Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90B9ACCD183
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 19:31:49 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.9204.1760038299707025563
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 12:31:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UdnckSUS;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-780fc3b181aso827558b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 12:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760038299; x=1760643099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FUWwMXGnJvjZXn06g2u7P2jOKfZqw2y8+qflU/5QRqo=;
        b=UdnckSUSGiG8Xic3e+7aooKsw3xNZEHoPUN42YyZijzI24SxAem1wLZ90+DoYu7lrW
         Xav2rCeTG96tyr4uCybaF5+AyRQEOf95FTBaGj0J+hjSPXVDhvDQR07mSVHWBiqqTI/U
         MZGle5slkvTg1eySHy43e2MMb7eIB9uHT8YS/K38udsFtFu6LZlwcRkqtvSbofrdg5q3
         TEnmgPmrv78osowZO0KqbFtZITZp7bcfh8rlm2P5u9P9LlfL7ziQL9WkRHeYoFkRSsPd
         kD2hz7fx9SGNkoX/AV356DmkGMa+KcstkMkaOG8IEG2OZOfBNje60smhKJIS7za1CakW
         8vDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760038299; x=1760643099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FUWwMXGnJvjZXn06g2u7P2jOKfZqw2y8+qflU/5QRqo=;
        b=fSBa6BaZWjP6ELch0xTvkMdRih3paqYnw3j8wOyzMW1s+Vr+a3LrsNflwIj/hO6qph
         2xRP7H3SiL90nUQcuacfxmtcEyWig95KPLDW9YaSfXvbZFqxJYTmE8kZi4+lLTG65POB
         y54IqPxX02sF/0vEn2M98tz08QZC3QYgG7sRmqLMQZV1NlaFPAOMWVeMk461FyNj3kcv
         V2yga85uf2336Fm+LP2SONEhMdr5sVwMuYc2bOGnYj5G8UKq7qzQ0yVwU9CNo9c4Jyt9
         jUUer6LsCm9+R6g3TYBvllyyh9pQ/Nkz4UsoPUa0GiA5MbJW1T7FAwhvErCBqMCZTlzR
         9zcw==
X-Gm-Message-State: AOJu0YzRUHIUrFZPjkb/i8JX01G3aeZmZSSyaKEfWP1QORqlSdmvqKSb
	Xl+O+PO867yfhK1EgtRrgxx72hLfdMmy5sqXYsQEZCpX4rQaCf3J3tRZB6AFwzAQqgGxoGPwCwa
	MhxKA
X-Gm-Gg: ASbGncsF/Z7LUTtwM+ae8zCcHqkO5e+bagPX2hAC9c2rkJfp80YXrZ1ttieEyrDTxvB
	0XR9quRaPRu5ncQvhX5ZgYCCQcxZtQeOzI79ekM5ksLfwtVqrChsjOyiVgovkt/MLF0R2h9M7Aj
	WffhvZ9xE0D0e9o+vOTY77hh25XdEXy7PpRew720HLy25B41aRN9uQQsKPqf/4OIPZJNHrZA03Z
	YJ1LrXEuPY0dvoz3lr0lgBKcFz0t2zD/lL57cb2TAPgGH3UdorFdMyjWnX7AeaO0wfGcHC5DNLf
	gI+ULHHTeLNu0FhjaWV5/IZrfq7fC/tk3jpcn6Iyos9tMHv3Q/lOpAd0XhnBypQIONG4VCs6PSn
	OoDwPdnHR6GJBP3qb6pUkt3M/scRLVk2BjGXzvA==
X-Google-Smtp-Source: AGHT+IErmbj8+5Bf/hqZ3POk8dmiYmX8R1opBEuoM/Bj7RBKaU8aCcltyWHIOiHhluWhTHOLA4MsbA==
X-Received: by 2002:a05:6a00:2388:b0:772:3aa4:226e with SMTP id d2e1a72fcca58-79387242fa9mr9900209b3a.19.1760038298890;
        Thu, 09 Oct 2025 12:31:38 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b96e:4301:8642:779c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2d51sm495864b3a.65.2025.10.09.12.31.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:31:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/24] ffmpeg: ignore CVE-2023-6603
Date: Thu,  9 Oct 2025 12:30:58 -0700
Message-ID: <dcfd5672474f7a9bf7913c0f0e35f7c40bb685c4.1760038088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760038088.git.steve@sakoman.com>
References: <cover.1760038088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224633

From: Peter Marko <peter.marko@siemens.com>

Per [1] this CVE is fixed by [2] which is available in version 5.0, so
version 5.0.3 is not vulnerable anymore.

[1] https://security-tracker.debian.org/tracker/CVE-2023-6603
[2] https://github.com/FFmpeg/FFmpeg/commit/28c83584e8f3cd747c1476a74cc2841d3d1fa7f3

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
index a46cb3480a..d64b97e787 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
@@ -101,6 +101,10 @@ CVE_CHECK_IGNORE += "CVE-2022-3109"
 # bugfix: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/481e81be1271ac9a0124ee615700390c2371bd89
 CVE_CHECK_IGNORE += "CVE-2022-3341"
 
+# This vulnerability was fixed in 5.0
+# bugfix: https://github.com/FFmpeg/FFmpeg/commit/28c83584e8f3cd747c1476a74cc2841d3d1fa7f3
+CVE_CHECK_IGNORE += "CVE-2023-6603"
+
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"
-- 
2.43.0


