Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B90A2E6FE4C
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 21:26:26 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.109422.1766525184823601780
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 13:26:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KupDQ4lL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-29efd139227so71968625ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 13:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766525184; x=1767129984; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stx2Z775L0BSdgdJ+O12aDfx7B/An6moHEiG2hxSfhA=;
        b=KupDQ4lLMGlPeKJxQl2w1H/Y7VwDRCRa901exm8ioy8sbyNwtLoHtctqS+VMtPT9pv
         uh6d8sbJOqqYcLwwgEWwjBEQVIo0WibgOmKNEucDxazUlBiwck+5qIM1Us/Di52PyCCT
         KGe+xqFX+gHnhC71n8nOIDDEcTvoxZ6vS+MV0NHdqdwQYo7YhPGJ9M5J78kUBf7xQAmJ
         JQGlAYiwuerz9fVJS/CqIVfRqDSsDw1uxSHm0+o4o+hqwr1H9Xwz0tIpmgBxMIpbLktM
         uFvo0F33olvcShW1aBmQt5NxrrEe3rBVX95KY4qMsioWEgddTh0u76ksAWCSkP0fimYZ
         Abng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766525184; x=1767129984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=stx2Z775L0BSdgdJ+O12aDfx7B/An6moHEiG2hxSfhA=;
        b=puNoVVF0j2bOknfv/0bCjyicqRDsefT5pd9amgKHgqQOkWUfWEe0Evx0vQg9tqDpPB
         BQRl+BtYTYs3sonOu4z4xh547IaRtacbPLatpVpiBcEjFwFVqOxLGeCdV79y1W9cIAiO
         Gcis3tAeNWTiaR5uLcluDTgBn1OTd6CGwTRYbmiOlOnvpkLRds3RHRTUvnn/vJ3s43oH
         jwJL3BsallR7cCZnakUkiu2d/yyFGG+g4tQ1hAqik+UqV1oUWmcaXwY7RfRLaCL7EbLf
         kwr4RlpORRh21xTVqUx7ZafiS18YMd6CpuOfKxAPTg7fqMW6fVj2XoXeX3B0M4rTw9lD
         TaOQ==
X-Gm-Message-State: AOJu0YxQWCoGC/8iIq2GgSn/Xy+m3HkIl+K2DI8e7UboAom8eKKxIGq2
	x5Vl3h1CyctxNyulw6cz99/GDShfdvZ8K2yLpz5l3RczOYHvVgaMQZr/M5AT+bwDqfjIr9DvLcU
	dZrfw
X-Gm-Gg: AY/fxX4cS/Q2njSJUl+8RbKoo3eyNWaM3znxSVq5tHSAYv4PTIYNEBkvMZAOxRK6MI6
	6UhWUnM9nFTnKuxVFSsQcxFbzkvqnDORXOsLKBaugbL9ZgM3MYCSgaKeyiDzaRwgYUqhMzJiG4v
	KnqEEXQQ7rghxn+OU4MCpd5ycC9dy7Z4mge7FpCgS8+D6GBmIjIdoIJa1NIYirad8tQ26Ug3fFd
	4YQ3c54OskPPekeuUZU2xExxc7z7QAhnYT7LUERdb50gI+NIKUzceAvSWu4QPZnlM1tPdOz4A2Z
	RFXcXDM4be5evf6siWucsGDE5mNsxrieBRj7F1oOzG8cezlzWYL84CG+xSqha+ntdCwKjUsjQDL
	/45g/Wv6cMDfrM42yNc/SC6l43lbg/2LpJaq23o/bxmk5vDBSU1VDKJCU70C7GeOXWwTayawuIw
	N81w==
X-Google-Smtp-Source: AGHT+IFO+supDj7KQX+3878ExdxlZXzmxNTY77FPQnTWaZUOGzFlwDMU3xbB6aNArjgPbp1FWpL0pA==
X-Received: by 2002:a17:902:f60c:b0:295:888e:9fff with SMTP id d9443c01a7336-2a2f221fa6emr150275325ad.20.1766525184023;
        Tue, 23 Dec 2025 13:26:24 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:74b3:f61b:a7a7:fafc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c6a80esm133756765ad.8.2025.12.23.13.26.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 13:26:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/10] scripts/install-buildtools: Update to 4.0.31
Date: Tue, 23 Dec 2025 13:26:00 -0800
Message-ID: <f449a6cc745c0b840a49fed55649b95c89f3de37.1766525021.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766525021.git.steve@sakoman.com>
References: <cover.1766525021.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 21:26:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228502

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 4.0.31 release of the 4.0 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 5c990b1f8e..2c9f3f25c6 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-4.0.30'
-DEFAULT_INSTALLER_VERSION = '4.0.30'
+DEFAULT_RELEASE = 'yocto-4.0.31'
+DEFAULT_INSTALLER_VERSION = '4.0.31'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.43.0


