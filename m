Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DEDDC44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:23:58 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2909.1784568232537687556
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=amB0I0me;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493f6de72faso28435845e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784568231; x=1785173031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YdqY19dUutz1p817DrPt8kbsZvEm9gbYlTmIyLX8nHQ=;
        b=amB0I0me85HwoAfbdUdJxYfU6CtjECQojf7wdYc+8YW1F8Smkau/NBNxmWdbmW1N1h
         wgBkIall6ZqaenZN0jkxmUrigr5+VALGDwuRg4hM46JIMXJdfuDw9C59d1gnZhvs5Z4E
         i+ql9VQjMicUaGcMmYq4f+trEX1++EwVc/FoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568231; x=1785173031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YdqY19dUutz1p817DrPt8kbsZvEm9gbYlTmIyLX8nHQ=;
        b=TJUI79iuvY2gMq7cuDPcmOK+X031OyV8EVeldqfFQdrL0jxgnKfFFOBPZSeSoMEOoH
         q+jda2F+50E6rE+S2R15ie3IG2RCY4BWZXGyBTefm+30k0Mu6vgRbWPdg1xjidQ05cvM
         Y8iBbPfs1iiXQZs8rYJ13feKY5Ivntnw670l9Ln6+zUy882l/06841k+KgiN5a69/DiG
         KJH0FNpu81vUNpS8erCy21gTSDL2SkB1M5PrAR+k2hrYZvPzgVl16Zq8BEvaY+i00Twh
         pLKcVT7H0SfadGc6Dj2sN3U/HBnd5VCGNJ+aAap5MRjThG15/iMTRHHTrjQ198moPYyR
         J25Q==
X-Gm-Message-State: AOJu0Yzvx4uw4IGw3wGSOebz55yEWiapXDl0jyCqFE2xtZbqpycifqW/
	1fulMOgWSxwk/Nk0JxEVNPqlcxPwtoRTfIqyjaz5bWfVpVKwydGDjeHojvgGlCAFWTM7CB0+cfo
	WpGSZvq4=
X-Gm-Gg: AfdE7ckZ81Vg4wUVw3794LQEYLjvZQJF/jKF062A8vkQeTxDzKkjq8lL7u/gfX8XeiY
	04HBEz1O/y2lEE3hn8GbEj/f9LiGJ0qFaRWImwj5ixbmVJY7+DsVdkwr2+RrZpIULXSbxFLFWbr
	m875B4PE6MODQqAa1H9L691NTTuGUW0FHLoXDoYG0RwLRQG0pIFTCZUd3/F8Np+89g9QoePdKyL
	HeTCdg/ctau7o05KdNKmKnnsGtSb/ERFqxUO/McoaBwbddZq+FgkKVNbVbP6gNtg6DQ7kEM0n5L
	/AADYXrl+ssQV9P3rDNdF158MZzBWQ0pcvvaNXyMTa6tUPDqA6I/GegQjrv18slT1/YapqSfuJt
	n7HV+mSB+IITJ+qgZFYCUsQQgxiQ7CskkdQrN8IpPTXbS5Zy+jfCskOaPR31lJFShY1Ar17pbep
	/pyKI7LQzy+sFXdd9jZZxI+TwFaWede4i88ZUe3A/2oJJPMPzlK5I/cEu1o/sd7OHhn3sUENdoT
	suX/LzA
X-Received: by 2002:a05:600c:6289:b0:493:b4a3:5ab0 with SMTP id 5b1f17b1804b1-4954a33dc26mr156197565e9.13.1784568230850;
        Mon, 20 Jul 2026 10:23:50 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-b501-5b7b-2580-caa3-ecc1-dea5.rev.sfr.net. [2a02:8440:b501:5b7b:2580:caa3:ecc1:dea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563eee22esm36508575e9.1.2026.07.20.10.23.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:23:50 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 32/33] binutils: Add CVE-2025-69646 to "CVE:" tag
Date: Mon, 20 Jul 2026 19:23:05 +0200
Message-ID: <6e6e0b5b8a6b743696b8447dc8f7f95e1b148459.1784567958.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:23:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241466

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Bugzilla bug 33641 (assigned CVE-2025-69648) has been resolved as a
duplicate of bug 33638 (assigned CVE-2025-69646):

https://sourceware.org/bugzilla/show_bug.cgi?id=33641

The existing patch already fixes the issue associated with both CVEs.

Update the "CVE:" tag to reference both identifiers.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
index e04d7ed6c21..e123273338c 100644
--- a/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
@@ -19,7 +19,7 @@ length field.
 	(display_debug_ranges): Check display_debug_rnglists_unit_header
 	return status.  Stop output on error.
 
-CVE: CVE-2025-69648
+CVE: CVE-2025-69648 CVE-2025-69646
 Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=598704a00cbac5e85c2bedd363357b5bf6fcee33]
 
 (cherry picked from commit 598704a00cbac5e85c2bedd363357b5bf6fcee33)

