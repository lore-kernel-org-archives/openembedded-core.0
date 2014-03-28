Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 703036F465
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 09:43:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2S9hxHv004551
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Mar 2014 02:44:00 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Fri, 28 Mar 2014 02:43:59 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Mar 2014 17:43:38 +0800
Message-ID: <a83b601a6841cd1d4d0745f7d584a2f5d5612be2.1395997035.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395997035.git.hongxu.jia@windriver.com>
References: <cover.1395997035.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 4/4] nss-3.15.1: fix CVE-2013-5605
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
X-List-Received-Date: Fri, 28 Mar 2014 09:43:59 -0000
Content-Type: text/plain

From: "yanjun.zhu" <yanjun.zhu@windriver.com>

Mozilla Network Security Services (NSS) 3.14 before 3.14.5 and
3.15 before 3.15.3 allows remote attackers to cause a denial
of service or possibly have unspecified other impact via
invalid handshake packets.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-5605
Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../nss/files/nss-3.15.1-fix-CVE-2013-5605.patch       | 18 ++++++++++++++++++
 meta/recipes-support/nss/nss.inc                       |  1 +
 2 files changed, 19 insertions(+)
 create mode 100644 meta/recipes-support/nss/files/nss-3.15.1-fix-CVE-2013-5605.patch

diff --git a/meta/recipes-support/nss/files/nss-3.15.1-fix-CVE-2013-5605.patch b/meta/recipes-support/nss/files/nss-3.15.1-fix-CVE-2013-5605.patch
new file mode 100644
index 0000000..7203d02
--- /dev/null
+++ b/meta/recipes-support/nss/files/nss-3.15.1-fix-CVE-2013-5605.patch
@@ -0,0 +1,18 @@
+signed-off-by: Ryan Sleevi <ryan.sleevi@gmail.com>
+Upstream-Status: Backport
+reference:https://hg.mozilla.org/projects/nss/rev/e79a09364b5e
+
+--- a/nss/lib/ssl/ssl3con.c
++++ b/nss/lib/ssl/ssl3con.c
+@@ -781,6 +781,11 @@ static SECStatus
+ Null_Cipher(void *ctx, unsigned char *output, int *outputLen, int maxOutputLen,
+ 	    const unsigned char *input, int inputLen)
+ {
++    if (inputLen > maxOutputLen) {
++        *outputLen = 0;  /* Match PK11_CipherOp in setting outputLen */
++        PORT_SetError(SEC_ERROR_OUTPUT_LEN);
++        return SECFailure;
++    }
+     *outputLen = inputLen;
+     if (input != output)
+ 	PORT_Memcpy(output, input, inputLen);
diff --git a/meta/recipes-support/nss/nss.inc b/meta/recipes-support/nss/nss.inc
index 6364562..404decc 100644
--- a/meta/recipes-support/nss/nss.inc
+++ b/meta/recipes-support/nss/nss.inc
@@ -17,6 +17,7 @@ SRC_URI = "\
     file://nss-no-rpath-for-cross-compiling.patch \
     file://nss-fix-incorrect-shebang-of-perl.patch \
     file://nss-3.15.1-fix-CVE-2013-1741.patch \
+    file://nss-3.15.1-fix-CVE-2013-5605.patch \
 "
 SRC_URI_append_class-target = "\
     file://nss.pc.in \
-- 
1.8.1.2


