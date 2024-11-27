Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77274D66BBB
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 04:12:07 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.64669.1732680726317445428
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 20:12:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2MIHR2Z1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-724e14b90cfso4481064b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 20:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732680725; x=1733285525; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iSHODsRCg6oFVq4PP3wcKTGzoUScDfKIeeXtpdDFV0g=;
        b=2MIHR2Z1hUGdzUpQ+zf4qmm7vUGAO9+Ic2edLSRo/VUQtxsNzUbFZkQqRfshgwWS7H
         EyGA2xwBFkk6NDUZoyBfhwF6rLXFPeRstHKMuq5BjOMc/uJU9hcS/HhxWJP581YhUrEK
         H9RQbSdsgY9lYv0NevQ49IhMvCm1iK2cZ9pCD9yjVfOt0PDOmuA1YP8J0oxf7pxQeIDk
         RmvHq0KD3bg1bOlnIUzqn0qjJz4PJDox1zsE2PbR8WGKK1pjnAFzEzRKQOnVjxQN9Ty5
         544PTwhKWIkGD4rh0LT8rZj5DNcmYor5frFeGNAwLPKFHKRP6mIC3aE/LamyQGs53Jbc
         ffcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732680725; x=1733285525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iSHODsRCg6oFVq4PP3wcKTGzoUScDfKIeeXtpdDFV0g=;
        b=itmP4mrrqGyAveA44Hgp9rYg+Uw3Z9/vz3HUUJsTRREIEmh62FCq+GgfStAeQTX58y
         RNHb1oJtWV6mLHbaBS+o5U8LooHgvbD8BZeAiHjmN7hbWD6HIvJP8IsjsN6UEWIH319o
         IOpTH23Oy3c5ZlMU4LeXRvo7o6bivC3cCdBNP8ChOQJOsAkGFLSL/0RsZm3TVftuDXLa
         lBdeRU5ZxB4M7+MoDF1w8JR7wO/0/f+nmL1zsPd7bNrlbcPqhgQTRxAnJ/DhYJxy3jTK
         ABMpN/u+ISAgLjjYeCyicm570KVrqhu2pBKIo3HbhLkvX8MF5fX6RW+odBBVRDiRRRZG
         m1ug==
X-Gm-Message-State: AOJu0YwJ4bXUVgmpRUXIij/p/asKh3n3cEPwdfS7mXfOc3m5RgV+XTTj
	EekLYEo6oleVj9yXyRyGc1BYB0v388CQMXJaTq5baBGNCAwIS6Vm92kStSEQmRFeNe0711tqAJ1
	/
X-Gm-Gg: ASbGnctdnAkn8CwGgt7HtoUmWLxg5H7/guBx/QdciJVEZaQ1u92KsMCT5+vBesd5y6c
	kPODjB/ZmwJppIMf2qwQyaPXb6/WYGUUueBPmGMR78/UNfTbZBs4SUaLMrox9c+IHK76BIYCWSQ
	0lwdgZz9CCIdtUMJp+9dpJZZTEpRGKLdfEPMTZSEC6C5EwVV40eWDvM1eLWLq0udWcdrZ1d1EMV
	123N8AA7xCw9lRf3tHCKXjgtqV0ZJDzF9snLG8=
X-Google-Smtp-Source: AGHT+IG2IjYZxMYVgTq/njlLL3MLxtSHSBNePrFbwIKHBzV9JIZUgath5UMgC8yI2hjl/WDTpz5tdA==
X-Received: by 2002:a05:6a00:1887:b0:725:2b93:3583 with SMTP id d2e1a72fcca58-7253014c613mr2161494b3a.21.1732680725526;
        Tue, 26 Nov 2024 20:12:05 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de485c84sm9240796b3a.80.2024.11.26.20.12.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 20:12:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 09/18] scripts/install-buildtools: Update to 5.1
Date: Tue, 26 Nov 2024 20:11:29 -0800
Message-Id: <4f58037a49ef538d89d9c6df81b1b2d8a2eab4d7.1732680538.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732680538.git.steve@sakoman.com>
References: <cover.1732680538.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 04:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207903

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.1 release of the 5.1 series for buildtools.

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 92a4c9dfb1..6387287ade 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.0.3'
-DEFAULT_INSTALLER_VERSION = '5.0.3'
+DEFAULT_RELEASE = 'yocto-5.1'
+DEFAULT_INSTALLER_VERSION = '5.1'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.34.1


