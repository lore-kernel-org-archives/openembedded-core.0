Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 18AD3731D7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 05:02:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2483396"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Jan 2016 13:02:39 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id B57E0418911C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 13:02:26 +0800 (CST)
Received: from localhost.localdomain (10.167.226.98) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 12 Jan 2016 13:06:05 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Jan 2016 08:02:14 +0300
Message-ID: <1452574934-2053-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.98]
X-yoursite-MailScanner-ID: B57E0418911C.A0070
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] net-tools_1.60-26.bb: Error fix
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
X-List-Received-Date: Tue, 12 Jan 2016 05:02:41 -0000
Content-Type: text/plain

when set PATCHTOOL = "patch" in conf/local.conf,error will occur
in the step of do_patch.
The error is: "quilt: command not found",so fix it.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/net-tools/net-tools_1.60-26.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
index 923d048..e173f54 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
@@ -30,6 +30,7 @@ SRC_URI[patch.sha256sum] = "aeeeafaff68866a446f01bb639d4e0146a60af34dcd20e31a3e4
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/net-tools/"
 
 inherit gettext
+DEPENDS = "quilt-native"
 
 # The Makefile is lame, no parallel build
 PARALLEL_MAKE = ""
@@ -40,7 +41,7 @@ PARALLEL_MAKE = ""
 # up all previously applied patches in the start
 nettools_do_patch() {
 	cd ${S}
-	quilt pop -a || true
+	${STAGING_BINDIR_NATIVE}/quilt pop -a || true
 	if [ -d ${S}/.pc-nettools ]; then
 		rm -rf ${S}/.pc
 		mv ${S}/.pc-nettools ${S}/.pc
-- 
1.8.4.2




