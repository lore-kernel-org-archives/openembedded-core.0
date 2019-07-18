Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 35CF27ECA6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 02:16:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jul 2019 19:16:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,276,1559545200"; d="scan'208";a="169720365"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.220])
	by fmsmga007.fm.intel.com with ESMTP; 17 Jul 2019 19:16:09 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2019 10:16:01 +0800
Message-Id: <20190718021606.3560-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/6] curl: upgrade 7.65.1 -> 7.65.2
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
X-List-Received-Date: Thu, 18 Jul 2019 02:16:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Changelog:
https://curl.haxx.se/changes.html#7_65_2

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...format-security-fixes-in-libipt_icmp.patch | 61 -------------------
 .../curl/{curl_7.65.1.bb => curl_7.65.2.bb}   |  4 +-
 2 files changed, 2 insertions(+), 63 deletions(-)
 delete mode 100644 meta/recipes-extended/iptables/iptables/0003-extensions-format-security-fixes-in-libipt_icmp.patch
 rename meta/recipes-support/curl/{curl_7.65.1.bb => curl_7.65.2.bb} (95%)

diff --git a/meta/recipes-extended/iptables/iptables/0003-extensions-format-security-fixes-in-libipt_icmp.patch b/meta/recipes-extended/iptables/iptables/0003-extensions-format-security-fixes-in-libipt_icmp.patch
deleted file mode 100644
index e26594d19b..0000000000
--- a/meta/recipes-extended/iptables/iptables/0003-extensions-format-security-fixes-in-libipt_icmp.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 907e429d7548157016cd51aba4adc5d0c7d9f816 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Adam=20Go=C5=82=C4=99biowski?= <adamg@pld-linux.org>
-Date: Wed, 14 Nov 2018 07:35:28 +0100
-Subject: extensions: format-security fixes in libip[6]t_icmp
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-commit 61d6c3834de3 ("xtables: add 'printf' attribute to xlate_add")
-introduced support for gcc feature to check format string against passed
-argument.  This commit adds missing bits to extenstions's libipt_icmp.c
-and libip6t_icmp6.c that were causing build to fail.
-
-Fixes: 61d6c3834de3 ("xtables: add 'printf' attribute to xlate_add")
-Signed-off-by: Adam Gołębiowski <adamg@pld-linux.org>
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
-
-Upstream-Status: Backport
----
- extensions/libip6t_icmp6.c | 4 ++--
- extensions/libipt_icmp.c   | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/extensions/libip6t_icmp6.c b/extensions/libip6t_icmp6.c
-index 45a71875..cc7bfaeb 100644
---- a/extensions/libip6t_icmp6.c
-+++ b/extensions/libip6t_icmp6.c
-@@ -230,7 +230,7 @@ static unsigned int type_xlate_print(struct xt_xlate *xl, unsigned int icmptype,
- 	type_name = icmp6_type_xlate(icmptype);
- 
- 	if (type_name) {
--		xt_xlate_add(xl, type_name);
-+		xt_xlate_add(xl, "%s", type_name);
- 	} else {
- 		for (i = 0; i < ARRAY_SIZE(icmpv6_codes); ++i)
- 			if (icmpv6_codes[i].type == icmptype &&
-@@ -239,7 +239,7 @@ static unsigned int type_xlate_print(struct xt_xlate *xl, unsigned int icmptype,
- 				break;
- 
- 		if (i != ARRAY_SIZE(icmpv6_codes))
--			xt_xlate_add(xl, icmpv6_codes[i].name);
-+			xt_xlate_add(xl, "%s", icmpv6_codes[i].name);
- 		else
- 			return 0;
- 	}
-diff --git a/extensions/libipt_icmp.c b/extensions/libipt_icmp.c
-index 54189976..e76257c5 100644
---- a/extensions/libipt_icmp.c
-+++ b/extensions/libipt_icmp.c
-@@ -236,7 +236,7 @@ static unsigned int type_xlate_print(struct xt_xlate *xl, unsigned int icmptype,
- 			if (icmp_codes[i].type == icmptype &&
- 			    icmp_codes[i].code_min == code_min &&
- 			    icmp_codes[i].code_max == code_max) {
--				xt_xlate_add(xl, icmp_codes[i].name);
-+				xt_xlate_add(xl, "%s", icmp_codes[i].name);
- 				return 1;
- 			}
- 	}
--- 
-cgit v1.2.1
-
diff --git a/meta/recipes-support/curl/curl_7.65.1.bb b/meta/recipes-support/curl/curl_7.65.2.bb
similarity index 95%
rename from meta/recipes-support/curl/curl_7.65.1.bb
rename to meta/recipes-support/curl/curl_7.65.2.bb
index e7bfe6cc0b..2fff04434a 100644
--- a/meta/recipes-support/curl/curl_7.65.1.bb
+++ b/meta/recipes-support/curl/curl_7.65.2.bb
@@ -9,8 +9,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-SRC_URI[md5sum] = "03ca3fa53ac4d791be66e30ba75b56ea"
-SRC_URI[sha256sum] = "cbd36df60c49e461011b4f3064cff1184bdc9969a55e9608bf5cadec4686e3f7"
+SRC_URI[md5sum] = "88910bdda3752a98083b6dbe85bafcaa"
+SRC_URI[sha256sum] = "8093398b51e7d8337dac6f8fa6f1f77d562bdd9eca679dff9d9c3b8160ebfd28"
 
 CVE_PRODUCT = "curl libcurl"
 inherit autotools pkgconfig binconfig multilib_header
-- 
2.20.1


