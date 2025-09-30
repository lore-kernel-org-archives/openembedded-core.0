Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 744A8CCD180
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 19:50:31 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.234.1759261827650212731
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Sep 2025 12:50:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rc1QUgzu;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-781206cce18so268585b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 12:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1759261827; x=1759866627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I87mr/YDl2XAOqWI0t/m7yn8InbCZN262f14wEQOD3Y=;
        b=rc1QUgzuXJ6yEu2W7EZC9qxEmnMmA2WdK88xEcUg27OJrhRDKiRCwWgHf+1kFbTr3p
         XItKRrzzHUcn3nOn1RZK+xvID1MYcbNGRdA7ixy5B9QPCLTnsPAF9kBLRuBYYYXBCmiO
         UXPAeKrSx0QzBzgC9gCaWKxZnNkDYRT4s95az09+8We2tYkl8jY8Ek3Jhpmvq6tJk36w
         vrnU391wkY9POz036wZu1hDLzX2MVLtTnfDqLqTkIjkXG0SgWIv8LPO5uUOSutC8j2q6
         kA0qHNIDZuu6D5NmVwW2CeamSA9sIQo0eB3FH5ULz8yBUCnsvJ6RANpb1EuNdNmrvfQS
         nCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759261827; x=1759866627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I87mr/YDl2XAOqWI0t/m7yn8InbCZN262f14wEQOD3Y=;
        b=qgdnqln6RdFMYWdOpzXSG3kCov81DSZgoytzz1MqP0s7zeKJoPdIytymnrQtYuPMzw
         o1I8nFLrPf138V4ywBxHFy+mslmMXxPOELi2XUT3KrUKi3SO9R8mIOJJUBq8KuVsA6Vm
         WjR75w/inXDxxMc6/NfVbGAIt4noA9GIRVz93Hduhdrwc7b+TQIaT+kQasTY8LuhnSFY
         U89VvcMinZvCtx0R1DFv27kaBVgxH1h1JOSEVyA1LF2DK9LO83Dh0ZibWa09wYIJmZri
         ffgDXAQQAwKSl7MG6iE9tmwFCTYIhX3sZy3YqOT9UcMAZnCnDRYxqhFOfq/E3muQyXYl
         RZDA==
X-Gm-Message-State: AOJu0Yy6/EQI3hagk9GITMCndKB7lOwKmqCm8ldQcWz78/Vqild8rseT
	bpoFwoQZTKCK80vnWx+YOMCKLAUrYQWVuoNTq+553FCRGlWwt+KzhfhhekCdYTd+2coXMvJn1bc
	zWazH
X-Gm-Gg: ASbGncsB7/gjEhfXbbfgd/4OrxRDHDXdLStZ9IQrKBTyObE6Ywt1OXCnPHEdbiLc506
	yiSzMnr/KI/IuUpZxFAPvUcZ8a7Fqg6UuVztzw8YrAw+aywdx7ev3mTBwkfDSI7I4OoPh3ariY8
	pbZjQvQ7QiinfHYq5vAi4GIFO39JapgT66V1Y5PaK0/nOlqFc+roT96C2dW15m52wLiRyJoUk8g
	dL+NfqmULR1TApIFE9wfxgKS7mEal3Va5zONV1ZSEbyF21XRTxnYyvZjigteOiKvkYfm3kDz9Fi
	+0GeZ17TSWW9fTd0wtxn301kGm7byifARIzw+GBdaFkrdCs5DLP+uZ5/gPJY/sDcbT4FH7Z0kbe
	V6XzqQ1lBsCF0v8NVGoseBlO0AwLQdZOHR2Hs7Kw//zv1rjYu
X-Google-Smtp-Source: AGHT+IELxq0D8gzXWiPoE6KlHbWGKlJu3YIV3cf7s7Z3T057xhDOeCUrVuTwIuKHyud5kHX1YeDrxA==
X-Received: by 2002:a05:6300:8804:b0:245:ffe1:5619 with SMTP id adf61e73a8af0-32199e80039mr1260049637.23.1759261826911;
        Tue, 30 Sep 2025 12:50:26 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238ca6dsm14411202b3a.8.2025.09.30.12.50.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 12:50:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/7] libhandy: update git branch name
Date: Tue, 30 Sep 2025 12:50:09 -0700
Message-ID: <2285f30e643f52511c328e4f6e1f0c042bea4110.1759260542.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1759260542.git.steve@sakoman.com>
References: <cover.1759260542.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 19:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224200

From: Gyorgy Sarvari <skandigraun@gmail.com>

Master branch was renamed to main.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-gnome/libhandy/libhandy_1.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb b/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
index 722593dfb1..4b3f43df1c 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
@@ -9,7 +9,7 @@ BUGTRACKER = "https://gitlab.gnome.org/GNOME/libhandy/-/issues"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=master \
+SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=main \
            file://0001-Add-private-headers.patch \
 "
 SRCREV = "8fa8306a79215fc6ebf2483145da98bf9b2495ab"
-- 
2.43.0


