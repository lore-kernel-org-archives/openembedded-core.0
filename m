Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A8AD172C6
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 04:08:25 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45830.1770005303340676542
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 20:08:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MYPDcgSM;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3545cf80e1dso384153a91.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 20:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770005302; x=1770610102; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxju+Q+kLfh37NUhOyUOdDKENjB1zHZnoDq45CnPRmQ=;
        b=MYPDcgSMBuTWIRuiK4qr951FHWkhHhKSi70rBdKf71GGa9tlyIZcpt5TahWaRwPf5i
         hdkGpmKVbqCKgIe5c+m/0AjUAoRqlbkoWEg+ghAJ4t/v1NA8IPUSOz6otFaduwgOPxF1
         lDOuLb7hKC43ujmJp1SrERCA8Xoetmdie57O5X/5TNxzMbwRrUSEFm8ZoZnBbkwj3TwY
         1HMiqISffU/GZMqFaq+3/6qX68sYzMIu8JC93rHpBUeRwc6kpK0hNyaKVaGIISf/wBjX
         1iD405E6DUcD9/xZ+PZRRm6F18XPmdkLSlr8MVVU/V6C+rIfmvAdkbZP1VFJ3carKZMa
         9U7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770005302; x=1770610102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hxju+Q+kLfh37NUhOyUOdDKENjB1zHZnoDq45CnPRmQ=;
        b=cDh/REuGMUBMQKyHdbVuwoAEMw3bLaWsQuVqG0XAiImrI6uBxAEW7yogwW86eaC63G
         iy4B51KgM3BxF5LZiLHU7UU8jLqzlS6UWpT7yDU1ypo5PGBiWrpzJ89fNZIlfnHxbYFS
         5/2DW26euIbV88jPZky3vpkEloE3KVZVf+UpzE7iyF9VFHg3Q1tjFbBAAIym2aMOM8Ms
         GKK8qRozz/Wpj9/sdhUQ69k2/Xwcrx9Z03F3YOixyWs4/3lj95fosXCoaH6INtEqinXJ
         9HCxxoD/AeMzmbtSTUqbXwwtPv0Yw4cPPryEY3ysKp55J29UMWwS98tCVIcB2ElG2TtN
         ELyA==
X-Gm-Message-State: AOJu0YzWMYiRYmRx4f7cGkxAz/ytJ98qyqP2FqPhjDZ4HtLZIeXGDOmg
	25jpEimPmOk7IMqzVcrCD22rUurLaVmPb37f1UBW4zctiohlk0ucSMx0USF2og==
X-Gm-Gg: AZuq6aLtFv9VujlLVTMThHpo2a11XGF8zyARdxwkryzS558Bg3HpWJ8v/uMh9UC9ZUT
	63BLYYfzvTitJpY9aCibQrAeX/1aAJbB0ONycL6lGu+3tUwhn6WLQM09RLz2qMEsr4+wpZha/sd
	e5mXjZHR+6jwUfDx8bacNbuTBIeAT972eIg0CAHxRA7lM5IeccT9N6PE3BhcD9begAMydTaNmhh
	AB5Ww1FOpE4qPa0nxHxs4MnxygNe6BKe3JIf4CFrFtCjKNGXzxrYgG0GmeYdkPVCwz+AvyWbmF0
	141XzYa7fS5xf/5rd5r7FjVp/GEyxRqKXGOuITCSCEVbgcLMtZPyYv+1B7kgwHLz4P+DcjqCN7e
	/rYmqHzXp69urWRsPgVO9AoAl/gSyMYnljfkzKdCjCHHEmOj22sdrnxwjgdNfXhA4W316PSs0+M
	rY6mMGzD9wPWJb6fH7b2kXJrw=
X-Received: by 2002:a17:90b:1d8e:b0:341:88d5:a74e with SMTP id 98e67ed59e1d1-3543b3b0485mr10277392a91.29.1770005302253;
        Sun, 01 Feb 2026 20:08:22 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3543babe4aasm4926588a91.0.2026.02.01.20.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 20:08:21 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][scarthgap][PATCH 2/3] ffmpeg: ignore CVE-2025-25469
Date: Mon,  2 Feb 2026 17:08:04 +1300
Message-ID: <20260202040805.596021-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260202040805.596021-1-ankur.tyagi85@gmail.com>
References: <20260202040805.596021-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 04:08:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230343

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2025-25469

This vulnerability exists in IAMF (Immersive Audio Model and Formats demuxer)
which was introduced in version 7.0 [1]

$ git tag --contains 4ee05182b7cccfa6928dcb0a45c2b50b7d9ea39b
n7.0
n7.0.1
n7.0.2
n7.0.3
n7.1
n7.1-dev
n7.1.1
n7.1.2
n7.1.3
n7.2-dev
n8.0
n8.0.1
n8.1-dev

[1] https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/4ee05182b7cccfa6928dcb0a45c2b50b7d9ea39b

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
index 8b0b7cfd6e..c1536015d9 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
@@ -51,6 +51,8 @@ CVE_STATUS_GROUPS += "CVE_STATUS_FIXED_61x"
 CVE_STATUS_FIXED_61x = "CVE-2023-49502 CVE-2023-50007 CVE-2023-50008 CVE-2023-50009 CVE-2023-50010 CVE-2024-31578 CVE-2024-31582 CVE-2024-31585"
 CVE_STATUS_FIXED_61x[status] = "cpe-incorrect:these CVEs are fixed in 6.1.x"
 
+CVE_STATUS[CVE-2025-25469] = "cpe-incorrect: Current version (6.1.4) is not impacted."
+
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"

