Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.89.1603837781341040903
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 15:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=eoF/VoIS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id 1so1521985ple.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 15:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=PoHKivGD7QlwRqyYrhVstu/1OAo09Y4wyXrvIpUnHvs=;
        b=eoF/VoIS5F2GG1FYRpiQy5AUA4pIsavwt2yQip7bmKTDPSxrD6Oszlyxl4gtatxexy
         XKR+WbTfjXiBby8Avdi/vlBHYNAhVbS/KX2eJfK39r3/zfprcGHr3Ce5UOuXSSVYIiMX
         Isis+ifM81D96yKtn+f4Kbt3pRjek4YseoUd2OrfswPOxJegZxdYDblNehs5DJ+/PQx5
         egrqLYj7Z/wKlYfxYgm6owi7B1+RYnjYdUI+ohKyPjHEEAij1G/t8aNanwYoNKvZF8Gm
         EI7UqaaGtIvzUeb/dEcUDsGkYDxinYsLchuonqmpU+Mx/c9cV/mUt74Kz5Sp/lWBrjHg
         e9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=PoHKivGD7QlwRqyYrhVstu/1OAo09Y4wyXrvIpUnHvs=;
        b=HRBHiM98EXlW/fvsuZU/0yVSV9yMWfNegNnQpAyy0eD+Mpa2l8UFWXLokqfIcEmzCY
         4RmHOCHEuItWTt+OkFfGYqfU6nLRDkNcFIbiCb3CRCZeRERg/Ku/7wvs7NNHlUgRAvvU
         kpCOsFhBQsP1M6fLKbw32ccJFnknBY3N+T2/mLaloFF3ZIb9R2L80VcH8E03rfSeAgUj
         QIIGz5sQNl6wwJQ07NZG9wg+JrxpVPwSh8RcflRT2s7VCVIWb4oYh3ps/HXIGd5QQVdK
         tSc9cNCshpnBYJDGuAZeXSp23Y8GaHrewn7pDQLZnsDE1hpDJaE4/xrWw1idfvdpcRhC
         LCmw==
X-Gm-Message-State: AOAM532ixv87aPMxkv4QhE7Edzy2VD2GRzp2RySZIRfDwJFYJK3bEqUs
	niqJkjc6s9el+To3utjZGfOBltO6kPoEsblY
X-Google-Smtp-Source: ABdhPJwTU7jA/C001GIGK9V9PhPr19Iz5yHebday2R7L3osVflSWtCXKqJZlLba7CFkAUIX/aMzSgA==
X-Received: by 2002:a17:902:7481:b029:d3:f038:202 with SMTP id h1-20020a1709027481b02900d3f0380202mr3757725pll.57.1603837780411;
        Tue, 27 Oct 2020 15:29:40 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b7sm3699000pfr.171.2020.10.27.15.29.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 15:29:39 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/16] gstreamer1.0: Fix reproducibility issue around libcap
Date: Tue, 27 Oct 2020 12:29:08 -1000
Message-Id: <62ecf9737c31f0128096a4c70417bca1778c73ed.1603837524.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603837524.git.steve@sakoman.com>
References: <cover.1603837524.git.steve@sakoman.com>

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
2.17.1

