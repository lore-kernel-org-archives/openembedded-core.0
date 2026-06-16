Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E396DCD98F3
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:16:59 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5758.1781637411836456379
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MtaQ56Zd;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490ac10e337so33389595e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637410; x=1782242210; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0MYT/MbvPxFzsOlVVoDx60GUc9t1SRAlWqtIEDsWXaI=;
        b=MtaQ56ZdGRo6ejyDG4s1NfWyN3q/P+VK26Q3dh0gAAKR8NlXry/IuuE9GHptiVuSi3
         GfWtGMYBv5S9nreinhAYPeC3v8TgH+N1rvZNWZ+Hwi1IvWe9zGe+KxS5qyG/4+hw46tM
         NLiHljuutFhdhE4H3H5B9TSZq2fe3SwQsQn4Xe6RBTQqiEYrmPbbc2C7ghoM/CISgjta
         2givmrMjkh7LrslvJVSNPscn+mhUgQ62iu31d8TJjGWWdo/tebukaBMNKiX6ohvpG7UJ
         vcBZ8bBbsSJiIRlUkHRKdij7ICSx3Uv8v+20j8qRNYIfonyoJdtYWIDkHKGeUQueOoXE
         /12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637410; x=1782242210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0MYT/MbvPxFzsOlVVoDx60GUc9t1SRAlWqtIEDsWXaI=;
        b=eFAbb7+pNpCtrw7I1zrzbq45DhmtjQzhppLUc9A+nBdvFPnX5EainiYRxVD6BPJ5sB
         poxhMT9W734tuMlVcqcj5EgbWIiLy//N8L6oY4b+ySFZ1eAbLaj3gnXMH5S1M+ekYdHx
         5j5UN+d1gfJGsm8PV5AkF9Q8HHewX1MCFB1PpMBR0BdHYSmnDdnb6g7ZE1JTRgzWGTkG
         9Bblu/fQnmGbcmGzlSpDpZBkK4upbM+4laQv4v3495dJma37JxJrY6T5KoPRzjhkmxUB
         U0YAQkUR6U5c3jAXJ80tK1pOuBiVC8Ad1OUFyjcgP7pqiKAw3VnfO5b1aKdv9ePERFtQ
         yVug==
X-Gm-Message-State: AOJu0YxPlT/nFzc3EWMf7o5xuDcYnmwCWqew4L+B/8J+7hAsZ2UXGKR2
	bc7tAaNtPxI4gX/8lyg9uCzKgGJK1+V8fDSA/RBo5c0K+Y8b4piFZyiHyuRRvwaH
X-Gm-Gg: Acq92OHziIXScW4uZdvg7Ufl1BrjJyodL6uSv7mzRpNz1YtVV4qf1iU0qcUYKk4cZpQ
	yF+OJwcxtC1uyjUgCle+pKkz2F57yAVRqk1TkCpvFOtgwmtdoCsPIioA+uBEffmEpi21cfVcGak
	BzdBzPnHaLbxhmpJ2PBR5KePmQ9JcgC01QNNUJQlmcn3oMU38VF48b2UT9HPZM0bZ0AIGRJMie2
	ey6TRzAZbGALKfStCEMOMP9tB40Jh8QmdkOBad+vgCtB6Gw1D8L05blUVqQIig4Z9BjFK3DiSps
	fbDz682Cx2sADSavbMD6uqwkUbBqJcsIhOOJcdH5BHCKNCDgfuWMGF5tMF4iOpjqaYVhobDj/HM
	9hLjd95K/e/WAWVtADfSS2ijCvmzcLGiRYoo8o1xUQbVsdA7nWqJF+FuxqK8QyTqVvYgsk5Jjmx
	fQjm+cT0i8ZvpjTjxonUjtekJ2WWpMA0/epqvhhY0zhKgjHlAHMD2SgN4Lijw=
X-Received: by 2002:a05:600d:108:20b0:490:e342:127 with SMTP id 5b1f17b1804b1-492333ffd1bmr11193015e9.34.1781637409835;
        Tue, 16 Jun 2026 12:16:49 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4f8d7sm86982035e9.5.2026.06.16.12.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:16:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/30] which: upgrade 2.23 -> 2.25
Date: Tue, 16 Jun 2026 21:16:13 +0200
Message-ID: <20260616191628.2014553-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616191628.2014553-1-alex.kanavin@gmail.com>
References: <20260616191628.2014553-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238942

From: Alexander Kanavin <alex@linutronix.de>

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-getopt-Fix-signature-of-getenv-function.patch     | 2 +-
 .../which/{which-2.23 => which-2.25}/meson.build           | 0
 .../which/{which_2.23.bb => which_2.25.bb}                 | 7 ++++---
 3 files changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/which/{which-2.23 => which-2.25}/0001-getopt-Fix-signature-of-getenv-function.patch (96%)
 rename meta/recipes-extended/which/{which-2.23 => which-2.25}/meson.build (100%)
 rename meta/recipes-extended/which/{which_2.23.bb => which_2.25.bb} (80%)

diff --git a/meta/recipes-extended/which/which-2.23/0001-getopt-Fix-signature-of-getenv-function.patch b/meta/recipes-extended/which/which-2.25/0001-getopt-Fix-signature-of-getenv-function.patch
similarity index 96%
rename from meta/recipes-extended/which/which-2.23/0001-getopt-Fix-signature-of-getenv-function.patch
rename to meta/recipes-extended/which/which-2.25/0001-getopt-Fix-signature-of-getenv-function.patch
index c54368a084..457d11fb44 100644
--- a/meta/recipes-extended/which/which-2.23/0001-getopt-Fix-signature-of-getenv-function.patch
+++ b/meta/recipes-extended/which/which-2.25/0001-getopt-Fix-signature-of-getenv-function.patch
@@ -1,4 +1,4 @@
-From 83d2ed3fd203868a8f287d2ebedc7c304c74fbb4 Mon Sep 17 00:00:00 2001
+From 3b823f4fbd3135c27287621ee3c315ae5975382d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 22 Mar 2025 17:56:19 -0700
 Subject: [PATCH] getopt: Fix signature of getenv function
diff --git a/meta/recipes-extended/which/which-2.23/meson.build b/meta/recipes-extended/which/which-2.25/meson.build
similarity index 100%
rename from meta/recipes-extended/which/which-2.23/meson.build
rename to meta/recipes-extended/which/which-2.25/meson.build
diff --git a/meta/recipes-extended/which/which_2.23.bb b/meta/recipes-extended/which/which_2.25.bb
similarity index 80%
rename from meta/recipes-extended/which/which_2.23.bb
rename to meta/recipes-extended/which/which_2.25.bb
index 0bbc3510d8..fff8e97cf2 100644
--- a/meta/recipes-extended/which/which_2.23.bb
+++ b/meta/recipes-extended/which/which_2.25.bb
@@ -7,8 +7,9 @@ SECTION = "libs"
 HOMEPAGE = "https://carlowood.github.io/which/"
 
 LICENSE = "GPL-3.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
-                    file://which.c;beginline=1;endline=17;md5=a9963693af2272e7a8df6f231164e7a2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://which.c;beginline=1;endline=17;md5=bcd173cbf5381e10d43be8d6ca6da3b5 \
+                    "
 
 inherit meson update-alternatives
 
@@ -17,7 +18,7 @@ SRC_URI = "${GNU_MIRROR}/which/which-${PV}.tar.gz \
            file://0001-getopt-Fix-signature-of-getenv-function.patch \
            "
 
-SRC_URI[sha256sum] = "a2c558226fc4d9e4ce331bd2fd3c3f17f955115d2c00e447618a4ef9978a2a73"
+SRC_URI[sha256sum] = "1cb83e4f702e60b8211ab5ec4c2afbab1b1dec80209456a7d2faf7584ed225ea"
 
 do_configure:prepend() {
        cp ${UNPACKDIR}/meson.build ${S}
-- 
2.47.3


