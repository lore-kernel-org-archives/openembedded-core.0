Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F28E378876
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 07:13:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w127DATV027940
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Feb 2018 23:13:10 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 1 Feb 2018 23:13:09 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Feb 2018 15:10:34 +0800
Message-ID: <43ac77af5aacf8076f0b6af1330af6013502fe19.1517555249.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1517555249.git.jackie.huang@windriver.com>
References: <cover.1517555249.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] e2fsprogs: fix the hardcoded paths for ptest
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
X-List-Received-Date: Fri, 02 Feb 2018 07:13:09 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Fix the hardcoded paths in test scripts and expect
files to avoid issue like:
| cat: ../e2fsck/e2fsck: No such file or directory

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
index a53585db47..ceaf171585 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
@@ -104,7 +104,9 @@ do_compile_ptest() {
 do_install_ptest() {
 	cp -R --no-dereference --preserve=mode,links -v ${B}/tests ${D}${PTEST_PATH}/test
 	cp -R --no-dereference --preserve=mode,links -v ${S}/tests/* ${D}${PTEST_PATH}/test
-	sed -e 's!../e2fsck/e2fsck!e2fsck!g' -i ${D}${PTEST_PATH}/test/*/expect*
+	sed -e 's!../e2fsck/e2fsck!e2fsck!g' \
+	    -e 's!../misc/tune2fs!tune2fs!g' -i ${D}${PTEST_PATH}/test/*/expect*
+	sed -e 's!../e2fsck/e2fsck!${base_sbindir}/e2fsck!g' -i ${D}${PTEST_PATH}/test/*/script
 
 	# Remove various files
 	find "${D}${PTEST_PATH}" -type f \
-- 
2.11.0


