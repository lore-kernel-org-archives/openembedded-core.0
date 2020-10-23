Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.1027.1603478624336188465
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2020 11:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TsbuATQ9;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id k18so2977264wmj.5
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2020 11:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iGVw+rb5f6LVHE8ymdEhXpWrtz2zMn4xHMqL/Ulwhb4=;
        b=TsbuATQ9YnvvInkAInjKdBIULB/78SmQ8ce7ZciMb2glQF4Wj0/8L7dzcZABwsGYlc
         5Q/tHWjGp2QHPl2vH448RkgYqoIwe0h+41kwXfI0lp909a+SMrfuYzlbYTT7KfpFjYp9
         Pz7x3yS/OXze/xPQ0WTL/3JiHgI3fXzDFLUQYjYCWhuLBEpFqz8G028rmZatRQzFkWSs
         GSp1+QhYVtjQyaseG9TBa5oXc/Ir0yx6N1+FAr58jUZtj6VMcZWMzja7OVnYp5TEZ7NC
         iaLpJvlwX1UZLorkJpa6qiaok1ncp95OOGXegO5Z0ZQ17V3jRMsIuNPjQrh5FauTntrt
         SwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iGVw+rb5f6LVHE8ymdEhXpWrtz2zMn4xHMqL/Ulwhb4=;
        b=RbWncBxzbRc1w2Zqv/Gza+G03olvb5DVx7WWv6xradhca7nAvlHphA/Ltdyb/0KzTE
         YHl9H26s/23q23AwGmb29TA9y5e8Jr8kQsSTnI1Rhm6eC47AwNM00PKLHeyPA7m64yl3
         OgUOyVKgXxyUvug4Ra7WWxdjkPC3Le+dO6jCTZX7Sww/YqYqXiBKv9GGEegoNfgzRatR
         dBDoAdOPD+4xpP1Na8JUwDlvLWi8BA/D+/SUP0eWEzDULf43+L8VmAnNPSEW4W25j+MQ
         uWQh2XgIWP5CuY1peFtAysUylZ6RtzFvNvDomFyjRvMG4SdoEnS/8TpT2Qiubm1o+lAb
         /G9A==
X-Gm-Message-State: AOAM532RWNtEYZKuxU20c3ZIMv6ln/1WmFWSca9K3V6v5pBbgFtqyT2T
	hDUCxBOyAeiReMQSvjNe6244blPxJt8MNw==
X-Google-Smtp-Source: ABdhPJy1zDXrY5NCCqhHK1DH97b7mjgHmOHz3kxgv259zqWq0yC2NQvEPpKtbQiJ8jFTDdwA/2iYEQ==
X-Received: by 2002:a1c:e455:: with SMTP id b82mr3024810wmh.47.1603478622667;
        Fri, 23 Oct 2020 11:43:42 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id b7sm4999302wrp.16.2020.10.23.11.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 11:43:42 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4 02/21] gstreamer1.0: Fix reproducibility issue around libcap
Date: Fri, 23 Oct 2020 19:41:13 +0100
Message-Id: <20201023184132.3208737-3-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201023184132.3208737-1-quaresma.jose@gmail.com>
References: <20201023184132.3208737-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently gstreamer configuration depends libcap and on whether
setcap is found on the host system.

Removing libcap from DEPENDS and only use it when the 'setcap' is enabled.

    * 0004-capfix.patch
      Removed as the same goals can be achieved only with the PACKAGECONFIG 'setcap'

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0/0004-capfix.patch  | 48 -------------------
 .../gstreamer/gstreamer1.0_1.18.0.bb          |  4 +-
 2 files changed, 2 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-capfix.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-capfix.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-capfix.patch
deleted file mode 100644
index 32e9610cff..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-capfix.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 9607e9858d681f5ad2e1677f5dbbb1fb61bd8846 Mon Sep 17 00:00:00 2001
-From: Jose Quaresma <quaresma.jose@gmail.com>
-Date: Sun, 18 Oct 2020 10:40:59 +0100
-Subject: [PATCH 4/4] Currently gstreamer configuration depends on whether
- setcap is found on the host system. Turn this into a configure option to make
- builds deterinistic.
-
-RP 2020/2/19
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Pending
----
- libs/gst/helpers/meson.build | 7 ++++++-
- meson_options.txt            | 1 +
- 2 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/libs/gst/helpers/meson.build b/libs/gst/helpers/meson.build
-index 9e5a4ae..c2e540f 100644
---- a/libs/gst/helpers/meson.build
-+++ b/libs/gst/helpers/meson.build
-@@ -66,7 +66,12 @@ if have_ptp
-       description : 'getifaddrs() and AF_LINK is available')
-   endif
- 
--  setcap_prog = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap', required : false)
-+  setcap_feature = get_option('setcap')
-+  if setcap_feature.disabled()
-+    setcap_prog = find_program('dontexist', required : false)
-+  else
-+    setcap_prog = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap', required : false)
-+  endif
-   cap_dep = dependency('libcap', required: false)
- 
-   # user/group to change to in gst-ptp-helper
-diff --git a/meson_options.txt b/meson_options.txt
-index 346c423..03338ad 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -25,6 +25,7 @@ option('libdw', type : 'feature', value : 'auto', description : 'Use libdw to ge
- option('dbghelp', type : 'feature', value : 'auto', description : 'Use dbghelp to generate backtraces')
- option('bash-completion', type : 'feature', value : 'auto', description : 'Install bash completion files')
- option('coretracers', type : 'feature', value : 'auto', description : 'Build coretracers plugin')
-+option('setcap', type : 'feature', value : 'auto', description : 'Use setcap')
- 
- # Common feature options
- option('examples', type : 'feature', value : 'auto', yield : true)
--- 
-2.28.0
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.0.bb
index 8f7dfc6079..d382655bcb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.0.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
 SECTION = "multimedia"
 LICENSE = "LGPLv2+"
 
-DEPENDS = "glib-2.0 glib-2.0-native libcap libxml2 bison-native flex-native"
+DEPENDS = "glib-2.0 glib-2.0-native libxml2 bison-native flex-native"
 
 inherit meson pkgconfig gettext upstream-version-is-even gobject-introspection
 
@@ -36,7 +36,7 @@ PACKAGECONFIG[unwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
 PACKAGECONFIG[dw] = "-Dlibdw=enabled,-Dlibdw=disabled,elfutils"
 PACKAGECONFIG[bash-completion] = "-Dbash-completion=enabled,-Dbash-completion=disabled,bash-completion"
 PACKAGECONFIG[tools] = "-Dtools=enabled,-Dtools=disabled"
-PACKAGECONFIG[setcap] = "-Dsetcap=enabled,-Dsetcap=disabled,libcap libcap-native"
+PACKAGECONFIG[setcap] = ",,libcap libcap-native"
 
 # TODO: put this in a gettext.bbclass patch
 def gettext_oemeson(d):
-- 
2.29.0

