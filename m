Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6430C4450A
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 17:16:37 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1603.1784049393485215549
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 10:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=I14Aepzo;
 spf=pass (domain: mvista.com, ip: 209.85.216.41, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-384c94c9414so1080685a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 10:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784049393; x=1784654193; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cXpwYSOTQsr0bQiOOqRXPJhNY7KMdS/1VB3GBss2gG0=;
        b=I14AepzoScV6qBqdsJorGF/Pj2nI4UrMmVNrHOk4to2Wq0wN7jtmiX2p3i8nHN9g3v
         NC115Wy63rE1oVE+9al+y4C82XGtGe0/KpW0/5HUgIk4wMg1RT/LOf0XqUXd8gFjxzI0
         3lmXH0SAQH7O06FSKK9LO/rGNud6wIQhnEleY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049393; x=1784654193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cXpwYSOTQsr0bQiOOqRXPJhNY7KMdS/1VB3GBss2gG0=;
        b=JvogCG7xQxWyRF88KBkUkxuby0UZLwbdpJhYGCqJRLmTQ3XCf81d7ZdALbxaJZeYYi
         KE9OmKY6+eptkOA2IFFwpLzChqYslVCo+41F9gscTpWDekHAVdmadGYzPmhhU4+o/PUc
         pn7h+bvsGviiTpm1YhoQ0KJURwkpJRghcCTEkqKw9sBnjWCJxwicIhg5oIwf9xbWgvuh
         aKEy6RPzmCsM12mjJoMoXPHLU7N3+J7IBdE3QiuFwsFL/uOl5vsBRS0XBRGjD2WxMiJF
         wqVTqyR4bQ1a7qut3OKcLKBls51s9cDub+M9vInS5SWkFNnVS/vlpEnQWqxbwC9mGQtg
         4XLg==
X-Gm-Message-State: AOJu0YzYB4lRLWeVFOvUiqqH21wTu6/0wm4QR3VMi1dX3gpq2o6Tf9NG
	9uI3qJwpp2vyDLrGEz0PI9DBbC8ix+DK1g+ytWbIjGASyqeahVSz/lxMtrlYo1Nc4/mmLL3YaJp
	gkWs+3BE=
X-Gm-Gg: AfdE7clAVpcvurEQVcMyZa5dszsnU3MuzxRK87lULXPjY0QCinCZ0rt6cnyxJIQa1s8
	tUWWkcdqY0qzQ4ACexCtAKLcu9ezVJYUBB5RtHpoaldtc/nyJuogp5jNRvH8ZdEiY5DxBWJ4/4N
	mFhLnOhYKxz7BGr4VevvgO7CYTq87IdrrUk6QZQpLg1cezFdXt3A6HF5cAb2p738cSNZRAo3rUH
	SdoscbKv5VPFK53UqlopCFw66Vx/VDRdGOlVsA2hz7qwV9o4hQEF5k9UJpajjr4VMjqtoHTrJ9f
	fZ5tlWVkr8uAVMYCQEf+4ZOQOzfACsFJuq9fDL+h6+rfe6AywAobgSUe/E/ggb7z2vmHrJvzUmH
	vHTbz71RGCMAnav0Bxjz3NcamWhLFSAUQSoawVzPxEz9HXjOhvUdE+ZALEkDOJWtKrnyrQKOBW1
	cDM0ZoDTbzqvNy873OzTiA8o4=
X-Received: by 2002:a17:90b:3dc4:b0:387:e0db:bc2b with SMTP id 98e67ed59e1d1-38dc77ec294mr13839802a91.43.1784049392805;
        Tue, 14 Jul 2026 10:16:32 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.46.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311950eb930sm59355798eec.8.2026.07.14.10.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:16:32 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][master][PATCH] pinentry: upgrade 1.3.2 -> 1.3.3
Date: Tue, 14 Jul 2026 22:44:18 +0530
Message-Id: <20260714171418.1585070-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 17:16:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240905

From: Siddharth Doshi <sdoshi@mvista.com>

For detailed information, see the link below:
[1] https://github.com/gpg/pinentry/compare/pinentry-1.3.2...pinentry-1.3.3
[2] https://github.com/gpg/pinentry/blob/pinentry-1.3.3/NEWS

Note: small modification to libassuan_pkgconf.patch

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../pinentry/pinentry/libassuan_pkgconf.patch                | 5 +++--
 .../pinentry/{pinentry_1.3.2.bb => pinentry_1.3.3.bb}        | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-support/pinentry/{pinentry_1.3.2.bb => pinentry_1.3.3.bb} (93%)

diff --git a/meta/recipes-support/pinentry/pinentry/libassuan_pkgconf.patch b/meta/recipes-support/pinentry/pinentry/libassuan_pkgconf.patch
index fbd370d9fd..4ae7641c48 100644
--- a/meta/recipes-support/pinentry/pinentry/libassuan_pkgconf.patch
+++ b/meta/recipes-support/pinentry/pinentry/libassuan_pkgconf.patch
@@ -1,5 +1,5 @@
 From 1bf04756b90832494020c39661ea944a0b11204f Mon Sep 17 00:00:00 2001
-From: Armin Kuster <akuster@mvista.com>
+From: Siddharth Doshi <sdoshi@mvista.com>
 Date: Thu, 22 May 2014 10:50:00 +0100
 Subject: [PATCH] libassuan: Improve pkgconfig support
 
@@ -9,6 +9,7 @@ the libassuan recipe for libassuan.pc generation.
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Armin Kuster <akuster@mvista.com>
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
 ---
  configure.ac    |  4 +--
  m4/libassuan.m4 | 94 ++++---------------------------------------------
@@ -51,7 +52,7 @@ index a2eb5d9..897f407 100644
 -  fi
 -
 -  use_gpgrt_config=""
--  if test x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
+-  if test x"$GPGRT_CONFIG" != x && test "$GPGRT_CONFIG" != "no"; then
 -    if $GPGRT_CONFIG libassuan --exists; then
 -      LIBASSUAN_CONFIG="$GPGRT_CONFIG libassuan"
 -      AC_MSG_NOTICE([Use gpgrt-config as libassuan-config])
diff --git a/meta/recipes-support/pinentry/pinentry_1.3.2.bb b/meta/recipes-support/pinentry/pinentry_1.3.3.bb
similarity index 93%
rename from meta/recipes-support/pinentry/pinentry_1.3.2.bb
rename to meta/recipes-support/pinentry/pinentry_1.3.3.bb
index a5c8d2258a..325a75a7cb 100644
--- a/meta/recipes-support/pinentry/pinentry_1.3.2.bb
+++ b/meta/recipes-support/pinentry/pinentry_1.3.3.bb
@@ -16,7 +16,7 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-find-gpg-error-with-pkg-config.patch \
 "
 
-SRC_URI[sha256sum] = "8e986ed88561b4da6e9efe0c54fa4ca8923035c99264df0b0464497c5fb94e9e"
+SRC_URI[sha256sum] = "c2970f16d6afb66ecddfca767d743936c86239bff936eed7fd7597a678414b63"
 
 inherit autotools pkgconfig
 
-- 
2.34.1


