Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C91CC2BA18
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 14:08:11 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.48592.1718892485701322831
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 07:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=wQatv+3/;
 spf=pass (domain: baylibre.com, ip: 209.85.222.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7955dc86cacso58313685a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 07:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718892484; x=1719497284; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IK6hFPTgqdIKbqtHnewnp1bgaIGCo9GQFNjlAluvV50=;
        b=wQatv+3/YtsP1J1vRBu1lNwg3tbNvn/w2wZfwF9F/Wyh2er/qD9QiPfKcclSCqftiM
         ruJdDq9E6QibbAEcobgmh4NRFFGdtPrZTkBCFvlHua67Xa7rg++qxNb4J0JMlTrW6Hca
         opNXAibpIflckpaQUBs+FoXli8Dtsmu0FwFX4LDNXQ0vQ2ECuTIJWiV9y6/sfTCYahOM
         RnJ5OqXBKdQH2y4vVIf3uFJTTRZlpcex2QEyveFlJVgqzvVvvS6c6KEH7jekDKys3htY
         mSK9aBz41lQ6nq4IgzvXEKi7cipmNQ74LsAtgC2m84p3tfIKyUacpvlAzkWTM1qiz7Bl
         7rZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718892484; x=1719497284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IK6hFPTgqdIKbqtHnewnp1bgaIGCo9GQFNjlAluvV50=;
        b=S8OHTjs3P8Kf0Pocu4UcJ0HZfP753mBIl/ya5Ym5c89Nw4/gML4XnxRS3rDFZKLI/P
         ba1+f9dXK6wkIPdOTXuFvANoSfyQofXP00ume8VxBPZdVmPR9gLF9xY6ECMYsB0NEgiD
         39tQhUjn8tdB3UbPdGGJ19Y9F70j5i4TyVgYm8qTPemw0O7ESmcqUxxlx0lOeNafZA8G
         SiPGf1eVHBudLmeSqTVEe9t8J9AIHAWaqQeJ613X7FpObkPu5XPr1VFlgJwq7CigFRzb
         Z2mhTBWPDtmKc55JKs3QBL553JW2kYkf7L8I/YJWoGtoH7ZwEyLqJRIsRa7ZSm+tqjrM
         svsQ==
X-Gm-Message-State: AOJu0YxzYScOc2i013W0dE/YlQjCkWkpVcWAt8i7raFpOLDsEyk/thNC
	f5I6ald1qrho756kwKmQSMb6DwwGzo7Zb2oJ6Mbok+kk8tylYNVHCr76ciPxi0mKV9yddMFzEv3
	g
X-Google-Smtp-Source: AGHT+IGHab7LwXRUiNHVkyU4YVqGMFI8VK2R2Np3B2frmOeDmT+yl1Tip0qBJ89NjZWQXmITOvElqw==
X-Received: by 2002:a05:620a:2444:b0:797:d3f7:3d48 with SMTP id af79cd13be357-79bb3e1bf16mr588653685a.10.1718892484538;
        Thu, 20 Jun 2024 07:08:04 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798abe6efc7sm691579185a.131.2024.06.20.07.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 07:08:04 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [OE-core][PATCH 2/6] python3-psutil: upgrade 5.9.8 -> 6.0.0
Date: Thu, 20 Jun 2024 10:07:49 -0400
Message-ID: <20240620140753.392220-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620140753.392220-1-tgamblin@baylibre.com>
References: <20240620140753.392220-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 14:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200957

Changelog: https://github.com/giampaolo/psutil/blob/master/HISTORY.rst

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3-psutil_5.9.8.bb => python3-psutil_6.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-psutil_5.9.8.bb => python3-psutil_6.0.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-psutil_5.9.8.bb b/meta/recipes-devtools/python/python3-psutil_6.0.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-psutil_5.9.8.bb
rename to meta/recipes-devtools/python/python3-psutil_6.0.0.bb
index 1a394eda33..9b77ec4005 100644
--- a/meta/recipes-devtools/python/python3-psutil_5.9.8.bb
+++ b/meta/recipes-devtools/python/python3-psutil_6.0.0.bb
@@ -3,7 +3,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a9c72113a843d0d732a0ac1c200d81b1"
 HOMEPAGE = "https://pypi.org/project/psutil/"
 
-SRC_URI[sha256sum] = "6be126e3225486dff286a8fb9a06246a5253f4c7c53b475ea5f5ac934e64194c"
+SRC_URI[sha256sum] = "8faae4f310b6d969fa26ca0545338b21f73c6b15db7c4a8d934a5482faa818f2"
 
 inherit pypi setuptools3
 
-- 
2.45.2


