Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41961C021A0
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 22:07:14 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.1183.1738966032682629567
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 14:07:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Gzgx9TKJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21634338cfdso64099575ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 14:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738966032; x=1739570832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9BEVoIsN/seRZLsSFhX5MAb95UC5yXRkvDM7yvwUItg=;
        b=Gzgx9TKJBDEpT8FO7qWnfiHMFlKXk4/pL5tz8Rqc8SREeSdz7le1UiX7WxfFeRjo0i
         PC/sEiowlkN8rSOZvFLzVApxrjusrK0Spr3JGGq2wrOZ8oHAoGD8dmvCHnvxT7YRMDM0
         fkjjUrgWRAF47xuEtW0VELAsrZAPYKlYlrwSufv1PNxAaTE+Q4Y7BwJN176cMFjc6NDK
         S1St3I71kEDMPcxVmqTyf8XOMyDRQoCeCG+ScvBPf0Qh1v07Pzu5KHOa6R2er0bi5tKJ
         x8/2S0I2cckxa8LapkxcbBN7wTEKW+bn/YOnX5UNazNzF21hi3OT4mMN1g/oKFqmW18Z
         PucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738966032; x=1739570832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9BEVoIsN/seRZLsSFhX5MAb95UC5yXRkvDM7yvwUItg=;
        b=u3a2GncZ9xinImcCbiM+brZ329yKYr3Xkuk/xO2WQ14CFu8E2rJ/XTMWW3XnFFJ9Vx
         ZlVCptqkH/+wNyDGD+SdUKgipJwRiR8SLh+htkAi6WuJINyX2miwWy4dZTDn9qngXUDP
         8suyLMh/hl9YELbYQG0Q2iQj/8u0SPTrA0xDrqXK5seHB2KEepgvZgLGgse9qrJWn4l2
         2M2NOBG4Tlsc9aOX5Dcmis9qtAYQ4g73BdK/zUwJHdshmNuwQTEZG9wPJUeaiTn6ISp8
         iPbHFpaBAsEc8PgG/VoBCWzk52xEFcYqNdVTO4/jSaidbUVFJ4363j7jGafnpBQJYQ9R
         mVaw==
X-Gm-Message-State: AOJu0Yw5emj9G8+vDvbFbloEU60eQwJsF12yHBYvo9jqei7UddT+wsKU
	zLKOF/rRC9GLPHVsR1qhKYOQLk3xKemmt74zPQoiYglN0aEUZm5Ny1C1YlSHlNhFuIIbBKiUB89
	3
X-Gm-Gg: ASbGncu8BtaeZL/Cz8bBP6QOkrUljxa2HDjXQyDX5zsIETNiPFdbVRxXH/FSv87K+ib
	UYJ3778439PpiaN7Fdmk91LGg7m76w5eta7mmSBanOwalT5awSDYTcj+BFw2Wj/Ctf8pVtPTQAS
	TuDiS6hQr0hd/ZYwbuIuKHguoQGEF3NsL5eowdMG8EDwZGyJK7mO4y2I1o3Dr0YisrR9bXZPD5F
	2KpDiTxmQdD9Fe/c1rvrcaDoBddxsjI2rEcXH2V5KbwlH5Qc7yyE/ukbonD3BSqd9F3U36xcCIf
	qQN3
X-Google-Smtp-Source: AGHT+IGw9PrPQml+5GLRVx2kTemKe6umBSpQ4jw11TrQeGPoPUP8vafc5p8HJ5mjkdng0IMbilkuog==
X-Received: by 2002:a05:6a00:2289:b0:727:3c37:d5fb with SMTP id d2e1a72fcca58-7305d4ed3fdmr8216432b3a.16.1738966031969;
        Fri, 07 Feb 2025 14:07:11 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51af65a31sm3586737a12.53.2025.02.07.14.07.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 14:07:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 11/12] oeqa/gitarchive: Fix syntax warning
Date: Fri,  7 Feb 2025 14:06:52 -0800
Message-ID: <d6912b043a816c47569ae40e058e9c2966a20211.1738965898.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738965898.git.steve@sakoman.com>
References: <cover.1738965898.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 22:07:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211010

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The backslash characters cause syntax warnings, mark the strings are raw
to avoid this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f717f61a37ed83618d054fc4017b5f5386fb2e3c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/gitarchive.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/gitarchive.py b/meta/lib/oeqa/utils/gitarchive.py
index a826646059..7e1d505748 100644
--- a/meta/lib/oeqa/utils/gitarchive.py
+++ b/meta/lib/oeqa/utils/gitarchive.py
@@ -146,7 +146,7 @@ def expand_tag_strings(repo, name_pattern, msg_subj_pattern, msg_body_pattern,
         keyws['tag_number'] = '{tag_number}'
         tag_re = format_str(name_pattern, keyws)
         # Replace parentheses for proper regex matching
-        tag_re = tag_re.replace('(', '\(').replace(')', '\)') + '$'
+        tag_re = tag_re.replace('(', r'\(').replace(')', r'\)') + '$'
         # Inject regex group pattern for 'tag_number'
         tag_re = tag_re.format(tag_number='(?P<tag_number>[0-9]{1,5})')
 
-- 
2.43.0


