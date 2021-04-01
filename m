Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web09.1130.1617290954885926103
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 08:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=JvgQrawz;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.50, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f50.google.com with SMTP id s11-20020a056830124bb029021bb3524ebeso2525400otp.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Apr 2021 08:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6+EiSO0cNaX2QUDQmL7lkUwO2QOL0ev8GCrH6PE0+BQ=;
        b=JvgQrawzcLOOFddHMUySmxB2Ma0zDMeMTPGRPhmJywvulnhmY9nIe3y55gttbYl9sw
         jubZfSC5Ae3q3PnBETg57v4SwzN4TMwreMKOBQDyoGdy6M3OOuC6L0ogvdHZWqsgF9HN
         YbhUa1K9VtFZy9P5eREosKnksLzRLKE2e5z1haB5vDMnexTNBwLv09Nj6PqScOHCOIVb
         go1HlqkgcahZb4Poq11mqVC5GiazdLoIVvBxXOXJ0e4HijLpskqHS9pdRHfHng1Dnfxx
         ExQfFTeiJPxr1Ice7u4lxO2Dtl7ZMNE+6hTxLeUNKw86gCSqMgqoYzkrhc3E8qTJe0k6
         4Cmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6+EiSO0cNaX2QUDQmL7lkUwO2QOL0ev8GCrH6PE0+BQ=;
        b=Xb5BueeNzIPAARpt0YK0p/xDUu7c4Nbo+GCta4YfWA0p3jRPmgAXpaYkev3/jer8bi
         krwEO2ifhyxGLSgMGgOdbROAjRG23JXa+8rfl2eWGWAkoMu23qhnUv9pgQHzCz4Fn+nF
         Mr8TsUYXLbxQAf/RAYCB5SWO6GjDoIjurYc20qyMLWbJ0iBD18Ez5/19S3K+oV/B9a38
         cH1SEPqVJeUA2PsshSgijGA9/ch13ESa/cYvDs9LbGfOE20a8R2kKEaPWlHe148QSNMl
         UaTrqpaJL5KzOT+p30zcvLydsIdkBDJxXsOIHICqK30fnmJROp+zH56j4dYGFSPzeenC
         pZog==
X-Gm-Message-State: AOAM532eSdd4Ye8FNyFHLsLZ+GRTiprUsJlOmKXUjcySSgP0GDQvbsSS
	IRbgvyUFUqUwshGZ1WRXGQ8/tFLxl02s0beBAbA=
X-Google-Smtp-Source: ABdhPJxZyDWaXFnIy8oZEQWONkxuxMJdg7ushsWrK/3DC9N2BFqOfawWEjontqOQA3NNMHa8z1GkvA==
X-Received: by 2002:a05:6830:348f:: with SMTP id c15mr7511212otu.138.1617290953729;
        Thu, 01 Apr 2021 08:29:13 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id u7sm1159610ooq.13.2021.04.01.08.29.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 08:29:13 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/15] libtool: make sure autoheader run before autoconf
Date: Thu,  1 Apr 2021 05:27:40 -1000
Message-Id: <ac63b30ac7dce558c9de5be985c153e4617157d5.1617290310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617290309.git.steve@sakoman.com>
References: <cover.1617290309.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mingli Yu <mingli.yu@windriver.com>

autoheader will update ../libtool-2.4.6/libltdl/config-h.in which
autoconf needs, so there comes a race sometimes as below:
 | configure.ac:45: error: required file 'config-h.in' not found
 | touch '../libtool-2.4.6/libltdl/config-h.in'

So make sure autoheader run before autoconf to avoid this race.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d8451cbef5906b67756582fdfc44eb01ed3512fc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtool/libtool-2.4.6.inc                 |  1 +
 ...-sure-autoheader-run-before-autoconf.patch | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/libtool/libtool/0001-Makefile.am-make-sure-autoheader-run-before-autoconf.patch

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.6.inc b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
index 8e17b56d46..19a03d4733 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.6.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
@@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://unwind-opt-parsing.patch \
            file://0001-libtool-Fix-support-for-NIOS2-processor.patch \
            file://0001-libtool-Check-for-static-libs-for-internal-compiler-.patch \
+           file://0001-Makefile.am-make-sure-autoheader-run-before-autoconf.patch \
           "
 
 SRC_URI[md5sum] = "addf44b646ddb4e3919805aa88fa7c5e"
diff --git a/meta/recipes-devtools/libtool/libtool/0001-Makefile.am-make-sure-autoheader-run-before-autoconf.patch b/meta/recipes-devtools/libtool/libtool/0001-Makefile.am-make-sure-autoheader-run-before-autoconf.patch
new file mode 100644
index 0000000000..2e9908725e
--- /dev/null
+++ b/meta/recipes-devtools/libtool/libtool/0001-Makefile.am-make-sure-autoheader-run-before-autoconf.patch
@@ -0,0 +1,35 @@
+From dfbbbd359e43e0a55fbea06f2647279ad8761cb9 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 24 Mar 2021 03:04:13 +0000
+Subject: [PATCH] Makefile.am: make sure autoheader run before autoconf
+
+autoheader will update ../libtool-2.4.6/libltdl/config-h.in which
+autoconf needs, so there comes a race sometimes as below:
+ | configure.ac:45: error: required file 'config-h.in' not found
+ | touch '../libtool-2.4.6/libltdl/config-h.in'
+
+So make sure autoheader run before autoconf to avoid this race.
+
+Upstream-Status: Submitted [libtool-patches@gnu.org maillist]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 4142c90..fe1a9fc 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -365,7 +365,7 @@ lt_configure_deps = $(lt_aclocal_m4) $(lt_aclocal_m4_deps)
+ $(lt_aclocal_m4): $(lt_aclocal_m4_deps)
+ 	$(AM_V_GEN)cd '$(srcdir)/$(ltdl_dir)' && $(ACLOCAL) -I ../m4
+ 
+-$(lt_configure): $(lt_configure_deps)
++$(lt_configure): $(lt_configure_deps) $(lt_config_h_in)
+ 	$(AM_V_GEN)cd '$(srcdir)/$(ltdl_dir)' && $(AUTOCONF)
+ 
+ $(lt_config_h_in): $(lt_configure_deps)
+-- 
+2.29.2
+
-- 
2.25.1

