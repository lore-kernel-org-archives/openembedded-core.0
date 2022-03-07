Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F73C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 22:12:59 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.1548.1646691178228226847
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 14:12:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FfxYVmcs;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id
 bi14-20020a05600c3d8e00b00386f2897400so282882wmb.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 14:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lXPfyJKkTs7IQo5YNfwPkkjyMVIv13U5bL9o1drhths=;
        b=FfxYVmcsClqrjOXjmi4jfzdKNYrdNZV66WLYeoHrL6jwXanXMEy8KFHOsNJ6BGBSUu
         DQAxgsZLF9Q97h8kYE42DCPod5Bt/Ot8HJ9IQaKkw1qQZcU4sOqRTIlTBKHiVC9shewj
         jM2DrLCIFszZHCGNcYEUVZDGuK41x6DDkmLbtmR92D8iLXQrW+m7Hy+YBVB5Quv+Nrho
         D/sMv6+wEv49Zh+gUACDlwcOevzjnlHmie6dTeyM6dqSnhnyLiwMmj2T1VbqgSJieQCO
         Df65odw6VOMRjc7VnhxCYlhgAr42s8fSodcdAGrbyJhcfUa72j+Jrnf2E05Q6zwVu1iu
         QrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lXPfyJKkTs7IQo5YNfwPkkjyMVIv13U5bL9o1drhths=;
        b=rgFh0jI0/Z9Wel7xDibmEkSt1g+djKUZclS+ZezeE05nGIJrL7ryWtuU/LbdMcNhvp
         smtJC61pW/z9/oFXJOLrtEZgKjNEc+glTdYkKZo+9lMZG9T2p93aY7plp4cCf9RZIwFz
         HYE2/h5LIvmraB8Dp4lUoeOXgoJvFA4Z88b/eg7JSHRLdDy4U4lYmKZX3T74hZaGcCZl
         oK+CivWNnfIjpA1irERISUyPMB1Bz+xyCcVBtGc4NkCDVg0smS0HpB24LVGe+LRsBPvS
         kg4bAHWn8+bOD7tBI7CWkt0XGwqGDnR21mw8CODjuDdBNLZyvNjE7FscMJ6Gn+chyjCv
         17qw==
X-Gm-Message-State: AOAM5308OvOv92EDwWFk3V5x6Gruc8okJBK0s4s6/ShGijrceiOefMXb
	HslhY6Ih+QX/TxgoM6ckskCgI7JhTGQ=
X-Google-Smtp-Source: 
 ABdhPJy+CBdYKhE6PtinunWpsYClqAFdXFih9EYcO/yp0+CkGaEoM9F2OLeYDpopOsGh8ouyp1hbvg==
X-Received: by 2002:a05:600c:216:b0:387:d3c0:8214 with SMTP id
 22-20020a05600c021600b00387d3c08214mr938358wmi.96.1646691176407;
        Mon, 07 Mar 2022 14:12:56 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 v188-20020a1cacc5000000b00384b71a50d5sm476490wme.24.2022.03.07.14.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 14:12:55 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [PATCH v6] gstreamer1.0-plugins-bad/ugly: use the GPL-2.0-or-later
 only when it is in use
Date: Mon,  7 Mar 2022 22:12:48 +0000
Message-Id: <20220307221248.554076-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 22:12:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162867

Since all gstreamer modules uses LGPLv2.1 with exceptions
for some plugins in bad and ugly modules that has GPLv2+.

For the GPLv2+ this patch set this license only for each plugin
that is affected by by that, using the new GSTREAMER_GPL.

CC: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer1.0-plugins-bad_1.20.0.bb        | 10 +++++-----
 .../gstreamer1.0-plugins-license.inc          | 19 +++++++++++++++++++
 .../gstreamer1.0-plugins-ugly_1.20.0.bb       | 10 +++++-----
 3 files changed, 29 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-license.inc

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb
index 44532222fa..1531b68de9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb
@@ -1,4 +1,5 @@
 require gstreamer1.0-plugins-common.inc
+require gstreamer1.0-plugins-license.inc
 
 DESCRIPTION = "'Bad' GStreamer plugins and helper libraries "
 HOMEPAGE = "https://gstreamer.freedesktop.org/"
@@ -44,6 +45,7 @@ PACKAGECONFIG[dc1394]          = "-Ddc1394=enabled,-Ddc1394=disabled,libdc1394"
 PACKAGECONFIG[directfb]        = "-Ddirectfb=enabled,-Ddirectfb=disabled,directfb"
 PACKAGECONFIG[dtls]            = "-Ddtls=enabled,-Ddtls=disabled,openssl"
 PACKAGECONFIG[faac]            = "-Dfaac=enabled,-Dfaac=disabled,faac"
+PACKAGECONFIG[faad]            = "-Dfaad=enabled,-Dfaad=disabled,faad2"
 PACKAGECONFIG[fluidsynth]      = "-Dfluidsynth=enabled,-Dfluidsynth=disabled,fluidsynth"
 PACKAGECONFIG[hls]             = "-Dhls=enabled,-Dhls=disabled,"
 # Pick atleast one crypto backend below when enabling hls
@@ -69,6 +71,7 @@ PACKAGECONFIG[openmpt]         = "-Dopenmpt=enabled,-Dopenmpt=disabled,libopenmp
 # the opus encoder/decoder elements are now in the -base package,
 # but the opus parser remains in -bad
 PACKAGECONFIG[opusparse]       = "-Dopus=enabled,-Dopus=disabled,libopus"
+PACKAGECONFIG[resindvd]        = "-Dresindvd=enabled,-Dresindvd=disabled,libdvdread libdvdnav"
 PACKAGECONFIG[rsvg]            = "-Drsvg=enabled,-Drsvg=disabled,librsvg"
 PACKAGECONFIG[rtmp]            = "-Drtmp=enabled,-Drtmp=disabled,rtmpdump"
 PACKAGECONFIG[sbc]             = "-Dsbc=enabled,-Dsbc=disabled,sbc"
@@ -91,13 +94,10 @@ PACKAGECONFIG[webrtc]          = "-Dwebrtc=enabled,-Dwebrtc=disabled,libnice"
 PACKAGECONFIG[webrtcdsp]       = "-Dwebrtcdsp=enabled,-Dwebrtcdsp=disabled,webrtc-audio-processing"
 PACKAGECONFIG[zbar]            = "-Dzbar=enabled,-Dzbar=disabled,zbar"
 PACKAGECONFIG[x11]             = "-Dx11=enabled,-Dx11=disabled,libxcb libxkbcommon"
-
-# GPL - only built if gpl option is also enabled!
-PACKAGECONFIG[gpl]             = "-Dgpl=enabled,-Dgpl=disabled"
-PACKAGECONFIG[faad]            = "-Dfaad=enabled,-Dfaad=disabled,faad2"
-PACKAGECONFIG[resindvd]        = "-Dresindvd=enabled,-Dresindvd=disabled,libdvdread libdvdnav"
 PACKAGECONFIG[x265]            = "-Dx265=enabled,-Dx265=disabled,x265"
 
+GSTREAMER_GPL = "${@bb.utils.filter('PACKAGECONFIG', 'faad resindvd x265', d)}"
+
 EXTRA_OEMESON += " \
     -Ddoc=disabled \
     -Daes=enabled \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-license.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-license.inc
new file mode 100644
index 0000000000..6638f13540
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-license.inc
@@ -0,0 +1,19 @@
+# This .inc file contains functionality for automatically setting
+# the the license of all plugins according to the GSTREAMER_GPL.
+
+PACKAGESPLITFUNCS:append = " set_gstreamer_license "
+
+python set_gstreamer_license () {
+    import oe.utils
+    pn = d.getVar('PN') + '-'
+    gpl_plugins_names = [pn+plugin for plugin in d.getVar('GSTREAMER_GPL').split()]
+    for pkg in oe.utils.packages_filter_out_system(d):
+        if pkg in gpl_plugins_names:
+            d.setVar('LICENSE:' + pkg, 'GPL-2.0-or-later')
+        else:
+            d.setVar('LICENSE:' + pkg, 'LGPL-2.1-or-later')
+}
+
+EXTRA_OEMESON += " \
+    ${@bb.utils.contains_any('PACKAGECONFIG', "${GSTREAMER_GPL}", '-Dgpl=enabled', '-Dgpl=disabled', d)} \
+    "
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb
index 9b6f80aa89..3dae3d5a11 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb
@@ -1,4 +1,5 @@
 require gstreamer1.0-plugins-common.inc
+require gstreamer1.0-plugins-license.inc
 
 DESCRIPTION = "'Ugly GStreamer plugins"
 HOMEPAGE = "https://gstreamer.freedesktop.org/"
@@ -23,20 +24,19 @@ GST_PLUGIN_SET_HAS_EXAMPLES = "0"
 
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
-    gpl a52dec mpeg2dec \
+    a52dec mpeg2dec \
 "
 
 PACKAGECONFIG[amrnb]    = "-Damrnb=enabled,-Damrnb=disabled,opencore-amr"
 PACKAGECONFIG[amrwb]    = "-Damrwbdec=enabled,-Damrwbdec=disabled,opencore-amr"
-
-# GPL - only built if gpl option is also enabled!
-PACKAGECONFIG[gpl]      = "-Dgpl=enabled,-Dgpl=disabled"
-PACKAGECONFIG[cdio]     = "-Dcdio=enabled,-Dcdio=disabled,libcdio"
 PACKAGECONFIG[a52dec]   = "-Da52dec=enabled,-Da52dec=disabled,liba52"
+PACKAGECONFIG[cdio]     = "-Dcdio=enabled,-Dcdio=disabled,libcdio"
 PACKAGECONFIG[dvdread]  = "-Ddvdread=enabled,-Ddvdread=disabled,libdvdread"
 PACKAGECONFIG[mpeg2dec] = "-Dmpeg2dec=enabled,-Dmpeg2dec=disabled,mpeg2dec"
 PACKAGECONFIG[x264]     = "-Dx264=enabled,-Dx264=disabled,x264"
 
+GSTREAMER_GPL = "${@bb.utils.filter('PACKAGECONFIG', 'a52dec cdio dvdread mpeg2dec x264', d)}"
+
 EXTRA_OEMESON += " \
     -Ddoc=disabled \
     -Dsidplay=disabled \
-- 
2.35.1


