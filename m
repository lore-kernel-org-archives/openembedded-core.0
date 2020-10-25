Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.27299.1603635837082723299
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2020 07:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E9YJnPHG;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id h7so9615245wre.4
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2020 07:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lQEMNk0B/QmKGbRvLUDYru40gBnbFemoZ5SRzSnEs84=;
        b=E9YJnPHG+DkfxQnNKwx5by7FjaAaCcCfdQhtjz2dCXFrNDyrJDFIc+RtiMvbvqyoUZ
         mZarg8CPu43B1fdL0xwO1NVdP9b+llbJRhRX/HSDaqmq52JG6tgna52/YkFUW3dcJnnV
         UiMN/xzXOxcgTiU1BQyeAE+PvM4AHyetY0ytQByMMD7+oFBS6mcbJU4hUyL2eIJwU8DZ
         1s8uOITpol/jpchRfiIuvBxU8+fOVrBr3WCJLiZDv84O2WOLrNQxcsOhwQ9zS6asbK18
         IhAVRUyJj9cIbLYmRFvmiKuuwlw7vEmDIkv3dfMPZwYmh0u1/nDsdTgKBnDkc1e7f4Oi
         vSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lQEMNk0B/QmKGbRvLUDYru40gBnbFemoZ5SRzSnEs84=;
        b=g/iIXOa4o5veWJLC/1xbCnF5OKeuzVIhC2FcvtE6d3tgcJ3tTu1VWsKnmCEEeXhlPl
         yuCDb4PePaVULUmcBiAvjHhU7Z1NdWjY79PSO0/sIyYJZLd7F4DSB5wnFW3ZgYJISQWm
         A1D5VZj9yajJwIeES9CfmliihNEYBL84wcrRAwjri2SOlVUgIOSxHc+awQkfzFnqd1jz
         RVBUo3YiUh+MRamzD6Bkk8YPq0d2/Kj9kHOwaB0g/ULetHY8HizhVH8zOSZ+q/l/p86G
         6majP2hXaH/jAvEE39aJPQ7u/5fjmLrcCV0Qf0g4QytMWG1Qk4zougRryTHX131NAUGi
         Rz7g==
X-Gm-Message-State: AOAM5325YscqmdAfILHM6NAx15jMLpcxu14giS0if5PBy6OynTN/Fw1r
	roiuCRKydurlRNljeXW1gzGyamVweNd05w==
X-Google-Smtp-Source: ABdhPJxB/mdl1qa7w+Joh1uwwYpQcXfdHi0UHrBsyO4ymtDgSuP9Tu+PMKmHZv3dNO+s/5YDKjf/ng==
X-Received: by 2002:a5d:43c6:: with SMTP id v6mr12886225wrr.20.1603635835053;
        Sun, 25 Oct 2020 07:23:55 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id f14sm18041731wrr.80.2020.10.25.07.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 07:23:54 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH][dunfell 01/12] gstreamer1.0: Fix reproducibility issue around libcap
Date: Sun, 25 Oct 2020 14:23:42 +0000
Message-Id: <20201025142353.1929717-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently gstreamer configuration depends libcap and on whether
setcap is found on the host system.

Removing libcap from DEPENDS and only use it when the 'setcap' is enabled.

    * 0004-capfix.patch
      Removed as the same goals can be achieved only with the PACKAGECONFIG 'setcap'

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0/capfix.patch       | 37 -------------------
 .../gstreamer/gstreamer1.0_1.16.2.bb          |  5 +--
 2 files changed, 2 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch
deleted file mode 100644
index 7ca3d5ad4a..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Currently gstreamer configuration depends on whether setcap is found on the host
-system. Turn this into a configure option to make builds deterinistic.
-
-RP 2020/2/19
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Pending
-
-Index: gstreamer-1.16.1/libs/gst/helpers/meson.build
-===================================================================
---- gstreamer-1.16.1.orig/libs/gst/helpers/meson.build
-+++ gstreamer-1.16.1/libs/gst/helpers/meson.build
-@@ -73,7 +73,12 @@ if have_ptp
-     endif
-   endif
- 
--  setcap = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap', required : false)
-+  setcap_feature = get_option('setcap')
-+  if setcap_feature.disabled()
-+    setcap = find_program('dontexist', required : false)
-+  else
-+    setcap = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap', required : false)
-+  endif
- 
-   # user/group to change to in gst-ptp-helper
-   ptp_helper_setuid_user = get_option('ptp-helper-setuid-user')
-Index: gstreamer-1.16.1/meson_options.txt
-===================================================================
---- gstreamer-1.16.1.orig/meson_options.txt
-+++ gstreamer-1.16.1/meson_options.txt
-@@ -26,6 +26,7 @@ option('libunwind', type : 'feature', va
- option('libdw', type : 'feature', value : 'auto', description : 'Use libdw to generate better backtraces from libunwind')
- option('dbghelp', type : 'feature', value : 'auto', description : 'Use dbghelp to generate backtraces')
- option('bash-completion', type : 'feature', value : 'auto', description : 'Install bash completion files')
-+option('setcap', type : 'feature', value : 'auto', description : 'Use setcap')
- 
- # Common feature options
- option('examples', type : 'feature', value : 'auto', yield : true)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb
index 50a872e292..9d92fe1439 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
 SECTION = "multimedia"
 LICENSE = "LGPLv2+"
 
-DEPENDS = "glib-2.0 glib-2.0-native libcap libxml2 bison-native flex-native"
+DEPENDS = "glib-2.0 glib-2.0-native libxml2 bison-native flex-native"
 
 inherit meson pkgconfig gettext upstream-version-is-even gobject-introspection gtk-doc
 
@@ -21,7 +21,6 @@ SRC_URI = " \
     file://0002-meson-build-gir-even-when-cross-compiling-if-introsp.patch \
     file://0003-meson-Add-valgrind-feature.patch \
     file://0004-meson-Add-option-for-installed-tests.patch \
-    file://capfix.patch \
 "
 SRC_URI[md5sum] = "0e661ed5bdf1d8996e430228d022628e"
 SRC_URI[sha256sum] = "e3f044246783fd685439647373fa13ba14f7ab0b346eadd06437092f8419e94e"
@@ -40,7 +39,7 @@ PACKAGECONFIG[unwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
 PACKAGECONFIG[dw] = "-Dlibdw=enabled,-Dlibdw=disabled,elfutils"
 PACKAGECONFIG[bash-completion] = "-Dbash-completion=enabled,-Dbash-completion=disabled,bash-completion"
 PACKAGECONFIG[tools] = "-Dtools=enabled,-Dtools=disabled"
-PACKAGECONFIG[setcap] = "-Dsetcap=enabled,-Dsetcap=disabled,libcap libcap-native"
+PACKAGECONFIG[setcap] = ",,libcap libcap-native"
 
 # TODO: put this in a gettext.bbclass patch
 def gettext_oemeson(d):
-- 
2.29.0

