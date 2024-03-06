Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F8E2C54E69
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:10 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.14857.1709739723196781338
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UjZAwURV;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-566e869f631so1389195a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739721; x=1710344521; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FtevCFDCJIJZ2XGd9AOQUyLtV3uTnx0DGa6BiE8F3/0=;
        b=UjZAwURV+0sbS46Oq6CMufMJ89S4jX5Mwhsz2QNLtmiwfxSCewgmnF6x2LVuQGIIN1
         zho5eBwcsDXqHmsltAK8Z8o3FVFRU1Kc1zGqNpD19ZfziTUpcdyv41Sg51JHTuqfbEMe
         NbDxlXac34Rjls8BffsccxR9OktN2/J6v7OJ5bNbKp4zHg7IoS8klwNT/a5x0nVI/uQV
         Vu85VkvPyjOdTKVLwHaY++K1f9Q1EPhWwpZ/E+35gBqWzwcd55JDAx1omoXfajNsczwj
         TYiM9qjNFClYEWi45z7i+vvtG+kSBllcipZ52HoD59R9EI94YmHWLEYzz4W4qYegm/Qg
         Rt0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739721; x=1710344521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FtevCFDCJIJZ2XGd9AOQUyLtV3uTnx0DGa6BiE8F3/0=;
        b=UBh8xvWSe2arSg6Jw4ozxve7W5JciLa9NHHe+v5HKJD1O2k5/dqmJSxdJtEDoxcl5X
         YT/g5b6zB/VowUmzyGXQt8GIzi/OMD3ArDF4cMXA6pJyo11vI6QZzH9AAgzmT/gFmhj3
         XvgzdJBeernL7IhHN2DHXVH8BfEJRd6jej20ugyonFOvyp727nW2SC7jTg6A7FgUqjIW
         eRSR/4HKUTMCfWNl80ziOGe6JmOJyBExWtPy3CfMjywxbPyKzyVfTYIZMh78p5wEURGw
         1IGR5FnzIis0wLOdP4wJSF5HxQgQQRBHmsHwhDSFw7h3mLYTNm1gPg1DvCuMVZkq0k7A
         fdyQ==
X-Gm-Message-State: AOJu0YzROUwPjG3ddIgpRvyX6oKiPsRijFjUxUlWxBGeXXh5wa8qh7DF
	ic5Q2yAGSfchC+0Dn255jIeBvgaIvaD/h+mMnVHpIBd9KAjXdnB3o2OqNxTz
X-Google-Smtp-Source: AGHT+IGBz6a2fum/a9BfGXqcBv+9c0276jC4vSamVRwvJs4tqwwYDUb1tdv7YsiKOlzSVRfUL22HEg==
X-Received: by 2002:a17:906:b154:b0:a45:da1:9375 with SMTP id bt20-20020a170906b15400b00a450da19375mr6912350ejb.30.1709739721244;
        Wed, 06 Mar 2024 07:42:01 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/47] appstream: upgrade 1.0.0 -> 1.0.2
Date: Wed,  6 Mar 2024 16:41:07 +0100
Message-Id: <20240306154151.3741709-3-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196686

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../appstream/0001-remove-hardcoded-path.patch        | 11 ++++-------
 .../{appstream_1.0.0.bb => appstream_1.0.2.bb}        |  2 +-
 2 files changed, 5 insertions(+), 8 deletions(-)
 rename meta/recipes-support/appstream/{appstream_1.0.0.bb => appstream_1.0.2.bb} (93%)

diff --git a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
index 66687a5b890..bc811d67b04 100644
--- a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
+++ b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
@@ -1,4 +1,4 @@
-From 6ab00a4279823829a9b82dc9e4d055da4de88c6e Mon Sep 17 00:00:00 2001
+From fe9ebb8c0fa7b84a9c5c667386b8fbb3baea2fad Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Mon, 12 Dec 2022 15:42:42 +0100
 Subject: [PATCH] remove hardcoded path
@@ -10,11 +10,11 @@ Dont include hardcoded path. This fixes:
 
 Upstream-Status: Inappropriate [oe-specific]
 ---
- meson.build       | 2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+ meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index fd0e3373..2f273ada 100644
+index fa171d5..79d5168 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -185,10 +185,10 @@ endif
@@ -30,6 +30,3 @@ index fd0e3373..2f273ada 100644
          else
              error('Unable to find Snowball header "libstemmer.h". Please ensure libstemmer/Snowball is installed properly in order to continue.')
          endif
--- 
-2.34.1
-
diff --git a/meta/recipes-support/appstream/appstream_1.0.0.bb b/meta/recipes-support/appstream/appstream_1.0.2.bb
similarity index 93%
rename from meta/recipes-support/appstream/appstream_1.0.0.bb
rename to meta/recipes-support/appstream/appstream_1.0.2.bb
index 3f8bfcd2638..7eb12a04c55 100644
--- a/meta/recipes-support/appstream/appstream_1.0.0.bb
+++ b/meta/recipes-support/appstream/appstream_1.0.2.bb
@@ -28,7 +28,7 @@ SRC_URI = " \
 	https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}.tar.xz \
 	file://0001-remove-hardcoded-path.patch \
 "
-SRC_URI[sha256sum] = "ef23477a380e8b525e92cfa87687f1146b9cef74c641349a1ae11250be5401d0"
+SRC_URI[sha256sum] = "1a5148ca97dcbf5eb6e9c380278bb0d20938569292ea8652df1b3cac8bd2736b"
 
 S = "${WORKDIR}/AppStream-${PV}"
 
-- 
2.39.2


