Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A30C3DA55
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 12:39:49 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.15472.1720960781005156383
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 05:39:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2IzlzHii;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-75ee39f1ffbso2357163a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 05:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720960780; x=1721565580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nzAgZUID8iXnjGbKwVnm0hvvIJKiXDNNRjlZLVr6v4k=;
        b=2IzlzHiiQaXSdop1toFXstmiiEMXOYCCjzcbf+Hn6+9ljPOTan/Z4rARBsksWqslF5
         GzH6cDDwXXsKly+kkgqNYyTmnrRyaUulCpznEzgTeho8NIHeAoWnYq8zhX0EjS981KQw
         2Mp58tsgxyKVLTAFvdD8ceYzTLHNxhHg5BVagDx8M7+VbOvwlLLDjJkMh/SeMmM9CN8j
         iupklUEag/q4QAVakiV/wgOb5m4i0og0rrXJ2DQq2mSP1ueozZIyw50Q7ZyFYsxCRqa8
         Lt6AWyL9khFcvdY3mFt2a/k1np881lXRDu198YiuaYi5ak8g6mUneU/P+ak/2WmaDAia
         PeZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720960780; x=1721565580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nzAgZUID8iXnjGbKwVnm0hvvIJKiXDNNRjlZLVr6v4k=;
        b=w2Z4uGaIl/Iu/A8M02jI288l5XeTmPpkZu+n4b+U3hCTxNKOJ6EDogg3HyHNqrSaDe
         zBEEJdSnGmVr2w1RgYhpy7mMe+Zkd6XBXU9dRDo1YEU6K0lwLl/SGY5+w/JwA9IYjnF1
         +Chbn3+Qqx27cD7NGAHhsgAhAISaMQklS0zAHLERBE9ghHHv8klJLN+jybxLVT7Kg1iv
         PyblGKfLd8/USqufKD2Qsb71Vrrg6hxuSaH4zuLqr/6dQSz3VDV80zxj6rvLPyRAMTX2
         SqVEmYutzP7xcPe8YuA1tJDkeK1pO4s2f/yPrLPaNahbj5crEDHlFwvKs00OmxvThHZP
         aG1Q==
X-Gm-Message-State: AOJu0YzD4xYrwsGK/xxMJKtyuF2qmL7OPSiMZjErq+J6AEbHMPqQ7ATi
	ZF8lIwKIVvbk28ZS4NjtHkpgh2OIRkKSzPFkRAn2eLpRuhdDaqczeORfOP6j69psvxp27KI6GXd
	BM1I=
X-Google-Smtp-Source: AGHT+IHgulzGs1alCHm+2Dfy4KRw9cGgAYSgHx7w8/2hvAhL7x2V2gjlJbZA3pS1sgvJoC/NHkBPNw==
X-Received: by 2002:a05:6a20:7491:b0:1c0:e54b:5651 with SMTP id adf61e73a8af0-1c29822ced0mr22321770637.24.1720960780225;
        Sun, 14 Jul 2024 05:39:40 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb7006bsm23245245ad.41.2024.07.14.05.39.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 05:39:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/27] dnf/mesa: Fix missing leading whitespace with ':append'
Date: Sun, 14 Jul 2024 05:38:48 -0700
Message-Id: <eb06788f3abef4af727da7399e7e97830b2f7c8c.1720960579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720960579.git.steve@sakoman.com>
References: <cover.1720960579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 12:39:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201878

From: Niko Mauno <niko.mauno@vaisala.com>

Mitigate occurrences where ':append' operator is used and leading
whitespace character is obviously missing, risking inadvertent
string concatenation.

(From OE-Core rev: 314041fd126a4800a5a5d9fcd84c525319479256)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0b6ca9beeff927bbb6158c71596ac475550559d8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/dnf/dnf_4.19.0.bb | 2 +-
 meta/recipes-graphics/mesa/mesa.inc     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/dnf/dnf_4.19.0.bb b/meta/recipes-devtools/dnf/dnf_4.19.0.bb
index 184dbea963..37a2cc7de2 100644
--- a/meta/recipes-devtools/dnf/dnf_4.19.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.19.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
            file://0001-lock.py-fix-Exception-handling.patch \
            "
 
-SRC_URI:append:class-native = "file://0001-dnf-write-the-log-lock-to-root.patch"
+SRC_URI:append:class-native = " file://0001-dnf-write-the-log-lock-to-root.patch"
 
 SRCREV = "566a61f9d8a2830ac6dcc3a94c59224cef1c3d03"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a8f3397e04..7cc48e8a04 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -90,7 +90,7 @@ PACKAGECONFIG = " \
 	${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
 "
 
-PACKAGECONFIG:append:class-native = "gallium-llvm r600"
+PACKAGECONFIG:append:class-native = " gallium-llvm r600"
 
 # "gbm" requires "opengl"
 PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled"
-- 
2.34.1


