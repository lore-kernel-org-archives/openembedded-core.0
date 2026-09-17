Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9849C982D9
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:27 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1603.1789682905387418468
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qwaa2AfB;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so721715e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682904; x=1790287704; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nv++BhtfLV0gjZH9p6vlcNvo5sm0DsrYXfZ3yrR/pSU=;
        b=qwaa2AfBU9KSXW7H5q3DthHFMTmzxLM8bp+PVqobFqCB7hmC57E8Zw0jy+5Ia0oG8w
         eOfNpoOc8BfWgMKJkNmnpSi8fazL+pU0bLF4mnzhmuqwwUSZkJ224gx2ayFdyxh5/nNr
         Gnt+MTPh2DMlSlurzoCo8R4kDMCHlkEwm7mRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682904; x=1790287704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nv++BhtfLV0gjZH9p6vlcNvo5sm0DsrYXfZ3yrR/pSU=;
        b=P2vfjSXsLXg89LDC5lFedvxIvVllEGig7N5YwpBZQCsdtwbwwDz3xSL1WhW26bwner
         D9NmcV7rVMucbTb3Crl1lCCwrpiKGyDuesa2J+rosr2uBMFKFOax5iMlbjTy3SV8WSAm
         5eV55D5di0N+RUZB6MbfDQWoPVFx/5sLJsSaoxht4adG2/mDZ7RoPmQBlrIknmlM0M0v
         Y4EU1eMHQsDT3autWd2qqReJ31TbR4tZgPWsDmH2tgdKSkwo2sBzZfjOOXGoLIdE7lm7
         nS4KXUymlW0LRl4BXLA/yuFEb7ZiHGhlhgXxQGthH1sBDTkkoIxF+81FVfyCYQIS8Ydp
         igeg==
X-Gm-Message-State: AFuF++nao7QUZoZis9r7XdZGqefLN7QrYPTuPNhRJdsW0Y8rzWAs8qsP
	+K23ceH/V9ykY3ef5eyZpNd1yAgt0uKqy73V2vcH8ZRCpdX1FEPq9Ek/UsIprP9ew7Jl4/MRViJ
	FgwsGA4k=
X-Gm-Gg: AYBFou2vI+GdtnwUSwOLap5Upe1c6VihKWq88NYDKM8cMT5zwcvyD4W2y9es6XZKdrr
	/Jpzpf9l+Rur6clYWAwlKYFVIiIsc5fcv/DymZAiyVm8v9q5t2B8inRQV//nqkluVJvZJiM8I5Y
	SyiVq6xw6vPzCZsGJG+yqym5FwUAJxkF17JDso5xwpZPXCUUI7qX6yAItWFtfQ06656d0fDsZtj
	9sxdkxHqA118HojiLVsMv+z5Ad1sd0Mb9kVHoMT57F1N3ulY2Br1s+cwCd6uVw8TooUQIvyWw5u
	PJwgoTHL3c7rkiLj7YWUgT6O48WjrWo9wHypQsgNhmIWisOR8hNwf+PYyVu5iKoGgX7U0nF9RfT
	yvYLcmPw/Mc2c2/xrDTrMtYnpLhS8B4tgnRdLIidVANX+9O8R9ypmBhkSE2WOf8D4IE/GPIZDAI
	cW0yP73ABlON+6xGJ9kVqPCaaBXppYj5P+uCKNbwxOCEq8oTXagDvS2AMoe2T1AhDCsVoppBNpG
	M9V4FWnMlDdygMqmXqBeJD14GAtpoDy+4KIu76kbIDme/UxMaaMhzKdTTg2AfpwEljqGhrkkDo=
X-Received: by 2002:a05:600c:3556:b0:49c:ffab:551f with SMTP id 5b1f17b1804b1-49fc5737c38mr3286375e9.22.1789682903647;
        Thu, 17 Sep 2026 15:08:23 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 64/79] libpcap: Fix CVE-2026-31911
Date: Fri, 18 Sep 2026 00:06:49 +0200
Message-ID: <566d5080a3946a9ad97cdefba6be8dc9da15c6ff.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246159

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-31911
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/a715bcdde830299cba4171514385cb17ec19b6e9
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpcap/libpcap/03-CVE-2026-31911.patch   | 45 +++++++++++++++++++
 .../libpcap/libpcap_1.10.6.bb                 |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-31911.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-31911.patch b/meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-31911.patch
new file mode 100644
index 00000000000..1060b3c372a
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-31911.patch
@@ -0,0 +1,45 @@
+From 0067e8fd1f3caf866da3d95508831389f3b20e11 Mon Sep 17 00:00:00 2001
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
+Notes on backporting to 1.10.6:
+ - The upstream CHANGES/changelog hunk is not backported.
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/a715bcdde830299cba4171514385cb17ec19b6e9]
+CVE: CVE-2026-31911
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+diff --git a/bpf_filter.c b/bpf_filter.c
+index 4f9adeea..f8b842d6 100644
+--- a/bpf_filter.c
++++ b/bpf_filter.c
+@@ -152,7 +152,7 @@ pcapint_filter_with_aux_data(const struct bpf_insn *pc, const u_int proglen,
+ 		switch (pc->code) {
+ 
+ 		default:
+-			abort();
++			return 0;
+ 		case BPF_RET|BPF_K:
+ 			return (u_int)pc->k;
+ 
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
index aa5265a54c7..da218bd87ba 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.xz \
 	   file://0001-Fix-error-messages-about-32-bit-integer-overflow.patch \
 	   file://01-CVE-2026-0799.patch \
 	   file://02-CVE-2026-31912.patch \
+	   file://03-CVE-2026-31911.patch \
           "
 SRC_URI[sha256sum] = "ec97d1206bdd19cb6bdd043eaa9f0037aa732262ec68e070fd7c7b5f834d5dfc"
 

