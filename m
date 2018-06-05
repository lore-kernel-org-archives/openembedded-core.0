Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9A8D076043
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 07:59:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w557wmr0013837
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jun 2018 00:59:03 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Tue, 5 Jun 2018 00:58:37 -0700
From: Changqing Li <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Jun 2018 15:58:36 +0800
Message-ID: <1528185516-258414-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] nettle: do the multilib_header magic for nettle-stdint.h and version.h
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
X-List-Received-Date: Tue, 05 Jun 2018 07:59:13 -0000
Content-Type: text/plain

add multilib support for this receipe, or it will conflicts in mutlilib setting

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-support/nettle/nettle_3.4.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/nettle/nettle_3.4.bb b/meta/recipes-support/nettle/nettle_3.4.bb
index 7a3cc65..ca8450e 100644
--- a/meta/recipes-support/nettle/nettle_3.4.bb
+++ b/meta/recipes-support/nettle/nettle_3.4.bb
@@ -25,7 +25,7 @@ SRC_URI[sha256sum] = "ae7a42df026550b85daca8389b6a60ba6313b0567f374392e54918588a
 
 UPSTREAM_CHECK_REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
 
-inherit autotools ptest
+inherit autotools ptest multilib_header
 
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
@@ -35,6 +35,10 @@ do_compile_ptest() {
         oe_runmake buildtest
 }
 
+do_install_append() {
+    oe_multilib_header nettle/nettle-stdint.h nettle/version.h
+}
+
 do_install_ptest() {
         install -d ${D}${PTEST_PATH}/testsuite/
         install ${S}/testsuite/gold-bug.txt ${D}${PTEST_PATH}/testsuite/
-- 
2.7.4


