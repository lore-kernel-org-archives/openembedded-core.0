Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.1910.1626214773185261549
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jul 2021 15:19:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XmJw54P5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id j34so310261wms.5
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jul 2021 15:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CugxHVteKTrN3DnaiK4nG41IxlsdTFB22u7EayNMX1M=;
        b=XmJw54P5NZMSkkg9LS9+oaAzSqlHZ3lWu9FEaxdb9ZJONNJTPYT6FVtkWANqzuQG1W
         R9s6XdRD7uOAv7gQeH0jd3mX4/GKUbcJi2w92bVCraK8M1TVGc6us5SmJKhpgSO3zMa8
         lXO6l1OCe+1AZCIkkamO74M3+EpxCvFX2WsWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CugxHVteKTrN3DnaiK4nG41IxlsdTFB22u7EayNMX1M=;
        b=KbjUlX6wnEil5Mj3T96AYSQM91aReIWLM3RjrkjrxXwkyPRBQe5XCzPpfBruCkw+x5
         xjcx5zKGilcBke5UXLxznkZ8eNoDVaotM8lr1OjZnKjwnFQg5ty5+7k9GBdPkS9rgMfF
         5iZnYMjnBU7W6gRngrrb71ngALXTRhoiw1sw1FKoIGDkmglReFNSLBU4QBmmrJnKzRw0
         Kbzz7xnuxh+B+YYxPHJ3Ipu6vuUDhlMt7o9nx7OTQejvHtoyNEKMee0kAdoVgxy+3Ha9
         ICzy8p9zfSU4AwLmYshm0HmDK8v5zyw+SNkrLm7zD/LfDf7O++3ohPPOiuJVaO210gS1
         dJvg==
X-Gm-Message-State: AOAM532ozzKEtq8KCNzAZ1C6QLcmqEmdbFg9IVRDMpr4fO0ImMCKb8OC
	7DEXt6xMML+CfsFJ1opYyrE36KiHgBiX+g==
X-Google-Smtp-Source: ABdhPJyG1hjWvDqITYUDzMFB6rXM32GddKPolr9znjs6CJdrfPfn3wSf/gR3oFbaXsWsGU8MYT+G7g==
X-Received: by 2002:a7b:c958:: with SMTP id i24mr409283wml.177.1626214771109;
        Tue, 13 Jul 2021 15:19:31 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:bb3:54c5:c899:49e])
        by smtp.gmail.com with ESMTPSA id w22sm3649803wmc.4.2021.07.13.15.19.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 15:19:30 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3: Add a fix for a make install race
Date: Tue, 13 Jul 2021 23:19:29 +0100
Message-Id: <20210713221929.2879805-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a fix for reproducibility issues where pyc files for python-config.py
may not always be generated.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3/makerace.patch             | 23 +++++++++++++++++++
 meta/recipes-devtools/python/python3_3.9.6.bb |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/makerace.patch

diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
new file mode 100644
index 00000000000..96744cb5570
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -0,0 +1,23 @@
+libainstall installs python-config.py but the .pyc cache files are generated
+by the libinstall target. This means some builds may not generate the pyc files
+for python-config.py depending on the order things happen in. This means builds
+are not always reproducible.
+
+Add a dependency to avoid the race.
+
+Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: Python-3.9.6/Makefile.pre.in
+===================================================================
+--- Python-3.9.6.orig/Makefile.pre.in
++++ Python-3.9.6/Makefile.pre.in
+@@ -1486,7 +1486,7 @@ LIBSUBDIRS=	tkinter tkinter/test tkinter
+ 		venv venv/scripts venv/scripts/common venv/scripts/posix \
+ 		curses pydoc_data \
+ 		zoneinfo
+-libinstall:	build_all $(srcdir)/Modules/xxmodule.c
++libinstall:	build_all $(srcdir)/Modules/xxmodule.c libainstall
+ 	@for i in $(SCRIPTDIR) $(LIBDEST); \
+ 	do \
+ 		if test ! -d $(DESTDIR)$$i; then \
diff --git a/meta/recipes-devtools/python/python3_3.9.6.bb b/meta/recipes-devtools/python/python3_3.9.6.bb
index af7ed208b9c..986dfda83dc 100644
--- a/meta/recipes-devtools/python/python3_3.9.6.bb
+++ b/meta/recipes-devtools/python/python3_3.9.6.bb
@@ -31,6 +31,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Lib-sysconfig.py-use-libdir-values-from-configuratio.patch \
            file://0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch \
            file://0001-test_ctypes.test_find-skip-without-tools-sdk.patch \
+           file://makerace.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.30.2

