Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DB3C3601E
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:41:09 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.42768.1744018862474334463
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:41:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NwTYLhxV;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39129fc51f8so3277672f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744018861; x=1744623661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hL/MufrReW153H65/MLeDdxoEm5B9TwrzH1x9gVOOi4=;
        b=NwTYLhxV/wWFDk0yli0WnLPx5Bawt5VUWT5AR7A31gYLbghsfP1OxwsI2o1fiFJlA9
         QcOVSrYX3tymBDm+7Df1B3UrKSGjsOy9bShZ4WatWLzyVoJZ20lTjEYI7Wy7DGnhCXkc
         jAsOODMaQ0xsyJQFpv34hBphC2v3BonECZ0XZht0CBXyBtl1wNS/Ym8swFh25YB1C+il
         mbtfgE/dVT+PvCvdBjvbjz8XGmF9MI/nxwDsJUpuhD5IZoSMDC5SPM1vmvTJkDJhZ/Bh
         MTPl0zGPOrPVVdC5YnI7jwvH86lKeky/SWZuFan+EL5rZLScdrJJ79vgAG1ieFmOYABj
         L5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744018861; x=1744623661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hL/MufrReW153H65/MLeDdxoEm5B9TwrzH1x9gVOOi4=;
        b=Zk0qAEO+Y7WtAyFoVTJY2JVd8aRcwN+BpLk/CVxWV8q6aXW+v7jx1blyMN64HF01wE
         tgXGaN/mkoo7tyCRUSUN6bKJp/gTqM3sTXcP+lgEhbZt0+qRy7SQZhBkGubPTqeozRq+
         cXVnPgh1g0hPZGKitvKJ0RwBSFyZe5SMlioRXZhFSdBQ2+1hLj7NBigYG0j/WbaIe6ns
         aWNG3XFt/PRQ0iCk8ZJ1lJgb1lC7mrGKTtIDh0czoFKZIjsBX3Vt2VsrjowhIQy+JzQw
         O1LMu1+PzOpZuDVI93rgd5zXhyMHY07X15cbyVomNWyQwSVpmUrDZ4GXn7lQco04hro/
         noKg==
X-Gm-Message-State: AOJu0YyTAiwPjwEw0CEtrgO/mGpRZQqzAJQRkmfFnP+iGV+ouh9yuT+8
	i7Gkugsj+C0/8IkTMgs3EFSqlqs5T82rIsi5oRHmgDSNr5PN6ep/0LTD7A==
X-Gm-Gg: ASbGnctQsyfj6SyrDQvAGkJUFWbjjLjObubGE+3VR2+JhowfyASmSYdrDohI9o1vsJ1
	LHUpwas7b1bnNX7KweKl8elYrtxdMCQKEp/YTHIy5H7SoucYQtgbvPEayc8azo7P8KC3TWvt+cR
	/KkvWeuJ+FKyfrERa3ox1PUY8j2JpYfH9W3x94+zAF4Gifm83/N3tbETPjC/MqMwb0zrjmfsZDj
	YRws0e7hn4BdYZdYw08l5/DvkGfuCWOd1vcwXc4RtrN6ncOX3K2Z9vKVgkB/b+TgtkTY0hvwjgZ
	gHbrypb+qTSIGbpfCxKlzViqPAcj/nXMxC5gq3zQuPYA0OArJTESnOscLkc1HumsyB4YoAUmzjm
	k7Mxh9w==
X-Google-Smtp-Source: AGHT+IFjv809J/692v7XuR2Z2Zvcp9gIMg7KNBZENNUqhKYhzAuG5cs98YRlRXw0oA/cdDBU+RFDIQ==
X-Received: by 2002:a05:6000:1acc:b0:391:41c9:7a8d with SMTP id ffacd0b85a97d-39d1475e1f7mr10436612f8f.54.1744018860485;
        Mon, 07 Apr 2025 02:41:00 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a76cesm11562459f8f.37.2025.04.07.02.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:41:00 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/18] apr: drop libtoolize_check.patch
Date: Mon,  7 Apr 2025 11:40:44 +0200
Message-Id: <20250407094045.753021-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407094045.753021-1-alex.kanavin@gmail.com>
References: <20250407094045.753021-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214426

From: Alexander Kanavin <alex@linutronix.de>

It's not clear what the intent was: libtool executable is present
in the native sysroot and can be used to obtain versions
during build time.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../apr/apr/libtoolize_check.patch            | 37 -------------------
 meta/recipes-support/apr/apr_1.7.5.bb         |  1 -
 2 files changed, 38 deletions(-)
 delete mode 100644 meta/recipes-support/apr/apr/libtoolize_check.patch

diff --git a/meta/recipes-support/apr/apr/libtoolize_check.patch b/meta/recipes-support/apr/apr/libtoolize_check.patch
deleted file mode 100644
index 80ce43caa40..00000000000
--- a/meta/recipes-support/apr/apr/libtoolize_check.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 17835709bc55657b7af1f7c99b3f572b819cf97e Mon Sep 17 00:00:00 2001
-From: Helmut Grohne <helmut@subdivi.de>
-Date: Tue, 7 Feb 2023 07:04:00 +0000
-Subject: [PATCH] check for libtoolize rather than libtool
-
-libtool is now in package libtool-bin, but apr only needs libtoolize.
-
-Upstream-Status: Pending [ from debian: https://sources.debian.org/data/main/a/apr/1.6.5-1/debian/patches/libtoolize_check.patch ]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
----
- build/buildcheck.sh | 10 ++++------
- 1 file changed, 4 insertions(+), 6 deletions(-)
-
-diff --git a/build/buildcheck.sh b/build/buildcheck.sh
-index 44921b5..08bc8a8 100755
---- a/build/buildcheck.sh
-+++ b/build/buildcheck.sh
-@@ -39,13 +39,11 @@ fi
- # ltmain.sh (GNU libtool 1.1361 2004/01/02 23:10:52) 1.5a
- # output is multiline from 1.5 onwards
- 
--# Require libtool 1.4 or newer
--if test -z "$libtool"; then
--  libtool=`build/PrintPath glibtool1 glibtool libtool libtool15 libtool14`
--fi
--lt_pversion=`$libtool --version 2>/dev/null|sed -e 's/([^)]*)//g;s/^[^0-9]*//;s/[- ].*//g;q'`
-+# Require libtoolize 1.4 or newer
-+libtoolize=`build/PrintPath glibtoolize1 glibtoolize libtoolize libtoolize15 libtoolize14`
-+lt_pversion=`$libtoolize --version 2>/dev/null|sed -e 's/([^)]*)//g;s/^[^0-9]*//;s/[- ].*//g;q'`
- if test -z "$lt_pversion"; then
--  echo "buildconf: libtool not found."
-+  echo "buildconf: libtoolize not found."
-   echo "           You need libtool version 1.4 or newer installed"
-   echo "           to build APR from SVN."
-   res=1
diff --git a/meta/recipes-support/apr/apr_1.7.5.bb b/meta/recipes-support/apr/apr_1.7.5.bb
index 215ac4b4b8b..83d84bfdb64 100644
--- a/meta/recipes-support/apr/apr_1.7.5.bb
+++ b/meta/recipes-support/apr/apr_1.7.5.bb
@@ -18,7 +18,6 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://0002-apr-Remove-workdir-path-references-from-installed-ap.patch \
            file://0004-Fix-packet-discards-HTTP-redirect.patch \
            file://0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch \
-           file://libtoolize_check.patch \
            file://0001-Add-option-to-disable-timed-dependant-tests.patch \
            file://0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch \
            file://autoconf-2.73.patch \
-- 
2.39.5


