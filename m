Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web10.26133.1599944650295980259
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2020 14:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iO2fVoK/;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id g21so1272272plq.1
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2020 14:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z4gMiHphUKwQJubYFgU51A/UdmwDQrVCTLlxl4nFF+Q=;
        b=iO2fVoK/PUIkRgb3vuy5yW8to7keaSD//5YMDePa4tT5rL/5LvyhUqtbqBYtMb2sKZ
         d7BdegIbmfPNjP9Tn+tQw4SPY0GqxwrXPiGZALKPNaZ0LWuxvazUx6G5FVKRWecWEBku
         Ucx+bc5TYugIeesn2J+HeBj6Sp2UJbxyKnjL/7gB0JroEkYqccTuOBhMtJN+X0y59NZn
         c/tkGXRUBn2Mai3Ai06H3grz6tmNzjh0mqEyC7hp9UjapoxHHwVQCqpvTj6rE+oVQlnv
         QYCjkImErwVGwm6xuEdcOWDP8u9AuuP+4p+Xtkt70SX7YoviZuth7nzwhKCamuVTPObN
         3GaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z4gMiHphUKwQJubYFgU51A/UdmwDQrVCTLlxl4nFF+Q=;
        b=WZOSXtfG+aRW3qUdd4VTqDcvY2zvZGvH4id8VV9Zx4WMjAjOaYTerk5FvHinnsnlk8
         vFOATBEcBe9fMYXknETLvI94qUI8Za01QNfUsNRpUQN2xqR+uzkufCW+he1ExcufU7Gb
         NDhQjf8fkYIlJJKoK5TLKiadvFuiGIOiclWqtlca+8e84axpJnNO7oT+5XQeYxLm/FIX
         g9yyGmD38jEnwg1lpzzNruZda8ivxRYrmLvq6kkDW02PhaD7Xmf3qBIX+f0Rg+Q4yTRt
         4zQvyufzTIaLphRp9RCXiRFvKPqURVBrd30xnz/8xoz4/Lj7xgqw7jLAyvRlQdvcNZJq
         y+UQ==
X-Gm-Message-State: AOAM533SeVq5TaOgb60UV4veFogF/PrsR3nSdN8D6W/V8uE19wX9/fwK
	5HTBqcdJFsq6KVKQFuGXig2brNipc8fAxQ==
X-Google-Smtp-Source: ABdhPJyqDSI7oh2tsmJMSELk8M2yxm6E8k76TIK7NaQumpSn0eHtgQpKvujErCSO7XITXHkslE+GJA==
X-Received: by 2002:a17:902:ff07:: with SMTP id f7mr7627333plj.52.1599944649546;
        Sat, 12 Sep 2020 14:04:09 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d92c])
        by smtp.gmail.com with ESMTPSA id 64sm6271787pfz.204.2020.09.12.14.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 14:04:09 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/4] weston: plane_add_prop() calls break musl atomic modesetting
Date: Sat, 12 Sep 2020 14:04:04 -0700
Message-Id: <20200912210406.3328090-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200912210406.3328090-1-raj.khem@gmail.com>
References: <20200912210406.3328090-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch ensures, weston/drm backend works which ends up with blank
screen on musl based systems

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/wayland/weston-init.bb  |  8 -------
 .../weston/dont-use-plane-add-prop.patch      | 23 +++++++++++++++++++
 meta/recipes-graphics/wayland/weston_9.0.0.bb |  3 +++
 3 files changed, 26 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/weston/dont-use-plane-add-prop.patch

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 95d75556dc..113f0ff599 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -38,14 +38,6 @@ do_install() {
 	sed -i 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${bindir}/weston-start
 }
 
-do_install_append_libc-musl_qemux86() {
-        echo "WESTON_DISABLE_ATOMIC=Y" >> ${D}${sysconfdir}/default/weston
-}
-
-do_install_append_libc-musl_qemux86-64() {
-        echo "WESTON_DISABLE_ATOMIC=Y" >> ${D}${sysconfdir}/default/weston
-}
-
 inherit update-rc.d features_check systemd
 
 # rdepends on weston which depends on virtual/egl
diff --git a/meta/recipes-graphics/wayland/weston/dont-use-plane-add-prop.patch b/meta/recipes-graphics/wayland/weston/dont-use-plane-add-prop.patch
new file mode 100644
index 0000000000..a4444e5d18
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/dont-use-plane-add-prop.patch
@@ -0,0 +1,23 @@
+Fix atomic modesetting with musl
+
+atomic modesetting seems to fail with drm weston backend and this patch fixes
+it, below errors are seen before weston exits
+
+atomic: couldn't commit new state: Invalid argument
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/weston/-/issues/158]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/libweston/backend-drm/kms.c
++++ b/libweston/backend-drm/kms.c
+@@ -1168,8 +1168,8 @@ drm_pending_state_apply_atomic(struct dr
+ 		wl_list_for_each(plane, &b->plane_list, link) {
+ 			drm_debug(b, "\t\t[atomic] starting with plane %lu disabled\n",
+ 				  (unsigned long) plane->plane_id);
+-			plane_add_prop(req, plane, WDRM_PLANE_CRTC_ID, 0);
+-			plane_add_prop(req, plane, WDRM_PLANE_FB_ID, 0);
++			//plane_add_prop(req, plane, WDRM_PLANE_CRTC_ID, 0);
++			//plane_add_prop(req, plane, WDRM_PLANE_FB_ID, 0);
+ 		}
+ 
+ 		flags |= DRM_MODE_ATOMIC_ALLOW_MODESET;
diff --git a/meta/recipes-graphics/wayland/weston_9.0.0.bb b/meta/recipes-graphics/wayland/weston_9.0.0.bb
index 2c526e3016..0b037a3770 100644
--- a/meta/recipes-graphics/wayland/weston_9.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_9.0.0.bb
@@ -12,6 +12,9 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
            file://0001-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch \
 "
+
+SRC_URI_append_libc-musl = " file://dont-use-plane-add-prop.patch "
+
 SRC_URI[sha256sum] = "5cf5d6ce192e0eb15c1fc861a436bf21b5bb3b91dbdabbdebe83e1f83aa098fe"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
-- 
2.28.0

