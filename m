Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8879CD3423
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:30:19 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9380.1777739418112151901
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g3fSjiow;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d7badbd7dso1251793f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739416; x=1778344216; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yiw23kiSH66wv4gFbINLi0bKgo6UBE7vW9JhEztcSaA=;
        b=g3fSjiowgpz0B8QVMDR/ueZynlvr6ilowjW7Pp0Vt1NCPzUpnHtYQwHhnQFFPR84SS
         698AMLoQTlE1nu88AXHHyxnB2m8if+YdecNnDOI4gHIflbEaZE6EmktWt+GNh1IkxL9G
         uN//36SBaV9WvI2gW4nl3HwbGcNHlI6Ji7e7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739416; x=1778344216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yiw23kiSH66wv4gFbINLi0bKgo6UBE7vW9JhEztcSaA=;
        b=anQ6UcHOknfKJMcX+cijdBYWQq8qj0HKEz1CbZE4krJi7n0EI7N673WUpRKtDbzjYT
         0Up+QvmBz50WItjBFSAuJYOeFF0fXmM0i7zGTpuoXGNn0lj/Rpi9SAdzHmPaW+BbaMR5
         qeGFIVxQrRXeYmDDJsaRa76UDpuW4EYq1DTl0KUrkJZK9la8+ej0WpfK5ywlKCs9bnVV
         Caem68NOPJ9YG1/QDQWiSNKapK6EM3cItDdYLQVm34voGQaRDhzWc1rGWe7gfsJ/yn7C
         l3ko5mvy+4h94rYVDSoZhKrPmT/b4AQNrz1dDw8RM76rhipFbpIQbGpvsmkTSFG3QE2U
         OZ1Q==
X-Gm-Message-State: AOJu0YyoiRZaWlyE+hC12YnbAb/ruRYN/MvanufVZ0ZfrI61EOWIOS3/
	zn19W88RiWFvZhXYUbZa0EntFsrDuxLCi6/TQPQ+i3dKHOaW4IKJjsCVJ0Bxk36cLRKJyJmhTfR
	+cmrOkmpEcrW41BAYRClHxNurA/fZwkPAKweRqTze0WoAalhCafUKUSel4ef3GBH1l6nR/0Ck4C
	M6KwFS/xkJWbXVmLM=
X-Gm-Gg: AeBDievYs1xtFaLdtkhxOUFcAKDjpGUnMUBAQTj50rHeyVxEibQvpAWE8grH0gLWpBG
	RxXZhByUgNHuI6gNBgPxAcjLnKkNFa9GD5u1wpdQY1AqfoL0grBbsW7XI0uM8dyGEF8mzzhooxj
	AWtuxHEPdru0CiyiJvIvVmhGThWVqAuwWVHFFXeVbrBwoPVT/4JOwIAhR/Xz2eLPqduQqtluHEv
	gJRZ+YV0B01P9nm+0hp+2faJc9r+gNvIbYR4owVlXVfrKrFynvt9Smu/81ksInack7KTZWjT4yG
	r4xTNLjNVKiMwTzoABeSbBlisqircpGuy939N9Fq7qXaJ2EhsoddpMkOjfL5rN4kb0rqZu09HuS
	uiBs44eSzoxA+dywmwZ/Fa7RorV2kqJ9gaqe0Joy/iUOtJbWboQfeKdQCT/XXC1nMytzsG693LY
	SSL5IioW+29Ir3FkR7tes5k85e04Wf/K/9bJH5eLZ7ftDUlZxPLTi5pAVSIWW4o2PVoLIRlUU8j
	w==
X-Received: by 2002:adf:fc49:0:b0:44b:bf31:1858 with SMTP id ffacd0b85a97d-44bbf3118b2mr3363767f8f.0.1777739415984;
        Sat, 02 May 2026 09:30:15 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.30.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:30:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 24/62] libxpm: upgrade 3.5.18 -> 3.5.19
Date: Sat,  2 May 2026 17:28:44 +0100
Message-ID: <20260502162929.1377831-24-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236333

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xorg-lib/{libxpm_3.5.18.bb => libxpm_3.5.19.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.18.bb => libxpm_3.5.19.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.18.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.19.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxpm_3.5.18.bb
rename to meta/recipes-graphics/xorg-lib/libxpm_3.5.19.bb
index 94bf28232e9..32e052fd424 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.18.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.19.bb
@@ -22,6 +22,6 @@ PACKAGES =+ "sxpm cxpm"
 FILES:cxpm = "${bindir}/cxpm"
 FILES:sxpm = "${bindir}/sxpm"
 
-SRC_URI[sha256sum] = "b4ed79bfc718000edee837d551c35286f0b84576db0ce07bbbebe60a4affa1e4"
+SRC_URI[sha256sum] = "ad3576d689221a39dc728f0e0dc02ca7bb6a0d724c9a77fd1bfa1e9af83be900"
 
 BBCLASSEXTEND = "native"

