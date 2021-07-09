Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web08.7527.1625811500678681277
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jul 2021 23:18:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H/qOcWCB;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id a127so7790141pfa.10
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jul 2021 23:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sY4Hwcgq3xIEbAt92nNRD0LiBp7ku4PuLzyCD8eF09g=;
        b=H/qOcWCBXVSmeuinpnKNIGUFi6hZ8qE2gGCA/DtbnbHBqCBCu/rlI7H79OZAJF4lfW
         JF8BgA5jhyC/7/efm8v1aeK97RVFWLUWZwb1zvbr/P2+U/QxIjxF8d+C9jMrjwWWkagi
         QgsBEaORx3sbVIm+I70madqkgfrV8QnL4Pj229r0WEclVv+tqdGubDGCWsi6DS42Nr5L
         iNaM6Zvm4lSyXBd+71mmNJY4iFKlaLjqyZuKJA9Zy5Iy4k6boHeA85dl+hryhJdxyeHp
         uCuAiz/s63rmFZAC6gkgtMHxAPwIOciM+RpXeQ4wFpoU82xvikR9dScdxvXzweCOn4me
         3ubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sY4Hwcgq3xIEbAt92nNRD0LiBp7ku4PuLzyCD8eF09g=;
        b=BZ4SCLCidaQfY4tHvmBVMRgGSoCsdfV449HavMAICs0tlnTkCz13Ai0TsdU0mCEfxA
         XqoJzhEVifb7Ial0eQhxO48vj5zlmjIkZmmSDwDrZvCoa+2Sd7pjORRKx67o21Hzpllt
         lhnwMva7M3IpUV/wbyjXrD123DTyb7m1jzpvHlQXiEePlMt/WAyLf2LB+VkAcaJyP6jq
         nUXI37xETvDIpuJEBUV7gteQe47tJPPyUwj6G57UA0+WfMsRAcKWkiUbDZozuztfevFm
         06ije1sAybHzWSIYA/HEyYER/2E83gRNocpQjT9OlF4VrHg0LC4gAvjDks3seqsLXnNw
         A6Wg==
X-Gm-Message-State: AOAM532kOHJSS4YOSk5sKMA+5LM9AlYoP9gRvK/j/o4mOAzMZChbNPq8
	BAvh/a8nzhnsiSPB7DoTCky/QyIyc3ichg==
X-Google-Smtp-Source: ABdhPJyZDM1LCJVfmF5TU/hcnU6/iCO4UfSYeSP/fJ9gehSRch41+ENTKqLVh8VyzaOlgYUwZyCKIg==
X-Received: by 2002:a63:dc04:: with SMTP id s4mr36171939pgg.75.1625811499827;
        Thu, 08 Jul 2021 23:18:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1c2d])
        by smtp.gmail.com with ESMTPSA id gi20sm11648005pjb.20.2021.07.08.23.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 23:18:19 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] glib-2.0: Fix signature of close_range
Date: Thu,  8 Jul 2021 23:18:16 -0700
Message-Id: <20210709061817.3055963-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

glibc 2.34 provides this function which exposes a latest issue w.r.t.
function parameters

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...tly-use-3-parameters-for-close_range.patch | 29 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-correctly-use-3-parameters-for-close_range.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-correctly-use-3-parameters-for-close_range.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-correctly-use-3-parameters-for-close_range.patch
new file mode 100644
index 0000000000..6ff25fc535
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-correctly-use-3-parameters-for-close_range.patch
@@ -0,0 +1,29 @@
+From b71117d89434db83d34bc1b981ca03d4be299576 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 8 Jul 2021 17:26:43 -0700
+Subject: [PATCH] correctly use 3 parameters for close_range
+
+libc implementation has 3 parameter e.g.
+https://www.freebsd.org/cgi/man.cgi?query=close_range&sektion=2&format=html
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib/-/merge_requests/2180]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ glib/gspawn.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/glib/gspawn.c b/glib/gspawn.c
+index 899647c2f..3073a10a4 100644
+--- a/glib/gspawn.c
++++ b/glib/gspawn.c
+@@ -1520,7 +1520,7 @@ safe_closefrom (int lowfd)
+    *
+    * Handle ENOSYS in case it’s supported in libc but not the kernel; if so,
+    * fall back to safe_fdwalk(). */
+-  if (close_range (lowfd, G_MAXUINT) != 0 && errno == ENOSYS)
++  if (close_range (lowfd, G_MAXUINT, 0) != 0 && errno == ENOSYS)
+ #endif  /* HAVE_CLOSE_RANGE */
+   (void) safe_fdwalk (close_func, GINT_TO_POINTER (lowfd));
+ #endif
+--
+2.32.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb
index 62c8d49464..cbce6eae61 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb
@@ -18,6 +18,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://0001-gio-tests-codegen.py-bump-timeout-to-100-seconds.patch \
            file://time-test.patch \
+           file://0001-correctly-use-3-parameters-for-close_range.patch \
            "
 SRC_URI_append_class-native = " file://relocate-modules.patch"
 
-- 
2.32.0

