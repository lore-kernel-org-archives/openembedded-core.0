Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.609.1605296945898879516
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 11:49:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Qa6pP9Gq;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id o9so15316825ejg.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 11:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RSXUOSTIo9c1q7xPYNddUNSx2GE8YjVHaDO6o50jHqY=;
        b=Qa6pP9GqQG6w6QZDruYDMBaKlrkwNuZS9ROXbC2fFGZ9Rx3WKSTnYrwIJNYjFhlKZm
         AA8tRthFQgqR8NvznrNtIxovafvJyWWkLxHjKrzgSbJyu0HWakfeohl4U1Je2SqIUJsQ
         5/9458zoW0hqAuw1iPelbj2Pw2pZ7CwzDszrHrv0UG0oBqxMI5E+gxQ+1yveC2bOHhPy
         LUWMSiYX6jiv04uFbjvbX2QLClxD8ZEVVIsCl+hxMfmHC2rEOXtg+QToQTBU+qLGS9w6
         ns9DlKepQh9b9xaDMWqRBVhzYyhqx9NYwTuxElrgssIDAZsXzdbtHIInM7KPzhs/PrTa
         vPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RSXUOSTIo9c1q7xPYNddUNSx2GE8YjVHaDO6o50jHqY=;
        b=Lxlun396cISnBDyDeZyigpEd06HAy1+hVClmjorMblWmfml7G+yR7MDTqumuoLieng
         LI02SWlZGDEGJoGBJ36GAFsAmcFV15f41+LCaUQJ9KTzACg2Q9YCoZJnpUW+YSLGtclG
         d//MuwvLpL/qoKWNSBobUBKkRpaeb2FY4B0UnRKRA6PF7ZkhyXE20MwyXcMlGamYPg6t
         3ZZH+7qhlIf1W+PGclg4twecY0ii6OxDt6r4anp15iOqc+Jw9iOwhX1gbSaRaFaUsY5f
         nID3MD8sV82Wu8sHtsktA5kPy/XQkroqYw1OSyzQLXSKTCrKLsWQ1Xi0+peldQb+VuiE
         RteQ==
X-Gm-Message-State: AOAM532zuqlnb/TxjZeM4JZJRgXrImzQk14ik4ecHyeHYonVYE0bGAi6
	UIUUyRi3QHx0xM1AYHSrlIHlGrvEh+E1lQ==
X-Google-Smtp-Source: ABdhPJyJ7se//oYkBuXTshboVZ82wKHxGlXUrKNZTbC1QRSNZyczflJY7CGseD67CJQnr/kSdU3nSw==
X-Received: by 2002:a17:906:8496:: with SMTP id m22mr3398659ejx.298.1605296943987;
        Fri, 13 Nov 2020 11:49:03 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id lz27sm4499287ejb.39.2020.11.13.11.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 11:49:03 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 4/5] meta: drop _PYTHON_SYSCONFIGDATA_NAME hacks
Date: Fri, 13 Nov 2020 20:48:53 +0100
Message-Id: <20201113194854.21266-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201113194854.21266-1-alex.kanavin@gmail.com>
References: <20201113194854.21266-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/scons.bbclass          | 3 ---
 meta/lib/oe/prservice.py            | 4 ----
 meta/recipes-core/glib-2.0/glib.inc | 4 ----
 meta/recipes-graphics/mesa/mesa.inc | 5 -----
 4 files changed, 16 deletions(-)

diff --git a/meta/classes/scons.bbclass b/meta/classes/scons.bbclass
index 6b171ca8df..4f3ae502ef 100644
--- a/meta/classes/scons.bbclass
+++ b/meta/classes/scons.bbclass
@@ -5,7 +5,6 @@ DEPENDS += "python3-scons-native"
 EXTRA_OESCONS ?= ""
 
 do_configure() {
-	unset _PYTHON_SYSCONFIGDATA_NAME
 	if [ -n "${CONFIGURESTAMPFILE}" ]; then
 		if [ -e "${CONFIGURESTAMPFILE}" -a "`cat ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" -a "${CLEANBROKEN}" != "1" ]; then
 			${STAGING_BINDIR_NATIVE}/scons --clean PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS}
@@ -17,13 +16,11 @@ do_configure() {
 }
 
 scons_do_compile() {
-	unset _PYTHON_SYSCONFIGDATA_NAME
 	${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} || \
 	die "scons build execution failed."
 }
 
 scons_do_install() {
-	unset _PYTHON_SYSCONFIGDATA_NAME
 	${STAGING_BINDIR_NATIVE}/scons install_root=${D}${prefix} PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} install || \
 	die "scons install execution failed."
 }
diff --git a/meta/lib/oe/prservice.py b/meta/lib/oe/prservice.py
index 2d3c9c7e50..fcdbe66c19 100644
--- a/meta/lib/oe/prservice.py
+++ b/meta/lib/oe/prservice.py
@@ -3,10 +3,6 @@
 #
 
 def prserv_make_conn(d, check = False):
-    # Otherwise this fails when called from recipes which e.g. inherit python3native (which sets _PYTHON_SYSCONFIGDATA_NAME) with:
-    # No module named '_sysconfigdata'
-    if '_PYTHON_SYSCONFIGDATA_NAME' in os.environ:
-        del os.environ['_PYTHON_SYSCONFIGDATA_NAME']
     import prserv.serv
     host_params = list([_f for _f in (d.getVar("PRSERV_HOST") or '').split(':') if _f])
     try:
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index a0055d81b0..06f4ae137e 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -34,10 +34,6 @@ DEPENDS_append_class-target = "${@' gtk-doc' if d.getVar('GTKDOC_ENABLED') == 'T
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-# This avoids the need to depend on target python3, which in case of mingw is not even possible.
-# meson's python configuration pokes into python3 configuration, so this provides the native config to it.
-unset _PYTHON_SYSCONFIGDATA_NAME
-
 S = "${WORKDIR}/glib-${PV}"
 
 PACKAGECONFIG ??= "system-pcre libmount \
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index ca593b8b1f..a6652b0ddb 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -49,11 +49,6 @@ PROVIDES = " \
 
 inherit meson pkgconfig python3native gettext features_check
 
-# Unset these to stop python trying to report the target Python setup
-_PYTHON_SYSCONFIGDATA_NAME[unexport] = "1"
-STAGING_INCDIR[unexport] = "1"
-STAGING_LIBDIR[unexport] = "1"
-
 BBCLASSEXTEND = "native nativesdk"
 
 ANY_OF_DISTRO_FEATURES_class-target = "opengl vulkan"
-- 
2.29.2

