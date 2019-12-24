Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AE1117DE3D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Dec 2019 01:55:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xBO1t4RD031233
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2019 17:55:14 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Mon, 23 Dec 2019 17:54:53 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Dec 2019 09:54:49 +0800
Message-ID: <20191224015449.5719-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] kbd: fix ptest can NOT run issue
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
X-List-Received-Date: Tue, 24 Dec 2019 01:55:23 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

After kbd updated to 2.2.0, it fails to run ptest:

| make: *** No rule to make target 'libkbdfile-test01.c', needed by 'libkbdfile-test01'.

Update sed expression to fix such kind of issues. And also make target
dumpkeys-bkeymap and dumpkeys-bkeymap which are required by ptest.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/kbd/kbd_2.2.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/kbd/kbd_2.2.0.bb b/meta/recipes-core/kbd/kbd_2.2.0.bb
index f2521617e5..88041bc878 100644
--- a/meta/recipes-core/kbd/kbd_2.2.0.bb
+++ b/meta/recipes-core/kbd/kbd_2.2.0.bb
@@ -29,7 +29,7 @@ PACKAGECONFIG[pam] = "--enable-vlock, --disable-vlock, libpam,"
 PACKAGECONFIG[tests] = "--enable-tests, --disable-tests, libcheck"
 
 do_compile_ptest() {
-    oe_runmake -C ${B}/tests dumpkeys-fulltable alt-is-meta
+    oe_runmake -C ${B}/tests alt-is-meta dumpkeys-bkeymap dumpkeys-fulltable dumpkeys-mktable
 }
 
 do_install_ptest() {
@@ -42,7 +42,7 @@ do_install_ptest() {
 	-e 's:${RECIPE_SYSROOT}::g' \
 	-e 's:${S}/config/missing::g' \
 	-e 's:${WORKDIR}::g' \
-	-e '/libkeymap_.*_SOURCES =/d' -e '/$(EXEEXT):/,/^$/d' ${D}${PTEST_PATH}/tests/Makefile
+	-e '/^lib.*_SOURCES =/d' -e '/$(EXEEXT):/,/^$/d' ${D}${PTEST_PATH}/tests/Makefile
 
     find ${B}/tests -executable -exec install {} ${D}${PTEST_PATH}/tests \;
     find ${S}/tests \( -name \*.map -o -name \*.bin -o -name \*.output \) -exec install {} ${D}${PTEST_PATH}/tests \;
-- 
2.17.1


