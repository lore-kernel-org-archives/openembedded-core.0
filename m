Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web12.8585.1604191467963494847
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 17:44:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cmurAs+F;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id k9so10538448edo.5
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 17:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mh4RgpgRlmbsACxjgOxTEdGUsihGMTa5VreivBcXnbo=;
        b=cmurAs+F0cDvaLmbu280aDSOKKp2KV0QwZEHc51rvhxmIH5y1rUlGVSbiM2AXCGIlB
         w/Zd313U6bX9yIk6V8HfJmZNyZ0MRfUd0RSk3QRjglFl46aIcTeScSpCV6XyIZ3l2MXI
         JMtUosGXsD74XItq+bIWXmcxdHa5y8Oq/cbGMjX0HCroIU+cUGfkCRn6ODNAJhQK1Hv9
         x3EzGCBxtaQLo2+3JbxGNKAPWfBo3jcXLrUTlawcu+2JAahUR94zxc2JwuJr1gNNk4qP
         MxFFG/Y9rug7erm59vlKDPfUW4ct8rGA7b6RTzU+mPvStSMZp1BIyAOUWyHvo7NbVTao
         zdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mh4RgpgRlmbsACxjgOxTEdGUsihGMTa5VreivBcXnbo=;
        b=IRpMIJg+uA+R6jthlzWRxInbStVE0prrc72LffCCxk6ORbBFb2+tg55M91xKht8XkV
         +Z6X4BRbftIs/KrYOshCPtufeYL2GsLRkuG6Mj6mQ4xH0HMo7QtKTjo99T35oUEg/rLq
         VnSoRhvsRmGt1S7ko6KHQyYpnoESq/9/l2kHUo6Q7NVWUQc5+SWStKwmU5udI4T0cOML
         1APWRFdy9wHQ0W3WoeZuWVIpvo28I/iQnRIop6Brs8Rx3k/RQK7GBEZmCvSAmdm0ENXx
         jo4gch912MfZEnjNVMWl+RpNYqdgzBAeQx/JUsAUyb5e1lgaH1j45ldFRMIGNMixrB10
         o8Bg==
X-Gm-Message-State: AOAM532dCQ/8yDyxTR51RR9V4F/i2Ep1X0enjUJWph1p7YalotRyESb0
	CP8E7NDBqBNlUmDl1Is5ip/UJ0OMUKY=
X-Google-Smtp-Source: ABdhPJzDC34E7CT+pWIkkqMI+0E4aSoYXQnsselcmXUkT+RaJ2v7xxCAZS6FmJbdnMhkCb9Id/Ot1A==
X-Received: by 2002:a05:6402:195:: with SMTP id r21mr9661981edv.164.1604191466046;
        Sat, 31 Oct 2020 17:44:26 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id gb6sm5945209ejc.21.2020.10.31.17.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 17:44:25 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [gastesgarth][PATCH 01/12] gstreamer1.0: Fix reproducibility issue around libcap
Date: Sun,  1 Nov 2020 01:43:29 +0100
Message-Id: <20201101004340.4019257-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jose Quaresma <quaresma.jose@gmail.com>

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
2.27.0

