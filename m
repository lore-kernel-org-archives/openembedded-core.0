Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7841C4450F
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:42:57 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.139217.1783291376418206242
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:42:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=p7fNNtic;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493b779003fso11293445e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291375; x=1783896175; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8OS7j5fmaQytDbieZqQl5tGAc/dS+Ujbzuqsx2noPk4=;
        b=p7fNNtic5HaRUUGAdT/fvfvo5cDzWdd5NMoN3yt6t/14z8DE91fAdN7Gy8lXB3z3GC
         v/CWjrV89wSacBQy+Z+XjcwqNdF4RLEd/erEM62qINEhrdoUlsMHtyo3XQMiRg8vVC94
         agUmh7Jn6v6Wnpsn20q19IaOtUARIlFPQ50iQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291375; x=1783896175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8OS7j5fmaQytDbieZqQl5tGAc/dS+Ujbzuqsx2noPk4=;
        b=fjk1UfWQ86O+N+pgXA+GyCBZIqtLGaBVhMPsQ/o6SWBkDxErc8iYu7GmI1nli9uQiN
         1vTXvdUbWy+l7s6VTNsbutF3RdneRjkRuXDE/jOTC4jdOJVzECfOI4qKf0D7r2BIrZgg
         C7BybFsfl8OuLdUm3+XK/3QVxnjnZMFWMJEq43KZMJDkWXUTElJj4NZkFd2LgFmrmwdc
         oTBzz+4tK/1cckb0aWiEGRhf8sOFTYjn+8nHznEA0Za8BoPaPn63rfhTt+DXAgE0EhSb
         wwdiUl8PePqN3LESkMn/qVOt8nGXYx5qU7SfIs8/EuhmA6+iELSNc99zgl3zFA2K7G62
         ROww==
X-Gm-Message-State: AOJu0YyqxAxaMmTGZD0zhMXOGR2S1PvfBhdlqz4iQ/LmjOcckUIsAaBc
	iR9s0VHG+AQStfILjSo/iV6vH7NmJu0zh8B4dVs1IRvsDuO5334THF9nb0g9/IIalDQ87Ud7COf
	DcxGIpk0=
X-Gm-Gg: AfdE7clC8RjKU9FpnmkbwpVN7benLPucxTZ54AdDBYD+mTLDqgHoC2OAWxyY+quN41w
	epqqOPzhmLZxWYktBxHJZw9dlLjr3kM4Zre4Lofs40DmYPEcd2C9S6+q4O83/bhutgdi9xH5KIL
	WaINpr0o7H7mdR/HJ4uo9v1TW2zFvLGHiGchjz9qmK37pg6V/Z0K8PyO8UawHvQDKSMa9C8Piru
	S43Gs0bjuc4VnKzhoYUuPZRffv22XnJeXWx5IQlZPeTd/T+JE8E2+5uAweJsM2YJBQR/7AUC4+E
	TOW4Z8iXyRLX81Ht5oW9DyNwfc7DrUSfEIIx1qrqoHxzxW65XccHb2vhznKelYgfQ1xKSIt65FV
	2cmvmdC7zbypvVeab+s+HZVE3fNv76N40BFAwq6WbzSDPWDEQa5vYRro78CWAFHT1cM5BDx26iV
	Na+5dqb1y6neWyo3Xqt0miRvhBlN9Gfv4Ja7f4
X-Received: by 2002:a05:600c:154c:b0:493:b7a6:3dac with SMTP id 5b1f17b1804b1-493d1d33cfcmr87701245e9.33.1783291374653;
        Sun, 05 Jul 2026 15:42:54 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.42.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:42:54 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 21/55] qemu: Fix CVE-2026-0665
Date: Mon,  6 Jul 2026 00:41:11 +0200
Message-ID: <21b58c5b455ebc0cd325b17540b25c0ff77d39bf.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:42:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240174

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream stable-10.2 backport for CVE-2026-0665.
The upstream fix commit is referenced in [1], and the public CVE advisory
is referenced in [2].

[1] https://gitlab.com/qemu-project/qemu/-/commit/058e1774d678031ec207441a51efcf8ae94cc6af
[2] https://github.com/advisories/GHSA-4pq4-6gr5-cr69

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2026-0665.patch             | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2026-0665.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 1d493ee1a32..518ef69789d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -38,6 +38,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://qemu-guest-agent.udev \
            file://CVE-2024-6519.patch \
            file://CVE-2026-2243.patch \
+           file://CVE-2026-0665.patch \
            "
 # file index at download.qemu.org isn't reliable: https://gitlab.com/qemu-project/qemu-web/-/issues/9
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2026-0665.patch b/meta/recipes-devtools/qemu/qemu/CVE-2026-0665.patch
new file mode 100644
index 00000000000..ed8623c2257
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2026-0665.patch
@@ -0,0 +1,38 @@
+From 77705f3f91dc1ede803228a0eaf4593103466e3a Mon Sep 17 00:00:00 2001
+From: Vulnerability Report <vr@darknavy.com>
+Date: Fri, 9 Jan 2026 10:35:48 +0800
+Subject: [PATCH] hw/i386/kvm: fix PIRQ bounds check in xen_physdev_map_pirq()
+
+Reject pirq == s->nr_pirqs in xen_physdev_map_pirq().
+
+CVE: CVE-2026-0665
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/058e1774d678031ec207441a51efcf8ae94cc6af]
+
+Fixes: aa98ee38a5 ("hw/xen: Implement emulated PIRQ hypercall support")
+Fixes: CVE-2026-0665
+Reported-by: DARKNAVY (@DarkNavyOrg) <vr@darknavy.com>
+Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
+Signed-off-by: Vulnerability Report <vr@darknavy.com>
+Link: https://lore.kernel.org/r/13FE03BE60EA78D6+20260109023548.4047-1-vr@darknavy.com
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+(cherry picked from commit c7504ba2a560fd884557f6e5142f03b491aad0c7)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+(cherry picked from commit 058e1774d678031ec207441a51efcf8ae94cc6af)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ hw/i386/kvm/xen_evtchn.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
+index dd566c496..173e0818c 100644
+--- a/hw/i386/kvm/xen_evtchn.c
++++ b/hw/i386/kvm/xen_evtchn.c
+@@ -1877,7 +1877,7 @@ int xen_physdev_map_pirq(struct physdev_map_pirq *map)
+             return pirq;
+         }
+         map->pirq = pirq;
+-    } else if (pirq > s->nr_pirqs) {
++    } else if (pirq >= s->nr_pirqs) {
+         return -EINVAL;
+     } else {
+         /*

