Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2401AC3ABC6
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 20:16:47 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.5812.1746735399531437912
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 13:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tdn/rOu7;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so100577466b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 13:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746735398; x=1747340198; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTzEAfnoq97wLspOYeMYHjxunPWk9CxRYLH4LpET6uA=;
        b=Tdn/rOu7C9MHuh9Lsp0GI/fCvL+QlkxiJGfySlsgsRuooanuWDSZengWCqfOW6YesC
         32qvABv9BwveKM01dXExM/6Wd1PNNwfjEn5qeYRz1fVomJLcYWyo8ftdPyio2mGoxWbM
         LJQT18Tg/jME+ymMxYezfRZlF7lNP0WPueuFHSVU9RW7Pkdle4MEBvgLBHOlWHi0WRoz
         f00l8I6dNaYY9x2LrqRCrh37Lw2E3MaqXOPR8rOfoZEuKVe4W15ipAug+xJwrg/LrHxy
         1ZaBV8s89KDiIIG4IvM3rZEoiSjtDmEGnkCQrdGiu8AW/Hr3KHAlPqI9XZv5BOl6LuV0
         CKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746735398; x=1747340198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTzEAfnoq97wLspOYeMYHjxunPWk9CxRYLH4LpET6uA=;
        b=JWPZbuwOsWWaf0tnJMKPifJj0xlzPKQu2+GMlkmY4SI/2eK2oQm3VhNod8f6Oru2Iw
         WBR1Q99hpiYPzCl3dd0qxEzUzBugPXSwjNhoHH12rTFsq2UmQQDC2WQCj8UuF3h4YTb9
         6IEAenv2jQU7ADyy/dQArObdNOm9ooBP6MiirpK8Q5zyjGFFAVlykrRIQZXuGex9pxLB
         nxhzkigUKNBcccV/xLNR3vmRX30tj6I3m204Nf7QGzcBQpRpVuyYTbcsH8LkDM6/4Iyf
         0Izcsq5DB3Aeq9+df+3Tx2358CcyvVg9Y3nL2jskSzcTjvCG+hKv6A2rkywHbxPz0DR1
         Kh2Q==
X-Gm-Message-State: AOJu0Yy1VIjy4jTlnmT5Fmos/GViPsqhXmAgCYYfCTK+BcABzcvvT8j4
	4n2br9YBmsviJ34DYuMG5KrGqDIbmMuVU13l2fCoU8IkT58ROArrHIVaog==
X-Gm-Gg: ASbGnctvrUZ/WQUsWv+6tjpQz4hcl6H8/zrAeDWWvTCCwYO8Nx9wHfOAc0KvV4vf4j6
	BcXgvvyyZZpLpHlcOkoJOwoECAOx71pjdjJEkAhgVWs8pImmz8u2EI3pnyJa3022/wifiAss25n
	4U5YYVS4Ot5oYfL2d1EwdRJyvV2XyedYUYzkvUfmICFYXizlwqbhIp44VlxKRdp9QSE0vT3lcdJ
	H8hThsTLuOOHLrqKGD1dW5qKNeU3QXUkCmL/dGQIEVbULDmzmVyp9UX0tH7AwJvnMa7HOH/HR2W
	8Y07pd5JczK9IpywbFE9uStGud+Jg66rjXYOeGTZjrLUDZRw0UE=
X-Google-Smtp-Source: AGHT+IGBHPdSI24q1ECdI/G61zQNlUs/k4euy6fawV9FS9/faFDpDI2G8pCCbDbGNo+779i6PcMAjg==
X-Received: by 2002:a17:907:1b1a:b0:acb:6edd:b255 with SMTP id a640c23a62f3a-ad21928f9famr100852166b.56.1746735397765;
        Thu, 08 May 2025 13:16:37 -0700 (PDT)
Received: from acert-swift3.. ([2a02:810d:625:1800:c942:8429:98e4:61e8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21933f4e6sm37610866b.54.2025.05.08.13.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 13:16:37 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [scarthgap][PATCH] scripts/install-buildtools: Update to 5.0.9
Date: Thu,  8 May 2025 22:16:29 +0200
Message-ID: <20250508201633.44249-2-an010@live.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250508201633.44249-1-an010@live.com>
References: <20250508201633.44249-1-an010@live.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 20:16:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216159

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.0.9 release of the 5.0 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index e4d472023d..59b45d8f1c 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.0.7'
-DEFAULT_INSTALLER_VERSION = '5.0.7'
+DEFAULT_RELEASE = 'yocto-5.0.9'
+DEFAULT_INSTALLER_VERSION = '5.0.9'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


