Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SJmGa-0005vP-QL
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 15:46:53 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3GDbRX8022670
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 06:37:27 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 16 Apr 2012 06:37:27 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Apr 2012 21:38:14 +0800
Message-ID: <3f7359690123356107fdc1a60f664a11bb54debb.1334583221.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1334583221.git.liezhi.yang@windriver.com>
References: <cover.1334583221.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] automake-nativesdk: fix builds on fedora 17
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Apr 2012 13:46:53 -0000
Content-Type: text/plain

Generally distros keep perl at /sur/bin/perl
Fedora 17 also has /bin/perl

this causes automake-nativesdk build on such distros to put perl
interpreter path in the perl scripts as /bin/perl

But we set perl location for target as /usr/bin/perl

This mismatch of perl path causes failure of rootfs image creation
like this:

| error: Failed dependencies:
|       /bin/perl is needed by automake-nativesdk-1.11.2-r2.x86_64
NOTE: package meta-toolchain-gmae-1.0-r7: task do_populate_sdk: Failed

The second sed command is for such a case:

eval 'case $# in 0) exec /bin/perl -S "$0";; *) exec /bin/perl -S "$0" "$@";; esac'

This line has two "/bin/perl" and we can't use a line number to tell
sed which line it is since the line numbers in different files are
defferent.

[YOCTO #2304]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/automake/automake_1.11.2.bb |   20 +++++++++++++++++---
 1 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/automake/automake_1.11.2.bb b/meta/recipes-devtools/automake/automake_1.11.2.bb
index 4271336..66589fe 100644
--- a/meta/recipes-devtools/automake/automake_1.11.2.bb
+++ b/meta/recipes-devtools/automake/automake_1.11.2.bb
@@ -34,19 +34,33 @@ PATHFIXPATCH = "file://path_prog_fixes.patch"
 PATHFIXPATCH_virtclass-native = ""
 PATHFIXPATCH_virtclass-nativesdk = ""
 
+PERLPATH = "${bindir}/perl"
+PERLPATH_virtclass-native = "/usr/bin/perl"
+PERLPATH_virtclass-nativesdk = "/usr/bin/perl"
+
 SRC_URI += "${PATHFIXPATCH} \
 	    file://prefer-cpio-over-pax-for-ustar-archives.patch \
 	    file://python-libdir.patch \
             file://automake_1.11.2_fix_for_pkglibexec_SCRIPTS.patch \
             file://py-compile-compile-only-optimized-byte-code.patch"
 
-PR = "r2"
+PR = "r3"
 SRC_URI[md5sum] = "18194e804d415767bae8f703c963d456"
 SRC_URI[sha256sum] = "4f46d1f9380c8a3506280750f630e9fc915cb1a435b724be56b499d016368718"
 
 do_install () {
-	oe_runmake 'DESTDIR=${D}' install
-	install -d ${D}${datadir}
+    oe_runmake 'DESTDIR=${D}' install
+    install -d ${D}${datadir}
+
+    # Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
+    # for target as /usr/bin/perl, so fix it to /usr/bin/perl.
+    for i in aclocal aclocal-1.11 automake automake-1.11; do
+        if [ -f ${D}${bindir}/$i ]; then
+            sed -i -e '1s,#!.*perl,#! ${PERLPATH},' \
+            -e 's,exec .*/bin/perl \(.*\) exec .*/bin/perl \(.*\),exec ${PERLPATH} \1 exec ${PERLPATH} \2,' \
+            ${D}${bindir}/$i
+        fi
+    done
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.1



