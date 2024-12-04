Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4724E77175
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:36:36 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.25423.1733344595933816319
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:36:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pNNmoGbl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7251331e756so247735b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733344595; x=1733949395; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VZkdE5bem606eL0OEJVTTByqvz8SgJKjhq8CXFOqRRQ=;
        b=pNNmoGbljvhxazJMAeD1wvf+J64+mgNVvwtPij3bLAtcWsLBAZoVi5DMsmTSTJ9GOX
         iLvMsXszfIIW0OUN/P//NMqVSL9Y8qDLKJKShWP2jKTqOh50dET5NdvsdDjkYJTtBmix
         aVdis+psCSNOvqsTg6lvCcrJQONpKRDfSEnQqnXF8eylA6gPMe/w1G5zPhAVK15lW2Lz
         WlFIifuawjnCvdXCxMC/v1Ab6I8ZeC7TH2/rj/XgExiKuNR1soMAy28fHmK2yELfj3eA
         7varRo05OTJilLCacNJMpQcwlSi5DWuyvx2EIeppZcCs/O9NVi4LA98pQYcKqID/Y/+3
         d0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733344595; x=1733949395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZkdE5bem606eL0OEJVTTByqvz8SgJKjhq8CXFOqRRQ=;
        b=VdP7YBb3kQ6t/EtgQs+DHK4hNqk5QGoVHnfLxQBoN8lToufKVbH10vmPUFe05uxS8p
         GvGV3TFzpPo9ZIVjdVowiR78O+7x+myX0RskVgSHkYlEZAgOZp1j49wqdRYWF9HYWU5Q
         U47lXhPi6AQ3XKyqKUrvPnUmxKUbLFDWBLhJGho/3cnZopsA7Uz7Rv3nm8hV6IugjCdp
         O7fyd+A8qKygNFiw1gmgzqWqAUSj7sDWbch4IoU1rDVbwVNJVxyV3gZMhOLDEb7zylNX
         8/bviiF/GpidivH3efCakmPX1oPmSz+wrf11waPA8c+pY39eQrVzvNKDE7I7+IWY1/F5
         YijQ==
X-Gm-Message-State: AOJu0Yxlzf3EIo50s7B0CNkW40mTnb6yqrX1w4dLRlihW43JwcQu5jee
	BTa1Tg8tjdsQljbhhqARdPOoDB6VGzQtMgelxScL/seIgWHOXLxMWekZgLEh1JIOILr6Pe7TZJS
	O
X-Gm-Gg: ASbGncuISS8PDQLVbE42LI/WSPml6Nnzt7/LLDLoikAq7rqSYbhIQRCtGe5uNirkSPG
	M4n+8Y5xTJJHQb1yh+NCSICOaypEXTH+NGHkmQ059pV40AmIr41jRO2qX/C5tab/2RJrO0Oagh7
	BvVqsr8e/XubCcLSU00dZMG7hSMwWTtPuIJo5oGz8ShW2CDqW4Wo1jMd9uopyDnhUY62DLBMQ2L
	vJYCjMz1Xx9LAGcsvg2Q6FK9WqpyY804rdN0/M=
X-Google-Smtp-Source: AGHT+IGsWO/3VepSvIcsRp4m378XHmMQE3giEtdOPi3U3GM86wK+eAdMguCjXjLCXSOJObUzRiwCsQ==
X-Received: by 2002:a17:90b:2e83:b0:2ee:c059:7de3 with SMTP id 98e67ed59e1d1-2ef012101eamr9641211a91.18.1733344595224;
        Wed, 04 Dec 2024 12:36:35 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176f3d7sm12827805b3a.55.2024.12.04.12.36.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:36:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/15] rxvt-unicode.inc: disable the terminfo installation by setting TIC to :
Date: Wed,  4 Dec 2024 12:36:11 -0800
Message-Id: <846071ec89d3dc5f392e9203c4e7e1e3ea27892c.1733344462.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733344462.git.steve@sakoman.com>
References: <cover.1733344462.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:36:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208332

From: Changqing Li <changqing.li@windriver.com>

Without this change, TIC is the native tic in recipe-sysroot-native.
By default, native tic has set its default terminfo path to native path:
${datadir}/terminfo; $HOME/.terminfo

When sstate cache is used, the cached native tic's terminfo path could
be a path not exist on current host, then native tic will try to install
terminfo to HOME dir, cause host contamination.

Disable the terminfo installation by setting TIC to :

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fe35ead2c3135a18c346e7baa31d34b15c3e2d95)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
index 016614b19c..aa6d908538 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
@@ -28,7 +28,8 @@ EXTRA_OECONF = "--enable-xim \
 		--with-codesets=eu --enable-pointer-blank \
 		--enable-text-blink --enable-rxvt-scroll \
 		--enable-combining --disable-perl \
-		--with-x=${STAGING_DIR_HOST}${prefix}"
+		--with-x=${STAGING_DIR_HOST}${prefix} \
+		ac_cv_path_TIC=:"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[startup] = "--enable-startup-notification,--disable-startup-notification,startup-notification,"
-- 
2.34.1


