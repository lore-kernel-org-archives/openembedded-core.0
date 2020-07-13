Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.20324.1594649843343219394
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2020 07:17:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=CiEODP7+;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id k5so6321498pjg.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2020 07:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=KTd2jLw6rgTrjQSOpIQxAqI59euYzaZKPiiJ4gHRJBE=;
        b=CiEODP7+DRYkfHvlCibdCa79KMaSObGWKVirNUNmamvL0oNk/vtC/ktnZ2lRZnfYzV
         yqgRmoeGJthvKl854Fu4POLXBEaP7LWRFoJ9EQ/45dU0cibqzIJaZJ2CBcj9FPQmdxYk
         8uaclxV1oYplW2BWF0gmtRB2CCEDcGIJj1lLpK6Lpg6TJQe7XByXQ0p5zo3E/Cy8Bp/f
         sBghUYjlrRDSVgC8VY/Cne4i9oKEAPaAzBWnIqlp4g4ni81jAUDpu6PlSFd3HELScdQF
         JE3P87h7FYJlomGe553kIJ5c5j3vb4vIPKAMdwXSK0ZVLjnfqMhre4wjVylaUSI3cUZQ
         DNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=KTd2jLw6rgTrjQSOpIQxAqI59euYzaZKPiiJ4gHRJBE=;
        b=i/UVaEyG1/m3pNlo6Pe0j2WB+lrn4l0VwApgkspTklF6GIfDG8uxR+pVJ5ViHABxp7
         U/I1nst1ODuUL7Yxwf6lUgbCaeFMQpLGdQuh1Mq1rRqnEuYsk0WEoeCtGyvDGz+b4Ji2
         C1QOrpcfChTKZSelBGd+jU0Qoj44uLeBg5s9HKsRveqK0zPHxoXOy9VVw1Kz2B82KJyI
         8Ia2qWwiuZw0rNlhzojnvehIOyK5SvbXuHQaqYpciWEtZtvxDm/EJmRjbn5adDkjQP92
         Ub3SpTB5GnifhmrZkJozZ2O3ZHtAT7zZzjtPK3z/LIRad3WsQpIf5IprATw+XY91B3tt
         76PQ==
X-Gm-Message-State: AOAM531gVBu04SbmoGq5C0xVIwEQn5DlWldrrVvdOYRAiTPL8NXWmPrp
	JbN2S73GHPRAdhNaESrRBm5bhYfwJeozYQ==
X-Google-Smtp-Source: ABdhPJw/NlBaxzLp4GsrxVoKOiRauXICW7vcQpb7Ew1SPX+RDEKCKSot+AHM38sNkE3tctxWhSVjWg==
X-Received: by 2002:a17:90b:3750:: with SMTP id ne16mr20204377pjb.6.1594649842294;
        Mon, 13 Jul 2020 07:17:22 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k7sm13723738pgh.46.2020.07.13.07.17.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:17:21 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/15] gobject-introspection: add a patch to fix a build race
Date: Mon, 13 Jul 2020 04:16:49 -1000
Message-Id: <80b61573fd1509cb46d263d6adb3621c3dee15d1.1594649587.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594649587.git.steve@sakoman.com>
References: <cover.1594649587.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1d6ffc795fc815509e193b28df3a33cc72bfb31b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ency-for-g-ir-compiler-for-building-.patch | 33 +++++++++++++++++++
 .../gobject-introspection_1.62.0.bb           |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-gir-add-a-dependency-for-g-ir-compiler-for-building-.patch

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-gir-add-a-dependency-for-g-ir-compiler-for-building-.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-gir-add-a-dependency-for-g-ir-compiler-for-building-.patch
new file mode 100644
index 0000000000..adb357b5ec
--- /dev/null
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-gir-add-a-dependency-for-g-ir-compiler-for-building-.patch
@@ -0,0 +1,33 @@
+From 56ba5656258b82dbc069ab3a61e597c931a16a83 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 17 Jun 2020 11:43:16 +0200
+Subject: [PATCH] gir: add a dependency for g-ir-compiler for building .girs
+
+meson inserts the dependency if the compiler is used directly, but
+fails to do so if the compiler is run through a wrapper. This leads
+to build race errors between building the compiler and using it.
+
+Fix provided by Quentin Schulz <quentin.schulz@streamunlimited.com>
+
+Upstream-Status: Accepted [https://gitlab.gnome.org/GNOME/gobject-introspection/-/merge_requests/228]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ gir/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gir/meson.build b/gir/meson.build
+index b37fdb81..557e5517 100644
+--- a/gir/meson.build
++++ b/gir/meson.build
+@@ -448,7 +448,7 @@ foreach gir : gir_files
+   typelibs += custom_target('generate-typelib-@0@'.format(gir).underscorify(),
+     input: gir,
+     output: '@BASENAME@.typelib',
+-    depends: [gobject_gir, ],
++    depends: [gobject_gir, gircompiler, ],
+     command: gircompiler_command,
+     install: true,
+     install_dir: typelibdir,
+-- 
+2.27.0
+
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.62.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.62.0.bb
index b1371776af..92b0d1d52f 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.62.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.62.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-$
            file://0001-Port-cross-compilation-support-to-meson.patch \
            file://0001-meson.build-disable-tests-when-cross-compiling.patch \
            file://0001-Fix-build-reproducibility.patch \
+           file://0001-gir-add-a-dependency-for-g-ir-compiler-for-building-.patch \
            "
 
 SRC_URI[md5sum] = "37278eab3704e42234b6080b8cf241f1"
-- 
2.17.1

