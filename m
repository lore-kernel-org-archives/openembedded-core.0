Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C586ECD98DF
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:32 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105067.1781424271978303440
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g9QrSHLW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b9318997so16292885e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424270; x=1782029070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bLQp3f81bvtYLBC6f9x8k0cqgtcqPIkdzrfOhWkTZdw=;
        b=g9QrSHLWIvMDWN1aOBc/9kYo8iM/NFmt1MzSTOyoPPRua32Zs34dTMtGSx+w2oOFzM
         JHtg++O0dR1KcjSVPWwPh+Wp0G0fgqcuNiQGTXcW/y5MZPFLIUqkxXtKjO+i/JAUBTcp
         qhdOaeoQQxVLN6J7WDFWZb0JdDtRcQydS9/5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424270; x=1782029070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bLQp3f81bvtYLBC6f9x8k0cqgtcqPIkdzrfOhWkTZdw=;
        b=s9UyFp/of+P0f2Zp/hcb8NFbvdnr9kaRGb9Phcpa6uBWd+cTo8T9K3N//UqeQOMo+m
         MbAvMdi6dScQHWJHi/bVBmGLW84tt97wrQX1mrCMXjjqKO5/Mnu5QOEHhijUzs9fuMRs
         8b4sbjIQbfNoYOvPOfq4tyKunsYG4AvnSOoIk+3J2zPyxxkWtDyKV7DTmaZr1X4VUORw
         LIm8d3zsLSAv3ZivOxZ3dEy/JZa8TowIOiM0u0Bi7wG73CWZRDR4O3uCS9PduitCBL52
         JoQqTTH9cXcrmuwRyhsln7MtCq/Zon9sG3xa8XlEs+0P+K/Arre8R8uosuoPtwofvDmk
         +U4w==
X-Gm-Message-State: AOJu0YxhhK2ntCbJkLercOZzZCcsiwl91WlH1rRWNOSjwUjvcWIYr2Dh
	mNTLzBIdCdSYOkrOeOaGgmdFibNUiPx2bqzyaVbOkNctoCR/9uE+QSSbsdBQ1JYDQpWPbf6AwPV
	c/BLk
X-Gm-Gg: Acq92OEekV8x1Zuzdl3ajaOk37sa1fRA1k2sfmlRciXp+6eZsx6JVj6cCfB6HaInUOm
	plkOoF8xbZS7oRaqFQjljHMBuXujPDrwfULYdv8AB71qqRJMc2Xk80POrQaGceCOFbchzzqjBaZ
	h36OUP5xUVqdSC5CwyAU1YmAYJnTSMwfD2O5mwJXuOsyb99CU1U+juMvLGDTwWiShQ+pMFoskSz
	BnKtX/3YV1ucZ6VYrkjolsctVuu12FJGy9TvL5V7lc/4uQWsaqjS5/2l20qIriC9rMimzkcvpxc
	MpFZsoLHWQeRLAPYLeZ7XmeDvHlpRjWn+9LDRM6fxITHftGNKPNsbruCetAaYG1aZ+ja5Q/buEv
	3eBDsP7faPpjqu5Guv9PBn2annQbev1vvdmdu+liQNFX9ZeXTG6u+JVks8N2Yy4WxxZzIlUMiAl
	2cysvBHjIvImbzD7yq1Mjq9drIIrivtfJnyk/pc2M0sAzaUsk5jaHx
X-Received: by 2002:a05:600c:a06:b0:490:e1a6:45b6 with SMTP id 5b1f17b1804b1-4922011df21mr73975255e9.20.1781424270198;
        Sun, 14 Jun 2026 01:04:30 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.04.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:04:29 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 53/56] vulkan-samples: upgrade to latest revision
Date: Sun, 14 Jun 2026 09:03:04 +0100
Message-ID: <20260614080307.4017177-53-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238737

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index dd7b151aa50..c7e09b4b7d1 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -9,7 +9,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protoc
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "f9b160340bf3066313825c119710c9f51e75edd8"
+SRCREV = "ab1e93d4a5dadf4c804fb6abbbe0b27dfa912b5a"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 

