Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 300DE78400
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 01:28:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w151SIaS026361
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 4 Feb 2018 17:28:18 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 4 Feb 2018 17:28:16 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 4 Feb 2018 20:28:03 -0500
Message-ID: <cf1c1b0a0cfb94dada82a17081be3e3da29c760c.1517793934.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1517793934.git.hongxu.jia@windriver.com>
References: <cover.1517793934.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] kbd-ptest: improve reproducibility
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
X-List-Received-Date: Mon, 05 Feb 2018 01:28:17 -0000
Content-Type: text/plain

Remove remaining build host references of ptest's Makefile.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/kbd/kbd_2.0.4.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-core/kbd/kbd_2.0.4.bb b/meta/recipes-core/kbd/kbd_2.0.4.bb
index 423b47a..5937cb8 100644
--- a/meta/recipes-core/kbd/kbd_2.0.4.bb
+++ b/meta/recipes-core/kbd/kbd_2.0.4.bb
@@ -29,6 +29,13 @@ do_compile_ptest() {
 do_install_ptest() {
     install -D ${B}/tests/Makefile ${D}${PTEST_PATH}/tests/Makefile
     sed -i -e '/Makefile:/,/^$/d' -e '/%: %.in/,/^$/d' \
+	-e 's:--sysroot=${STAGING_DIR_TARGET}::g' \
+	-e 's:${DEBUG_PREFIX_MAP}::g' \
+	-e 's:${HOSTTOOLS_DIR}/::g' \
+	-e 's:${RECIPE_SYSROOT_NATIVE}::g' \
+	-e 's:${RECIPE_SYSROOT}::g' \
+	-e 's:${S}/config/missing::g' \
+	-e 's:${WORKDIR}::g' \
 	-e '/libkeymap_.*_SOURCES =/d' -e '/$(EXEEXT):/,/^$/d' ${D}${PTEST_PATH}/tests/Makefile
 
     find ${B}/tests -executable -exec install {} ${D}${PTEST_PATH}/tests \;
-- 
2.8.1


