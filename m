Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DFC8C021B1
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 21:10:28 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.7397.1739913025962490314
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 13:10:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=O+LZXEOq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2fc3027c7aeso8258076a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 13:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739913025; x=1740517825; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9sdJ9GiKwTJrL3GVpI98XbcJ/kFNtvUtzFTpuueR4o=;
        b=O+LZXEOqxtHsq1HvZKm5NVtW8ezJdBlel6dxKW5aM+5FJqRetNJrEJPObGj2xyy7j7
         QuucXYDbL6COZggz1rD+r+s+MRcMKPLPBF5L2LEzulleR4rAxWS8bHfac3rAMWWxFeG9
         hizQ8d/0Zw3hHaNhhYoCouMBHnYebPC2FZf2uq5kxXOfYID7SbHAbSsL49MLf4FPSDO5
         fDzZF0Yp6fF8NAoxSJ8IqJhNAVGFL69nfUCWI/AUAc8KKXo2uU9ei6U/nMM0WmdJ2j1n
         TwbfSq91+vYlZUzigeUIKhvv+d0ZBaOS3xyGTKp8LtP70oDRj3Oqsa0bA48qit2JOWo+
         xB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739913025; x=1740517825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9sdJ9GiKwTJrL3GVpI98XbcJ/kFNtvUtzFTpuueR4o=;
        b=PlAwlGIbdxepSr/4OY4nuCSXXmkaF2iXbDTzNy7tLipoCU76qZ3ynBLVz1f8kZj6L6
         62FPisyfuaW07J4jJJ71Sbn9f+ic25q2W1xuK6w3/ZbjWj9YAUQ48s8wyWy6ggNQTKxD
         GooXqLc28RxrXuoBOAbXrBrkSDNX/HCOzIpwI5iQDi4PR1RkmNcEIhGe+5/WFxBRR0Z9
         lNi+yMf6subkYmDMjgHJNNO79Lvs/CmIU+tAuxLqHmPlBr0YvF1qMR1WmL5J5oPbQacZ
         ajnbc9md+gKDalWxk9NyKt/QPMlPEWl0wBxLZtP2BibIG+LtJlTe5p0psxoxwj6Tey4v
         hsTA==
X-Gm-Message-State: AOJu0YzozJDkc5G9UTDUtslA8s2pIQONI2s+al8jsKI63sETOk7XTVKy
	WnmgQYE1c7N+/M5mcE6K16W8+1QkoAOXpN+u3+t7fRigr5pPby/ZVIhg1tBaI2I8zO15sVp3m0A
	l
X-Gm-Gg: ASbGncsWqA//bD7x/SaUhaXnwh+UwTvJlWV6lIH3VBomaigN9X4sdct+NyUm8sO0ByJ
	/+S2d5hFCEeUTOkHR3FF9zGcxf9lh5H7gxtsbk89ZAKwTdckY7NytbBS8qXfGbNMd8zFMUL5QuH
	v7Gnb82SerdYhp9qrRM4hRiXWn4MAgDRyInr3/wvFXtiD0TeX62noXU9wYUYR+FNlyBiKU8aOeH
	bisTVpvTaHdxY+bQA+tmtpkUIIh1u5sUIsYWtceJasN6gRWs7sNrRuhc1CgEZg9+Uz0/DlzsXS0
	IMXGmb0=
X-Google-Smtp-Source: AGHT+IHydY8ZDfnGpMV2GYtrGfhUnIgqnwpvyFmWR+yPTltg+0GoeoIhulDqOzJSfoHOUgam0i8WDA==
X-Received: by 2002:a17:90a:e7cc:b0:2ee:5bc9:75c3 with SMTP id 98e67ed59e1d1-2fc40c1d6e4mr21970488a91.5.1739913025281;
        Tue, 18 Feb 2025 13:10:25 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:83c7:94a9:a555:bf05])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98b326bsm12820720a91.1.2025.02.18.13.10.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 13:10:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/12] scripts/install-buildtools: Update to 4.0.24
Date: Tue, 18 Feb 2025 13:10:03 -0800
Message-ID: <db4b9844ce4430a32f6a6395f15cf49d9207e18c.1739912869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739912869.git.steve@sakoman.com>
References: <cover.1739912869.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 21:10:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211649

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 4.0.24 release of the 4.0 series for buildtools.

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 01253e5f95..56b22e4270 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-4.0.23'
-DEFAULT_INSTALLER_VERSION = '4.0.23'
+DEFAULT_RELEASE = 'yocto-4.0.24'
+DEFAULT_INSTALLER_VERSION = '4.0.24'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.43.0


