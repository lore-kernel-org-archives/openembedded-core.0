Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA3BC35FF9
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:12:32 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.31714.1742141549337977633
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:12:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e/welm2f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4394a823036so12803895e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141547; x=1742746347; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x2zbbvTDpmtrmEZc39SyFObaopn7HZA4BS7hcM+8Pvo=;
        b=e/welm2fyvI8Cszhj6RQr7cV4HonnKj8T2wII/uEdS7vsGAgJyI4VY07sOaZrpTr2p
         N5N9mhWou96fWJR4dT/YsOyitJAe7/nzbomZDYy4Wl4NY1fcLmZs49LFpJgtsbU+nUYJ
         hNG39S89s3x9eZT07MpKecPCEYMHdvoaXuo2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141547; x=1742746347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x2zbbvTDpmtrmEZc39SyFObaopn7HZA4BS7hcM+8Pvo=;
        b=LLdPGant+beFjuaMni05EnnAB4D7xJinvt/dxWVCHrnwxqxnK4ac89xt/zwux6EHip
         2jvSfp5o0sUTgT3GoEX1aFVTytf4smdGJKj3qr/eB3whSKIA8E+bzmMds7LIRNk2eAXB
         sEaOXnVhvcAL1lPZQfWb2ZyB3xN4DE+J3N2ff0Ijg75nEcb2gPL70aj/z2gcFpo51XMR
         GEw6Ai/cZUVY7weghXj1/UnAiW+8ZyEes4duJdZzDA4uM6IO9/ba56AlJMMdrjI+6mk+
         c9uTEGEJmRH/vhKIDwQc+N7qW4WIN3dB0Zzx1qUG/k7sxNPJX4aIeZY5+1NbnyQm+jtF
         ZNrQ==
X-Gm-Message-State: AOJu0Yyd59Es5mmeRjyDO503s4rIArwhCtwvmkTPvl3yDRUSq4bDFBWw
	nvV+JXpdXfqm+jcMHTZ438wIsC8lrzgYOu+AHM9Gt8YDS6QfxywAsSG2RTtZMZGtXxHlMNWY0ns
	Z
X-Gm-Gg: ASbGncsNJXY5T+nMX3TttevD/L45q3bK/eM8TtnjZdKC9eC853onyVHL0P9wyxqs9eQ
	78ok07jPO/qZsGAxFujx/50tkdND+TMDiTyLHSIl4JHPp2BiUDWB3vifR8K8LdYHmIhU5WVW/LF
	FNWaEChma8+sVlwjUTsS2RhCq3VXaus2RvLpS4863JHsvWnMHS7zrVG00jO9mVZ0nP2O8Nc4E9S
	MarunmW0YbqTQ/M8oLIDrJJhp27uIieDAiXE9NkKozv2hQTeLVYyJYYH8+Hav6/9JV4ulNI3Ocp
	GPCo+ZeyG5nZhbnFdkzOn1on6tUwsZSm6mblTk8rpA+wPl4GpX71UTc9CAwzcZ/ZOCdUQwsQvQ=
	=
X-Google-Smtp-Source: AGHT+IHdWAJPYalU7B7OAKsS47kPdKQSM7egIfQwYd2MFfv/5XVZ9JT9rsV74H73vxSgcexYvk40uA==
X-Received: by 2002:a05:600c:46d1:b0:43c:eec7:eab7 with SMTP id 5b1f17b1804b1-43d1ec81224mr116699275e9.11.1742141547323;
        Sun, 16 Mar 2025 09:12:27 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/43] libxmlb: upgrade 0.3.21 -> 0.3.22
Date: Sun, 16 Mar 2025 16:11:38 +0000
Message-ID: <20250316161209.3629986-12-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:12:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213015

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch | 6 +++---
 .../libxmlb/{libxmlb_0.3.21.bb => libxmlb_0.3.22.bb}        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.21.bb => libxmlb_0.3.22.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
index e37c3245e0b..7f130284c4a 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
+++ b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
@@ -1,4 +1,4 @@
-From b2dc47ed498d69ecac05b68abddefc7ca65983c3 Mon Sep 17 00:00:00 2001
+From ad8dcd768b637e53b80f9fea37ba945731ffd16b Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Sat, 16 Sep 2023 14:02:57 +0200
 Subject: [PATCH] xb-self-test.c: hardcode G_TEST_SRCDIR
@@ -18,10 +18,10 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/xb-self-test.c b/src/xb-self-test.c
-index baba19e..7da3b6f 100644
+index 76b2e12..c68c13a 100644
 --- a/src/xb-self-test.c
 +++ b/src/xb-self-test.c
-@@ -2882,7 +2882,7 @@ xb_speed_func(void)
+@@ -2912,7 +2912,7 @@ xb_speed_func(void)
  int
  main(int argc, char **argv)
  {
diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.21.bb b/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb
similarity index 93%
rename from meta/recipes-gnome/libxmlb/libxmlb_0.3.21.bb
rename to meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb
index c78b5eeaea8..1d6ad58b682 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.21.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
-SRCREV = "4cff6ece25f47b8fb740881387e50a00df922c57"
+SRCREV = "addcce32a3bd6a09303f052bd59fb758621d30fb"
 S = "${WORKDIR}/git"
 
 DEPENDS = "glib-2.0 xz zstd"

