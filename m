Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F541E77175
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:55:05 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.21210.1733334901853192214
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:55:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QRXF6/+R;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7fcc8533607so82498a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733334901; x=1733939701; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vgpaDaKW7ugXxVEVVieTCPfGRAFbm3yVqHZP0dZXsNM=;
        b=QRXF6/+ROxGg6hwXXlsTaxOLA5SxIWpPm7OwW/JpJ5tqM8UDKqc3WckaxnTvdD5u6C
         +Fj7glTcVPF9zAuhDgDzZwrzdoxSq3CNaJWSl0Hgz8U+auObPj7K93EAK9eMmFUhJ6mp
         h7vspfk42CbEshY6bpuX6ehwpheXBkMilpi9ZVqnDg/nO7Xeol94GZVGv+qzldSDXhWD
         d4s/5An14b5FvC9ETJZPJjft8aDFnQT8uyn+FcEYoYSz2nAB+O4LOU6dXAv0D7FFZmy8
         WuQv4obQxdu6KFqUj11/HjA8l6EdAeD2Cf1wUA7YWEhSBRQ0hHsXaSkXDWv4ZX0mmYA5
         ROyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334901; x=1733939701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vgpaDaKW7ugXxVEVVieTCPfGRAFbm3yVqHZP0dZXsNM=;
        b=YhT0Bmm+9z/HfZb6wfpIgBeKPK1t54ske2KprTB5/J1Kq/UMoWtkaVRCeSMAXP9THb
         DJRCD1JOPNJGrJ0t/RuDPj93g62H1swQhVP8R/yGYp9xTNheBzRvzWczjocUQ0q1Jejh
         DMhIPchp5fPv+eFSXb3Ckl7z9B1m8gnUuPlB8LQ/i+WUr1Vfx+hhoCMgD0eUDaBxAhjK
         xHLB4j35a5Icoy8Y0S1E0xnm/3k6/uyae+/bRvRZgBBSWuxEwZiqXmIauklXZ3JC5LId
         /U2LMVxd2tBynQXZMLN56megXzTAtGfQopCVUNfvOM6IxY8A3WWzKVNEY24VGg5oMYo9
         kwNw==
X-Gm-Message-State: AOJu0YyBQl7Y2ewZr20uNkWkxr7tLB6LgWd+eloDBkBM4DXuMZUf/u+B
	tf/wI/82NHOtN7RGFtS2KNphtZH+jfAs9Cq8KvkaA/TzbOabXcT1k3y3takr6uNdipONnJZtiJo
	t
X-Gm-Gg: ASbGncuXD2uo5h7YCZqR1GHYiGsxTT8Gdu2zuKB2lPzDofenKiGnTF8SZWVXQR7o6Ng
	pdv0OfuSCNsWG0uHHaaZPaxBiX31tojspwxnk9iEPxXKyHg6NFKSu5ruH8g7rUqLge0WH+Mpp7l
	gCBWZm5Utl+R7p7ONmx4V4kxPND5lg5qUyA9rkE01fLr7lzolp9b6Ari4OXJf1N6r3BRLXAUsvM
	6upuDAUuASEEYsIy4ZN/PJcd8zS/oYl0P2t3TU=
X-Google-Smtp-Source: AGHT+IFyFChmhPFbxPfuDd+GpjCTqHLX3kKc/174JZ5NOb+S8VBFKrc+BCeip+ULzfeqdfYmRGn81g==
X-Received: by 2002:a05:6a20:1d98:b0:1e0:d14b:d54c with SMTP id adf61e73a8af0-1e1653f3dc4mr10089607637.30.1733334901137;
        Wed, 04 Dec 2024 09:55:01 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5af1sm11727765a12.16.2024.12.04.09.55.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:55:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 27/38] rxvt-unicode.inc: disable the terminfo installation by setting TIC to :
Date: Wed,  4 Dec 2024 09:53:54 -0800
Message-Id: <33069a688930ccb98a66f02feac40382ecf6cf85.1733334655.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733334655.git.steve@sakoman.com>
References: <cover.1733334655.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 17:55:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208310

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
index e7d520ebef..aa26cc41a8 100644
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


