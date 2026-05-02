Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CEF4CD342F
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:29:59 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9360.1777739387714345022
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:29:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hWGOEpp+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891cd41959so23352585e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739385; x=1778344185; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f6jsGIujrmddAwuta26v0QsdamB6pWGLmM1D0QUpihk=;
        b=hWGOEpp+Y3E2PelGcf7Gv3ITvcsJ0m7j7Xe5b4a+tR03WjYiN7HaezwVKxfub7xnHT
         EeI/skmUwgopszZ5H5Uaq7E07486giWuerxWr0N7TAXDLTcDgHrsGqKde5c3uWxvydCL
         hvQfgZkH8y0sLyC6QE28wkbrrMdGhzh6YBPAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739385; x=1778344185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f6jsGIujrmddAwuta26v0QsdamB6pWGLmM1D0QUpihk=;
        b=WEufnm0GOcA8D376IqkqqJQLAu3sKYezDlTMFi4pMJGaNnLg/i5atjQJ3zwNcT4ruP
         nCLCgDPEZr0FG3GtAF08m4xEPicKA50uNviB/y3vNJQ8iZlM1ziZ5INUMnRuzIc+u2IG
         ELVGtvjc+Tpkgb419e842vJh6InOylnst2i5Ard+AXz0wocSdiBYahgxVyOIvQXRu5Rs
         nWL8MphJBoBY1oLyCMZ2XF44jU4wf7TOS8bXHtt6BXhj44teqRZFeWHtEQjb+2BbXQRy
         /ufRE+gaLGxWjgtXRHgy4gV7s//x1Er4oyMOB5vEWIQctuVVzIMSFmAJUFc4ukkpluT4
         y8sw==
X-Gm-Message-State: AOJu0YzQmj5XWs6uaXSWxEGLmUhGwtPXhIcvYU0UGD6WnX0R5G3MEhwF
	lnC/oiHFblBCtioFKtJzxPe2QfE1lwKRJnh+dHmybgOmGvJeEWAEfkZpuSBJ64UMr3krStG71JL
	C/+9mZ3UBwH77dWd1+3GIuIA6c/0CUBAjWINixwQCO3eMGbedCrmSXLynMrjb2N5PZMbSbIlEss
	p9KPbkHzAMPrVfsa0=
X-Gm-Gg: AeBDiet5th4A/L81wbM4qzuh9s5OXw30bnsYDqTbF85DqDSNz27y56xgmgJMYBszxSv
	4S0qklcPFsyUz/Ip8lOIJPvXJhNoEL++1ESMjPkaLDIqG4FGxpVybxa63XE3Z+U+dWGurP05o9K
	klAY237+tsLjtyQMHfpiSl2lROyGycTl56Mg1zYrwz4177I0/3xvVjKQ+xj/Lz0wa78Al7Xik/5
	EJuAXOmVLx8KefwRKj1oW+WAoFkDvsVbfGGZnangVb4rsPz7yW7BwDeMX+9ZwtbKv1TRKAcsfNg
	ENi7VjtlCOl1UIfLtJheRLGkaiakt8JgoTg1ox/nhFrZw3Pmy/ZzOvgNWFKWTy/VYpmgN3IrBfx
	36onGApUPiF5OQyIS+vDvB1frOKbrAegnRgb5h6cki4I7aao99ni9xcbOWP6AFAPzfx/mp3Bsp8
	ahdle6Qsz/frmHgeC8MGjKOV5bzndr9G0GH9Og0e+IOqY0Vtyoe0aS4cYchLZriLU=
X-Received: by 2002:a05:600c:a404:b0:488:9fb7:376d with SMTP id 5b1f17b1804b1-48a9867710cmr45440135e9.28.1777739385451;
        Sat, 02 May 2026 09:29:45 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.29.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:29:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/62] gdk-pixbuf: upgrade 2.44.5 -> 2.44.6
Date: Sat,  2 May 2026 17:28:29 +0100
Message-ID: <20260502162929.1377831-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:29:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236318

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ....build-allow-a-subset-of-tests-in-cross-compile.patch | 9 +++------
 .../gdk-pixbuf/gdk-pixbuf/fatal-loader.patch             | 4 ++--
 .../{gdk-pixbuf_2.44.5.bb => gdk-pixbuf_2.44.6.bb}       | 2 +-
 3 files changed, 6 insertions(+), 9 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.44.5.bb => gdk-pixbuf_2.44.6.bb} (97%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
index 45b9aa60c43..2b41d1cca9f 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
@@ -1,4 +1,4 @@
-From 3b6aab24f6844b7d5b3e166bc910bffbcee1f6f5 Mon Sep 17 00:00:00 2001
+From 38bc595a5c365074b924ed2706a402679b3f6df4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 26 Jan 2023 20:29:46 +0100
 Subject: [PATCH] meson.build: allow (a subset of) tests in cross compile
@@ -22,10 +22,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  2 files changed, 9 insertions(+), 7 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index f478326..464ae1d 100644
+index b88ef70..b181054 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -428,10 +428,10 @@ subdir('gdk-pixbuf')
+@@ -434,10 +434,10 @@ subdir('gdk-pixbuf')
  # i18n
  subdir('po')
  
@@ -67,6 +67,3 @@ index 9b96fdc..9c3ed7d 100644
  
  foreach test_name, test_data: installed_tests
    test_sources = [ test_name + '.c', 'test-common.c' ]
--- 
-2.34.1
-
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
index 3b4bf628614..2dd790115d7 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
@@ -1,4 +1,4 @@
-From f78ab4edaee5f62663a9a4bcfa56e5c524da4474 Mon Sep 17 00:00:00 2001
+From dc1096f95914b7faf786e3c2682aa0b453605a3f Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 1 Apr 2014 17:23:36 +0100
 Subject: [PATCH] gdk-pixbuf: add an option so that loader errors are fatal
@@ -13,7 +13,7 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 15 insertions(+), 4 deletions(-)
 
 diff --git a/gdk-pixbuf/queryloaders.c b/gdk-pixbuf/queryloaders.c
-index baa9a5c..9b6fa89 100644
+index 5228c6f..46ffa35 100644
 --- a/gdk-pixbuf/queryloaders.c
 +++ b/gdk-pixbuf/queryloaders.c
 @@ -216,7 +216,7 @@ write_loader_info (GString *contents, const char *path, GdkPixbufFormat *info)
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb
similarity index 97%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb
index 9ed9a272e01..d9c0d0ab653 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb
@@ -14,7 +14,7 @@ SECTION = "libs"
 
 DEPENDS = "glib-2.0 shared-mime-info"
 
-SRC_URI[archive.sha256sum] = "69b93e09139b80c0ee661503d60deb5a5874a31772b5184b9cd5462a4100ab68"
+SRC_URI[archive.sha256sum] = "140c2d0b899fcf853ee92b26373c9dc228dbcde0820a4246693f4328a27466fa"
 
 inherit gettext gnomebase pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gi-docgen lib_package manpages
 

