Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B826AC04A6A
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 14:36:50 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.9071.1690468601178776800
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 07:36:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=WI5PChMS;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-99bdf08860dso96913966b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 07:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690468599; x=1691073399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXAImm9clV+hiL3ifq6k96IIygnZSDttiUD/Xay7yG8=;
        b=WI5PChMSh57eyDe8Grl7kkBFuSRJOr7oyR0vB/v85f0sFhSBETrKm4jlT9AujpsWi0
         ZH7D4FLw3nehIdVRzIkPkHzIMuiIdq95X8CJVhuYGK3Q8L6djmvXXnjEB6XrCqj+cCGG
         DpG0y8b2Mrvknu9sffZCQz9eBuP6liTyJS4QfZCjqWcg2pTA/82c/Q5gH2YOcQliEBWC
         F+046pNdgz1CjfP0hzN3BFc2/CzX+6lEiJAywHr3AFaR33kaVKN3QjnA/UcZcpkd0g9S
         eBMOBXufW+H8s+x4MYiLytUWZTYVZMcM/HiDL4MQ3ue0PWRtcPRhi/qw2iCa7PcNivfu
         3kzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690468599; x=1691073399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kXAImm9clV+hiL3ifq6k96IIygnZSDttiUD/Xay7yG8=;
        b=UODkYIFCdYiVxXVnvR3vs2IdmEk3YU7HJ7TkhFJPr70M1r+I8Gp1wf1QJmrE8YEcjs
         8hJTYEGlmCaOSnqmyn0eBZeUKlcq7haAHqbFecddtfcQQ/vUsLdYN4Dhmv13W49I/7kE
         wmNkyiITdZAckXSfqASSiG00zCRt9R4gFnyB0ELg7yfeNs0QJ6C0X/nAoBnf+YwcmYjX
         304NbTQuhZB28M6QQJpGhHqwXqhKQfIWu+bWws48uEZtWo28Gu9wzlxMrh7rPw5NAkPA
         +sYUeXvFimXp0IDLtXvznZyKch4+vZnAyLVWaj1UsVnwKzxQ0vDgjS/MzZFH2ZMjBakE
         yfIg==
X-Gm-Message-State: ABy/qLZEoXjo84yjgZWiVr9xuzlgg9vA9BH4v+JOp5WQF0FskEzuUtfY
	VICXlGkr7/cwBQWWb/OvFG6M5i1ViGY=
X-Google-Smtp-Source: APBJJlFFhvaCjsjpxcLZeJD3DUjVQtWB00gt0MufFk4SyWeGUWXEuRDFEIxKyKxVhibsI3tTHwyQcA==
X-Received: by 2002:a17:906:5356:b0:98e:370c:be69 with SMTP id j22-20020a170906535600b0098e370cbe69mr2879481ejo.6.1690468599505;
        Thu, 27 Jul 2023 07:36:39 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m10-20020a17090607ca00b0099bcf9c2ec6sm846725ejc.75.2023.07.27.07.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:36:39 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/21] epiphany: upgrade 43.1 -> 44.5
Date: Thu, 27 Jul 2023 16:36:23 +0200
Message-Id: <20230727143627.3718496-17-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230727143627.3718496-1-alex@linutronix.de>
References: <20230727143627.3718496-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 14:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184957

With this version, epiphany has transitioned to gtk4,
and requires webkit built with gtk4 support (there is no choice,
it's a hard break). Adjust the webkit recipe accordingly.

There's also a new requirement for gcr 4.x and libadwaita.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../epiphany/{epiphany_43.1.bb => epiphany_44.5.bb}          | 5 +++--
 meta/recipes-sato/webkit/webkitgtk_2.40.2.bb                 | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_43.1.bb => epiphany_44.5.bb} (92%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_43.1.bb b/meta/recipes-gnome/epiphany/epiphany_44.5.bb
similarity index 92%
rename from meta/recipes-gnome/epiphany/epiphany_43.1.bb
rename to meta/recipes-gnome/epiphany/epiphany_44.5.bb
index c97ede459da..f92d149c881 100644
--- a/meta/recipes-gnome/epiphany/epiphany_43.1.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_44.5.bb
@@ -8,10 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = " \
           webkitgtk \
-          gcr3 \
+          gcr \
           gsettings-desktop-schemas \
           nettle \
           json-glib \
+          libadwaita \
           libarchive \
           libdazzle \
           libhandy \
@@ -31,7 +32,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "e86ead27cb9982815150664de3bf20faf375f77b8065b02b31180c65b6bbebb4"
+SRC_URI[archive.sha256sum] = "3c475e04ed2a0f410cb44b96937563697079193ac9b7a50c91485fb9b08315ab"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.40.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.40.2.bb
index 8bef0b16055..a9391bfc991 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.40.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.40.2.bb
@@ -35,7 +35,7 @@ DEPENDS += " \
           jpeg \
           atk \
           libwebp \
-          gtk+3 \
+          gtk4 \
           libxslt \
           libtasn1 \
           libnotify \
@@ -84,6 +84,7 @@ EXTRA_OECMAKE = " \
 		-DENABLE_MINIBROWSER=ON \
                 -DENABLE_BUBBLEWRAP_SANDBOX=OFF \
                 -DENABLE_GAMEPAD=OFF \
+                -DUSE_GTK4=ON \
 		"
 
 # Javascript JIT is not supported on ARC
@@ -124,7 +125,7 @@ EXTRA_OECMAKE:append:x86-x32 = " -DENABLE_JIT=OFF "
 SECURITY_CFLAGS:remove:aarch64 = "-fpie"
 SECURITY_CFLAGS:append:aarch64 = " -fPIE"
 
-FILES:${PN} += "${libdir}/webkit2gtk-4.*/injected-bundle/libwebkit2gtkinjectedbundle.so"
+FILES:${PN} += "${libdir}/webkitgtk-*/injected-bundle/*.so"
 
 RRECOMMENDS:${PN} += "ca-certificates shared-mime-info"
 
-- 
2.30.2


