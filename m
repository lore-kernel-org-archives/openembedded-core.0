Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9D24771A54
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 07:28:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0G7S4s2009168
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jan 2017 23:28:04 -0800
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 15 Jan 2017 23:28:03 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 15 Jan 2017 23:28:03 -0800
Message-ID: <1484551683-62104-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] perl-native: process -fstack-protector-strong
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jan 2017 07:28:05 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

perl-native provides configuration information for building host perl
modules. This information (includes CCFLAGS, LDFLAGS ...) is based on
the host gcc that used to build perl-native.

While using prebuild perl-native to build perl modules and meet:
1. the prebuild perl-native was built on a host that gcc includes
   option '-fstack-protector-strong';
   (such as CentOS 7 64bits, gcc version 4.8.5)
2. the perl modules (such as libdbi-perl-native) need to be built
   with host gcc;
3. the host gcc does not support '-fstack-protector-strong';
   (such as Ubuntu 14.04 64bits, gcc version 4.8.4)

Then below error occurs:

  gcc: error: unrecognized command line option \
  '-fstack-protector-strong'

Just re-check and replace the gcc option before sstate caches were
populated to sysroot for fixing the issue.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-devtools/perl/perl-native_5.24.0.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl-native_5.24.0.bb b/meta/recipes-devtools/perl/perl-native_5.24.0.bb
index af2ad7b..65d65cd 100644
--- a/meta/recipes-devtools/perl/perl-native_5.24.0.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.24.0.bb
@@ -123,5 +123,17 @@ EOF
 	cat ${SYSROOT_DESTDIR}${bindir}/../nativeperl
 }
 
+SSTATEPOSTUNPACKFUNCS += "perl_sstate_postunpack"
+perl_sstate_postunpack() {
+        if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
+        then
+                tmpdir=`mktemp -d`
+                echo "int main(void) { return 0; }" > $tmpdir/gcctest.c
+                if ! ${CC} -fstack-protector-strong -o $tmpdir/gcctest $tmpdir/gcctest.c > /dev/null 2>&1; then
+                        sed -i -e 's/fstack-protector-strong/fstack-protector/g' ${BUILD_SYS}${libdir_native}/perl-native/perl/${PV}/Config_heavy.pl
+                fi
+        fi
+}
+
 # Fix the path in sstate
 SSTATE_SCAN_FILES += "*.pm *.pod *.h *.pl *.sh"
-- 
2.7.4


