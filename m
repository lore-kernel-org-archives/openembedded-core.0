Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F7DC02198
	for <webhook@archiver.kernel.org>; Sun, 16 Feb 2025 16:16:14 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.31495.1739722570435029883
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Feb 2025 08:16:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SEgA8Cym;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5ded69e6134so5094848a12.0
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Feb 2025 08:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739722569; x=1740327369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7pxhHfweeldSJLb7IyAqcwlSRmaVN6Akbxp3l273B0=;
        b=SEgA8Cymh90Vzq0P19cULAnY9NAAX98OYzTykkZZmj5uNzsXAfuJNLSCfxFme/t0aC
         GlSEmx+R9Hzj8HvNFrGYZze80c0rjLhVzud7CR4PkzGu7c9g4/zhWtiCiMP7XAZQ9BF1
         od/qiOjOQaVkbd9HuzWP5mzGdyCLZQRFVh2lkAcWued73PxcXU2c5IfRWIav7xxwHKdL
         Ya8VhPNI+49MW3xuJIwR29XzHMgjb4j4GUBa7AdxeWS//kVv4owqIW5KkSRqDPksPhNL
         63ROFbUecwJx93GY1CsZxiwPgzfVkwSTzaXIFS69wF8svYcSSjp7jK/XzUlOYJr8Qsds
         3Qcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739722569; x=1740327369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7pxhHfweeldSJLb7IyAqcwlSRmaVN6Akbxp3l273B0=;
        b=vqZVBU6GEy0Y9Bdciavhu9055TLRsdLrNQ16a9njqJ/4dfnrxtIy0MjFQ0vzLkkqC+
         CLrMzSyeGWXZ3maVt2Ufv+sSnxfPS33OwwFgXDyIywMyMEGqk85+cjni6XdgvvNacg/9
         /22b3RguiGaDTGBvixhNjzcEW7QR/9qojcZnQUuuvMlZalYSwYPYgb33uFlK1obV0ZHL
         Vk4QR2xrJxxSMAvy1AFGSH9Vj8sTrWd5ZTj+q53/fv8LlIA46NTCQujNeYWgwfs80HQx
         dfVyNWY8022KCGaAjBAyPgPCkAFthIe/6i2cP69aF8R6RpWAuOJB80wNQ8AgRrcgoLCA
         dIbw==
X-Gm-Message-State: AOJu0Yy1Sdfmw5Ksa66jNar0mpgSjd4+frEBFybFoCAKVB2Hz3rgqhjA
	oS9LgwdfeFDoV5/3VYYYV6F1JwJ5ysZ0WpM5CK2ucv6PmKlo9S1U3CwrPxV0
X-Gm-Gg: ASbGnctJe799TPT4pqs8uiOYl341gY2Ic7NtqaGswUSJ5XGmDO4ZXheiFb5uQakM0m4
	DJTdm6OTL5AosDvDf2JcjkaqiXOsbHk1XzGv8cA4CE1O/iiwjIrhRX8zNty/Icy5n+rttHlKxnb
	Q+XQwPdjau/FPY3aur52e3wsbTipKEv+RKTr3k5/+FiR0uNZURV/73X5ghCVwirjcpcjpgh8XxH
	n2PjWcak/21iqxO3Mu7xz2fv6fl2HvvHat+wzYKx3p+fBaKv1+uD+26/LI8eW/IE0P/Bma+zwaP
	+bKsvncnwA8H
X-Google-Smtp-Source: AGHT+IErwGu1e7AcYQMbkABB1dsN+zUO7gp4MtJkPYhjbifsfNu3kKYSxX1R6SsX6dkoAEUKjEk6TA==
X-Received: by 2002:a17:907:72d5:b0:ab7:b5d6:2696 with SMTP id a640c23a62f3a-abb70dd71ffmr26989866b.32.1739722568475;
        Sun, 16 Feb 2025 08:16:08 -0800 (PST)
Received: from acert-swift3.. ([2a02:810d:600:5a3c:6621:dedc:472:571])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb6e4df5basm357917966b.152.2025.02.16.08.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 08:16:08 -0800 (PST)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [PATCH] scripts/install-buildtools: Update to 5.1.2
Date: Sun, 16 Feb 2025 17:16:00 +0100
Message-ID: <20250216161600.406219-3-an010@live.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250216161600.406219-1-an010@live.com>
References: <20250216161600.406219-1-an010@live.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Feb 2025 16:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211504

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.1.2 release of the 5.1 series for buildtools.

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index b56910455d..639ebb12d7 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.1.1'
-DEFAULT_INSTALLER_VERSION = '5.1.1'
+DEFAULT_RELEASE = 'yocto-5.1.2'
+DEFAULT_INSTALLER_VERSION = '5.1.2'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


