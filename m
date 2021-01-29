Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web12.7651.1611915862322157675
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 02:24:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GBwq2SSw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f49.google.com with SMTP id g1so9962869edu.4
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 02:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FyquiFD8aEvUuiTUoi615PxF8jO1neaE4exMXz/TICA=;
        b=GBwq2SSwsGZtwEb0zVF2FnCf+fIZ+CUw7I9/br7tBqAfX5xUaruccHU5TkZDNXMzx+
         OnDnlxMgNjKQztN4fxxVDZVihKR7C0VqorJLNqoLK+8lNS9ZggKRXwfirnUFoV2LFkWA
         WQYgGgJKQ91ZypraDUQoRihrr+ZbLlPtJoqdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FyquiFD8aEvUuiTUoi615PxF8jO1neaE4exMXz/TICA=;
        b=PO4hvFx6VQKSrWdxqlF8CZcSABnYA1IyAFFfrw/3/eQ5/uAZ2sMqHLrsL3Apy5JfD5
         TpBBxKD6zJa5Fl11CFgU4hARTjRyaXgJ5+/DuATmrEL1wQa8f8f8g90QIbDIX35eOPZt
         ibYxrlcRlKnnryRGe5rIvoGf6mLHIB3mvKCitERsaL5q7kdF6XYs3uFE1nfhwEW7JsG/
         BSO3jLhaQNP6beGEtunEelT3mNFaQh5pRyGsbkM9bw7fQRLompmdh/g6Q1VBKBpUJ4VL
         TX4fqGK+mkNSebi7I8gJRYx4Fi9yP7I/WYOwWcB1XDcislkKD16VXzNopsNAzERpOP/n
         MMpA==
X-Gm-Message-State: AOAM532VNWS6Z7NZ1biDGBromQa6Gcli14eB9DXJvGq6/BFboqxOceHw
	oIVrrL7JUsFJsbwAugabYcNYqt58n6Wd8A==
X-Google-Smtp-Source: ABdhPJz+EQ4/Jv23XOf8y7+NcQYFtbYPAJYDm/GbZVEOyvrYgZCEOO0lpdVsFtpjU5FwxAOOjdOuUQ==
X-Received: by 2002:a05:6402:50c6:: with SMTP id h6mr4203954edb.117.1611915860460;
        Fri, 29 Jan 2021 02:24:20 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:93ef:509c:4f16:14ff])
        by smtp.gmail.com with ESMTPSA id k22sm3554574eji.101.2021.01.29.02.24.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 02:24:20 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/13] gobject-introspection: Fix variable override order
Date: Fri, 29 Jan 2021 10:24:07 +0000
Message-Id: <20210129102419.1360572-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
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

