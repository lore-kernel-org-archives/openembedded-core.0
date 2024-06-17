Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C4DC2BA18
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 12:05:14 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.54561.1718625907344508986
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 05:05:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dZht3QKk;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7041e39a5beso3128877b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 05:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718625907; x=1719230707; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7okafwD+4Reob3oeJ5DUXS/6Ngpjbkcs5SArx6m6VMU=;
        b=dZht3QKk9zBm9XiZNZWqHhLHwvuXXUqJAGIL8d3XicFBb/osORd2a3IBuBYq9yDWVl
         JAdM8mhkUpeZPfHJTL42QirEnaDZS+KtzIJXcq/MeftH8hh2rG01s2Y/8Hq8RKVCQm4G
         6Au80xfnD1zJJoYeNfF7P/hSabtjcGag4SayHSJRk1+JeycXSnFKYB3cUKrykaUJHLzR
         /b1xTEPghnLw0U49bj6/k7vvI/4TmS3/1Em4Sm0kGoNfxZ09jp+5iwNYapw+vDbkCoes
         Kir79OUmWT5GQmk+PbTMGW6DeybpTR0Th4vYLOxdjcVdxqBtKkbdUn8/LjsypQP0Mlhp
         I3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718625907; x=1719230707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7okafwD+4Reob3oeJ5DUXS/6Ngpjbkcs5SArx6m6VMU=;
        b=YU2jJvSG/PVVLszUIL4pN4xkT+muZSTlwF8lJzGXwVrNrsELTt/TS2rmvWhgI3zKMF
         KmiB5IGKGC+slG9Jl7eUq2bbcUeplJJrZw0xiJ5mCdN4Ym4EEzhcltaMDIEioet62q0i
         jEIG2GFQxDpDVhWqLW4SjoAn30c994XbSp8WSWIqBwPVZpMw98c/V/l0IYdkAfCrGkHi
         S+F5VyEn8UD++LM9V9fZb0m10B1c2xMFyIq8sbVVy2si1vtq9/1ixaOKliAg64euN+aT
         04GC17QEk58gE3n5a9E+Vhl9S3vLm4OGZ6v0lHq5FA5AYcIhIPpYVSLiPdxEMU/CqLJt
         TwUA==
X-Gm-Message-State: AOJu0YyF+rKDwWLpygfZWtbhPilCXA7q5LAAA3hcrOIF1iEJq4t5+HQz
	QbsdBqGJlgTQ4AfSFt0thBkxyKk+ZwqzqtMK2p9ajoTn16NMA2/SrXC8F0S0Rdsvwk68qhnOsUr
	fsF0=
X-Google-Smtp-Source: AGHT+IGEbew02HmABBij6eO8Ss4fiUKCjjCHZB2qtGzjIAvCjF4kNqPA3fzmXwmVCTZGuP+0+FMvVg==
X-Received: by 2002:aa7:8e8f:0:b0:704:24fb:11b8 with SMTP id d2e1a72fcca58-705d70eb625mr10630410b3a.7.1718625906473;
        Mon, 17 Jun 2024 05:05:06 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc925fe7sm7482348b3a.19.2024.06.17.05.05.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 05:05:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/22] yocto-uninative: Update to 4.5 for gcc 14
Date: Mon, 17 Jun 2024 05:04:39 -0700
Message-Id: <335d11ad2dd4207e5927f1938c449547a3a2975b.1718625680.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718625680.git.steve@sakoman.com>
References: <cover.1718625680.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 12:05:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200812

From: Michael Halstead <mhalstead@linuxfoundation.org>

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f5638681cef7e250ac64832dbe791418d97f05ba)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 4ac66fd506..657c1032f9 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.39"
-UNINATIVE_VERSION = "4.4"
+UNINATIVE_VERSION = "4.5"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "b61876130f494f75092f21086b4a64ea5fb064045769bf1d32e9cb6af17ea8ec"
-UNINATIVE_CHECKSUM[i686] ?= "9f28627828f0082cc0344eede4d9a861a9a064bfa8f36e072e46212f0fe45fcc"
-UNINATIVE_CHECKSUM[x86_64] ?= "d81c54284be2bb886931fc87281d58177a2cd381cf99d1981f8923039a72a302"
+UNINATIVE_CHECKSUM[aarch64] ?= "df2e29e2e6feb187a3499abf3b1322a3b251da819c77a7b19d4fe952351365ab"
+UNINATIVE_CHECKSUM[i686] ?= "8ef3eda53428b484c20157f6ec3c130b03080b3d4b3889067e0e184e05102d35"
+UNINATIVE_CHECKSUM[x86_64] ?= "43ee6a25bcf5fce16ea87076d6a96e79ead6ced90690a058d07432f902773473"
-- 
2.34.1


