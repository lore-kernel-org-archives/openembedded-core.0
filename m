Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.26895.1613946777218618677
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 14:32:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N9OfXwHh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id w4so11801342wmi.4
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Feb 2021 14:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pu1GPYcpMrUACtoWY7Hr1hn1TK3yJBlkHWrvr7x0A6U=;
        b=N9OfXwHhDIC6+bhoJfNViI2CN1TMX/kDlVIAegMwjdPoaNG4XOPApcYqOC4g3bvIVb
         aY5ik95MoR1rmy8IhfrFrvOrin/5M16rA9mowwGHRXRK2jOpbcxHN7Zdg8gfRSzYNI/c
         CpJEaoUY+2Z1HMa44CG5ink0+xTrSsAEALv1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pu1GPYcpMrUACtoWY7Hr1hn1TK3yJBlkHWrvr7x0A6U=;
        b=jwfkZlJwCRagmFqOHyisILlC+F9F00PPPYrIdFQ4/i0TnXaNSeJsmNthMiAB1v5duK
         ehw/GGkgxEmZ56QIea60ONRZ5kHIlpMqttmLs8ekycgy49PuJELKDVowyhgqPVCbiQR3
         1Z4cfr2675h5NKr8zOcYHB41/3Poe0qD+8nW46PZwLXywkCVZ6/ZmgyGl3kMlce8lUtv
         GC/DdB85uepKIOxQKWxsSyrB+MvXbYxt6ekCoEaSuRCwRH+CHXlcoghCkAEWYla21II9
         BXCDaVVWhmRquyQrlE0BmzRJfH2ob0NhJQgUgCIGfEV6V9+/VzdPKZS6p2ax2d+0PDRS
         gYUg==
X-Gm-Message-State: AOAM531WRLc7JA/R+i55gTIlfGkaZU0QPdHy7ay/oSaZ8BBsURLyn52b
	hdWgang1rttKfOcUb71fNWbAY4MCTFSmHg==
X-Google-Smtp-Source: ABdhPJx0BuQA37JQaEi7q9DX4UCKwH6ropiskbLk+88oD0Gjbhs/iSAX+Gfe82GlGs5N5iABexjegw==
X-Received: by 2002:a1c:f20f:: with SMTP id s15mr17229260wmc.35.1613946775608;
        Sun, 21 Feb 2021 14:32:55 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6747:849:8224:46bc])
        by smtp.gmail.com with ESMTPSA id h19sm21843467wmq.47.2021.02.21.14.32.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 14:32:55 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libproxy: Avoid /etc/sysconfig determinism issue
Date: Sun, 21 Feb 2021 22:32:54 +0000
Message-Id: <20210221223254.3715008-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libproxy/libproxy/determinism.patch       | 26 +++++++++++++++++++
 .../libproxy/libproxy_0.4.17.bb               |  4 ++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libproxy/libproxy/determinism.patch

diff --git a/meta/recipes-support/libproxy/libproxy/determinism.patch b/meta/recipes-support/libproxy/libproxy/determinism.patch
new file mode 100644
index 00000000000..09770f68f0e
--- /dev/null
+++ b/meta/recipes-support/libproxy/libproxy/determinism.patch
@@ -0,0 +1,26 @@
+[PATCH] cmake/modules/config_sysconfig: Allow configuration of sysconfig module
+
+Checking whether the host system has /etc/sysconfig is not deterministic
+when cross compiling. Allow this to be disabled by adding a configure
+option for it. OpenEmbedded can set this and have deterministic build
+output independent of the host OS.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Submitted [https://github.com/libproxy/libproxy/pull/160]
+
+Index: libproxy-0.4.17/libproxy/cmake/modules/config_sysconfig.cmk
+===================================================================
+--- libproxy-0.4.17.orig/libproxy/cmake/modules/config_sysconfig.cmk
++++ libproxy-0.4.17/libproxy/cmake/modules/config_sysconfig.cmk
+@@ -1,5 +1,8 @@
+ if (NOT WIN32 AND NOT APPLE)
+-  if (EXISTS "/etc/sysconfig" AND IS_DIRECTORY "/etc/sysconfig")
+-    set(SYSCONFIG_FOUND 1)
++  option(WITH_SYSCONFIG "Build sysconfig module for /etc/sysconfig" ON)
++  if(WITH_SYSCONFIG)
++    if (EXISTS "/etc/sysconfig" AND IS_DIRECTORY "/etc/sysconfig")
++      set(SYSCONFIG_FOUND 1)
++    endif()
+   endif()
+ endif()
+\ No newline at end of file
diff --git a/meta/recipes-support/libproxy/libproxy_0.4.17.bb b/meta/recipes-support/libproxy/libproxy_0.4.17.bb
index ad81cccf522..7d618618241 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.17.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.17.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "glib-2.0"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz"
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
+           file://determinism.patch"
 SRC_URI[sha256sum] = "bc89f842f654ee1985a31c0ba56dc7e2ce8044a0264ddca84e650f46cd7f8b05"
 
 UPSTREAM_CHECK_URI = "https://github.com/libproxy/libproxy/releases"
@@ -28,6 +29,7 @@ EXTRA_OECMAKE += " \
     -DWITH_PYTHON2=no \
     -DWITH_PYTHON3=no \
     -DWITH_WEBKIT=no \
+    -DWITH_SYSCONFIG=no \
     -DLIB_INSTALL_DIR=${libdir} \
     -DLIBEXEC_INSTALL_DIR=${libexecdir} \
 "
-- 
2.27.0

