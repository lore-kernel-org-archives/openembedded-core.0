Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89975CCA460
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:14 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32849.1792040652070953748
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PLTDPwkV;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so38967595e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040650; x=1792645450; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0r7jayP/irf7gquJzMkLKBxq0+l/bPsZu3j/bH5Gpyk=;
        b=PLTDPwkVcLb6zaGr2gTbDDf0ps6iSwz+RSONcW6f0RPKdHiHj1pFLEIHKfD2Yk8Y0O
         bavU7f6eKzdjcY1497Ne3OOSCPYvbUqcDHyHlfoE+PTNxQi18ELDhYrrddG3IT2jYgwO
         j5YM0BQXqQL4Pm3dGRfbDzA/hNM0Wp5C6Bf6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040650; x=1792645450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0r7jayP/irf7gquJzMkLKBxq0+l/bPsZu3j/bH5Gpyk=;
        b=EsdJv2kmP4XM6NgKOSKAVE2g6Lq9bogikEuRRsTV9He4ehUeUvxClZSbmTaGTrHz+w
         94d/8vKwHk/RTy1wrwamotg0X1AGNvF16tM44rXueY75NJjmz4coeNb4PshVZQFk8j4N
         Bqufmd2jyxOIXqJL4X3zbCwxIikwaNFaWEb0roPP9yajbmGl836d4QIYoofcZo73nkOR
         kQnLHaHEByjFKQYtSErMnNVZqqaAdHmZzpaqQTbKLwh32m3MhXhnO9pwgscvff+BC8uz
         ug7aYdqibdhRQ6og7JURvrhGVruVY6PgjDxEmjijgroK+kIZYRymYZVofTFgvdcjGJcY
         vXCw==
X-Gm-Message-State: AFq9FYI6JuXgurv14D5PAt60uktlyE9tfQ1EnqYZUT8sdxwpxc7hjOWr
	0DJ6O+1pFYnj23QsFWXfLpg1DSjo1ZqcEYTTZHJBnvmWgyAgeVLLchIH6wM8MPeOlZciTOpwS+a
	PSfSpK+8=
X-Gm-Gg: AYBFou0DFaNHSVxqOljA4ZS9YlKzyBAXptoM9lxUfaDnrInEWYQYOGuguG5dlEcgpVP
	ALHs2PEqO49NNxqFOsMXqFYBb85T57hYqxtL1HkrDOTuetvRLMN5ld+0q9Eb6ZjaLV6QcHNpP4j
	PiUqAK6ax1JYyD/S1BFZBqi+if03iqhVLb3dYqUfiMcMInXl7GA2F2T0z6Q1GoSn8PTjCXrOZvj
	EtWulyNKhXVQ7T9j1OVunWy/MxJCV45Urgwe76T7748aFScGu3XWi1+MebuHFRIRwyspJMxz9ij
	FoHKNVJNtUCmp6IUiY0ZmPS6Cl262axMd1Dp8gSQKcbtqsureqJ8oHGIZE4vZ0tk1wpQ8GMt9sL
	7I2tRF/AL15ht9aNZ7Kjs986B3tNiucOn4a+EC/Tr7ZIWkqejSYXTUhNd2X2AE51NRgoZQmBB1/
	3/KHdNfSNvWFpcxxBobvOclVB9POvRwqOwo4Bz/5P7I1qsVHCHdiKmxaQ4T+ES5Qhcvy2sMHQT9
	CXKgA1T5VsIusmrJk4FaQeZDkscRVabInodElVitnWnOz4D5MRdCHCNNtM7W7J6lWBzeZm9970Z
	oySMXoJd
X-Received: by 2002:a05:600c:8b11:b0:4a1:ac85:9696 with SMTP id 5b1f17b1804b1-4a1ac859a48mr141136685e9.17.1792040650113;
        Wed, 14 Oct 2026 22:04:10 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.04.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:04:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 46/55] libpcap: Fix CVE-2026-0799
Date: Thu, 15 Oct 2026 07:03:09 +0200
Message-ID: <2f99d027a326fcef62013c3d8bd2464e67809af7.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247844

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-0799
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/48e8960a7108e9e828f9d7bdc7e97bdab841aec7

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpcap/libpcap/01-CVE-2026-0799.patch    | 67 +++++++++++++++++++
 .../libpcap/libpcap_1.10.4.bb                 |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026-0799.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026-0799.patch b/meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026-0799.patch
new file mode 100644
index 00000000000..a4dfea42361
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026-0799.patch
@@ -0,0 +1,67 @@
+From 48e8960a7108e9e828f9d7bdc7e97bdab841aec7 Mon Sep 17 00:00:00 2001
+From: Denis Ovsienko <denis@ovsienko.info>
+Date: Thu, 30 Jul 2026 13:33:41 +0100
+Subject: [PATCH] CVE-2026-0799: Access M[] safely in the BPF interpreter.
+
+Include Security identified and reported this problem as a potential
+vulnerability in 2018 (case reference "I7").  Their work was sponsored
+by Mozilla under the Secure Open Source program.  The vulnerability has
+been independently confirmed only recently.
+
+The current revision of pcapint_filter_with_aux_data() can, but does not
+check whether a scratch memory register index is valid in the "ld M[k]",
+"ldx M[k]", "st M[k]" and "stx M[k]" BPF instructions, and assumes this
+is always the case.  This holds for programs that have been generated or
+validated by libpcap.
+
+However, this does not necessarily hold for programs that come via
+pcap_offline_filter() or [deprecated] bpf_filter() from an external
+source and have not been explicitly validated.  If the interpreter
+executes such a program with an invalid index, it will read/write the
+process memory at arbitrary locations starting at the current stack
+frame.  Depending on the address, the memory layout and the OS, this can
+result in stack buffer overflow, SIGSEGV, SIGBUS or other effects.  To
+fix this, in the interpreter reject the packet if the index is invalid.
+
+(backported from commit 569f8fd3524192acbabf93c9cd704471bb38f84a)
+
+(cherry picked from commit 48e8960a7108e9e828f9d7bdc7e97bdab841aec7)
+
+Notes on backporting to 1.10.4:
+ - The upstream CHANGES/changelog hunk is not backported.
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/48e8960a7108e9e828f9d7bdc7e97bdab841aec7]
+CVE: CVE-2026-0799
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+diff --git a/bpf_filter.c b/bpf_filter.c
+index 8691d0d1..fa82d1d0 100644
+--- a/bpf_filter.c
++++ b/bpf_filter.c
+@@ -219,18 +219,26 @@ DIAG_ON_DEFAULT_ONLY_SWITCH
+ 			continue;
+ 
+ 		case BPF_LD|BPF_MEM:
++			if (pc->k >= BPF_MEMWORDS)
++				return 0;
+ 			A = mem[pc->k];
+ 			continue;
+ 
+ 		case BPF_LDX|BPF_MEM:
++			if (pc->k >= BPF_MEMWORDS)
++				return 0;
+ 			X = mem[pc->k];
+ 			continue;
+ 
+ 		case BPF_ST:
++			if (pc->k >= BPF_MEMWORDS)
++				return 0;
+ 			mem[pc->k] = A;
+ 			continue;
+ 
+ 		case BPF_STX:
++			if (pc->k >= BPF_MEMWORDS)
++				return 0;
+ 			mem[pc->k] = X;
+ 			continue;
+ 
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
index ee7d7540f67..692fdf606c0 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz \
            file://CVE-2025-11961-01.patch \
            file://CVE-2025-11961-02.patch \
            file://CVE-2025-11964.patch \
+           file://01-CVE-2026-0799.patch \
           "
 
 SRC_URI[sha256sum] = "ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159d20e47160ebe5f"

