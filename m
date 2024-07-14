Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A57CC3DA55
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 12:39:39 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.15468.1720960776435771001
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 05:39:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xcDQU8jV;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-70b0d0a7a56so2629941b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 05:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720960776; x=1721565576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMRQY9sdTkH/Z/M8iZWfFcAAULkt28ZHHjEqdvYIUO0=;
        b=xcDQU8jV5GnZj0rVz6kd7p+WhjZY6So8W6Z1o0/jMzI8o1D8NNglkRWSweuW7yb/dk
         z6D5Lz0ENcHJp3dXEjBh1RV74pACIA5z1pZ2KYdYbS2ICxaH/QuE35vFziqjlpVzYX/f
         gxeiyHtY5U1Hv4E21hZhtsSNWNhCcutCwDrkNW8GkXyk0vSgRYMbzkZSSXXpWhYCLiGA
         60MWV5etUGF7vhNbc0oFUqpSnOWSDE1WIGP5VbmIBdW7vpBU/MR1x/OE+hmiUWrfQXJK
         xRwkY/gsOpOLXKXokhO0U3/XMFGnLXWtCLq+O2wTu8Xjl4mV/MmKWgB2MtR4ATr3DwU/
         IB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720960776; x=1721565576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qMRQY9sdTkH/Z/M8iZWfFcAAULkt28ZHHjEqdvYIUO0=;
        b=rzFaytfUC3wkqn1WbYiPVtCuxRbO5onux/WadBs64tOaRn84fJ5HEtVRBHx/uay1dW
         hCFJWdbdzYJDUoNZoS+4XTC0pzT/RiYrAID8zZT2Oy9XjsHZiRW+XrFMgDpf9gbNuZ7I
         p9mHzVcDpyY6t9kwGMmhE5qsVuU9ojK55SBGvoMxaJQs79kyWkvlFwAsDqTgDZcGiTmv
         JmVpji5TelZXxjuOnvuLAC7GmEiwJX1Gu+oj1U6XkRs23hGu25L4rwUDeN6xtTS3S8wj
         00WhqD0M7OdO4clVR7IZHGpuiJjFaqgi0wWPkoFxYslCn6Wrq4KhC5By3eXvSp0YtUNm
         gjPQ==
X-Gm-Message-State: AOJu0YwXBHQ9JssykASzvZofiiXnE3wMY8ek4htxsA9AmyKuqgi8RHPO
	fcuRQHhdSQnvtHAuC07zRhiY7xWT4+gxhm24iSe+s9LEC3c63l/Hl3WbfOla8M3i+LbGgDu3k8u
	CUE0=
X-Google-Smtp-Source: AGHT+IHRME7jXgGUU6Nz+4qWibtX5gHTAu8Epj27gxPGljCZ1CSZ6MXf5V2SnlUDZk/rkbJvOYpTew==
X-Received: by 2002:a05:6a20:1583:b0:1c2:89a3:4e1f with SMTP id adf61e73a8af0-1c29821fff7mr17124909637.16.1720960775726;
        Sun, 14 Jul 2024 05:39:35 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb7006bsm23245245ad.41.2024.07.14.05.39.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 05:39:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/27] meson: don't use deprecated pkgconfig variable
Date: Sun, 14 Jul 2024 05:38:45 -0700
Message-Id: <14ee7a2310b5d3da5e7af442454f7957c6c090b7.1720960579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720960579.git.steve@sakoman.com>
References: <cover.1720960579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 12:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201875

From: Ross Burton <ross.burton@arm.com>

As with a previous change to the class[1], the "pkgconfig" entry is now
deprecated and "pkg-config" should be used instead.

[1] oe-core d64b307891422e290bbe821d4303b3af526bbe17

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3e441544f1aa7258718a1cadd6836d9cd9dc65ab)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/meson/meson_1.3.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson_1.3.1.bb b/meta/recipes-devtools/meson/meson_1.3.1.bb
index 9cc0cc31ab..f34af0e06d 100644
--- a/meta/recipes-devtools/meson/meson_1.3.1.bb
+++ b/meta/recipes-devtools/meson/meson_1.3.1.bb
@@ -86,7 +86,7 @@ ar = ${@meson_array('BUILD_AR', d)}
 nm = ${@meson_array('BUILD_NM', d)}
 strip = ${@meson_array('BUILD_STRIP', d)}
 readelf = ${@meson_array('BUILD_READELF', d)}
-pkgconfig = 'pkg-config-native'
+pkg-config = 'pkg-config-native'
 
 [built-in options]
 c_args = ['-isystem@{OECORE_NATIVE_SYSROOT}${includedir_native}' , ${@var_list2str('BUILD_OPTIMIZATION', d)}]
@@ -104,7 +104,7 @@ cpp = @CXX
 ar = @AR
 nm = @NM
 strip = @STRIP
-pkgconfig = 'pkg-config'
+pkg-config = 'pkg-config'
 
 [built-in options]
 c_args = @CFLAGS
-- 
2.34.1


