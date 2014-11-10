Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8497D7179F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 02:22:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAA2MD3p019126
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 9 Nov 2014 18:22:13 -0800 (PST)
Received: from pek-kkang-d1.corp.ad.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Sun, 9 Nov 2014 18:22:13 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Nov 2014 10:22:05 +0800
Message-ID: <1415586125-544-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH] qemu: remove task sanitize_sources
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
X-List-Received-Date: Mon, 10 Nov 2014 02:22:18 -0000
Content-Type: text/plain

There is no dtc/.git and pixman/.git files any longer. So remove task
sanitize_sources which is used to remove these files.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/qemu/qemu_2.1.2.bb | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu_2.1.2.bb b/meta/recipes-devtools/qemu/qemu_2.1.2.bb
index 0e20605..55ae7b6 100644
--- a/meta/recipes-devtools/qemu/qemu_2.1.2.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.1.2.bb
@@ -13,14 +13,6 @@ SRC_URI[sha256sum] = "fd10f5e45cf5a736fa5a3e1c279ae9821534e700beb7d1aab88a07648a
 
 COMPATIBLE_HOST_class-target_mips64 = "null"
 
-do_sanitize_sources() {
-    # These .git files point to a nonexistent path "../.git/modules" and will confuse git
-    # if it tries to recurse into those directories.
-    rm -f ${S}/dtc/.git ${S}/pixman/.git
-}
-
-addtask sanitize_sources after do_unpack before do_patch
-
 do_install_append() {
     # Prevent QA warnings about installed ${localstatedir}/run
     if [ -d ${D}${localstatedir}/run ]; then rmdir ${D}${localstatedir}/run; fi
-- 
2.1.1


