Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F0C4CD98E2
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:22 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105058.1781424261432720515
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:04:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OiWR86vC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490aebf33e9so9978055e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424260; x=1782029060; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z0I/Ga1z8C5o8nxdvj9HViyPDe5w/JzpkWsf2+vxjQg=;
        b=OiWR86vCGGfk5pK2uQBXewVsup7A3VV3Fn18jFAD1vRd6owHHJg+OGYm74vkuMEV6L
         CSNGQ4Mp0N94jFsRfpJzl+QGszFpg+92929ol/F01jU0fq5Rf2HSOhQyd04R5mGdLUw/
         +6sLehrGYJ2UjcV4q2CyIBVmpcmoR/COWjLY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424260; x=1782029060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z0I/Ga1z8C5o8nxdvj9HViyPDe5w/JzpkWsf2+vxjQg=;
        b=pk2Vp4IbHNM5MceMNBEl+l1fhVsvEtHy5AQyiR1o3iergTS4ltba7BmbAfufJDQGFa
         nNiQUXIUC0MbBGRVudAVP8AEbqEjL+NGZFGT9InGt1u3pvdxByFMZD26mxMhZp7p2Gha
         G5NLo6yh9uflO/BFw4wRVnJjqQN5KpV2JVIl3o65wFAhoJiLHJY10+PKto8MbBBXLAQy
         FtqTp3j9gqR6DwIeinCi32XP2Z5iLf3lUvuYhAZvMp87MvtJho8u9Ao05rt22DygCRly
         S/mkh1AgJ0L77IDEDYvPMrp0oDf0+Gvbkzs4m9glE4Rvv4NR4TWV4YEm/jLqY/wJ0gQ5
         LjZQ==
X-Gm-Message-State: AOJu0Yy+JqaQmb15beTvWznw2bpFmtX1SB05HJknE8BJAe0a2eyUv7wD
	jwCwYPwhPChHzVlu9hBg/ZK/qp8UgYZr0OUFWwIzrrHG4AylR7HUmAva57GsekZP8K1S85zf1m3
	icb7r
X-Gm-Gg: Acq92OGyErX4DkEHr3abQt7gpJQ036GPgVhf1oX8fxS4Df3Uh+MlwzzlfiVxWvBUizm
	r7nuQoFDdsRdO7anTRUpUQ+RRq7rvktQBeMl3F33mcnlNB3aBUjE1zdCwcYZV6AkP8wbK3+7elx
	zgQIOYKaxQG9rMCry0GnglhLx2M37n2zOuV+imhnCJcFB5IyBgEhjoZpavErVg6mLOhZa9c03ar
	xo7Tf12jugHMzGqBbmo2FzoZk+8X6TwfqPmDgWQz0GslvDH12T33588moKdZV2SwqIsnlQR3vJK
	cBJ1hCLjzHzGNpa2z8Yow4RNpbDH4dcN9okQO62f8tDFycKyhcMoH9NLbB32whIOcchvCxq95DR
	VPxPlzgtgLO9uN317SZjR7PpUFM+rYQpbZaoRyK/v06vX6W+AhD3pk3cJAtnYixaSs2OgAN9J1z
	dgl1mV3q3lraCgS1IF62YTMiO8o1RgqFyi8hWtqDjpezXKvrEIEBdqEv8KY3TCxa8=
X-Received: by 2002:a05:600c:5394:b0:492:29a1:98c4 with SMTP id 5b1f17b1804b1-49229a1991emr1882115e9.8.1781424259687;
        Sun, 14 Jun 2026 01:04:19 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.04.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:04:18 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 46/56] spirv-headers: upgrade 1.4.341.0 -> 1.4.350.0
Date: Sun, 14 Jun 2026 09:02:57 +0100
Message-ID: <20260614080307.4017177-46-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238730

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{spirv-headers_1.4.341.0.bb => spirv-headers_1.4.350.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.4.341.0.bb => spirv-headers_1.4.350.0.bb} (93%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.4.341.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.4.350.0.bb
similarity index 93%
rename from meta/recipes-graphics/spir/spirv-headers_1.4.341.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.4.350.0.bb
index 258ba11504b..c4a7be4045b 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.4.341.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.4.350.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT & CC-BY-4.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a0dcaa512cc2dee95fe0fd791ee83a18"
 
-SRCREV = "04f10f650d514df88b76d25e83db360142c7b174"
+SRCREV = "ad9184e76a66b1001c29db9b0a3e87f646c64de0"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main;tag=vulkan-sdk-${PV}"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:

