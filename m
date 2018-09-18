Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7AA50793C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 08:46:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8I8kPNi030634
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 01:46:41 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 18 Sep 2018 01:46:17 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Sep 2018 01:46:17 -0700
Message-ID: <20180918084617.64582-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] curl: CVE-2018-14618
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
X-List-Received-Date: Tue, 18 Sep 2018 08:46:50 -0000
Content-Type: text/plain

Backport the CVE patch from the upstream
https://github.com/curl/curl/commit/57d299a499155d4b327e341c6024e293b0418243.patch
https://curl.haxx.se/docs/CVE-2018-14618.html
https://nvd.nist.gov/vuln/detail/CVE-2018-14618

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 .../curl/curl/CVE-2018-14618.patch            | 37 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.61.0.bb      |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2018-14618.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2018-14618.patch b/meta/recipes-support/curl/curl/CVE-2018-14618.patch
new file mode 100644
index 0000000000..db07b436d3
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2018-14618.patch
@@ -0,0 +1,37 @@
+From 57d299a499155d4b327e341c6024e293b0418243 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 13 Aug 2018 10:35:52 +0200
+Subject: [PATCH] Curl_ntlm_core_mk_nt_hash: return error on too long password
+
+... since it would cause an integer overflow if longer than (max size_t
+/ 2).
+
+This is CVE-2018-14618
+
+Bug: https://curl.haxx.se/docs/CVE-2018-14618.html
+Closes #2756
+Reported-by: Zhaoyang Wu
+
+CVE: CVE-2018-14618
+Upstream-Status: Backport
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ lib/curl_ntlm_core.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/lib/curl_ntlm_core.c b/lib/curl_ntlm_core.c
+index e27cab353c..922e85a926 100644
+--- a/lib/curl_ntlm_core.c
++++ b/lib/curl_ntlm_core.c
+@@ -557,8 +557,11 @@ CURLcode Curl_ntlm_core_mk_nt_hash(struct Curl_easy *data,
+                                    unsigned char *ntbuffer /* 21 bytes */)
+ {
+   size_t len = strlen(password);
+-  unsigned char *pw = len ? malloc(len * 2) : strdup("");
++  unsigned char *pw;
+   CURLcode result;
++  if(len > SIZE_T_MAX/2) /* avoid integer overflow */
++    return CURLE_OUT_OF_MEMORY;
++  pw = len ? malloc(len * 2) : strdup("");
+   if(!pw)
+     return CURLE_OUT_OF_MEMORY;
diff --git a/meta/recipes-support/curl/curl_7.61.0.bb b/meta/recipes-support/curl/curl_7.61.0.bb
index cabfcffc62..4f408d2aaa 100644
--- a/meta/recipes-support/curl/curl_7.61.0.bb
+++ b/meta/recipes-support/curl/curl_7.61.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=8;md5=3a34942f4ae3fbf1a303160714e66
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
+           file://CVE-2018-14618.patch \
 "
 
 SRC_URI[md5sum] = "31d0a9f48dc796a7db351898a1e5058a"
-- 
2.17.1


