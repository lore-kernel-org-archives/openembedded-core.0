Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC9CE9A767
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 10:50:46 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17051.1774349444589944882
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 03:50:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OJYV/Xh1;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439c6fc2910so885922f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 03:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774349442; x=1774954242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=re9U+9e8bhpViC45H5GJ06H51LJ1HUSlIB27oU6O9mg=;
        b=OJYV/Xh1s1ZJK3qJQJxWQb7qeVQL1vpu3Jp8N6aEjYPW6TbXjfQWzP6TBwLeqtJEB+
         554t8RJ43JXC5XR+TfWINaNL6c6tidfGk04DdBT1ENfOiwpBOTRvIdZzQh4120i0AoDV
         Mrv+oCtge+xo/L7Jq9GjWEKxZDLzLTI/ywXC+dDlkXF+EZb2mfNblTd2JWLBpaUEh7jK
         1j/rVeWjTIHIlP5Qn6RNoryMITwLu0xx6rDR+BMSdU3iUqOQKPu/+vlZNzXsf13Lj/1A
         He6rfjXzY6lvS71JxWsTWmvVbERtfRrko9sXLkbXKY+stsOUoRTOHqeJccQCUxAQWqTY
         Im9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774349442; x=1774954242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=re9U+9e8bhpViC45H5GJ06H51LJ1HUSlIB27oU6O9mg=;
        b=Rf4Q4LrGolFHhWK3PHpVGORqC8cABqTAuhmzgmeuZnNy2UwK/Wytrq++YhrGXlrykM
         TWIVptd28OVofoPytX9LVldNqedKmYTAQu5g2Kt5W3c4NtZ6utyXbS0fS0svNEvCNhu1
         P4sKyDt9DVKkiNjuSB1vcQyMX6KOdadYQjzbBk+QQ88/AjQzfTcc4SgQygB8lSQgPNv+
         V6ln9xbK4DNg8V+d7bRD02vku7yJ67xbO8wGw4JJPWMjn2kYJOditnJwVbymdCpqnbdj
         U2bwKg4/cWbUjEUij29271xKWVkUL8QcG6ZZ7RmEUKB1rjYxlzVc80TKucMOJpGmCjHR
         QW0Q==
X-Gm-Message-State: AOJu0YzvzbkoJCWXzfChgM8xmpHeATltol3P8P2zUBGfptYB1uFIbSSk
	v1/0J/JfdZJedkCr/v5101nAjZTKlIinJXRpQ5c8s1vUq4uVJeezq0kU8RqBnA==
X-Gm-Gg: ATEYQzxnAAGm0lTl6zuB9u1/2AfEHfEUBhqCy/fOaw0Ak1DVqMRXdJ7Wy8nNMqYwGzD
	lOZSeBXoiYFcBio8h0BDDagrQfvlqvbFDzMFgv0xbA4Lo62lbF5n675DWI2mMcB/18fwaomHJ8y
	cPCSTOMKVxB56kKIYltYBP0uxbuntCBaoaZlVKbaHwQ4lv//zifflSBesxF68syQtCylWZHj28o
	Mfoe6CSO97Y0us7tDuBKWCyzsc5+cqKMkBd9G0XgywgO+h+zR6E7HoLZ4ZDMuQiIbg5DYNnE+Mc
	SnmD2qRJQ3alCumdfx+dweeiX1PBzeqj+ohHumDXlxmsZ+hVIqRCCcd6ZYLlDaBqopL6mzp9HwN
	4AbEiaD2GZqMe2sFcl8DjcKxlD6yvIH4IKglPTYCNZCyy8CxdTydT9jBJOeeXqrQIAuQMP/5aqt
	2BOxMUGWYSXxgW4g==
X-Received: by 2002:a05:6000:1a8d:b0:43b:4592:f91b with SMTP id ffacd0b85a97d-43b64242fa4mr24131549f8f.5.1774349442315;
        Tue, 24 Mar 2026 03:50:42 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bd923sm43089667f8f.12.2026.03.24.03.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 03:50:42 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2] gtk4: Upgrade to 4.22.1
Date: Tue, 24 Mar 2026 11:50:11 +0100
Message-ID: <20260324105011.2879076-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 10:50:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233788

Remove the previously added patch, it's already part of 4.22.1.
Added inherit mime, so the QA error is fixed.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 ...-t-use-space-in-meson-generated-file.patch | 34 -------------------
 .../gtk+/{gtk4_4.20.3.bb => gtk4_4.22.1.bb}   |  6 ++--
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk4/0001-application8-Don-t-use-space-in-meson-generated-file.patch
 rename meta/recipes-gnome/gtk+/{gtk4_4.20.3.bb => gtk4_4.22.1.bb} (94%)

diff --git a/meta/recipes-gnome/gtk+/gtk4/0001-application8-Don-t-use-space-in-meson-generated-file.patch b/meta/recipes-gnome/gtk+/gtk4/0001-application8-Don-t-use-space-in-meson-generated-file.patch
deleted file mode 100644
index 2a79fc637d..0000000000
--- a/meta/recipes-gnome/gtk+/gtk4/0001-application8-Don-t-use-space-in-meson-generated-file.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From d26453923a21de0d908af3bf83c69263aaee5705 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
- <zboszor@gmail.com>
-Date: Wed, 11 Mar 2026 07:02:10 +0100
-Subject: [PATCH] application8: Don't use space in meson generated filename
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-All other example apps use underscore, examples/application8
-has a build error:
-
-| /usr/bin/ld: cannot find examples/application8/exampleapp8.p/meson-generated_.._exampleapp8: No such file or directory
-| /usr/bin/ld: cannot find resources.c.o: No such file or directory
-
-Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/9627]
----
- examples/application8/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/examples/application8/meson.build b/examples/application8/meson.build
-index f2e1d7cea9..77987d554a 100644
---- a/examples/application8/meson.build
-+++ b/examples/application8/meson.build
-@@ -1,4 +1,4 @@
--app8_resources = gnome.compile_resources('exampleapp8 resources',
-+app8_resources = gnome.compile_resources('exampleapp8_resources',
-   'exampleapp.gresource.xml',
-   source_dir: meson.current_source_dir())
- 
--- 
-2.53.0
-
diff --git a/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb b/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb
similarity index 94%
rename from meta/recipes-gnome/gtk+/gtk4_4.20.3.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.22.1.bb
index 0cca44fb5c..bbe595c376 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb
@@ -33,9 +33,7 @@ LIC_FILES_CHKSUM = " \
     file://tests/testgtk.c;endline=25;md5=49d06770681b8322466b52ed19d29fb2 \
 "
 
-SRC_URI[archive.sha256sum] = "2873f2903088a66c71173ea2ed85ffae266a66b972c3a4842bbb2f6f187ec153"
-
-SRC_URI += "file://0001-application8-Don-t-use-space-in-meson-generated-file.patch"
+SRC_URI[archive.sha256sum] = "cd7b5a9c41127da6fb321c5a842ad73c62e6996f9ce3f1960ca509f6559d55fc"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 
@@ -43,7 +41,7 @@ CVE_PRODUCT = "gnome:gtk"
 
 GNOMEBN = "gtk"
 
-inherit gettext gnomebase gi-docgen update-alternatives gsettings features_check gobject-introspection upstream-version-is-even
+inherit gettext gnomebase gi-docgen update-alternatives gsettings features_check gobject-introspection mime upstream-version-is-even
 
 # TBD: nativesdk
 # gobject-introspection.bbclass pins introspection off for nativesk. As long as
-- 
2.53.0


