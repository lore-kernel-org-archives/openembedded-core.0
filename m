Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB45DC02198
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 05:52:42 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.33444.1738821161617667242
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 21:52:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J2p6uUEz;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4362f61757fso4621335e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 21:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738821159; x=1739425959; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPu4S32qezSc3KLY7SyMngOyXn0YoKwhtJNV1US/CBo=;
        b=J2p6uUEzfkYiSnvf+COMoxFtcyJ1e9+TdZYz1dQXHxyylNnPR95TwPYPCvGcvigVHz
         aBKmzOA/pvlGEchWrrQs/1njoKvZKhefUT0OWutGdTpG5CAIQGO209Y+4DBbQ+/o6KIs
         8tPCPyYielM2cqDWHFK/c3gIJzcdpOQ8+xgNgv/qWBodTKCxnS0solp+MEM0oxFEAXD4
         8M1AYszvx/eaj8k6Zc+BWMgShcIwKhUiuEpFXROD/ryXzoLDx+4ShsfqQyckkZ+e9kCx
         QahQ7yYR4iH7HWfpuzhWZnWaoznyL8CPC2sFgiRkeyHCOpeZdZbR4eqwJnPYLSA/d262
         7nDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738821159; x=1739425959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPu4S32qezSc3KLY7SyMngOyXn0YoKwhtJNV1US/CBo=;
        b=htrRgkTjYxD8BQW/lhScvx5AFbtuGHdC0ZvGYhiZ0RlSnkAik66CjJn4ZWtddaNpGH
         xnn/1G4VthGTBtBvfIyYAYLCjBnQergkEhZQgf4NryodI5iphSJ65BGghIwr+b5BFSyl
         f9YlP5y43mvyVH5TdzDAR3iGQyq88ZKRlt+qaUJJ/dpmTZAMIO1QxUQi16JbX5RVH7EW
         CtHOIMnzxn+a9hxxfxlqvxOJq91eqMlxv5bMXENzxJkyuXtuhyNCGnWGtHf7ymLHWt99
         LOyAE5zq4lVaOWZ/3IuSKmTzfL/SZJO/eV/1O4l/0icjwUX3M/wuJDD0g4MFnvJn4/Gc
         h9RA==
X-Gm-Message-State: AOJu0YwAP5X7ZzSk8UiVFP7cBjONU9RsiV9lhRhzK3lJQJI/dMqONVqG
	xZ3nlWlb8FgGef/eobp3c+i0YwdlX5JKILNkqb6l0vrCASZvxAzb/ZurIw==
X-Gm-Gg: ASbGnctCsprvAlLAm/erlj7gWM3gRviAyRFf1Gd46JNA4FxsumZd5WySz4lO6WPfimF
	s60S9YNcABwlaSgHIa9Htt66eaJmxTz6j7lzlCO2QDjewKVhG7LLNpJ3DV5yh5J/dG+tzhj4lUq
	29YUV9bbPTygU2g1yOKGTlN7AfzHOd4/1XhVZao/dp2A2DR02jw07JaksxyxZFivJ6Hs8MavpSd
	P2fezaI4rW9iO0fHeKvWOIfjA4rqCPUrfaBrGrw++ksggzJk+sWuKf9++dZejAC6Q9lImLq1uC1
	SKaTUFp8BFMw16kBcTvTQ67i/TX3QFF0lFJ/WL9WSxRiew==
X-Google-Smtp-Source: AGHT+IHIw2pYHclMEDd33Bk2BNA5+cPxxLOx0UwB1ZPhF78BI2BJL4AMe+/PeXR/WOgIWeppiFqmcQ==
X-Received: by 2002:a05:6000:2a8:b0:38d:bec9:c8d with SMTP id ffacd0b85a97d-38dbec90e78mr360912f8f.53.1738821159203;
        Wed, 05 Feb 2025 21:52:39 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde0fe37sm777242f8f.69.2025.02.05.21.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 21:52:38 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v8 4/5] dnf: Set SEQUOIA_CRYPTO_POLICY in wrapped tools
Date: Thu,  6 Feb 2025 06:52:21 +0100
Message-ID: <20250206055222.3319167-4-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206055222.3319167-1-zboszor@gmail.com>
References: <20250206055222.3319167-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 05:52:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210901

Point to the crypto policy file	so dnf can work with signed packages.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-devtools/dnf/dnf_4.22.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/dnf/dnf_4.22.0.bb b/meta/recipes-devtools/dnf/dnf_4.22.0.bb
index f9d6ea1fa6..e5ac3c9824 100644
--- a/meta/recipes-devtools/dnf/dnf_4.22.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.22.0.bb
@@ -69,6 +69,7 @@ do_install:append() {
 # Direct dnf-native to read rpm configuration from our sysroot, not the one it was compiled in
 do_install:append:class-native() {
         create_wrapper ${D}/${bindir}/dnf \
+                SEQUOIA_CRYPTO_POLICY=${STAGING_DATADIR_NATIVE}/crypto-policies/back-ends/rpm-sequoia.config \
                 RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
                 RPM_NO_CHROOT_FOR_SCRIPTS=1
 }
-- 
2.48.1


