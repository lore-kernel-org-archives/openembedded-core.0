Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C914C71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 21:21:05 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.31268.1750195257790160473
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 14:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FwkOy6Cr;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b2fd091f826so92590a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 14:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750195257; x=1750800057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kL3C/qPUVYRQf5/mJd9T4tVhWdAcgbu28NrV9yERV+s=;
        b=FwkOy6Cry08amw9FvEP3lenygXkodjyv991t5FIeu4/av/Ra8wuexfRdfb0fwEu3nv
         OH5nDeR9X4XZi2Uk08fE3LYObi1orOkUlUGYIaZVvlITACLZcsJz5kyJnQij/KBLPpTs
         tyK4KUVOlfgUI1R84sNZSC/DzpLAux28C+33Kuj72QpgrebiTDGi1B2Igu/QvPAirE99
         HrI0CVjdNR8+oYvVM0BeNOyDpymIZ3g9+tzPH1l2SRGCVAtyZ+fpQVl3QVe4Dcesj6vm
         MfF9n4Wnkxof4ypMa/ahv+dMnlY6m2QayIE0j8fkv+sh2K75Yor84T+dcolCMcIqZuMh
         q2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195257; x=1750800057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kL3C/qPUVYRQf5/mJd9T4tVhWdAcgbu28NrV9yERV+s=;
        b=tkJDInapS+c7IgyxJ9jU1mpdVtGsM/JTK8Pv/q3CMjvLStof++IRHOpML5je2KK0Lh
         JLwnpUFCePq6eeV+L7c7GuOmyPOw4TcUobCrcvWanWgmv5OZ8VkB5QKfKqNZeGOMrJoC
         ZQQNsO0EvwdXv8DgSQpjAZ3TgTprUieUwVCEsw4FMpLSD7f9fSdBpox6150fry3U1vaJ
         0Q4SGiQkQ3gd9mMjlIPjOmhfD5HTfd34Bb9Y+UvBIkHiFjy4Bacyif+jBbPAxbuk484H
         ip14lAI2SrFCdpOkyW6Cj2HT/EZXlt8MbV8OAv5wJT8S4rVDteKADwN5Zalo4DbYKOvs
         xHpA==
X-Gm-Message-State: AOJu0Yx630+1+rlVBYf/qCATHVMqEkWjc1WG+sBqLPJRNdB6iv1KJpQw
	aYaiTGV9bgVmxfU33Yb2jZZdxXXhpyzG48PB/5MR6+xHACWegCYIbA+LMDd+xJcP7YS3K+llY7p
	TXgiB
X-Gm-Gg: ASbGncuBf8a5A5cbphU1kw38ypD5IfiRAekSzFJD7Kscx/hChAIlp35cp5Riu9f9Bbl
	BBbDb+7EruF7U0mLGcai+lBOP9yEX5sbJ3QTzFRohnSyPvhXfA9l88a4TBbFhK9qHR7/G1AEl3g
	kxbWlZtL812KbZdoROo7Ds6Hv5iT5gB5g7OLgLauY+D6uDECmiVdyKlcaglMK7/J0LbJa8goYYh
	VZG78d3iUSFiuJSSS+pJ5P30NngNzr9B4ZL54QF6/M6oyQwdOJtsusu7dBYsQ5acgWJL5HFAOLN
	iwY3JpGVIIOvxLlKdPJpnrC2FhdrDMf33sjdCVNBKpsz/cRWqZZ+fQ==
X-Google-Smtp-Source: AGHT+IEUUWo8k9yyxKcJzs+b8PdnvhkoNmDIzCxuy52+6SICPvpeY4KGAIF928zSBA/uILto9lNkGA==
X-Received: by 2002:a05:6300:67ca:b0:21f:7497:9f93 with SMTP id adf61e73a8af0-2200364a74bmr205827637.4.1750195256913;
        Tue, 17 Jun 2025 14:20:56 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeccf1sm9720728b3a.18.2025.06.17.14.20.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:20:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/27] scripts/install-buildtools: Update to 4.0.27
Date: Tue, 17 Jun 2025 14:20:12 -0700
Message-ID: <9277fae3c81a269994faa6ba6f6c9bdfc74e11bd.1750195103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750195103.git.steve@sakoman.com>
References: <cover.1750195103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 21:21:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218932

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 4.0.27 release of the 4.0.27 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 8e55bd69c8..cf75d84630 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-4.0.26'
-DEFAULT_INSTALLER_VERSION = '4.0.26'
+DEFAULT_RELEASE = 'yocto-4.0.27'
+DEFAULT_INSTALLER_VERSION = '4.0.27'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.43.0


