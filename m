Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.1039.1588696766279326913
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 09:39:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s8Lynctf;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id w4so2634427ioc.6
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 09:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=+RJw18MznXg7csZXREsxs9aWz0ypsMalbc3YWLAc9W4=;
        b=s8Lynctfhu0e9sytHU+BQywtjxoPJZK6JeGZxfc2pjMV/gPBPRS6imwEJXL+ijs4PR
         kgyDfs682Aj6n40dvXxpPMKkf4DTH86i3Cu17N6Erj66iRrfKj8RH82OWQd/UPvX6hj+
         UFAQqL3xGFz6RWRw4XfWxrHiSWhhWBCAd4U3tAUlb91fkCUJ57TUH78IZVcLx9MNdjPZ
         3gtYgW8gwMaahRpBkC+uq4RxHnw9SWgKIhZMlduTufSKMpBnRXyztrFuUdabafE56EW7
         6RHo7MbYJNqtESi/G9S4Lf9GiYypkJLOD4FYKkkqSzyBoStQB5h23wlbI5Imz8hzUeK0
         pTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+RJw18MznXg7csZXREsxs9aWz0ypsMalbc3YWLAc9W4=;
        b=eC7YwN9eicb1CsXaYuH/hysuzPa/00C/2I+Iy3AQRJapLUfAUHn4p9jfJAqSXHvIwy
         YiaUwlx9WhPSmwAaYcl1Vbf+ilvZvvsT5+dOoAjxxUEJ7FFbPn8IeK41hPb777oe/uVX
         xslCxSWHdtzh3dilceeGyPQuCCgmq6Uv7EEo5z8yI6faLRGu9MgOaywtbVogr4LJkjB3
         H+VyqHBZZAT+5/tWBKXTG9I17lbFnnAqFnlIqY/RwYzAjD/PNFH1M2KtjOJYKgbqS0pO
         +0OLNctbS03XswkuWGM+GjYRCt+lrc9fiauAQW3mgfxl/GO7OrRGxVrLjh1teHAPOr4A
         mgfQ==
X-Gm-Message-State: AGi0PuYMSz1QqPjan1ivuMFBsFhWBXEhfO13oC3NHyxSWrYbhmYdmoc0
	eH1FeT430t/9G1mFKDM2xLz/NK1h
X-Google-Smtp-Source: APiQypJwBZtPSUr0xV11KSShVCW/zYq1yFidpq7771aSu2tj0+FCm+KBtIsogRN13H+I5nolL0c3Yg==
X-Received: by 2002:a6b:7d4a:: with SMTP id d10mr4322758ioq.70.1588696765380;
        Tue, 05 May 2020 09:39:25 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:3d8f:d2ff:4011:cd1a])
        by smtp.gmail.com with ESMTPSA id u4sm1727293iop.1.2020.05.05.09.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 09:39:24 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] bitbake.conf: Prevent git from detecting parent repo in recipe
Date: Tue,  5 May 2020 11:39:10 -0500
Message-Id: <20200505163910.8822-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1

Prevents git commands run in a recipe from moving up past ${WORKDIR}
when searching for a .git directory, and thus prevents them from
detecting the parent OE-core .git directory. Fixes several
reproducibility issues where recipes would use the OE-core version as
the recipe version due to git walking up the tree.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/conf/bitbake.conf | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 4b544a22cd..bdade79abe 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -718,6 +718,10 @@ export PKG_CONFIG_DISABLE_UNINSTALLED = "yes"
 export PKG_CONFIG_SYSTEM_LIBRARY_PATH = "${base_libdir}:${libdir}"
 export PKG_CONFIG_SYSTEM_INCLUDE_PATH = "${includedir}"
 
+# Don't allow git to chdir up past WORKDIR so that it doesn't detect the OE
+# repository when building a recipe
+export GIT_CEILING_DIRECTORIES = "${WORKDIR}"
+
 ###
 ### Config file processing
 ###
@@ -878,7 +882,7 @@ BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DI
     WARN_QA ERROR_QA WORKDIR STAMPCLEAN PKGDATA_DIR BUILD_ARCH SSTATE_PKGARCH \
     BB_WORKERCONTEXT BB_LIMITEDDEPS BB_UNIHASH extend_recipe_sysroot DEPLOY_DIR \
     SSTATE_HASHEQUIV_METHOD SSTATE_HASHEQUIV_REPORT_TASKDATA \
-    SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE"
+    SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE GIT_CEILING_DIRECTORIES"
 BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SSH_AGENT_PID \
     SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_EXTRAWHITE DISABLE_SANITY_CHECKS \
     PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_INVALIDCONF BBINCLUDED \
-- 
2.17.1

