Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171F0C982DD
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:28 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1604.1789682906112728356
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=h7lD1Y8F;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso578495e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682904; x=1790287704; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dr/PAf8qCEVEQ2LamWbc+s7h3RHTEZ8S5+8GYhyF+xs=;
        b=h7lD1Y8F84g6UtqQX6pGiHhb5SvD9M5PUtzrdyN9UBUJzVSGriF9ZvQFq2eI2O4IKj
         Z9CN0FRORZ1P/cR7nfTpcqj2IgUpzF4GAJ8bAB0qSamY6rxhMq+4Atr2MGHXYPXyaDjq
         GdvxLqjyzM84HgUFS+W2WSt57GBtI1p49wx8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682904; x=1790287704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dr/PAf8qCEVEQ2LamWbc+s7h3RHTEZ8S5+8GYhyF+xs=;
        b=UGvpYFWf5VFUTvhZZBE1QwkzD0emK0XaF3YzijKuW1XIpDcmXDIzn+Xfno+PfUOAdp
         uqexSnkNXcwE+Pxw5gcnXozyMdWvIj20o6xI15xtYFFAC3ZFL9zeects+Aqnsug1jnPP
         PAVwuRi5wgqMY2ScNYjGh2nMEl8WkZY0AYaThRtJ7FYrop7+MHUNhzghz5/nuXGIkPF8
         WFEDxF9bm39FxKqzKewzuuMMZmlIQxnRW35KKRgrIyI/XBHELTJ0xaciMs1iuMFvJFae
         yFDP2XR8DY1R1eujQLZ8T/1s9VpW7aXI2gAWm/00ZFfa5Yi+Gqt8OYtZeG9RCgGfuWSO
         CnYA==
X-Gm-Message-State: AFuF++llgq2azRcHsk8z9j8shQWwuPFr3v1FpT/zFmzjYhkfpIbqxlZ0
	fRKED7XL7othsyrfBcRNazYWVnoZAfEsz+mPIqdEPyDb3qHIKMXubBICDIP85bxfOHhFkR9HV/G
	1nENLRsw=
X-Gm-Gg: AYBFou1HVvSWMRXa/PkCOB5QGGOnC65FnICv+vstn3RV7de61NtiVPXX5pfn9QFcFuf
	3/B8Mgzb0K4KKj2LKvvbnYcqEVw88EdwMHanXV3Rxaub3I3Thw1HJHFBCbgD8yMbQg3oeryaetP
	yxufARpvfcIH/5ZE/rOBS9dZsseT9mbzqWJW9PeyJdgaYdDQ22oZPXRrmECT4BCouXHnflbfdx1
	WYHsvslA9fUS1ZaWlj9m/EIU7r1TYeAlO38YBiaykkG8fH4HUkvUi3xE6eYBLN0QVRTOQYE51n/
	F66+SH0dVLZJH62Ox2xXllfaJz4wiDnY0druxAvGqSDJNhmNvuCfFlPT5qQdMAVcWPrs1mu4o++
	LEjrluUWvFrC8FB6e6kIfGKjNsartT20yuHD2im+Syu3KngwkVT/9ejXrIX0v0v847GTnKKp+yE
	di+lulJ675+N+EzLAKPxOC4FbxXtJ36gmSao3EDLuLUl3Mo/HHYmuXUpWoi1OsSi9X41AUjgayv
	524w5qAr11c8hCCtrXSSGjJv51i6rjoR/M+udApQkHwK8SCh37H+RYtE3NZyrcoCMMYMNSR/RY=
X-Received: by 2002:a05:600c:1382:b0:49d:1d7e:4085 with SMTP id 5b1f17b1804b1-49fc5750e24mr2590765e9.22.1789682904332;
        Thu, 17 Sep 2026 15:08:24 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 65/79] libpcap: Fix CVE-2026-6244
Date: Fri, 18 Sep 2026 00:06:50 +0200
Message-ID: <bff5c99d67566080b34f35898655fb0122339a46.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246160

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-6244
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/98bb921b141aa642faedbf2ac510541c76499a19
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpcap/libpcap/04-CVE-2026-6244.patch    | 50 +++++++++++++++++++
 .../libpcap/libpcap_1.10.6.bb                 |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6244.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6244.patch b/meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6244.patch
new file mode 100644
index 00000000000..b7fec6b554d
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6244.patch
@@ -0,0 +1,50 @@
+From e2f4d78f71237c44f730fee11fa0497b756e9d81 Mon Sep 17 00:00:00 2001
+From: Denis Ovsienko <denis@ovsienko.info>
+Date: Thu, 30 Jul 2026 13:34:21 +0100
+Subject: [PATCH] CVE-2026-6244: Avoid division by zero via
+ pcap_offline_filter().
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
+Notes on backporting to 1.10.6:
+ - The upstream CHANGES/changelog hunk is not backported.
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/98bb921b141aa642faedbf2ac510541c76499a19]
+CVE: CVE-2026-6244
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+diff --git a/bpf_filter.c b/bpf_filter.c
+index f8b842d6..0178aae5 100644
+--- a/bpf_filter.c
++++ b/bpf_filter.c
+@@ -420,10 +420,14 @@ DIAG_ON_DEFAULT_ONLY_SWITCH
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
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
index da218bd87ba..258a15f5bac 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.xz \
 	   file://01-CVE-2026-0799.patch \
 	   file://02-CVE-2026-31912.patch \
 	   file://03-CVE-2026-31911.patch \
+	   file://04-CVE-2026-6244.patch \
           "
 SRC_URI[sha256sum] = "ec97d1206bdd19cb6bdd043eaa9f0037aa732262ec68e070fd7c7b5f834d5dfc"
 

