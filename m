Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C595A7717F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 08:51:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAC8peMR018074
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 00:51:41 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 12 Nov 2015 00:51:40 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Nov 2015 00:51:38 -0800
Message-ID: <a7b9d82ce0f3f166c730037fe550a8076b8a6e01.1447318250.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1447318250.git.liezhi.yang@windriver.com>
References: <cover.1447318250.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] gdbm 1.8.3: install libgdbm_compat
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
X-List-Received-Date: Thu, 12 Nov 2015 08:51:41 -0000
Content-Type: text/plain

It has been built but not installed by default, while 1.11 builds and
installs it.

Fixed when build non_gplv3 + perl:
powerpc64-wrs-linux-gcc -m64 -mhard-float -mcpu=e6500
--sysroot=/mnt/docker/test_p/bitbake_build/tmp/sysroots/fsl-t2xxx
-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -
fstack-protector -shared NDBM_File.o  -o
../../lib/auto/NDBM_File/NDBM_File.so   \
   -lgdbm -lgdbm_compat         \

ld: cannot find -lgdbm_compat
collect2: error: ld returned 1 exit status
Makefile:473: recipe for target '../../lib/auto/NDBM_File/NDBM_File.so' failed

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/gdbm/gdbm_1.8.3.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/gdbm/gdbm_1.8.3.bb b/meta/recipes-support/gdbm/gdbm_1.8.3.bb
index af01b6c..b253dc1 100644
--- a/meta/recipes-support/gdbm/gdbm_1.8.3.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.8.3.bb
@@ -19,6 +19,7 @@ inherit autotools texinfo
 BBCLASSEXTEND = "native nativesdk"
 
 do_install_append () {
+    oe_runmake install-compat DESTDIR=${D}
     install -d ${D}${includedir}/gdbm
     install -m 0644 ${S}/dbm.h ${D}${includedir}/
     install -m 0644 ${S}/ndbm.h ${D}${includedir}/
-- 
1.7.9.5


