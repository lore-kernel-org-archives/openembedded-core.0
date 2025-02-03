Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73A4C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:41:40 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.92634.1738600893403771497
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:41:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cSQLVKOw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3862f32a33eso2080788f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600891; x=1739205691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/qzGFr+pcLfRPc4Wwuv9ZNihxYeQI1FM6ZmgwOmc55c=;
        b=cSQLVKOwCEGiGEckueSXP9NKsE1dYoocJThqIiRjO27KU21mjrFvl+lvujoix4HfPb
         2jyR1mEhZyGCvB+cmeU74hEj9v0WNu0zYO+n7MAoho1xUGBBXXOS8DKn7NHvNqkhCufj
         w8KCasrOvGcP1H+GtkFWAcRFDYqHXY9EFxA0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600891; x=1739205691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/qzGFr+pcLfRPc4Wwuv9ZNihxYeQI1FM6ZmgwOmc55c=;
        b=vnbjs/h+OLBbTHnt9oX92e+t2A9XTTZ/ePIplR6Z7+4OFJEfHOULp1E/oaa31ce56R
         Uv4lvpzPx+s5zHwYvYNv/MChNlWhiEnFNVPr2b9S6nxidpXjJeMY+iPX32aurrdcYmdj
         SLIgdkUgLwBWQlT22meVtmOW+DuqSUf51Febjo8VEV/bD2rgjI30A9UYx/7Np52cVWGs
         RXnmDcMRFyIUch4GTPz6TSQ8mZFAMQJMsVZHiEPewWRmMoVUJFgVh4iKTEmaffplaAIG
         TsExTzbhhqLISohhGItdiO77OPvISoLH0sqOsTJq+M5DtmscjbM2qXHxje60XncTQmNV
         1/hQ==
X-Gm-Message-State: AOJu0YxCtsboCFTy9KR9Fom3MZgP2BWHQzR2iEEaXnOTPS9vW7Har+dS
	pKXTrqyGRN9pg5uTSlMiwZfl6sS+agBYW3qR6Gk0VTEU+GYtRGmMBmbeaVK7mH1bQEM8yRWEYx4
	O
X-Gm-Gg: ASbGncufk5hWsqfVlx0npG2VHKSj13PX/NxsKDSMfY7/nd7DaCT2U3XMwnu3NnZuhEj
	53LFKf801gDu3DQoqLiZOWQ9lx4fmhQtm9uFIfnW4vM31lTBwE5ULkmSwIRrCYa1i4FbkZk+GiA
	/MISWCRCJ6aK7hakxcPUn4x2767Ydds65NmbO3j5mB84FMFRPM9DVUwohP+oHGCJsqwuQ9JbsRR
	H9+8f634i82bs8y9rWPkhI+kJAyGk0LDyouDcAzuHJGwveHmidmvtcvDiCrk7YSW1Ujbcpz4wUY
	hPC4LjCxmvUOBO8sFwHSaiQWIvV1f8pn5p2EF4gaIFx8
X-Google-Smtp-Source: AGHT+IFz2bHWkPBEbhLkHtsGKJ9/gcvQCV+talNBYvv9SWa5pSGjALL9aDSL31o5wUPj93rWeAkthA==
X-Received: by 2002:a5d:588c:0:b0:38a:8f77:4b with SMTP id ffacd0b85a97d-38c5193206dmr18110711f8f.5.1738600891437;
        Mon, 03 Feb 2025 08:41:31 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.41.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:30 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/46] at-spi2-core: upgrade 2.54.0 -> 2.54.1
Date: Mon,  3 Feb 2025 16:40:45 +0000
Message-ID: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210674

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../atk/{at-spi2-core_2.54.0.bb => at-spi2-core_2.54.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.54.0.bb => at-spi2-core_2.54.1.bb} (95%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.54.0.bb b/meta/recipes-support/atk/at-spi2-core_2.54.1.bb
similarity index 95%
rename from meta/recipes-support/atk/at-spi2-core_2.54.0.bb
rename to meta/recipes-support/atk/at-spi2-core_2.54.1.bb
index 975dc9b959d..7b87783735e 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.54.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.54.1.bb
@@ -13,7 +13,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "d7eee7e75beddcc272cedc2b60535600f3aae6e481589ebc667afc437c0a6079"
+SRC_URI[sha256sum] = "f0729e5c8765feb1969bb6c1fba18afa2582126b0359aa75a173fda1acf93c4c"
 
 DEPENDS = " \
 	dbus \

