Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84998CD98D8
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:11 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105054.1781424246007270389
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fwXOufrg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490a76757e5so16065355e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424244; x=1782029044; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UzcEcA+YOO+yBMV1/A3OR3Tw7m95UBJ3ILCmg3oOYQI=;
        b=fwXOufrgA51vJO+UrYGqYdZYhJrB41g6CjSdn8Q1KQcMFJSU4pZbfUZxw5DiU9c45f
         /TCYEUoOSJZE0b8WqgZT3akL3phEzasWY3+JzoCuPKU5XgpN/imH8KtCC99qFkBFexUm
         Byu6MuCIo34kg/gA+tVe+J8dP6F0VYcjuiPKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424244; x=1782029044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UzcEcA+YOO+yBMV1/A3OR3Tw7m95UBJ3ILCmg3oOYQI=;
        b=SoCstddbxMQDFG7KL7knFgYpHdNT2sO3eBh2Pf4Hg59hwTwnLIrBRczDnewNg5Xngj
         WRr6R2W8UYLd1jcKvkPIDasCrP7fLrXVXJli9LFwXO76tTCe2syldOOz7g4h9d38jrNB
         JH9cU8BWpZDmaLw/8vc6ia+LKBXupaqJbcrxs2h1Zx1Bh6QkKqM5c4jZTBEHU4VKisGZ
         KeeHw3p7LsIHsDEn7wZ36GZCKgJbIRG50w0J801Yd5rEogKPTdgrcb3zYmyRbVyg/wEf
         tBgmapAnf9IaJIse9AVc2kiOuxgcu1qyVtFzH3MEgA12ACeyJfxsJvz6qeToiL+KhFuu
         VV+Q==
X-Gm-Message-State: AOJu0YwPMPE+1VFrwD3ss46QsMVVpC4cevbdcrQxUfIVcw/NjWtpvRF4
	XSMd8jspv6nxCtTagLWvd+yjDQ/dm+b1/sj/H6HIzm5iMjD72zNqNtjOF6KYD5t4cD1C2815YDy
	L14V4
X-Gm-Gg: Acq92OEv6z3arBRrK2v8Rp44ftsp+T49pKSzz8j1Um+KH2iBIrzwJYaMhkT4/jpqaT+
	YnvNxLRga46MEosQHun7ooCT+2f4XBJso6q/GLOGEV36CW1OALsVAdWG10JoT6TKXuhEejnaUPA
	0aEc9aU4D+Yy5BZl9up/7eWC4+9b4NHV6kVNLCqUWAMwnyeDBtJUqF/aYNPc0fsvrIxNBTvxDbI
	DGN4ljyUhy6+lwF1If8JpWNVVH7L9xjk0AJoi8ghIMxf5PUDwI32Ryd83qLV7i+DzAQ0HQP5WHv
	sv2iDca99KLdPT643peORSy+Pz1+XSALw86Bg4Ao0u5E2YzAGCjyMJNcXKHNzWJVBMBjGLRq+yI
	lyRJ8ag3l2ND1jnQeYzXljVNI/90es/pSTHBlYQztiQXqXCDEVBG0vVno/HkRqtsH+Z3BGAGVry
	Fmef+dgGvKEXg2DSWQcgynHauAt5AU4qs8vJh1DDxtuzF1/XMxGY8FL6++hdRY+MM=
X-Received: by 2002:a05:600c:6298:b0:492:348:ba08 with SMTP id 5b1f17b1804b1-4922007d38amr75917035e9.16.1781424244224;
        Sun, 14 Jun 2026 01:04:04 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.04.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:04:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 35/56] python3-pdm-backend: upgrade 2.4.8 -> 2.4.9
Date: Sun, 14 Jun 2026 09:02:46 +0100
Message-ID: <20260614080307.4017177-35-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238719

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ython3-pdm-backend_2.4.8.bb => python3-pdm-backend_2.4.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm-backend_2.4.8.bb => python3-pdm-backend_2.4.9.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-pdm-backend_2.4.8.bb b/meta/recipes-devtools/python/python3-pdm-backend_2.4.9.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-pdm-backend_2.4.8.bb
rename to meta/recipes-devtools/python/python3-pdm-backend_2.4.9.bb
index 5833bb717b7..cdeadbaf1cb 100644
--- a/meta/recipes-devtools/python/python3-pdm-backend_2.4.8.bb
+++ b/meta/recipes-devtools/python/python3-pdm-backend_2.4.9.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a564297b3c5b629a528b92fd8ff61ea"
 
-SRC_URI[sha256sum] = "d8ef85d2c4306ee67195412d701fae9983e84ec6574598e26798ae26b7b3c7e0"
+SRC_URI[sha256sum] = "c41a852ccbf4b567b033db9b2ae78660d7a4ea49307719959ab88a01f0aabb2e"
 
 inherit pypi python_pep517
 

