Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F658E7718B
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 09:41:37 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.5206.1735810891860868314
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 01:41:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CA2SSJbl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385e3621518so5255057f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 01:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735810890; x=1736415690; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8VGin7sjxhdLx7igLYP1zuzZim99/T8tGofly2sKoIc=;
        b=CA2SSJblp+2BjVw1xRCE6XTsx0nDsEhUFrA6neFM+0rala1Y/lXo6l8gLc+xvUHQLD
         xAg2++IlgGHTYy6o0dwnQVtfpLTAZkd5NqSWHGiAUDWSYeyJ4GHB0XKBPAmjCgG24FGx
         ttd1zLvR3sWMB+LJxNlb73FoCkfwmzZrbib58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735810890; x=1736415690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8VGin7sjxhdLx7igLYP1zuzZim99/T8tGofly2sKoIc=;
        b=KsdFZU5lqEQKdmKWgQR0s2FpnvsDvftyVsgJJ/kqlUnxwPrUfpnrqexIpkkc3/MUnX
         QXp7Ld4Bdrlu3mYEwAwOi+K/9Le6wXXaKpn3f3LyEuuh5cclXAwga2x+NB9P/FxMMOtw
         +wNNkdRjWZM8LE4d4Vm1D2dhtMxxMyyBFnde/eLuGpOsY6z7+u3Bb/EyRdCM10o2E/GL
         Z6N8uhpAHMqxS/2IK9mWQE4j0IKC2q9S80stiMltNukrY0IkDoaLQ42N8NR0FJ3sORvu
         SDBD560H3UTZ8yofV2Xmdfax7yC1DzADcPYmvM7xqs+vabn13bT2JOcEjAc9TC0OwWTV
         AAJQ==
X-Gm-Message-State: AOJu0YzB2zwbm92S/xRwCxeJVN+jsobmag/6De8w6M9YRuCT1Tfo+f7+
	BfLcboV2gS2ly6TfdahfG26Oj/Anz+PIcnt1RbcBYgossvHSJU7/l7tikCUb+WE1RR/0S2axjUr
	Cz7I=
X-Gm-Gg: ASbGncubK16UdRRbvR+QC/aUlDKyyd+MsQ7RKZtVD5YMhuEH4rQvaBSe13604xwFPrQ
	Anpy1SudIVH/Z0mQTv0qauXDh6FnPq9khnVrnhGSAg8fLRcZSAk1XWXsOPiB57QPo6nChiBXW3a
	LlJWZLzQ8KnoD3wGvXhkOqOnmxHNceeLmmOIHdtK+NMY2ca5IyAebXgR758uncxuC8nX7EFP/M2
	JxMc9AsJLIQaLety3YoVlsNZcvAdDCJwifO3frq88AuPH71b2LuGsqdb0Mq+VlxRSvYStPybJVT
	qiAf97ynGg==
X-Google-Smtp-Source: AGHT+IFAvOX3oHsrTRNFbv2fAva4H4mlmU2CYIBmgAtk1sc+fdf0dwQlyHR/k5g/W18JRxpTLzPT3Q==
X-Received: by 2002:a05:6000:184e:b0:385:ed1e:2105 with SMTP id ffacd0b85a97d-38a221f2f0cmr38676426f8f.26.1735810889917;
        Thu, 02 Jan 2025 01:41:29 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ae2e:9f02:55c2:739d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b119ccsm479785625e9.24.2025.01.02.01.41.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 01:41:28 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 20/21] xxhash: upgrade 0.8.2 -> 0.8.3
Date: Thu,  2 Jan 2025 09:40:51 +0000
Message-ID: <20250102094059.322187-20-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
References: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 09:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209280

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-support/xxhash/{xxhash_0.8.2.bb => xxhash_0.8.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/xxhash/{xxhash_0.8.2.bb => xxhash_0.8.3.bb} (93%)

diff --git a/meta/recipes-support/xxhash/xxhash_0.8.2.bb b/meta/recipes-support/xxhash/xxhash_0.8.3.bb
similarity index 93%
rename from meta/recipes-support/xxhash/xxhash_0.8.2.bb
rename to meta/recipes-support/xxhash/xxhash_0.8.3.bb
index f16b183c950..227649854e3 100644
--- a/meta/recipes-support/xxhash/xxhash_0.8.2.bb
+++ b/meta/recipes-support/xxhash/xxhash_0.8.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=13be6b481ff5616f77dda971191bb29b \
 SRC_URI = "git://github.com/Cyan4973/xxHash.git;branch=release;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-SRCREV = "bbb27a5efb85b92a0486cf361a8635715a53f6ba"
+SRCREV = "e626a72bc2321cd320e953a0ccf1584cad60f363"
 
 S = "${WORKDIR}/git"
 

