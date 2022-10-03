Return-Path: <mathieu.dubois-briand@hyprua.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB393C433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 11:28:39 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.17737.1664796509617888361
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Oct 2022 04:28:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hyprua-org.20210112.gappssmtp.com header.s=20210112
 header.b=FfqnVcN2;
 spf=none, err=SPF record not found (domain: hyprua.org, ip: 209.85.221.49,
 mailfrom: mathieu.dubois-briand@hyprua.org)
Received: by mail-wr1-f49.google.com with SMTP id j7so10891189wrr.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Oct 2022 04:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hyprua-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=k9wEF8j7MzoRZiKmhO4NzfYuHgl6wGhCgPPZ3B6k8vQ=;
        b=FfqnVcN2v3jHnRGKvO+lDisENLUKcUhK1Ed+7e1mSuDy+mwE9UShG+D5iGdW1qlADG
         qqulCfwLFjCpKcYzlEvAVDoF42zNd2Qli2VUYMFKXPLdHhUs5KeKidKLeoGr3ZVxqetJ
         akLKveivbMn3vPLrwpQ7ggRTtxfr/1yodtXq65sHGsBjoC8Bs+6QXN2i4yFKaIe1LJfO
         raSzHRnjSfwyKK6NhU2deikIlcu/OUm0ydeoJ5e9/6AcBxqVdLaV4O1Dqb+Px9k1vttO
         iTQmH3lP3AiyHmOyUrS/QVemR/WQHL60k41/bslQRIgLa2WAW/fgWUoaGP+4MWt7HSUr
         uC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=k9wEF8j7MzoRZiKmhO4NzfYuHgl6wGhCgPPZ3B6k8vQ=;
        b=iz8WePpKbvBRXVVDUFwyk/DCiShxeBuPT5XjktReyoJTs18fvvTp6Z5JFMevt+lGKd
         UYPUwUxhS5LKD5CGeXut4oDkf6+ljw36oS17i4JeRbkBWzkAezUdF3gIv+rAZ4s8G8a0
         XAJWoEymfiYIzG49mNC1PeuVKIs9gGcxCz09xvNU0V2Y2V5YUP3Nzdy+Eaq2kjyLkwWF
         9cHL6Z06cxxeXBz6vXzzStARYnbz4xfW0iMwpU8BKu1KsglHXUrwvhmg52cBtKwL0uz8
         OVbm3XCRnctnkQAlMU9iTgqJK8YcvscvWA9tnAtwoBKZLrt0DI+9pCPPPsNAQMgWHout
         8KnA==
X-Gm-Message-State: ACrzQf0EX3/Hz5SyRXgmdz108m5wGLl4nScXbQm6UUs0+JqOI5rF2q4S
	zFBuAYVgyqfzPxTTnevbDVm4bnvQFudxq4YcSRc=
X-Google-Smtp-Source: 
 AMsMyM467v0zZT2fuokiV+u0rb4JtqPcpJt575z3ABUy6gzN/EXTw48a5f/MdMr4eUxQ0W3Qecb1sg==
X-Received: by 2002:adf:e549:0:b0:22d:b410:d0ed with SMTP id
 z9-20020adfe549000000b0022db410d0edmr9104976wrm.633.1664796507375;
        Mon, 03 Oct 2022 04:28:27 -0700 (PDT)
Received: from WIPC21110265.. ([2a01:e0a:9a8:8b40:238e:3570:9587:5b36])
        by smtp.gmail.com with ESMTPSA id
 l17-20020a05600c4f1100b003b4ff30e566sm24673590wmq.3.2022.10.03.04.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 04:28:27 -0700 (PDT)
From: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>
X-Google-Original-From: Mathieu Dubois-Briand <mbriand@witekio.com>
To: openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mbriand@witekio.com>
Subject: [dunfell][PATCH] bind: Fix CVEs 2022-2795, 2022-38177, 2022-38178
Date: Mon,  3 Oct 2022 13:28:12 +0200
Message-Id: <20221003112812.866-1-mbriand@witekio.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Oct 2022 11:28:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171360

---
 .../bind/bind/CVE-2022-2795.patch             | 60 +++++++++++++++++++
 .../bind/bind/CVE-2022-38177.patch            | 25 ++++++++
 .../bind/bind/CVE-2022-38178.patch            | 26 ++++++++
 .../recipes-connectivity/bind/bind_9.11.37.bb |  3 +
 4 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2022-2795.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2022-38177.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2022-38178.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2022-2795.patch b/meta/recipes-connectivity/bind/bind/CVE-2022-2795.patch
new file mode 100644
index 000000000000..10d8e6140bb3
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2022-2795.patch
@@ -0,0 +1,60 @@
+From cd73ad5f5380304627e3c14bc8ff5d8e8794607c Mon Sep 17 00:00:00 2001
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
index 000000000000..7a76048b4da9
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2022-38177.patch
@@ -0,0 +1,25 @@
+From 2275d217a8ceb6f970749b364a075651052c04f5 Mon Sep 17 00:00:00 2001
+From: Mark Andrews <marka@isc.org>
+Date: Thu, 11 Aug 2022 15:15:34 +1000
+Subject: [PATCH 2/3] Free eckey on siglen mismatch
+
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
index 000000000000..4e98ca4ef96e
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2022-38178.patch
@@ -0,0 +1,26 @@
+From 87d51359fd84b8d61ff427c69105524344e1da9c Mon Sep 17 00:00:00 2001
+From: Mark Andrews <marka@isc.org>
+Date: Thu, 11 Aug 2022 15:28:13 +1000
+Subject: [PATCH 3/3] Free ctx on invalid siglen
+
+(cherry picked from commit 6ddb480a84836641a0711768a94122972c166825)
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


