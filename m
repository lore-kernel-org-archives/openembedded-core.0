Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4818C021A2
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 14:05:22 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.9245.1739023514747187180
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Feb 2025 06:05:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hPlyddUV;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21f49837d36so30366015ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 06:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739023514; x=1739628314; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Is2DOIXLbq40AAqymPueUL9hsroqf/63oPIaHD4rudo=;
        b=hPlyddUVR0Y16siWHalEwEQPNVWDAqzVy2+Lthpk5RYIZc7pGA+zqrAgCeeSj9raLR
         qQxYQGo+8DeEdbTMKjHUUBPby0XrfRDxvlRdUNNPq4JG60A1a8o1fR8hfI9v5kCGr3G5
         ofDCzROsFDb29cueUqZzjVUeS36tUa8r3UbkLxHtreq3rNTERDOq8Q8UlopnGRsD5bim
         3iwpFRk6FVDIE4pzmMoEH2JLwU/jrKw2RE2jeMxsQLUZJI9rWQCeOcFxhhlI8V3b9Heu
         GuNA9Dd6BuaeYaAcMhqBjg+oJf0zug1ss4+/GP7e/OScSCcraXZHKwyMAdQZ61biVKOk
         1RVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739023514; x=1739628314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Is2DOIXLbq40AAqymPueUL9hsroqf/63oPIaHD4rudo=;
        b=D5Vj0WT9JBcuOpYzvf6LF6FBiiHQuxlXoA+AZ1xUgLLovqBTekuWCTVBuXycUOHdox
         HcZXarV2xJ9OnpxUVZOPWpbSdVgDmK6HZzkUr5Z7DGmVJhyUA7mREWCOS3ihDXOSg2La
         dPKIWByk29u2Eyrfujv1s53iBgwCOmcLqvfripbYm0jw5+PZt9btqP60Mx4c0697Imxm
         QWuf04MGEWyMv//5zpaRshQbVG6GFJjg//yHoJT96YBEUdEehsGXnvbiLGGqCc4/DM+l
         qMTRD8/OwrFBJIdusGeG0r30hAORIgDWBHKrLTqIP0NxjlyWjsuzHpRaA9HojaOO0suE
         lTiQ==
X-Gm-Message-State: AOJu0YwABma1jr+LP5PkQDXrdNAvhB1JsR1Hq0lOysqLThUhV+gxTDFL
	dpTdxX3YkZm62QAwspBWa4JEyS6jvOSzJpNnfqdQRU/l6zFYUdfBR/z1QZVXiCaynSyeNWRyFAl
	f
X-Gm-Gg: ASbGncu4UdG/lsFgdScMtnynLVbAHH+GPmMN95JJ7mUts5q/X0mJiIShi/mTkmeMgkA
	tdwT8xnQGKmMaCtQneK5rGHfeH8BHRpOKbCTC1J6gc0MbCtyHHjCv15fzUYb3+1rJbv58687xwK
	c1Y+nqCoTf9v8OXNLO6VLX24z8+tTAWb7z+2fG1SNR1sHVF1a1AuNxqZjL1a7Su6sHOAUk5bR6J
	jdcla4Jtpbw/zptiI23il+JionhKaS35AqQ/lcY2xdMjugc5QPPtl+48a1TJt9A72x4M6ircFaf
	WLSS
X-Google-Smtp-Source: AGHT+IHssJqhZj5+P9MbeQnsdkdKDxL12p7Uf1KutNIyb4Hm0kti8Entnlg4ryBBuOkKTIzkktIXpg==
X-Received: by 2002:a17:902:d50c:b0:21f:46b:a25 with SMTP id d9443c01a7336-21f4e6bea28mr117706365ad.16.1739023514007;
        Sat, 08 Feb 2025 06:05:14 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c820sm47278345ad.173.2025.02.08.06.05.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 06:05:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/13] pkg-config-native: pick additional search paths from $EXTRA_NATIVE_PKGCONFIG_PATH
Date: Sat,  8 Feb 2025 06:04:54 -0800
Message-ID: <104737073bd553b9cf93db7ed9575fd50ba6c973.1739023409.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739023409.git.steve@sakoman.com>
References: <cover.1739023409.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 14:05:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211027

From: Alexander Kanavin <alex@linutronix.de>

This was prompted by working on librsvg update: the new meson-driven
version wants to query values from .pc files residing in its own
build directory, and modifies PKG_CONFIG_PATH accordingly.

When using the pkg-config-native wrapper such modifications
have no effect, and we have to pass them in manually
from the recipe via EXTRA_NATIVE_PKGCONFIG_PATH variable.

This variable is already defined (with an empty value) and
appended to PKG_CONFIG_PATH export in the native class, so this
simply extends its use to the wrapper.

(Appending to PKG_CONFIG_PATH in the wrapper, instead of resetting it,
is not an option as that can lead to contamination with the cross values).

(From OE-Core rev: 2bc050146d47b14d890a1b0db2b55f9057a08b65)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in     | 2 +-
 meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
index 9ed30a0d80..fd5ab6b1fa 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
+++ b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
@@ -1,6 +1,6 @@
 #! /bin/sh
 
-PKG_CONFIG_PATH="@PATH_NATIVE@"
+PKG_CONFIG_PATH="$EXTRA_NATIVE_PKGCONFIG_PATH@PATH_NATIVE@"
 unset PKG_CONFIG_SYSROOT_DIR
 
 pkg-config "$@"
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
index a9324de4cf..d4bb4f8c06 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
@@ -1,6 +1,6 @@
 #! /bin/sh
 
-export PKG_CONFIG_PATH="@PATH_NATIVE@"
+export PKG_CONFIG_PATH="$EXTRA_NATIVE_PKGCONFIG_PATH@PATH_NATIVE@"
 export PKG_CONFIG_LIBDIR="@LIBDIR_NATIVE@"
 unset PKG_CONFIG_SYSROOT_DIR
 
-- 
2.43.0


