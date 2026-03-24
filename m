Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B238E9A764
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 10:46:26 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16625.1774349177699126924
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 03:46:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Mccy9s83;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: zboszor@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a297a69089so482421e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 03:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774349176; x=1774953976; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ck0QJ8DfY8uf3tuSoETSGVOXRyZ2jrjrfyl8IUpj18k=;
        b=Mccy9s83/W2r0G8N/UWUh4xeIcDGxGixLqK5YnQ3Cpy6Sl1HNdTHWnHPzSo49RU2az
         6/XckrUovOzvoND/XkKSF2/Q7GonhWZyFtt30oBfvuIYhbCtGrFNzopYJMbTxERAJz8C
         FaV66DwssMzulzJWKS2JGL8HS6rzKfmmx+p64wlr4QX3yciRJWXMj+afp3eQdSL7b4yM
         9SPtJK1/w6DJ5/ERLZAlvnAO7MN3ofctzupudKVFX+mAuJG4NQtdN8J6taH7q1BqzUwK
         8uHh7ysFX0dztDAt59YukJ7IkgPuiC6fYl7T1KOApCEYrH2dW1jn7yidxGR/iV/9eR/I
         VAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774349176; x=1774953976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ck0QJ8DfY8uf3tuSoETSGVOXRyZ2jrjrfyl8IUpj18k=;
        b=Ra5MuKsZAOZl/AbK3ufGv10Q+d696fWg6GDE8XSTcxdjKhpCyoItttyqnMw2gfxCbq
         UKCCb4YFIsxDzleJJG8n5NL23w1T8E12h5k0Q3wnd81NCCCoCczuCM0yWo/EcYuOqweG
         NfTZiv/Hx/8EIljoy3o5V1JuyahsyCuYY1EXB11UrEiS0YYzV/tbcRZfM0u+CY8qr456
         sbNi38i8JhPTPVNiz7q430PTSXga1yU4TZmhQI8eZcP82C53Hq13eZF9AqVaZSL6wWLy
         f/UZbe9GSJwVOeucdL6KPQBTmgT8M3q0JfDuQqM9H7kG4EbnVEh9De3uaFP6o72B8HsO
         bPwQ==
X-Gm-Message-State: AOJu0Yw5tDVfllDhOtnWarrrWUWaxv7Dfq5iOQWPxWq+7xF/j6dmpR4m
	OI7vRS6gSzl1skZxxhIC0KySMCkrIlo4tSBV7F1xBwj8m+PlN0B0BK7A2gutwg==
X-Gm-Gg: ATEYQzxwI1Iog9P0p2CX038AyplSH2EV+6SHdIkiScfJ5rsetEsCQoeUKJIoCBnUtva
	nogllb/RLURxYI9PAR1UhFsYOsVeZhXNdQx8CSZT/YgWzC7yB4y1/n3RSxU6cHteDtUTwDbNf/x
	/lqLM3CMOkUDoWXIfGByNn0iVBfOArG8/yOKisjUGZR946KOc3NiJ7ovHwtt+hJSeF0SajoBHp9
	xyPnQ9amYmV6UHMpzQ8IdpmfvB1q2rLO/CgX0cP24X2ZsqItFSgzshfuxCiJZNf0oLIQwzMzPQv
	zIDA9wtFGXZ0BvyqKRNeBkV202CDsB8BiY/vZlZTinW75QyrtAlqlUA7yqD2+fz2tHgCo8mG3cD
	NkGJTDSiceUVhLTMoE4jfFw00EzjAFfIe9ThrbGTIQyqK1QaLUnpRIxm3+R3rj3QWw3XRw1iIIc
	1/rospkuR5K5qTJg==
X-Received: by 2002:a05:6512:318b:b0:5a1:27b1:1e0b with SMTP id 2adb3069b0e04-5a285b5879dmr5259292e87.38.1774349175267;
        Tue, 24 Mar 2026 03:46:15 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a296d7c953sm394066e87.65.2026.03.24.03.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 03:46:14 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] gtk4: Upgrade to 4.22.1
Date: Tue, 24 Mar 2026 11:46:10 +0100
Message-ID: <20260324104610.2860460-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 10:46:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233787

Remove the previously added patch, it's already part of 4.22.1.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 ...-t-use-space-in-meson-generated-file.patch | 34 -------------------
 .../gtk+/{gtk4_4.20.3.bb => gtk4_4.22.1.bb}   |  4 +--
 2 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk4/0001-application8-Don-t-use-space-in-meson-generated-file.patch
 rename meta/recipes-gnome/gtk+/{gtk4_4.20.3.bb => gtk4_4.22.1.bb} (96%)

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
similarity index 96%
rename from meta/recipes-gnome/gtk+/gtk4_4.20.3.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.22.1.bb
index 0cca44fb5c..391c6f2508 100644
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
 
-- 
2.53.0


