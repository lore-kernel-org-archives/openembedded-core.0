Return-Path: <ungerer.ricardo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 242D0FF6E87
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 22:04:02 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1075.1773785036814543902
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 15:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fBLTAiQH;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: ungerer.ricardo@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43b4d73463dso799691f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 15:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773785035; x=1774389835; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lxibpbhxgdkfs+MFlTEJflsZ708gJWpXNU19A9PhJD4=;
        b=fBLTAiQH4FBdSMApTFXGWf+DhYxb+wK5KyZCLAIEKzom6mmQHa7/e9waMcqRNywQzz
         GkjT6KyfeKKdff2k4Z61AAMobcKj2pDg0eQUHvBWakA/TfPQAlIUC1NBIH9ghebq1/m3
         MVwjNOBKZlRy+W65y3YZK+pyQ2QU3hmyOEAQiFDmA+sgoH8TvbG1xyUBoM7sDtQcawMx
         SE/lFVoY/NDjC/aF2MGMY6XL0dXEyFOr8TBNemzn+RKBWPxitz2yvZMU8Ivh42tsJM71
         RrSvOQgn/6q5GqCDf2mf4ruuPLd5cxBrejR/GQhse9A4knJVuHaBw6uk4n7D8vJkM0Xp
         7LYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773785035; x=1774389835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lxibpbhxgdkfs+MFlTEJflsZ708gJWpXNU19A9PhJD4=;
        b=rNGLVk4ZX1ADsC2cAmEy5CZrPYoQmbvYZfm5bT2IjMk6XcdH1rYqR+aI8a91/+cunr
         zwtG22Zo6fHd1Y3EXSSSRdDlbx3ElmgDydkOTgNCNQsLkyaf+RbtLM90DwVtID7m6vuV
         4bKOvQzQfRdkxxfTfvEyCIvAyAyuO3qNW7KrFxMD8QsDMOfJSW1iiE9zqKSc+42oEwcu
         a6OXyxkE80IqUfKeT5llYiRCpWsZ9eeXhCEUVmPuBzg3+TJ+1do+zzEwcWYMmeaWKnQr
         frKS/WiOeT/mqkA9I5wO1Ai+Rwo6BUeZCl8cFLk6rYRmgJhlB1O00Ya+jhSY9KttZ+Yl
         Mswg==
X-Gm-Message-State: AOJu0YxToZsxx3DR3GOEFWZIz0Zl/BH5ZzwqFmLy2THC9K5vOBSlFHvX
	mrBwR6EwSjuODEFfSUbVbdbYLAqp1FUiTx28eTxNK95DyA6SexzIMmBqyipapg==
X-Gm-Gg: ATEYQzwYUBHgb7EMBXN9eQNiLsqjVZCZm5d2gNMKQYp8cJztBgJRig1sld3Z7kQ5ou2
	YZe6Nd7qgCT7N3wXEihThhMQEewZiwHG1vKy8wrt2ziOY8q2w14cwjkDvwWWCl/xqqh0NtF6SU0
	EdwI/lE8vJ0j9u7eofGJG0VS9VGhLNgWdjusIIEBU/Cs7Yh4L56SyHpZOoPD+aducp8xPbnSPE7
	GqOiz9D77eZ5dgg5EupRzrwihwXE1VjdeHRYjQI8AJHokorEvQsivx8c0BUvAHUZWgeNso8hMog
	ifDHKw16tdkfRSCoXqIXABs/chwMIC6J9bilT5W565CRVtLPYGX6joQvUKkRkoqpcfjsA1Lh+Rj
	c5ag9tLBbBEIZ8EQURXTHQAtQOoeamiofx7xNfY8+XBPXKvBZFmuevn5blekkIXsd2WpobjojY4
	pg3xH+hOCpKGZ2+1mz39QZWGh4e2S4KgisfJd0xNYRoWWx0HM4NTOKMF/TRVh/5TZBn9GN9Q==
X-Received: by 2002:a05:6000:2906:b0:43b:44e6:6e4a with SMTP id ffacd0b85a97d-43b527d2ec6mr1461342f8f.52.1773785034541;
        Tue, 17 Mar 2026 15:03:54 -0700 (PDT)
Received: from bolonheso.. (36.207.137.78.rev.vodafone.pt. [78.137.207.36])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43b518922absm2452743f8f.18.2026.03.17.15.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 15:03:53 -0700 (PDT)
From: Ricardo Ungerer <ungerer.ricardo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: toertel@gmail.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ricardo Ungerer <ungerer.ricardo@gmail.com>
Subject: [PATCH] documentation.conf: Add LICENSE_FLAGS related variables
Date: Tue, 17 Mar 2026 22:03:50 +0000
Message-ID: <20260317220350.655982-1-ungerer.ricardo@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 22:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233353

The LICENSE_FLAGS, LICENSE_FLAGS_ACCEPTED, and LICENSE_FLAGS_DETAILS
documented in [1] are not listed in documentation.conf. This commit adds
them to the documentation.conf file.

[1] https://docs.yoctoproject.org/dev/dev-manual/licenses.html#enabling-commercially-licensed-recipes

Signed-off-by: Ricardo Ungerer <ungerer.ricardo@gmail.com>
Reviewed-by: Mark Jonas <toertel@gmail.com>
---
 meta/conf/documentation.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 741130a392..8c0358a138 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -261,6 +261,9 @@ LAYERVERSION[doc] = "Optionally specifies the version of a layer as a single num
 LEAD_SONAME[doc] = "Specifies the lead (or primary) compiled library file (.so) that the debian class applies its naming policy to given a recipe that packages multiple libraries."
 LIC_FILES_CHKSUM[doc] = "Checksums of the license text in the recipe source code."
 LICENSE[doc] = "The list of source licenses for the recipe. Logical operators '&' or '|' and parentheses can be used."
+LICENSE_FLAGS[doc] = "List of commercial or other special licensing terms which must be explicitly approved through LICENSE_FLAGS_ACCEPTED."
+LICENSE_FLAGS_ACCEPTED[doc] = "List of accepted licensing terms matching LICENSE_FLAGS."
+LICENSE_FLAGS_DETAILS[doc] = "Gives more details about a specific license found in LICENSE_FLAGS."
 LICENSE_PATH[doc] = "Path to additional licenses used during the build."
 LINUX_KERNEL_TYPE[doc] = "Defines the kernel type to be used in assembling the configuration."
 LINUX_VERSION[doc] = "The Linux version from kernel.org on which the Linux kernel image being built using the OpenEmbedded build system is based. You define this variable in the kernel recipe."
-- 
2.43.0


