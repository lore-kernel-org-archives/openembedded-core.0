Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E33C3601A
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 22:36:30 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.58.1743546987551611570
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 15:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LOl8f+xf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22403cbb47fso127287545ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 15:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743546987; x=1744151787; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CPeWXsuU3W8JyJl80urGKgfSiJvTipJrbZ/7wDFG7Vk=;
        b=LOl8f+xfjY9gHiMlE3Mb1xZydfyk7CtAWshlVhl0m9OaDBSMKUkDkR0N88pnSRIwQp
         ZNgcIO4eZR7BT3WHwxTp4BTBD/bp2VfH7z2pBU8lbp1BzVklI+h6xm4QJC1qx2OXgwOz
         +CYgC00565Ma1J2x3T7snrQXtacNRnZz8FK/2ia+tje32HHNTPaLjC0oojL+h+71JrYT
         /VgSChEMiv1PUwp486PwW+5dUZNfnhAbgBCMhczDjTYKKrjvxoRqt9DcjPzSsszUPFxC
         ztNpp2aQw3hLM8XvbePaKCbYUmeX9XmYuJWIbZYTYjwkLvRc4mS1EiRyobuxTzRvCqvh
         ZiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743546987; x=1744151787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CPeWXsuU3W8JyJl80urGKgfSiJvTipJrbZ/7wDFG7Vk=;
        b=uUUWPl+MaPhYALu4bDmZMtSpRccBdXySCL4n+jBjzQZv5FqcVheSlFdDfzBgSNnQ3F
         XXlH974FPpqaZqkPLhykJV0Zsu49GfzQ2CJtw/UUKRW5jNsk5BpwTkxLYW3bAtpxIBbj
         T2hqyUHi0vnRhc1Mujm3Z7PqXz5+S+tMcFETq0H233dh+umRrrkLCQtT2dwdOsGkU/s6
         VR7K/jpUg94muAlpjOX1heaZF7M2SL9KLFMu9eFqI4cWIIZ9cerONF0EvlJHlCic1C0M
         bJ8qU308763d/GaAGno0IcaBg3oPg4rzg7+802UahLJoJ3am6TD+ZFdMSqhJJ3fGSveu
         5K4w==
X-Gm-Message-State: AOJu0YxQZ7jIVfM/apcBIPu8nxNV4xERSbv01HOcMfBR86JrbCrhodiq
	eL52H1jSRyGckwz6f2wyyeE+lH+Rfx9BtDl0trZIflHpyzBua3jr8qEjKHhLA/LphVD6n6mO+LB
	P
X-Gm-Gg: ASbGncsgfTEtwKigryKeQgK3spePZwpylchqbCJB006AywGftolx4cWOHWzEFOS0C5E
	6K6omuyaOflMDcFydA32iiE0/cNjquFwCGCFGp0LQ3XMKFnuq4FCrYUaPJ+xykKBKP0j60an3Lb
	lP72WfD08XBDiOxrJ8WWFwVVrfmkfEh1KgEil4cZK5/P6CoAwFyXujGTZQgs/XwGtXx+2wd3GNp
	eXeYxzzd3HoY4y+x2/EuoQE6vhHlYk/1B8hNwBjAiyVzPz6ZGROJbC/E5wh6gzPWMGgmEecxMwY
	uS8Gs0qVOM6RzgYe4HPRN0k3rs0GJ3PKwzLX
X-Google-Smtp-Source: AGHT+IFpYjeq/FN5z6zrVjOGYj/BJjDJNYkeisp1k63qsSw5OgD9UQ76xshbcHQYCSjhOmHcCKYe+Q==
X-Received: by 2002:a05:6a00:2d8b:b0:736:41ec:aaad with SMTP id d2e1a72fcca58-739803c0d09mr19477459b3a.14.1743546986630;
        Tue, 01 Apr 2025 15:36:26 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:6021:5333:bc00:e45b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e226a7sm9534241b3a.48.2025.04.01.15.36.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 15:36:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/8] libarchive: ignore CVE-2025-1632
Date: Tue,  1 Apr 2025 15:36:09 -0700
Message-ID: <bf7654877ba99f0b18a1cf6f83032af5ecabd01f.1743546795.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743546795.git.steve@sakoman.com>
References: <cover.1743546795.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 22:36:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214154

From: Peter Marko <peter.marko@siemens.com>

As already mentioned in [1] when backporting commit including fix for
this CVE, this vulnerability applies only from libarchive 3.7.0 commit
[2] which introduced bsdunzip which contains this vulnerability.

[1] https://git.openembedded.org/openembedded-core/commit/?h=kirkstone&id=ec837d3b21b4f8b98abac53e2833f1490ba6bf1e
[2] https://github.com/libarchive/libarchive/commit/c157e4ce8eb170a92945cc2d292fd7106bdfcce1

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/libarchive/libarchive_3.6.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index 4ceb0df2c0..f7e576b688 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -44,6 +44,8 @@ SRC_URI[sha256sum] = "ba6d02f15ba04aba9c23fd5f236bb234eab9d5209e95d1c4df85c44d5f
 CVE_CHECK_IGNORE += "CVE-2023-30571"
 # cpe-incorrect: this vulnerability was not in any release; introduced in v3.7.3-14-g91f27004; fixed in b6a97948
 CVE_CHECK_IGNORE += "CVE-2024-37407"
+# cpe-incorrect: bsdtar was introduced in v3.7.0, so 3.6.2 is not affected yet
+CVE_CHECK_IGNORE += "CVE-2025-1632"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.43.0


