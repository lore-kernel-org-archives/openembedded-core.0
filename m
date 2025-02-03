Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97924C02197
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:42:21 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.92686.1738600937748636527
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:42:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NQYV73ka;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3863494591bso2361386f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600936; x=1739205736; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jUCDNvTVehS4GfiwGrZZ96hvau21RDlfIrpUn7C4aws=;
        b=NQYV73kaxySRSbaGDpfjy/RfpQ9jHQRBNxH+b5KDifPxtqEGwYD7cFAyboZXd15GFT
         oVZfPG/ikJRHQV/RKLvcq4IeJRFoEmxbcZadhHmV31Dhz5tffki3JY//vv6eNo9cCiHJ
         UV6m5oPZ6SGL6/BhM2jlnJKrryeLHx90FeqiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600936; x=1739205736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUCDNvTVehS4GfiwGrZZ96hvau21RDlfIrpUn7C4aws=;
        b=RVpHsH5HQ4X/kze2dPQupv0b5L+hfGzf4zaDO5cjuICX1V79+2ccxONtm0CdFntGC9
         8Ex8PswX/iOii/eoCyYxeu8vin0rjnJo3ACABHgm1ro9nyHu6rYFAfd1C2Wb5T05mLBF
         8v4g748UsaxpQTBUY0Tw+appgaIm0ovspLv7fe4pRNVe/7egGwTCGuUfjunlLcmwxOZ7
         gLPKAJgLMA0/7Vox/5KODHcqJ5aj5+LrMnc/qo+NSA0VIFmjHS7qZy368KGM0poG4Pxg
         29nowROW5fS3XFy4vgtOp1sJH/tYj9AxLQZ3yU051dr5ITclRFrFyklRTHP3NgJwR9Su
         p8Og==
X-Gm-Message-State: AOJu0YyJBPParbZltXBMInFUuK0cXHWM/Eg7031sFJNhMxnFw6fPc8Uv
	V7UHYqAdsR45rsACScckh42bpWN9Nv7XTwVOx1V23WgPhXGJfx7P+WwZ+HKRE1vw56DleY5S2V9
	o
X-Gm-Gg: ASbGncsMFba2il9TAnYRuo5s63jVrUd0leF/9s7zUq7Hrjoglky4LPak7vQbcAlLAIH
	uE4awF0LS8hp+kLyrtVm9LrWbcG3k/KJx4UYDTuQWwlXHmHvSDEoFGIisSPzzHRB+go1mkXjCYs
	2/L3CNs4tDTQGWedI7fuhB2JvMA2iAH0mKN6oG6Fl9qGcoYuNjd1QO6bFrJ3CRnVylhMzEFDIBS
	b4JyT1QgiAADzk30sjnQO/TVyPpG6dEgbdXq11a+ss4C3IFhV37GqJrrZz3NjyPd8j7FY/zuxGC
	CKFylyTv5bePadvcfVlud3Ylnyo+L4jaYfkJvooIsVQG
X-Google-Smtp-Source: AGHT+IHiYI7P+l0SS2pgTXHkV/DPnbV+CjG7hjw2Lk3nNz79cx6w3o4mIwa3+TKFgVJJBWVLkuEqFQ==
X-Received: by 2002:a05:6000:4013:b0:38b:ed7b:f78c with SMTP id ffacd0b85a97d-38c51946f8emr17417924f8f.6.1738600935715;
        Mon, 03 Feb 2025 08:42:15 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.42.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:42:15 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 42/46] repo: upgrade 2.50.1 -> 2.51
Date: Mon,  3 Feb 2025 16:41:26 +0000
Message-ID: <20250203164130.3403325-42-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210715

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/repo/{repo_2.50.1.bb => repo_2.51.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.50.1.bb => repo_2.51.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.50.1.bb b/meta/recipes-devtools/repo/repo_2.51.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.50.1.bb
rename to meta/recipes-devtools/repo/repo_2.51.bb
index f1fcc9c8a18..b78b4867f14 100644
--- a/meta/recipes-devtools/repo/repo_2.50.1.bb
+++ b/meta/recipes-devtools/repo/repo_2.51.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            "
-SRCREV = "13d6588bf60f0980ffa3d178441fa707655fee95"
+SRCREV = "db111d392407797e170355e1c0ec98e71d4a8278"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 

