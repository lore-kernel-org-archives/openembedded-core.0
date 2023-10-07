Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93525E95A79
	for <webhook@archiver.kernel.org>; Sat,  7 Oct 2023 22:25:42 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.27679.1696717537915694947
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Oct 2023 15:25:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=u8tTBIug;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5827f6d60aaso2091806a12.3
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 15:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696717537; x=1697322337; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UGDgXQASuTBkA/mJjLCoN8054sQa4nsr8gmWxucKdU=;
        b=u8tTBIugP1wbgaEINE/83mXxpFmdVxnlbRkiSxh1vTEUJhDTBRK6QyBWrheaMg610A
         k4+q8KBjX1LMRyKd9rihtrELIX8VfCRs010IdPv1+VQ4GmX8eMb/STz5mV6R75TW348Z
         icCsZd4r6BhLdLY04P9pqErWt3RGK9m5y2vnz891l20Ug3pftuPKfjAInJ05tiDWYdQR
         YzZLVO+OyFwIkGfZ1kjXPQkxySSrS4mqlC/cn4bln6/Dlxf/2tTx2rmIZ9HxoTaAiODW
         EaIbui4jR58glVoONQGjup3Awkt2qGMN2FG+gwiWGkqRLDGbhi4Mq7y7M1ihAkfA8ADE
         Udzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696717537; x=1697322337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UGDgXQASuTBkA/mJjLCoN8054sQa4nsr8gmWxucKdU=;
        b=BJIhOCUZosCAadMa0jUjsJyVAK8pxFs/8Uas1nv6VL6d+PDFLz16x2UJnQfbHt2q4E
         HtpNF+WRdlvEoRh9yyQ2VN+dtnToIKiH14PANDr7pRyamt4WFatZFyNOayYeOBzfSS4L
         sYzv3IFcPVCuRJwxSkpF4S5JVVd5mL12EZp5VFWs38lSJZ/bVYO73v09bUQaLT5L+Cis
         pXwhzwsjUnvKMrZcQdxcYKsbDQASLmUwEjJoksr6AU0Y/ocIlf+k4Xlb5Ser0FrhrAnG
         +IjXwjLobdJlqEsU7+vYQhB0pjmMBcCc1qBaug0usNeY5OndP7DWejgEJyTDjJmNk8gd
         VODw==
X-Gm-Message-State: AOJu0YymwxQJO3g2EhVPVtwKXe1Z/L8S8fdIsWXvfcYA4liJp1TN0JAv
	QyrD5vJp6Qem5y0zoRoFmSUHcmxWcrjot8e5sP8=
X-Google-Smtp-Source: AGHT+IGufIIBycGsWe8C61uh84DCNtX8nUWjfsIvpAW7hdGUkj6MmTYD3U04YoQsL8CSpo0uO0CATg==
X-Received: by 2002:a17:903:24d:b0:1bd:c7e2:462 with SMTP id j13-20020a170903024d00b001bdc7e20462mr12772870plh.11.1696717536868;
        Sat, 07 Oct 2023 15:25:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj15-20020a170903048f00b001b8c6890623sm6424076plb.7.2023.10.07.15.25.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 15:25:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 08/19] xz: upgrade 5.4.3 -> 5.4.4
Date: Sat,  7 Oct 2023 12:25:04 -1000
Message-Id: <51334c166c8d5cd5c99b7a7bd1cf6edd7e631f0b.1696702947.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696702947.git.steve@sakoman.com>
References: <cover.1696702947.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 22:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188809

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* liblzma and xzdec can now build against WASI SDK when threading
  support is disabled. xz and tests don't build yet.

* CMake:

    - Fixed a bug preventing other projects from including liblzma
      multiple times using find_package().

    - Don't create broken symlinks in Cygwin and MSYS2 unless
      supported by the environment. This prevented building for the
      default MSYS2 environment. The problem was introduced in
      xz 5.4.0.

* Documentation:

    - Small improvements to man pages.

    - Small improvements and typo fixes for liblzma API
      documentation.

* Tests:

    - Added a new section to INSTALL to describe basic test usage
      and address recent questions about building the tests when
      cross compiling.

    - Small fixes and improvements to the tests.

* Translations:

    - Fixed a mistake that caused one of the error messages to not
      be translated. This only affected versions 5.4.2 and 5.4.3.

    - Updated the Chinese (simplified), Croatian, Esperanto, German,
      Korean, Polish, Romanian, Spanish, Swedish, Ukrainian, and
      Vietnamese translations.

    - Updated the German, Korean, Romanian, and Ukrainian man page
      translations.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 1cc37e3f7aca7e04b03de99f9ce4b8068a61510d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/xz/{xz_5.4.3.bb => xz_5.4.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/xz/{xz_5.4.3.bb => xz_5.4.4.bb} (95%)

diff --git a/meta/recipes-extended/xz/xz_5.4.3.bb b/meta/recipes-extended/xz/xz_5.4.4.bb
similarity index 95%
rename from meta/recipes-extended/xz/xz_5.4.3.bb
rename to meta/recipes-extended/xz/xz_5.4.4.bb
index e1cdac3014..90f4c3d82c 100644
--- a/meta/recipes-extended/xz/xz_5.4.3.bb
+++ b/meta/recipes-extended/xz/xz_5.4.4.bb
@@ -25,7 +25,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c8ea84ebe7b93cce676b54355dc6b2c0 \
                     "
 
 SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz"
-SRC_URI[sha256sum] = "1c382e0bc2e4e0af58398a903dd62fff7e510171d2de47a1ebe06d1528e9b7e9"
+SRC_URI[sha256sum] = "aae39544e254cfd27e942d35a048d592959bd7a79f9a624afb0498bb5613bdf8"
 UPSTREAM_CHECK_REGEX = "xz-(?P<pver>\d+(\.\d+)+)\.tar"
 
 CACHED_CONFIGUREVARS += "gl_cv_posix_shell=/bin/sh"
-- 
2.34.1


