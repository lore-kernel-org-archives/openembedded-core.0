Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ABDC260596
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 02:21:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9C2LED2015121
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 19:21:14 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 11 Oct 2018 19:21:13 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Oct 2018 10:21:12 +0800
Message-ID: <1539310872-56487-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V3] e2fsprogs: fix test f_detect_junk print error msg
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
X-List-Received-Date: Fri, 12 Oct 2018 02:21:12 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

This test need to check config.h, so install it
to fix below err msg:

grep: ../lib/config.h: No such file or directory
./test/f_detect_junk/script: line 3: [: : integer expression expected
f_detect_junk: detect non-fs file data: ok

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
index 823d18b..beb0a36 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
@@ -129,4 +129,7 @@ do_install_ptest() {
 	find "${D}${PTEST_PATH}" -type f \
 	    \( -name 'Makefile' -o -name 'Makefile.in' -o -name '*.o' -o -name '*.c' -o -name '*.h' \)\
 	    -exec  rm -f {} +
+
+        install -d ${D}${PTEST_PATH}/lib
+        install -m 0644 ${B}/lib/config.h  ${D}${PTEST_PATH}/lib/
 }
-- 
2.7.4


