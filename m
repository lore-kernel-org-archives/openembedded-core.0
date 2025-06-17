Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 093A8C7115F
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 16:00:23 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.23017.1750176014732664612
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 09:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2caD8YuF;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-311e2cc157bso4884538a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 09:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750176014; x=1750780814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DaKSPc5rwrEMV/HncWsoVuydRt6O4ociiDTDbLy/cXE=;
        b=2caD8YuFKUL43V4IirAka1GxQXpkuAkXBGyL/mTt/uG1TtfBqwQ8SKbo58j4qhiriO
         ifyGqh6edf3QcyfWtZ/slCYcNclOfeNwRKyqk5eugytdqiFXKQfvMmQijt/pCtYKcS0H
         ftnU8GNlPRxByjitot7fkbqnY4HrFfl/W5ofqRyscyAkWNCdL6zlSFk9K2Lxba9XG3d5
         2Q790ov8a8ADXuMXF4QPjXz8pXHbkw6E27XluAvsBr/3JzJp4tkBo0C/kdEltLEceXQV
         AwL862Xcvu4qXUEAFBpL3V8j70S8SJxWoZ27LlvcDHPxWoE8buOsmX3vqokdMVAe155l
         8gEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176014; x=1750780814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DaKSPc5rwrEMV/HncWsoVuydRt6O4ociiDTDbLy/cXE=;
        b=YXx2kpTLuRJ6EalJPha9nuLqKoBR/aOCNLvxHOZnYReRm79aDIVsA+ghu4yUKK6EOC
         suXXkcBeB04fnvVk9ejTJV0iYv0kYkz9AWA/8d8nhVZHocoJ3hQm2XEphzQYMDU9lCJ/
         nzc1Dr8k97YOrulXgi4wUsHBQCyW+iBRbx4Q0JVvKIi6Ui+PfsiyM2eU6m+rdW90pfuV
         OK+lh1MUaD49ad9lah9hyf8KuhwCrPyTi4lB8Ph7H4y81ebi1MNyfMJsTYR4s5Yy5V/6
         zu7o8lFTMJVGoiJkwPB6plaMQ/67DpkB/xE/QRZ4MSXn0VidCeONTt69bQfWBESYXWdR
         zpzw==
X-Gm-Message-State: AOJu0YzqZlBVk20GBsLxRImzS+0TILYkYBrINwE2tTeOXSkLiLXEtGq4
	YgGMWnvUcekukYMJcZRowmx6b+Qne3cRC6JwsCu6CYrEXLaYIHeN66PAyw7SXKGun0tgWrSsus7
	/EyWZ
X-Gm-Gg: ASbGncuMoZ2qHjE/crr4vsRINJ1r8vd649uNiiA2z8wnIw53mEv/hqtOpG/rcI+MfA+
	oawXB/IcfAbS/w2uafbttoaeagO7ks4gwItus1kR5CsndUTxEUm6oaWBMKxd9jwSgohKYUmva+b
	AVcqnXieWPRQc/PnjLniotfxglHits2BJeVJ94QaBDQW2d3LLitqCXIgDA3F2nTvhZFn+vkRuh5
	qa3plD2ZI7cDn4ek24gkVIrKKtWLcoBBYYqTWmwLQrPL+Ae1cfvYHAPj05oXypesa83oiQxvHel
	0WrK7ZM4nU7nIRxVWrUvV/Voi7DejrM9CzF+wwywi6QBgLPdmAfQ4Q==
X-Google-Smtp-Source: AGHT+IFD3eedk3y4NVgItO4THFxjibCxdCsDxpIEzczqhETxG0buJhxsF/M5xNvhPAjRcgxoaE2mVw==
X-Received: by 2002:a17:90b:1c81:b0:311:ffe8:20ee with SMTP id 98e67ed59e1d1-313f1c0168cmr22333828a91.11.1750176013789;
        Tue, 17 Jun 2025 09:00:13 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea7d82sm81475515ad.146.2025.06.17.09.00.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:00:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 07/12] scripts/install-buildtools: Update to 5.2.1
Date: Tue, 17 Jun 2025 08:59:47 -0700
Message-ID: <91d430e7a68a0cc819398bd05d020f850364fdf1.1750175857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750175857.git.steve@sakoman.com>
References: <cover.1750175857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 16:00:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218895

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.2.1 release of the 5.2.1 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 6750ffcbcc..aa23942858 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.2'
-DEFAULT_INSTALLER_VERSION = '5.2'
+DEFAULT_RELEASE = 'yocto-5.2.1'
+DEFAULT_INSTALLER_VERSION = '5.2.1'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.43.0


