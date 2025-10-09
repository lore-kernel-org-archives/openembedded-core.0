Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D4CDCCD18D
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 19:31:49 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.9209.1760038304023443177
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 12:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EP4uCv8B;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7811fa91774so1186748b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 12:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760038303; x=1760643103; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BzXA6gFmJuwFC3d8eUFkXkT/bS+ROUirc0PqzHQS46U=;
        b=EP4uCv8B2tAX1f59uNj0wb7LTxC1rjk08ZYXxiydZHKLMTe9LLx5ZFGAMKwWE5ejcO
         NjCnGe037mjOK79trHbZSRUJ3IxfShxYO1cWq8ejel/DIdM5+6UcW/VcV+tK0pfcKtba
         wmy2P5l3CySylcMHLKt2JGjma55MIedORZ6nDrTy42vLcJ1s7gS4DiiS5SEyuu2GBGdV
         EE59xr+xB4MKyq0V5/F5XHs+TQuxOrxpwc4Jg562qCz59exOyBgKZEAI6apyG3Q8roSI
         AucLQZ2hZt0dWK+v8R0loMwxsXnf+3/E/EVtBTgOpeyGPSoY/yCSKA7CeEJ2mfbcmmN3
         KTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760038303; x=1760643103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BzXA6gFmJuwFC3d8eUFkXkT/bS+ROUirc0PqzHQS46U=;
        b=Mo008HX0yM9fJiv50Eav7AaZk7ib5kkxpxkUKkhjrKGfoDU1TV0EzfwZoOx4KpOD5l
         ZvCv9oey824TNuFh1ZnEAi7zSfUFCwWAxGwKPj6mnXtI5vSFyvbmeMWG1MQbYNzTJkPV
         rrWCgVi3WbmxA7A+zcQkWTmpZST5Mr5ajgaHkwhHsa3rESPEQHy2obTwoTPgynIbKK76
         l7wVDpfpILed7ja0ubJI8eWQGZ898wATqttXFz6/P/i2r3Z2nIE+svH/hPwwN63+jgi2
         kmmLQpKRPuCm7oau3uP3vvk4u4AEgsVcFkAtrwO8pjx1U3qkFQk48GAkJEm+p1uX9L2O
         rL6g==
X-Gm-Message-State: AOJu0YyutZrcNLE0rqh66BJ7euONa0M7HKn+Szbnw/OwPr+HplDLz0Um
	h84VnOMmAgbwyHZdXXfyL8LDhT1rkfIlYaWdkKWrUxLNQQQNyiVrp1NeLPU8oomDkZWQ3KF013m
	3btSW
X-Gm-Gg: ASbGncv+oApKeVK1F7UAd7XKqNsQN/kV90RHqxIf/KmYrnULB0YCAmqdKwZAYU0XHAI
	VtUtDQu/o56VwtCSK/XMP3uUOfqCfSeS543WvypkpscQS+HgXDIsEaUYPI+dv6SF6YixI16VZbH
	Xk9rHNZiOZJgI+fiSR7yakhu4Auexsa+tA9WXMnfzrPLT8QDxTCVR2tELolyZosLyuaYME+QEkP
	l3P8QHFkdZoR4HnyC2PDcLTi9tbZZEFG5rkff7nIYAQgG89uz7TrYXVNWEv1/I+ceVjJ/fVFVv+
	wLW7tcYw4Js6vFclJQP2mfSSdFCBRtw4MKQZ8a4jsWEXSbc0ptNzL3F3XG62Vfpz0vtvztdXXpr
	mIQd5YmyrDMJj+p9DoP8n20CO4LFT5UyMs3UhOg==
X-Google-Smtp-Source: AGHT+IHSl9LEoz1YzFYTFH35gRNUhI5zbZi5pfHw6hhuGnkDruFSvvDXK/5NtSAgNerGCGCgXkRs8Q==
X-Received: by 2002:a05:6a20:914c:b0:250:429b:9e6d with SMTP id adf61e73a8af0-32da850fccfmr12058210637.44.1760038303278;
        Thu, 09 Oct 2025 12:31:43 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b96e:4301:8642:779c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2d51sm495864b3a.65.2025.10.09.12.31.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:31:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/24] scripts/install-buildtools: Update to 4.0.30
Date: Thu,  9 Oct 2025 12:31:01 -0700
Message-ID: <237452d023dfc895cd8183e30e781da6f60b2ec5.1760038088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760038088.git.steve@sakoman.com>
References: <cover.1760038088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224636

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 4.0.30 release of the 4.0 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 3c86a087e8..5c990b1f8e 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-4.0.28'
-DEFAULT_INSTALLER_VERSION = '4.0.28'
+DEFAULT_RELEASE = 'yocto-4.0.30'
+DEFAULT_INSTALLER_VERSION = '4.0.30'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.43.0


