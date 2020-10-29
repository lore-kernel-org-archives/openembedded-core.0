Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.9658.1603981692144438652
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 07:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lc/zOXM4;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id n18so2998420wrs.5
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 07:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dWs0jBn0e3YGmUPnTKyW+Doe+kpSdVtCr0QzH6QWOTs=;
        b=lc/zOXM4kjFoT6/GStcMuyKRSL6UyOlKJDLJ1jBXcfoVBU844Q6GYJ5xSdQP6Ditpl
         3KHk/ViycRFVApOD/Dr+2or+r9zLvAvKFeCXue2UxW1BZKeo0n46fLAF7vWNGYkkNbh6
         I1FVMWUkzg6Bv2Cdjs+5UT5hZxq/uePG2oNCP1uprAiF/sBM6ND4JbD6hQpOA/r2X7Wa
         6JLdpE32fz1oh8hwqrxwT5cfPJJlulUql+U3HuYAEtUjJheHkRipDKzc3SVNTf9NwlBi
         5ukYptSxQTwO8vK6FajKzEoaT9XkLup7mj4XdwTvR70p1MkQ+JDm4tfTq8f8ffGVXHWr
         Ly6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dWs0jBn0e3YGmUPnTKyW+Doe+kpSdVtCr0QzH6QWOTs=;
        b=OFq2UfjSpg4IzCoYVZS6zYAWmCenzbePHDuyMRJ9zOwFLCcuJNDBt9TjebU+WxWr3j
         UhsQdXz+0eYKwosLFugsjRWOA+kUsz7QU6vCFKeptu2Y4G2Bsmwtq7l0UEGeeuxqR4ca
         iElig1+8b7qKXoMbmXdtTRWlyQtIjzvBP8YxIu/fOkRIXT8aIMGpmKsnR6KiThf5jN0v
         bkekmxUrVhXO/NBa7g/yexNsUZUHZMvnLyC7BdVuqXTbHKA0ulYxvbBMkyqbIubqfkQr
         G+tPAZFtMhGq/IYAEuWw3jfGgp/7LL827VMNQdvCfkUJqjaMQDRSfxxFqKsi9p2zEJmQ
         6wmw==
X-Gm-Message-State: AOAM533zljfxrWDFxreg2YIdRrvALT9yF8cwba6qt754ZwZu5ko2TEj2
	ii3yBdUSyUDjiiO5wl1YeIWzZe2aJ+f5+Q==
X-Google-Smtp-Source: ABdhPJy81ewRsU1G9QLnbPFRV33xhTAy4ZkPhakZ5goH8NUE3pzCBYWNN0SfTLj/dxqM0a+9CRSaSQ==
X-Received: by 2002:adf:f4ca:: with SMTP id h10mr5826342wrp.89.1603981690350;
        Thu, 29 Oct 2020 07:28:10 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id y4sm5404803wrp.74.2020.10.29.07.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 07:28:09 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v5 01/22] gstreamer1.0: Fix reproducibility issue around libcap
Date: Thu, 29 Oct 2020 14:27:45 +0000
Message-Id: <20201029142806.1830504-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201029142806.1830504-1-quaresma.jose@gmail.com>
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently gstreamer configuration depends libcap and on whether
setcap is found on the host system.

Removing libcap from DEPENDS and only use it when the 'setcap' is enabled.

    * capfix.patch
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
2.29.1

