Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.11050.1611768477615904524
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 09:27:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=POqGujcz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f48.google.com with SMTP id s11so3402742edd.5
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Jan 2021 09:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FyquiFD8aEvUuiTUoi615PxF8jO1neaE4exMXz/TICA=;
        b=POqGujczD+DOLIjviTLV3xBYQyARdnx3XjSo7JiUl7EHLKl28r1b0xP+9cNJsKF1rI
         z92ht+gj1pOcApUnNOC+uWeJ4VdDsM7qflcd8HV3Ch9riDMBHIiUAdSu5Y3bmt2SiAkC
         UjR1UeWsdf+DlZSS/Esugt1T7RmR70782jfbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FyquiFD8aEvUuiTUoi615PxF8jO1neaE4exMXz/TICA=;
        b=IZTw/Up1m5ykHKROp/aRf/+tvjGqYitxN0fPyaqnH06o8hN7SKR3FscjN+qrkgMtaF
         MrTP9CJBMoZmUbXqbV4j4+jiOT556aTjnVb5Swwl98/awazB31uMXQbp4N2Ol8vyxFAe
         JyylXyGqt1c+7WZrmMyvNAv48xqzK7WQz7uu1CVNCulnONc2FJzRa7ra8NdEFVm9aZuj
         XK9sWBuHgNacaSl3eDT7TLASgl6woCKBuErfvlEkXTkqdRmEGQuylKs3CG9SHdoF9b43
         GFu4aksVShxy8CTPXOyvuVRquT9NFldHUje3AqzeRUx1cK9me3q8KY/UGKpsYk2v0VsT
         Fozw==
X-Gm-Message-State: AOAM5317k7LHlmi+X328IPvac2adIJ5KX+KidKjxH+4vwx2+gn7HYIMO
	BzUuM6WFBet6yUmXz4uprdMGsTHMVBOMKg==
X-Google-Smtp-Source: ABdhPJxD6qqprsGzPpm1OAIK4vwcKloGMOIzJWk3UHLGqPwJayIU4NvxIH6TkY3/ix66tvVKSZQSew==
X-Received: by 2002:a05:6402:22b7:: with SMTP id cx23mr10049506edb.313.1611768475953;
        Wed, 27 Jan 2021 09:27:55 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:52a7:b6a0:dca3:45dc])
        by smtp.gmail.com with ESMTPSA id k27sm1115581eje.67.2021.01.27.09.27.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 09:27:55 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] gobject-introspection: Fix variable override order
Date: Wed, 27 Jan 2021 17:27:50 +0000
Message-Id: <20210127172753.1286275-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210127172753.1286275-1-richard.purdie@linuxfoundation.org>
References: <20210127172753.1286275-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DEPENDS variable override ordering here was almostly certainly
incorrect and led to weird behaviour when making changes elsewhere.
Correct it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../gobject-introspection/gobject-introspection_1.66.1.bb     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
index ee0ab2866b8..ebac8d3a432 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
@@ -28,14 +28,14 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 
 MULTILIB_SCRIPTS = "${PN}:${bindir}/g-ir-annotation-tool ${PN}:${bindir}/g-ir-scanner"
 
-DEPENDS_append = " libffi zlib glib-2.0 python3 flex-native bison-native autoconf-archive"
+DEPENDS += " libffi zlib glib-2.0 python3 flex-native bison-native autoconf-archive"
 
 # target build needs qemu to run temporary introspection binaries created
 # on the fly by g-ir-scanner and a native version of itself to run
 # native versions of its own tools during build.
 # Also prelink-rtld is used to find out library dependencies of introspection binaries
 # (standard ldd doesn't work when cross-compiling).
-DEPENDS_class-target_append = " gobject-introspection-native qemu-native prelink-native"
+DEPENDS_append_class-target = " gobject-introspection-native qemu-native prelink-native"
 
 # needed for writing out the qemu wrapper script
 export STAGING_DIR_HOST
-- 
2.27.0

