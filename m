Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93BC3CD98D8
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:03:19 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105027.1781424192474694926
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GFO4n51t;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490be03d47bso23097995e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424190; x=1782028990; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AaJnWl9L2+EWUsdxaZ7wFWGPUi7CpDSm2fxAcvZZHUw=;
        b=GFO4n51tmFzHDOK+AqcEMM54b/xRZ+mUs9a7NjOFLgaomkDx6IApAN/LcIGiRqm+KN
         vPnlVFm9qbmRyA8p1qbTyHo32+FgJwxRuYhfOQcvplGeF4g+Enmjy0JXZFreaNE5rA6W
         ejIPuzz3Rs0dJOnhmVd4Ku349bc0y8t13Ruqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424190; x=1782028990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AaJnWl9L2+EWUsdxaZ7wFWGPUi7CpDSm2fxAcvZZHUw=;
        b=Q1AtZToYK5oS6ix9nOCqTsue3r2nV4IF1UJeSprE3hmo/yKfKi/C/2UXpE9FmoLApq
         WUY8JLTaCLss89awXmJSLUmFDlIn4wZc2dboa6/h6RfaOugl+fyjVfsORbDDSYDhQW6A
         vVK8Am2KkdsLZxwziJI7uhKNIG2Xpz9vmxYNRhLOMY92JI8EHwivAkQ91YjtiBLNEuPN
         dVTQSKo8cnFcCyUxpbE9Aua2RHYDsVxvawxjGzvuIHaeJxy7lUDIHjDSbX7wtnISEXJu
         KSqttkf2ylCdjxpUYAiHZpB5jFq54PNGZJhXg+A4XEDLmX+BwhOVG1KMtSfuCPkNTse5
         kt9g==
X-Gm-Message-State: AOJu0YyQlPms0UFM3BJ06OZ2S+j/M2G9RyGFeA1BQmRaoFsqQCH4b1Tg
	WiJFlnlR05mXi6JQscnt3Pmf/6JFtHgzmwQTl5ZYJUMwdZ7JfPfd3MAaNJemlWbiO5GVE2IY4dp
	1fspe
X-Gm-Gg: Acq92OFbUa/SFKjwntrH7JsYEY2SOW7pcJEztikilcsAGBzrjU2WTHzqiuxoMIhnmn0
	LE772wPxbmDaCpIbhR44UWAYQ8ji/YxLP1fyT7yMAuXSzJKoa255zAIsv3l4FH0mZT6Sz0lAMJv
	7hqGWX2Mmm/bnF2bhsrNzpmqirtXLQIiOYC2saBY6ov949HJN7gH3G2qvZLngr7ElmRFnfPUAIz
	TexKuxWiXbWAr+BzSSV2fiFYd1k6UvblhOX57CI+s2kxd16t1JD2KmptJ9NmEzLSJQuuqYP9C5L
	F/hvZdzW3fSQziYeqx/NLEZDAKzo0CF4D+sJ3doQ5hQe+z2IacHJX2SHhv16cqz3vkEAFgjS3Mz
	JgnElKVXHuBQt/6cVbEty7a4rStb23QbcOhqJI1ebd30DZa1eZjDQtBuLqjRppRvgltUyT3D2z/
	xoV9ZmibBHAlkuofvMbDP7i0RfxgrnNyrhI5oaE4UPR3DVrUbI/jdl5PFmaRW376k=
X-Received: by 2002:a05:600c:214b:b0:490:bd1d:472a with SMTP id 5b1f17b1804b1-490ec4d7879mr84761265e9.15.1781424190378;
        Sun, 14 Jun 2026 01:03:10 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:03:09 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/56] diffoscope: upgrade 318 -> 319
Date: Sun, 14 Jun 2026 09:02:12 +0100
Message-ID: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238685

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../diffoscope/{diffoscope_318.bb => diffoscope_319.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_318.bb => diffoscope_319.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_318.bb b/meta/recipes-support/diffoscope/diffoscope_319.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_318.bb
rename to meta/recipes-support/diffoscope/diffoscope_319.bb
index e874d2bce40..258dab9027a 100644
--- a/meta/recipes-support/diffoscope/diffoscope_318.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_319.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "313261c0da6b6c02e525a6b8a898a00aaba32cb7c5511364d5939fc0394295d9"
+SRC_URI[sha256sum] = "990d8ac71a5e7045c8ad6c66353f6a0dcbf5537ab323295e31bd795b043aa916"
 
 RDEPENDS:${PN} += "\
         binutils \

