Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DFB6C55174
	for <webhook@archiver.kernel.org>; Sat,  8 Aug 2026 08:49:45 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2286.1786178982945453779
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2026 01:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GBEcdvaY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954dff6536so2494235e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2026 01:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786178981; x=1786783781; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=641oPHblcEk6UDlQ2lO6EKntobBfFnuZVqjf/t6SsYk=;
        b=GBEcdvaY+pN6oH5mqCBuzkS7B7AYgN5hlAGGLivbuidJq0E4XfJETocCBPXuEDyGog
         7wmWPL4LWYCzXYgzwLXgaue1JhYuIG3PABpsg9Nq/VU0gmcmStIh4h05eFp0H1fhDtSu
         i5CZcs2DHkSpr1Yh8RvDec0Ou9f8yxKn7TbxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786178981; x=1786783781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=641oPHblcEk6UDlQ2lO6EKntobBfFnuZVqjf/t6SsYk=;
        b=d5Ogb92ISX8KnfOj1bveiMSyRRZopbggAjmb2w8WRFhELzSz/zg5n1bVNZszQH0p9N
         VjypBIxn5jmH+Owe9UAgBj6S7ztH0YMXseApv7yveIM4sMsNvhYk+PqqEOEL9ZJuSjvo
         G2nhyFFfUQSUXX4JCgAOIGrn+Gcei9q5kgP5mjU2ZTSen94O9aR7wNq52qboq0fIq/Bc
         1+VmfX4cF69F0jP9qFxcYgNt90FKWLvOKy6x6zU0tz2r5UIvzYlFO4bp8LKcd5lR/MQD
         zUwnR+rda6k2EGULks3iryrJJyNgq4dRjunytERs7z+c8GhTS9x81VaXJhjQhZyO+kpj
         j4Mg==
X-Gm-Message-State: AOJu0YypkC7ZdG83hj4rkg5Q+rrwAx75ibTrf51SfO/Lu/SVchHxYEj9
	pJKcqcOeXzRmztGDWmihYmCmrc9lXsVGbT9WH4E/2U4zHQvXTNs0yHUyGcd5HiLAlUIZRaJxiwl
	He9XrHBc=
X-Gm-Gg: AR+sD11A8yOZrP7AslBdpPUtaOPJkFJiFFGAred/S8Fh2G0HK73hSz63Z7BaVkoEKUn
	9JAFszRFJRdqNACNGDWjfcAMANJoFWuYaly2Jhg8W6in+z5tJVjLQrAS015g2N5ghJmpr/L5ing
	PCw2pow0zXF14Ynh9knnEyqQ39m+DNUm1A09J4wVVcIyWWpVDt1P+fmKvjHqaW4woPfp235oKrN
	VA+jxMhvUb6ypzMB8vRFXn0Ys49TcuXw6USor5jmRFezP1nZ9xkP4nllMLEce4x+MjwAW9CQt8Z
	A/yiZvYVknZpW6lg55vlet6xzYUOHDdZaSAJCEbJOxJe087Ftn8Bk7oW+yiLDT94Jsha8fGP2+C
	IPlpn591jBC3XNDbKem/rz+dtQksmNMMnmVAQQ9pNWPymJN1SeMS+ej8Janb6yM10cO0UMfT3/m
	XFCD3AEFKSENHp3XLWfFoeprn+iASNCU+9eTWL8n038fYV6sq7MkSLbLXG2yjKW0Gq/0Zn9zFGH
	4zCc2u12Z0Y5KxFkA==
X-Received: by 2002:a05:600c:4f4a:b0:499:51f0:a9b2 with SMTP id 5b1f17b1804b1-49959e0179bmr177277115e9.1.1786178980821;
        Sat, 08 Aug 2026 01:49:40 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a306:3637:68aa:bc01])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9f0230sm105258425e9.6.2026.08.08.01.49.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 01:49:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] classes/sign*: Drop obsolete inherit
Date: Sat,  8 Aug 2026 09:49:37 +0100
Message-ID: <20260808084937.438257-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2026 08:49:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243036

Now we have the sanity function library, this inherit is not needed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sign_ipk.bbclass          | 2 --
 meta/classes/sign_package_feed.bbclass | 1 -
 meta/classes/sign_rpm.bbclass          | 2 --
 3 files changed, 5 deletions(-)

diff --git a/meta/classes/sign_ipk.bbclass b/meta/classes/sign_ipk.bbclass
index cb01f7353b4..de11b9f32f1 100644
--- a/meta/classes/sign_ipk.bbclass
+++ b/meta/classes/sign_ipk.bbclass
@@ -26,8 +26,6 @@
 #           Optional variable for specifying the gnupg "home" directory:
 #
 
-inherit sanity
-
 IPK_SIGN_PACKAGES = '1'
 IPK_GPG_BACKEND ?= 'local'
 IPK_GPG_SIGNATURE_TYPE ?= 'ASC'
diff --git a/meta/classes/sign_package_feed.bbclass b/meta/classes/sign_package_feed.bbclass
index 49ecd5bd9fe..d33e850dbc5 100644
--- a/meta/classes/sign_package_feed.bbclass
+++ b/meta/classes/sign_package_feed.bbclass
@@ -28,7 +28,6 @@
 # GPG_PATH
 #           Optional variable for specifying the gnupg "home" directory:
 #
-inherit sanity
 
 PACKAGE_FEED_SIGN = '1'
 PACKAGE_FEED_GPG_BACKEND ?= 'local'
diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass
index c6314db5313..62a5e724758 100644
--- a/meta/classes/sign_rpm.bbclass
+++ b/meta/classes/sign_rpm.bbclass
@@ -31,8 +31,6 @@
 # GPG_PATH
 #           Optional variable for specifying the gnupg "home" directory:
 
-inherit sanity
-
 RPM_SIGN_PACKAGES = '1'
 RPM_SIGN_FILES ?= '0'
 RPM_GPG_BACKEND ?= 'local'

