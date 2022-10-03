Return-Path: <mathieu.dubois-briand@hyprua.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88BABC433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 16:17:49 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.1973.1664813860957974778
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Oct 2022 09:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hyprua-org.20210112.gappssmtp.com header.s=20210112
 header.b=oRbSEoI7;
 spf=none, err=SPF record not found (domain: hyprua.org, ip: 209.85.128.46,
 mailfrom: mathieu.dubois-briand@hyprua.org)
Received: by mail-wm1-f46.google.com with SMTP id
 130-20020a1c0288000000b003b494ffc00bso8816265wmc.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Oct 2022 09:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hyprua-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=hBXuysleNCa0+gaUr1l9i1HG4T6qne3HqmWlpEkpFnA=;
        b=oRbSEoI72+ixq6NInZLQvnoTLN2IlBSD6AmdWKx9eWsNviKvhl2dhxSVXM3c3MU2Uf
         JEj48uDkmJcqHXQYUiriWLuHpVpdu/ueMmddujr6z0DNhNwcNLlGNrfzEQc6sNMBnL3Z
         FvEXeXQ8Cbz4hQPzYm8IWDo14P2HkjZ3I6v2UhSsdkwicIhgwbr1qd8lykPVgP0RGfFr
         Ub/lCAdZ+3+x1g5zRLQhI9JH6t4Mi//kkvyGpF+7AkNMBbuqmgv+zfQJ8O0j51mzP2xm
         49IgyTc4PtVCH7LnNGl8BXQelbdR1Y9wHObwQmQ5Qeo8r9QvZjroDOa4ZUDgEFflAFz5
         bXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=hBXuysleNCa0+gaUr1l9i1HG4T6qne3HqmWlpEkpFnA=;
        b=5tjQwRtIStU5uo0Z+Ipt0malLRZs7LdumQCbqeBbfWmpqQfq0HxXe3Iyscwl8kuQTz
         yB9siRiEm183fIiukkjxdJ08tp/v99kzUcMmUtCr+JKhc8JkBqaMTppozxoZC2pk4k2S
         rzeQtqcISn/ut9q+sZoSycyhWRtmzmqBBRe7Uu7xmyI6F5MGqDlopFNvvabAmsVxBaHX
         ElyX54IXr2sT0C7f0NzN/zKmj60xqK/wpneAUjwJ5c+Vycm+Kr2Aij3kwe2fGt89aHwk
         8VHUyO/gtJhBIir7HklsjTWNpd6/51Uipcrx8gwXAAXCkAmll3DkM798uNFlFTBX9uX8
         W1fw==
X-Gm-Message-State: ACrzQf1REquTBOgcD0wRliu7UUBXheCjOt9TpU61kz/18lsIa61FacCF
	QRu/X2OHcXNpBZQU6TG+uAa/x+uV6ibpFY5DB1c=
X-Google-Smtp-Source: 
 AMsMyM5BiifDuUbezJD9suxpiZSQXTQx8lz4oos2BgnfBd+bVwVji/YLsTA3J9tBAes23JAW3L7uuA==
X-Received: by 2002:a05:600c:898:b0:3b4:8110:7fab with SMTP id
 l24-20020a05600c089800b003b481107fabmr7067251wmp.19.1664813858748;
        Mon, 03 Oct 2022 09:17:38 -0700 (PDT)
Received: from WIPC21110265.. ([2a01:e0a:9a8:8b40:238e:3570:9587:5b36])
        by smtp.gmail.com with ESMTPSA id
 c6-20020a5d4146000000b0022a403954c3sm10359479wrq.42.2022.10.03.09.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 09:17:38 -0700 (PDT)
From: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>
X-Google-Original-From: Mathieu Dubois-Briand <mbriand@witekio.com>
To: openembedded-core@lists.openembedded.org
Cc: akuster808@gmail.com,
	Mathieu Dubois-Briand <mbriand@witekio.com>
Subject: [dunfell][PATCH] bind: Fix CVEs 2022-2795, 2022-38177, 2022-38178
Date: Mon,  3 Oct 2022 18:17:20 +0200
Message-Id: <20221003161720.2260768-1-mbriand@witekio.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: 
 <CAOSpxdb_fvWZvW-2aMF0AMYrrekqaBxhRotKFriZ=xQfLn7Mqw@mail.gmail.com>
References: 
 <CAOSpxdb_fvWZvW-2aMF0AMYrrekqaBxhRotKFriZ=xQfLn7Mqw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Oct 2022 16:17:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171364

Signed-off-by: Mathieu Dubois-Briand <mbriand@witekio.com>
---
 .../bind/bind/CVE-2022-2795.patch             | 67 +++++++++++++++++++
 .../bind/bind/CVE-2022-38177.patch            | 31 +++++++++
 .../bind/bind/CVE-2022-38178.patch            | 33 +++++++++
 .../recipes-connectivity/bind/bind_9.11.37.bb |  3 +
 4 files changed, 134 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2022-2795.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2022-38177.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2022-38178.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2022-2795.patch b/meta/recipes-connectivity/bind/bind/CVE-2022-2795.patch
new file mode 100644
index 000000000000..940c6776d394
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2022-2795.patch
@@ -0,0 +1,67 @@
+From 36c878a0124973f29b7ca49e6bb18310f9b2601f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <michal@isc.org>
+Date: Thu, 8 Sep 2022 11:11:30 +0200
+Subject: [PATCH 1/3] Bound the amount of work performed for delegations
+
+Limit the amount of database lookups that can be triggered in
+fctx_getaddresses() (i.e. when determining the name server addresses to
+query next) by setting a hard limit on the number of NS RRs processed
+for any delegation encountered.  Without any limit in place, named can
+be forced to perform large amounts of database lookups per each query
+received, which severely impacts resolver performance.
+
+The limit used (20) is an arbitrary value that is considered to be big
+enough for any sane DNS delegation.
+
+(cherry picked from commit 3a44097fd6c6c260765b628cd1d2c9cb7efb0b2a)
+
+Upstream-Status: Backport
+CVE: CVE-2022-2795
+Reference to upstream patch:
+https://gitlab.isc.org/isc-projects/bind9/-/commit/bf2ea6d8525bfd96a84dad221ba9e004adb710a8
+
+Signed-off-by: Mathieu Dubois-Briand <mbriand@witekio.com>
+---
+ lib/dns/resolver.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/lib/dns/resolver.c b/lib/dns/resolver.c
+index 8ae9a993bbd7..ac9a9ef5d009 100644
+--- a/lib/dns/resolver.c
++++ b/lib/dns/resolver.c
+@@ -180,6 +180,12 @@
+  */
+ #define NS_FAIL_LIMIT 4
+ #define NS_RR_LIMIT   5
++/*
++ * IP address lookups are performed for at most NS_PROCESSING_LIMIT NS RRs in
++ * any NS RRset encountered, to avoid excessive resource use while processing
++ * large delegations.
++ */
++#define NS_PROCESSING_LIMIT 20
+ 
+ /* Number of hash buckets for zone counters */
+ #ifndef RES_DOMAIN_BUCKETS
+@@ -3318,6 +3324,7 @@ fctx_getaddresses(fetchctx_t *fctx, bool badcache) {
+ 	bool need_alternate = false;
+ 	bool all_spilled = true;
+ 	unsigned int no_addresses = 0;
++	unsigned int ns_processed = 0;
+ 
+ 	FCTXTRACE5("getaddresses", "fctx->depth=", fctx->depth);
+ 
+@@ -3504,6 +3511,11 @@ fctx_getaddresses(fetchctx_t *fctx, bool badcache) {
+ 
+ 		dns_rdata_reset(&rdata);
+ 		dns_rdata_freestruct(&ns);
++
++		if (++ns_processed >= NS_PROCESSING_LIMIT) {
++			result = ISC_R_NOMORE;
++			break;
++		}
+ 	}
+ 	if (result != ISC_R_NOMORE) {
+ 		return (result);
+-- 
+2.34.1
+
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2022-38177.patch b/meta/recipes-connectivity/bind/bind/CVE-2022-38177.patch
new file mode 100644
index 000000000000..0ef87fd260c9
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2022-38177.patch
@@ -0,0 +1,31 @@
+From ef3d1a84ff807eea27b4fef601a15932c5ffbfbf Mon Sep 17 00:00:00 2001
+From: Mark Andrews <marka@isc.org>
+Date: Thu, 11 Aug 2022 15:15:34 +1000
+Subject: [PATCH 2/3] Free eckey on siglen mismatch
+
+Upstream-Status: Backport
+CVE: CVE-2022-38177
+Reference to upstream patch:
+https://gitlab.isc.org/isc-projects/bind9/-/commit/5b2282afff760b1ed3471f6666bdfe8e1d34e590
+
+Signed-off-by: Mathieu Dubois-Briand <mbriand@witekio.com>
+---
+ lib/dns/opensslecdsa_link.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/dns/opensslecdsa_link.c b/lib/dns/opensslecdsa_link.c
+index 83b5b51cd78c..7576e04ac635 100644
+--- a/lib/dns/opensslecdsa_link.c
++++ b/lib/dns/opensslecdsa_link.c
+@@ -224,7 +224,7 @@ opensslecdsa_verify(dst_context_t *dctx, const isc_region_t *sig) {
+ 		siglen = DNS_SIG_ECDSA384SIZE;
+ 
+ 	if (sig->length != siglen)
+-		return (DST_R_VERIFYFAILURE);
++		DST_RET(DST_R_VERIFYFAILURE);
+ 
+ 	if (!EVP_DigestFinal_ex(evp_md_ctx, digest, &dgstlen))
+ 		DST_RET (dst__openssl_toresult3(dctx->category,
+-- 
+2.34.1
+
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2022-38178.patch b/meta/recipes-connectivity/bind/bind/CVE-2022-38178.patch
new file mode 100644
index 000000000000..e0b398e24abf
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2022-38178.patch
@@ -0,0 +1,33 @@
+From 65f5b2f0162d5d2ab25f463aa14a8bae71ace3d9 Mon Sep 17 00:00:00 2001
+From: Mark Andrews <marka@isc.org>
+Date: Thu, 11 Aug 2022 15:28:13 +1000
+Subject: [PATCH 3/3] Free ctx on invalid siglen
+
+(cherry picked from commit 6ddb480a84836641a0711768a94122972c166825)
+
+Upstream-Status: Backport
+CVE: CVE-2022-38178
+Reference to upstream patch:
+https://gitlab.isc.org/isc-projects/bind9/-/commit/1af23378ebb11da2eb0f412e4563d6
+
+Signed-off-by: Mathieu Dubois-Briand <mbriand@witekio.com>
+---
+ lib/dns/openssleddsa_link.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/dns/openssleddsa_link.c b/lib/dns/openssleddsa_link.c
+index 8b115ec283f0..b4fcd607c131 100644
+--- a/lib/dns/openssleddsa_link.c
++++ b/lib/dns/openssleddsa_link.c
+@@ -325,7 +325,7 @@ openssleddsa_verify(dst_context_t *dctx, const isc_region_t *sig) {
+ 		siglen = DNS_SIG_ED448SIZE;
+ 
+ 	if (sig->length != siglen)
+-		return (DST_R_VERIFYFAILURE);
++		DST_RET(ISC_R_NOTIMPLEMENTED);
+ 
+ 	isc_buffer_usedregion(buf, &tbsreg);
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-connectivity/bind/bind_9.11.37.bb b/meta/recipes-connectivity/bind/bind_9.11.37.bb
index afc8cf0b3b0c..2fca28e684a1 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.37.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.37.bb
@@ -19,6 +19,9 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-configure.in-remove-useless-L-use_openssl-lib.patch \
            file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
            file://0001-avoid-start-failure-with-bind-user.patch \
+           file://CVE-2022-2795.patch \
+           file://CVE-2022-38177.patch \
+           file://CVE-2022-38178.patch \
            "
 
 SRC_URI[sha256sum] = "0d8efbe7ec166ada90e46add4267b7e7c934790cba9bd5af6b8380a4fbfb5aff"
-- 
2.34.1


