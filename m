Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3E3CC6B2F
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:13 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32450.1792040653163515905
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ItHVquzX;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49e73611928so42321005e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040651; x=1792645451; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oZ1WQX319rCpvCbCo6Ea5aQcv9MvKfbZt/OVup5jlCs=;
        b=ItHVquzXT7rEaQ5m/qVeTjQpIr53DdXY6uOp0YSOryLZA5W5HAXaMzMsT7YtlUN9rM
         l9NRyskU+rV63cXUpJV73swYijoc92i088fdDSF/tyMe4G9w7BrtWKKKw7GQqlGSdWwG
         bz9V3ClTVs6mzXTZORwwIJg0Nsz9uxo8efuTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040651; x=1792645451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oZ1WQX319rCpvCbCo6Ea5aQcv9MvKfbZt/OVup5jlCs=;
        b=mbWmLlsOmhQH28SmT4cQgUjEOwo7EhEUr4uaS1lupZqfNIODTiYuWan/0apzn+Cjv7
         6VGraYpkczduPBoDdkWlr838yXmVzOFvfC5Z2AYv3e70vQ6HZn5vLNcxMMXDIaqEHv8e
         SFZD2jaiAC/pJH8B5k/ZTF5DoUE8s6ebtlJtdx1jWNDKm3V0r1AEMbWJTfKmwQSWEf+d
         fT6I7gyHBIC6z4/zVXz3Gmf/ideQs0YywSoF7y24gmxcR8Q2LuipGwql46umm+b8O54C
         SZ6/tFvvVCxQoiNcyuQJPamvcwseF3ZcyYEO8oinruL23JCRTuJvSWjxNY1ygUFfuOSU
         QmJg==
X-Gm-Message-State: AFq9FYIK619sbKPv/WnxHl+IVN2u6gpxhV/D9pp1BC/8D9hU3eTTNyis
	sKSLkrf8/mk3P5a33bK7AXiWl7aw4vhgZOOCiKQlMDLzHc9Sw5kAVpMrQBTSI7uEMnfX4TL7018
	jmF4Vj9g=
X-Gm-Gg: AYBFou1T7vAcws28wxYTiEA0vzlt60Bc/GaucTPviNoW508QcCXeEPBAi4N/MUQ+mRt
	RsoOP5yj2JE6knQkYe3cPE+1+MeUD2oNS3MQti/gdQXlJJ8ozEYdWuvSphEzNt9gCf4vn2qajYK
	CFUIARpVwRVxARfz3A38oAj8CukzfTijj7jNEGRJ3VI9+XTJTLbMMynfH60XIUXG8Vgk/mt73+n
	waWXnBO433Aa6YN4+wW8l4sD55sWCHZ5Bc+YxSxC99yJpIYnWqnoJh7Tx7O9SBKg1zVOMtbsGlZ
	QhqFDxQucqxVYHfxibJsbe1e0jbzOpzPD4WXiodKsHQS4zSfYkUTkiyYJKkLf0s3JB3v2mvZj/H
	pKtsc7V4WTwyYPyQAgg0kfifLNuh3pLdEEDNJu/CI70MyCjrQuELl8NEXlVefAQxfoX1h5VrYZZ
	eA61ptTgzwzRwxDWEuxImC3p402F+jl7x6HOlRgYYi+7GYwCV5N+Of8IreV8uzlejXjXWrnO0aZ
	G0O1Zu0Qis2I/HxH88MSUZIhlbyEUNL8s3IlKWS/aFc9yBNOpV8XJjPsKG+pNnxJD+uPr9nBw==
X-Received: by 2002:a05:600c:8b78:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a18e4837f2mr344099935e9.5.1792040651240;
        Wed, 14 Oct 2026 22:04:11 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.04.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:04:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 48/55] libpcap: Fix CVE-2026-31911
Date: Thu, 15 Oct 2026 07:03:11 +0200
Message-ID: <26ada8f7dd521e6b472078b2dac57e0e0f635048.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247846

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-31911
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/a715bcdde830299cba4171514385cb17ec19b6e9

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpcap/libpcap/03-CVE-2026-31911.patch   | 47 +++++++++++++++++++
 .../libpcap/libpcap_1.10.4.bb                 |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-31911.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-31911.patch b/meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-31911.patch
new file mode 100644
index 00000000000..fc35ada86a3
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-31911.patch
@@ -0,0 +1,47 @@
+From a715bcdde830299cba4171514385cb17ec19b6e9 Mon Sep 17 00:00:00 2001
+From: Denis Ovsienko <denis@ovsienko.info>
+Date: Thu, 30 Jul 2026 13:34:08 +0100
+Subject: [PATCH] CVE-2026-31911: Fail opcodes safely in the BPF interpreter.
+
+This vulnerability has been discovered by FuzzAnything Organization.
+
+The current revision of pcapint_filter_with_aux_data() calls abort() if
+the current instruction opcode is invalid, and assumes this never to be
+the case.  This holds for programs that have been generated by libpcap.
+
+However, this does not necessarily hold for programs that come from an
+external source via pcap_offline_filter() or [deprecated] bpf_filter().
+Furthermore, this does not necessarily hold for programs that have been
+validated by libpcap because the current revision of the validator has
+gaps in the checks and accepts a number of invalid opcodes (another
+commit addresses that).
+
+Thus in pcapint_filter_with_aux_data(), when the instruction opcode is
+invalid, just reject the packet.
+
+(backported from commit 4ccb54bf4946d31a248ec93bdbeaabd97fb9d8f7)
+
+(cherry picked from commit a715bcdde830299cba4171514385cb17ec19b6e9)
+
+Notes on backporting to 1.10.4:
+ - Adapted to the 1.10.4 pcap_filter*() names (renamed to pcapint_*()
+   after 1.10.4).
+ - The upstream CHANGES/changelog hunk is not backported.
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/a715bcdde830299cba4171514385cb17ec19b6e9]
+CVE: CVE-2026-31911
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+diff --git a/bpf_filter.c b/bpf_filter.c
+index 2ea11d46..d6e4b019 100644
+--- a/bpf_filter.c
++++ b/bpf_filter.c
+@@ -146,7 +146,7 @@ pcap_filter_with_aux_data(const struct bpf_insn *pc, const u_int proglen,
+ 		switch (pc->code) {
+ 
+ 		default:
+-			abort();
++			return 0;
+ 		case BPF_RET|BPF_K:
+ 			return (u_int)pc->k;
+ 
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
index 323cca3d985..5b97c14e855 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz \
            file://CVE-2025-11964.patch \
            file://01-CVE-2026-0799.patch \
            file://02-CVE-2026-31912.patch \
+           file://03-CVE-2026-31911.patch \
           "
 
 SRC_URI[sha256sum] = "ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159d20e47160ebe5f"

