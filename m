Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.3448.1589236262919577830
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 15:31:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XNO4vFko;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id j5so12992320wrq.2
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2020 15:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/33R9xEMhbd8kYCJqoo6azSgJwJ19Qq16yO4V1hCXco=;
        b=XNO4vFkoHR5xXBcfdgs74qk7fKvS7rQpqXvPcsypuYiNrDY6VMTck4I+MM4am1bzIz
         hDzoMKR2PRdQjYLXXbqqxQUc2kekN5aAfjqzwtCLFxClTgQ1orKUqAeiOZHBjbYdxAmr
         7Y6HhBJav666qZN8YEBHCVHsvndgXTddC4F2gkMkmMNZZSgDCPbWwfEnooADThg7+LxH
         6LEVy8tvdDm5gPJ3gBf0S5W61kO1KaBwXxSsES4nnmuehyAentNp8JFIVOm2+Qr/C8sU
         iw9LGPWC2WyODVM+rdm1bCAyotw4ni4XllsSyHqjqH1YEU5lkd1zT6w2nDObYnRy63b5
         2oFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/33R9xEMhbd8kYCJqoo6azSgJwJ19Qq16yO4V1hCXco=;
        b=WAD+egBj+ZzmihSpIjRsGAMtiHasofah1rbORd/b2kGW30IGAKMsw0umtcEgOZk1Ev
         3QfrUfvqasn7Vt/JuCMFXaFrQZOLRu7qw1D5UHs+ALP1D/Xi+gRKy1PXnVpeGIaFr5kL
         AlP9Un/GXCO4WX/RBp4Qn+HKMoQob8L1qlo3m0Sp1RciC/OKpDta5AgoFlxsk0sup8KQ
         +zOrdx6/S5YPnadYbs/kTJuvpr4qiIWKZbm7yHtLeoBt4yF/Fs+tAUNXLHyKyEJewGme
         2bYE6M+G6LGRplX9I84jlXxAdEg91lt/QGeHXzlQTd542Y64GaPQEqdtVbmEnxa4WT+u
         lRrQ==
X-Gm-Message-State: AGi0PuaR4vLW32ExXQTaOknmIBIB3v+aO8dnqCVZsxvKCfwwEWIsXUko
	HSYaQ/cL+i/GaobS85VZ694J7b/k
X-Google-Smtp-Source: APiQypKZv5W2k6e388duOrVGRYPAPJmWPdXi69eovWjZLUGeDJJueWowVzmLo4aoc69K1IAN97cL6w==
X-Received: by 2002:adf:f487:: with SMTP id l7mr20013662wro.381.1589236261018;
        Mon, 11 May 2020 15:31:01 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id l5sm27682380wmi.22.2020.05.11.15.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 15:31:00 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] gcr: correct a build race between vapi files
Date: Tue, 12 May 2020 00:30:14 +0200
Message-Id: <20200511223014.17540-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ectly-set-internal-vapi-dependencies.patch | 45 +++++++++++++++++++
 meta/recipes-gnome/gcr/gcr_3.36.0.bb          |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-gnome/gcr/gcr/0001-meson.build-correctly-set-internal-vapi-dependencies.patch

diff --git a/meta/recipes-gnome/gcr/gcr/0001-meson.build-correctly-set-internal-vapi-dependencies.patch b/meta/recipes-gnome/gcr/gcr/0001-meson.build-correctly-set-internal-vapi-dependencies.patch
new file mode 100644
index 0000000000..b484a1b222
--- /dev/null
+++ b/meta/recipes-gnome/gcr/gcr/0001-meson.build-correctly-set-internal-vapi-dependencies.patch
@@ -0,0 +1,45 @@
+From ebb77dad4563b882b449cbc5e882f36ac8c2de71 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 11 May 2020 22:19:16 +0000
+Subject: [PATCH] meson.build: correctly set internal vapi dependencies
+
+If they are set as strings, meson will supply the right
+arguments to vapigen, but will not set the ninja dependencies
+to ensure they get built first, and so races will occur:
+https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1881/steps/8/logs/step1b
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gcr/-/merge_requests/55]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ gcr/meson.build | 2 +-
+ ui/meson.build  | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/gcr/meson.build b/gcr/meson.build
+index 254a933..199452f 100644
+--- a/gcr/meson.build
++++ b/gcr/meson.build
+@@ -203,7 +203,7 @@ if get_option('introspection')
+ 
+   gcr_vapi = gnome.generate_vapi('gcr-@0@'.format(gcr_major_version),
+     sources: gcr_gir[0],
+-    packages: [ 'glib-2.0', 'gio-2.0', 'gck-@0@'.format(gck_major_version) ],
++    packages: [ 'glib-2.0', 'gio-2.0', gck_vapi ],
+     metadata_dirs: meson.current_source_dir(),
+     vapi_dirs: [
+       build_root / 'gck',
+diff --git a/ui/meson.build b/ui/meson.build
+index 5ca3753..477412d 100644
+--- a/ui/meson.build
++++ b/ui/meson.build
+@@ -174,8 +174,8 @@ if get_option('introspection')
+     packages: [
+       'glib-2.0',
+       'gio-2.0',
+-      'gck-@0@'.format(gck_major_version),
+-      'gcr-@0@'.format(gcr_major_version),
++      gck_vapi,
++      gcr_vapi,
+       'gtk+-3.0'
+     ],
+     metadata_dirs: meson.current_source_dir(),
diff --git a/meta/recipes-gnome/gcr/gcr_3.36.0.bb b/meta/recipes-gnome/gcr/gcr_3.36.0.bb
index 4fe3b2fff3..a3325b50b1 100644
--- a/meta/recipes-gnome/gcr/gcr_3.36.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.36.0.bb
@@ -17,6 +17,7 @@ inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even
 # depends on gtk+3, but also x11 through gtk+-x11
 REQUIRED_DISTRO_FEATURES = "x11"
 
+SRC_URI += " file://0001-meson.build-correctly-set-internal-vapi-dependencies.patch"
 SRC_URI[archive.md5sum] = "adc65563b6b458507b9a578a8b68fb61"
 SRC_URI[archive.sha256sum] = "aaf9bed017a2263c6145c89a1a84178f9f40f238426463e4ae486694ef5f6601"
 
-- 
2.26.1

