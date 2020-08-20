Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web10.108271.1597919093460664060
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2020 03:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IosoQAfN;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id l23so1145772edv.11
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2020 03:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=EzuFLAp+53kk3ZdbCjtcxkXFiuSFyxHq0+VJo8EWQ3E=;
        b=IosoQAfN0mYNwTXz2JcAwwrEEw2y1KaCYGQNkltcL2AmRiMM/BjHUvH8posOVBO5LY
         lcX3dovrk25ePOVHZutSHc6qlDRhyI3nrVjGilApmdfbLkbRfmzLUAhHf7WZW7W4xdgn
         W9vHUtaWpygi0F4r6aAwGE/XcB9nwZ1GP6s9lso35AfNw6jX0O/9RmsTqwRZt/2hgaUS
         nIg16pAK5eT8WwSROgOozvP5BWL3MBdN5dW8OtRH4GgnWmGl+MoX/11IGe4/aZ9izJnl
         sSi6WjK53/YnbsAdfsnE55+Qe66LQuUIyQxWDZPXcfgtGyaDTBmmA+Z3VTMttQmgjCom
         B9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=EzuFLAp+53kk3ZdbCjtcxkXFiuSFyxHq0+VJo8EWQ3E=;
        b=lmLzKN0aVUgAmS3uJD1xbGAQKnsAgdB6yWM+aWlzxrUo3nRsDPT/I30I1y+G6FEDZl
         hBZ65sxwcirq4BjzJ78nqvPD8LiSzNZDmusmLeRr97pmQZvP4KyRYzxZ/YhTarheJk3l
         ch0DxDrinAfe90A9TbP9UhXsFQkx+VItBuGG6b5FfUgpC9sdE5rbxBvsQjV9iek+hoot
         8jdvWaz/zatpXBx7JQqwAhRM/Abt7r/Jf+3m0TfTRQayHU+zCAli65ifmnQwCFFDEiN5
         Dp8glom+gXouT6L3+flwOwtCZVg25T2XsbD+NUjfeFidyiB+oFqq+ULgwc8gGlDN9Ruu
         Em3Q==
X-Gm-Message-State: AOAM532zCxqjirZYi6zTB4yFmBOjLiT0TLn/C70YKc7Kvxu8qoKXDYrm
	stPXbPwDlneYZ2KOhUhNgcLtBdQoR4A=
X-Google-Smtp-Source: ABdhPJyHGnNUIysvMxy7RTtJP82jdGExuN7s2y0JP0i4nOrMCxOhN4W9Gv62Va5OobXZLE2ECbRvGw==
X-Received: by 2002:a50:fc02:: with SMTP id i2mr2189584edr.121.1597919091335;
        Thu, 20 Aug 2020 03:24:51 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from ip-172-31-20-103.eu-west-1.compute.internal (ec2-54-76-105-136.eu-west-1.compute.amazonaws.com. [54.76.105.136])
        by smtp.gmail.com with ESMTPSA id du2sm1230795ejc.2.2020.08.20.03.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 03:24:50 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 1/7] systemd: Move musl patches to SRC_URI_MUSL
Date: Thu, 20 Aug 2020 10:20:35 +0000
Message-Id: <20200820102041.28077-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1

Supplemental musl patches for v246 were erroneously added to SRC_URI,
move them to SRC_URI_MUSL.

Fixes: 470c58ba4586 ("systemd: Upgrade v245.6 -> v246")
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-core/systemd/systemd_246.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_246.bb b/meta/recipes-core/systemd/systemd_246.bb
index a463aab1e302..11e3cd29665b 100644
--- a/meta/recipes-core/systemd/systemd_246.bb
+++ b/meta/recipes-core/systemd/systemd_246.bb
@@ -20,9 +20,6 @@ SRC_URI += "file://touchscreen.rules \
            file://99-default.preset \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
-           file://0021-Handle-missing-LOCK_EX.patch \
-           file://0022-Fix-incompatible-pointer-type-struct-sockaddr_un.patch \
-           file://0023-Fix-field-efi_loader_entry_one_shot_stat-has-incompl.patch \
            "
 
 # patches needed by musl
@@ -45,6 +42,9 @@ SRC_URI_MUSL = "\
                file://0019-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch \
                file://0020-missing_type.h-add-__compar_d_fn_t-definition.patch \
                file://0021-avoid-redefinition-of-prctl_mm_map-structure.patch \
+               file://0021-Handle-missing-LOCK_EX.patch \
+               file://0022-Fix-incompatible-pointer-type-struct-sockaddr_un.patch \
+               file://0023-Fix-field-efi_loader_entry_one_shot_stat-has-incompl.patch \
                file://0024-test-json.c-define-M_PIl.patch \
                file://0001-do-not-disable-buffer-in-writing-files.patch \
                file://0002-src-login-brightness.c-include-sys-wait.h.patch \
-- 
2.17.1

