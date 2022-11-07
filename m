Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C99C43217
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:56:12 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.4301.1667832970233450705
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:56:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AXYt+SO4;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id j5-20020a05600c410500b003cfa9c0ea76so1902464wmi.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BAtM41QUWjtJdXaiw6xQRfLpUJ46rSb2hWweOkHEhKo=;
        b=AXYt+SO40EYlbBUNrhZWvDp6pwUmeJzSU7P1HBtGdc2/QwsKZDfR5ia8UQVmGqOKqA
         7y9c85qAjbfbToL35bv5RSnpUKgi8lpqzFGhwvx9lrQh9HWy+9RwgVGSJEsKGBE31nCL
         qkOuyonIOJXeQqsVdaqV81DIdx7V9N+Dt7WoST662Aq2yEkm62A89uFB92lO0Pg5SdJ+
         kwgm+WUY/jX7Dh79ojr6/Hm4hanPrF5Wdq5maz3r+GFcPzfEvs0R9vGeucg8XsesdBVl
         ygwSxYqsqeq4SengN1kHUoD/C3JrccSNGT6ESzLffbqcQja3uLOe7OTHIkdOABqax8n1
         y2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAtM41QUWjtJdXaiw6xQRfLpUJ46rSb2hWweOkHEhKo=;
        b=0k5LDMIzxAfzrA4dSAaThAeb+1epirCJjei3oJhGSXxCquS6UPpigYtueJRhsP+Z1Y
         mz2NbA6VSuGa6RSB+/tNaVKrklT8EbCMunqSSkX15KTpLjhZ4PJ8edJdxmUeLj88Pvx6
         XGGmffEgnASKA12ANjNgxBt1sEg0nD9XstXv1lVHwmHt3FSrc6/tDQqSRtaK25HJhWWy
         D+PRjD3wk2CGKs8MExmQ2VgqW1iJsW4ksrQxhG4DCNN8oCvOoJcU6e/vEyFDKEWkuTFj
         6YLfvDzVYJL3tm11UgWTu2ySmkiZ1fIMaz1ebRUqWH35Ts8ygds5+UfEA/8mWA5YQCGl
         Sfog==
X-Gm-Message-State: ACrzQf2ZErsBxSUQG9k5CLMkQyd+n/5VHRXZyU0l8P9VsefGAmosJY/g
	ZmcPZvX3zqGFw5hwb+teRRH+PKWTDho=
X-Google-Smtp-Source: AMsMyM7ip49MF04Qjk4wk13wUl5LWhxAM1exevv6Wk+Qsc30vbi43WA3k1f3bsA1LmCGI63YwEpwbA==
X-Received: by 2002:a05:600c:654a:b0:3c6:f83e:d142 with SMTP id dn10-20020a05600c654a00b003c6f83ed142mr33006430wmb.147.1667832968660;
        Mon, 07 Nov 2022 06:56:08 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:56:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 48/48] python3targetconfig.bbclass: use PYTHONPATH to point to the target config
Date: Mon,  7 Nov 2022 15:55:08 +0100
Message-Id: <20221107145508.1051404-48-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:56:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172898

There is no need to patch native python so that it looks in the target
sysroot; the same can be achieved with just an environment variable.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python3targetconfig.bbclass               |  1 +
 ...fig-append-STAGING_LIBDIR-python-sys.patch | 28 -------------------
 .../recipes-devtools/python/python3_3.11.0.bb |  1 -
 3 files changed, 1 insertion(+), 29 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch

diff --git a/meta/classes-recipe/python3targetconfig.bbclass b/meta/classes-recipe/python3targetconfig.bbclass
index e5187bb459..5b6356b674 100644
--- a/meta/classes-recipe/python3targetconfig.bbclass
+++ b/meta/classes-recipe/python3targetconfig.bbclass
@@ -12,6 +12,7 @@ DEPENDS:append = " ${EXTRA_PYTHON_DEPENDS}"
 
 setup_target_config() {
         export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
+        export PYTHONPATH=${STAGING_LIBDIR}/python-sysconfigdata
         export PATH=${STAGING_BINDIR}:$PATH
 }
 
diff --git a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
deleted file mode 100644
index 45a37ed1a9..0000000000
--- a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 9c6b9f46179c8f9c9391767e2b02f268a1ee7a9c Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 31 Jan 2019 16:46:30 +0100
-Subject: [PATCH] distutils/sysconfig: append
- STAGING_LIBDIR/python-sysconfigdata to sys.path
-
-So that target configuration can be used when running native python
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- Lib/sysconfig.py | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
-index ff399e2..95844cf 100644
---- a/Lib/sysconfig.py
-+++ b/Lib/sysconfig.py
-@@ -528,6 +528,8 @@ def _init_posix(vars):
-     """Initialize the module as appropriate for POSIX systems."""
-     # _sysconfigdata is generated at build time, see _generate_posix_vars()
-     name = _get_sysconfigdata_name()
-+    if 'STAGING_LIBDIR' in os.environ:
-+        sys.path.append(os.environ['STAGING_LIBDIR']+'/python-sysconfigdata')
-     _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
-     build_time_vars = _temp.build_time_vars
-     vars.update(build_time_vars)
diff --git a/meta/recipes-devtools/python/python3_3.11.0.bb b/meta/recipes-devtools/python/python3_3.11.0.bb
index 7bfe7b2713..b2c209ecf5 100644
--- a/meta/recipes-devtools/python/python3_3.11.0.bb
+++ b/meta/recipes-devtools/python/python3_3.11.0.bb
@@ -36,7 +36,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
-           file://0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-- 
2.30.2


