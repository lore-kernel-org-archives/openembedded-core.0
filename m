Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B56C5CCA463
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:14 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32851.1792040653857940470
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:04:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rJ7fcWyU;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c14a06c95so3879187f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040652; x=1792645452; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eDTOA8KEyqAwNMFFI5Xt9hC9ONyj0E5R5ltQR2Wovfo=;
        b=rJ7fcWyUGPKdbQPYupJvh6Epu1O27GWpsLRatPrc23fqtrNX0bCwaMTMOf324zxOln
         2oge+kGZjTHs3SFrv/wpF2zVxaBvcExSaw3amEBhXNsBQJycuYPlLXe2WmCYa/pWhVam
         kT/+Bl69ljt3lOyH1wGbw0+mLEWTO4HnQXCtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040652; x=1792645452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eDTOA8KEyqAwNMFFI5Xt9hC9ONyj0E5R5ltQR2Wovfo=;
        b=tDxQOCcIK0+Xv0SsE/JQHChQBF8YmX/3QolghfUvP/ieH8UArv2jweOURuGJCAcfv3
         f10FsU4U5Q7bj7obG3TU6ZN5f5HSlWRnsDwTkKCRyPZNtJyNwTAYk6YucM9hdvdAvZSG
         TS2t0Aim8898wbAiyscMcdtKZjIuregDHlnvQ3x5W4odAdLvMmd5U0i6dLkKT8d5pjSI
         JdGsFjP5PMYqlh68cufnKmQFpUetyIqZx7j+o7CUpepnKuzWMRw9XQ0Xcxct5eNifC0y
         uEnCmhpPETj6SGL2zQ/rkY3ZG+Nj8JzF85S2m3cj0uYHntbkEKHcXcxQcy9Dfs6I/oOF
         8eIw==
X-Gm-Message-State: AFq9FYIiYWW+BnkuMud1OE8mTX7LivTUpRoBDDlIpYi+i0AOBj7W5wmf
	mDA3So7Ut7IXJZoA5d8kF/LscDV0NTNHZiwtwCjARn85+64c8KBLsDI2ATUrgnmP+mKO9lMjCS8
	fuHJ/eZw=
X-Gm-Gg: AYBFou2E4DUW0XDdJs7IGbb1VVaO1pTTOVmsKkEbfvpH04MQGL2T3mni8Vg/mhh3XX/
	Yi+gNRkP3KXYDot/fqSq+GIVxNqVnjKvNAchUNahmf9e0svBKyd51EUeCRks8QbsqqFcXdmKr8x
	uJ8BK0aYcAoqnRxudlUaaoFhOHchuuwKa2HpKr/cjjJk5HrxcJEvzxABPKJLOoAjEIvDO+zH3sy
	o0Kom0TGPn1Y0ghsQYqsWfiec0Ush16/BCphy2LDSIyvBkkjlOCz5pHrYFkpmxj+oazD2KCepZo
	OhwsO90D/Xud+zIQ7tbEAMXH34bqv2a54+RN++LZEEhjYPa8cUWaC67qGU/Lbh8NUhC5KgQk8IM
	tJeXJuk7CYNkbc0yh9ayx5EIuOyx+3Obfp6rzqKgLtd1T/Xgxhb4/F/VPTi9u8orUhNtBqaQChD
	I6Cu4jIyxwpGYxPjw8ZKqFUVpBsCPtJkhq3lGWnexweBnxW3yrriSH2I5oON0s/Kvhv2dYC1vzR
	RcNIEeCmoMBU68Rb2iWgm9n6Fxoix5f6jMZtssSWbOZMVwo1lyB8stTUmVjtfn+kfAaDq6kxQ==
X-Received: by 2002:a05:600c:4e11:b0:4a1:7f41:b9dc with SMTP id 5b1f17b1804b1-4a18e4d67famr352236415e9.23.1792040652076;
        Wed, 14 Oct 2026 22:04:12 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.04.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:04:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 49/55] libpcap: Fix CVE-2026-6244
Date: Thu, 15 Oct 2026 07:03:12 +0200
Message-ID: <19127ab88cace8da29f70441528474b326a0af4c.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247847

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-6244
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/98bb921b141aa642faedbf2ac510541c76499a19

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpcap/libpcap/04-CVE-2026-6244.patch    | 49 +++++++++++++++++++
 .../libpcap/libpcap_1.10.4.bb                 |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6244.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6244.patch b/meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6244.patch
new file mode 100644
index 00000000000..5215b12ffb0
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6244.patch
@@ -0,0 +1,49 @@
+From 98bb921b141aa642faedbf2ac510541c76499a19 Mon Sep 17 00:00:00 2001
+From: Denis Ovsienko <denis@ovsienko.info>
+Date: Thu, 30 Jul 2026 13:34:21 +0100
+Subject: [PATCH] CVE-2026-6244: Avoid division by zero via pcap_offline_filter().
+
+The current revision of pcapint_filter_with_aux_data() for "div x" and
+"mod x" correctly rejects the packet if X is zero, but for "div #k" and
+"mod #k" it assumes that k is never zero.  This holds for programs that
+have been generated or validated by libpcap.
+
+However, this does not necessarily hold for programs that come from an
+external source via pcap_offline_filter() or [deprecated] bpf_filter()
+and have not been explicitly validated.  If the interpreter executes
+such a program, it can attempt a division by zero, which will typically
+terminate the process via SIGFPE.
+
+To fix this problem, in pcapint_filter_with_aux_data() treat "div #k"
+and "mod #k" the same way as "div x" and "mod x".
+
+(backported from commit 0b2b1ad4a1796513613ff68e9dc09049cc8e0af4)
+
+(cherry picked from commit 98bb921b141aa642faedbf2ac510541c76499a19)
+
+Notes on backporting to 1.10.4:
+ - The upstream CHANGES/changelog hunk is not backported.
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/98bb921b141aa642faedbf2ac510541c76499a19]
+CVE: CVE-2026-6244
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+diff --git a/bpf_filter.c b/bpf_filter.c
+index 497b1586..df92c433 100644
+--- a/bpf_filter.c
++++ b/bpf_filter.c
+@@ -422,10 +422,14 @@ DIAG_ON_DEFAULT_ONLY_SWITCH
+ 			continue;
+ 
+ 		case BPF_ALU|BPF_DIV|BPF_K:
++			if (pc->k == 0)
++				return 0;
+ 			A /= pc->k;
+ 			continue;
+ 
+ 		case BPF_ALU|BPF_MOD|BPF_K:
++			if (pc->k == 0)
++				return 0;
+ 			A %= pc->k;
+ 			continue;
+ 
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
index 5b97c14e855..d23a018a953 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz \
            file://01-CVE-2026-0799.patch \
            file://02-CVE-2026-31912.patch \
            file://03-CVE-2026-31911.patch \
+           file://04-CVE-2026-6244.patch \
           "
 
 SRC_URI[sha256sum] = "ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159d20e47160ebe5f"

