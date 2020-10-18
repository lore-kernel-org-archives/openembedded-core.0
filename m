Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.18902.1603023022936880519
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2020 05:10:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bssW2scL;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id s9so8299755wro.8
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2020 05:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qp3ApZNwdVyNrZVWbK/1tGppYB+FMHe7qlfaOG0HmF4=;
        b=bssW2scL/GOGfMc1az6Lv28fs20LmB0jVQOG0L8oY11GwjhjFLeCRQQEBfkUB+2Kft
         aCVjSw0K5UY7SY8vB7V7uxZcf/VSJ9cbn5a9ptWFht7i0S4k5NTNNT1L2xaJaXc/7F8g
         g+LWcWmMqEaPcMd0qJgkFXb5Wp3OJKlLI5jdvAqDmc7ppI61mJ7HS7JfwfqEo6lSP6LW
         vIO7UhPfV9XtSJ9hkM2n3Q3z3mkPzf+D+nEg7t9ux3weXaLV4LqpvKLtX1alihrLbftV
         45HAAkwOwWmlkM9UTXEvfUXhtOp3cUL/ZFJUMqRb3Q64IDIES2SXataObPnmX9/tupK2
         9bIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qp3ApZNwdVyNrZVWbK/1tGppYB+FMHe7qlfaOG0HmF4=;
        b=AkoUERl4d33XOqcVUN/YgEAnBQIkf6qwdq0gwCMq+LcR/tM5weiucifWA0p5F8in3F
         HKU5PMnS/Juiw4timc+MLzOMc7tU1A9K8Dh8ojA45wsyFgbBVczkE1CfzECNxRbTr+mV
         aXdCc5gWgrs6M2raebTs/nJNuwQCES28eOqFGQG7hG76Dm4EkPebmcJqrwW48BJVn7X3
         YQ1frREeF80y10p8stA7PF8lANs+xffeVQaWXelp0wTTGL2WIDBbJLcpzpVhzhTN4jvH
         CDMoCk9AIdgQda9t4K2CJbvAQ+WQz1Cs1IuIuDdFLWtvwVeRtMjyM698v9xow3Ch8pEB
         8SSQ==
X-Gm-Message-State: AOAM531z6JpjCxdJQXQrjCQwF+OjqSXUbnOmfXKBwdzIn0WWjz0rx5Ua
	gCkurybouobRb3pM9XQ04hHPH9MjVS62cw==
X-Google-Smtp-Source: ABdhPJyu32CieLyi2m42ztfUWZo4OsiLBi2WNaiVq8UowRn8hdjoNqyOYiAvBqYpdm6wZClk1wcdAw==
X-Received: by 2002:adf:e38e:: with SMTP id e14mr9233257wrm.168.1603023021026;
        Sun, 18 Oct 2020 05:10:21 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id z18sm9511084wrs.82.2020.10.18.05.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2020 05:10:20 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v3 02/20] gstreamer1.0: Fix reproducibility issue around libcap
Date: Sun, 18 Oct 2020 13:09:44 +0100
Message-Id: <20201018121002.1417335-3-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201018121002.1417335-1-quaresma.jose@gmail.com>
References: <20201018121002.1417335-1-quaresma.jose@gmail.com>
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
2.28.0

