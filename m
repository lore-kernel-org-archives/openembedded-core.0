Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30CFC52CDA
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:06 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.55939.1722258786454091869
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rUj7IzY7;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2caff99b1c9so1868691a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258786; x=1722863586; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4cev+wLS0cSzi5c+8TKZstcFd/B6Z/Fw9/ebcX/TYi0=;
        b=rUj7IzY7wMLBZgt83B6FZ5iKFsAJ8hRFFx8pzIaJPGOaK9jES/YB2uush7KZdkUb0w
         i0r0RUq+0oyC6dZN3IAXdZ0DD/G03uAyYpae2HW9nDKikQ/yG1gHyutBVZLhBBO5sdN8
         HK8nQvO6RwwA9HLiNK26QCZu7Ky2clk6TwkBz7Bypgt+hVynPNEnYgOv+Yg9lssIvQVw
         nmuorJai0i9j78CK7cnOe64Ow5oQLTKqQOmWktW0fO0G0rzmPwCZVlmFP/S6EYhy/wZp
         MJquctH5tZSm80mFwxHmqvE0aGeO+qGOkX8DIf76huAZc6Mh6Wyq5iLgviugav2rYU76
         ZeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258786; x=1722863586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4cev+wLS0cSzi5c+8TKZstcFd/B6Z/Fw9/ebcX/TYi0=;
        b=mTaT14E9F79Odyv0Tm6vSCJarFHpHwWoNPUWQFz/kxsdBW7Xi9ShfawoETSvbT6abi
         f0GCwnADQLuKb+frvV5pU82DhumLvGgv/+cj3jWSVCGEVRG2z6EqLOIe8+rbOeCuzTo8
         azdUzDOkgCRSeTIp6MsxuGaiy2I/AUg5Ym7yXXLay/EWjbEj8+JeovYf7C+KiTYHfxkH
         apUzf5t35hApoP/ePR1F1De12yvzSnVZB/+wwSaoqWNsViosAv8IxhpmOf7A1elbM6IU
         JxKjmsjfyyIYDksmEWudco+q5PScSPNehaItnMf7QCLlvRNjfLydEYsKmyCYLpo02iag
         Wieg==
X-Gm-Message-State: AOJu0YxNmxGf7DzKXr/itTUslgG2iHMKSuDUUII2mCkqDjOr4HJwR0Is
	QLjSlbE0rFtc6OZpi5YJW5hLEHaN+3plYCCOTzFEk01P8FsXTDuIuae4jSMct3LcGmfADKzaDPR
	mtO/hGQ==
X-Google-Smtp-Source: AGHT+IEHxGLv5T1I40O231l1GLQH9ORsdXAk5jGHZ28D4bp0RMRKU0qh+jS6vQIvel7cagqY/jMNwA==
X-Received: by 2002:a17:90a:9c7:b0:2c9:6278:27c9 with SMTP id 98e67ed59e1d1-2cf7e621f45mr5280064a91.38.1722258785821;
        Mon, 29 Jul 2024 06:13:05 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/37] python3-idna: upgrade 3.6 -> 3.7
Date: Mon, 29 Jul 2024 06:12:17 -0700
Message-Id: <b6f8938c8048d08e29233fa29f5104b044353cf7.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202621

From: Soumya Sambu <soumya.sambu@windriver.com>

License-Update: Updated copyright year

Changelog:
==========
 * Fix issue where specially crafted inputs to encode() could take exceptionally
long amount of time to process. [CVE-2024-3651]

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/{python3-idna_3.6.bb => python3-idna_3.7.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-idna_3.6.bb => python3-idna_3.7.bb} (62%)

diff --git a/meta/recipes-devtools/python/python3-idna_3.6.bb b/meta/recipes-devtools/python/python3-idna_3.7.bb
similarity index 62%
rename from meta/recipes-devtools/python/python3-idna_3.6.bb
rename to meta/recipes-devtools/python/python3-idna_3.7.bb
index 47c080cdf8..729aff1c46 100644
--- a/meta/recipes-devtools/python/python3-idna_3.6.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.7.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Internationalised Domain Names in Applications"
 HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause & Python-2.0 & Unicode-TOU"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=dbec47b98e1469f6a104c82ff9698cee"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=204c0612e40a4dd46012a78d02c80fb1"
 
-SRC_URI[sha256sum] = "9ecdbbd083b06798ae1e86adcbfe8ab1479cf864e4ee30fe4e46a003d12491ca"
+SRC_URI[sha256sum] = "028ff3aadf0609c1fd278d8ea3089299412a7a8b9bd005dd08b9f8285bcb5cfc"
 
 inherit pypi python_flit_core
 
-- 
2.34.1


