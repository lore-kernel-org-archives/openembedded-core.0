Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4131FC43217
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 20:21:30 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.2043.1668025282637371389
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 12:21:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nBJnXM1r;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id t1so11620606wmi.4
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 12:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTUmBrzO8EMtoSKtYMDhnELN8b+oGDsf7XaFjxk4Dwc=;
        b=nBJnXM1r5JPZVs1ezyKhOoUasTaQcadhMBCTchj36oZA8iGCAuiSQotAIRUrvCK/gW
         4EtnCeaQkufCoj/q4qhHiOCMtQ/MYtLado68oYHttwu81KH59fN6y2W/KW8AIVo3abAk
         cWvNKbIlP6+pJfJXd0zWUauIvy3FlaONB20VVpsxOWREXd4Q6OehnQU3uPmm322KN+dn
         MGE6BEZUb0ZeWCdw/MLNlEzo1iQcRypmex9MBzynm9ijefCtiZIoccZvXueyuxzIBZ1G
         CM7lNLbhbZN0rGWBkSBfxsu/BG+9J2OAg0WKxCTV8NZm7bIYXgCTnVMyM8tzKHVPzdev
         E7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vTUmBrzO8EMtoSKtYMDhnELN8b+oGDsf7XaFjxk4Dwc=;
        b=laVda5NnWLq2Xt3ybqu5H1WODNJTxoHE4NkD86iY9bNb9AvC3mFwr+tXEbLIF32oS2
         0+7V+5j4W06Tq+nLMnjjlXZyFK6WuROTMn/Q+Ub+r8eRF4MIVTh1PjhEGQtJZmAFcGQm
         d9CEA5xVwnrr6hI8NUnALzlgMCJ7UbHiN8LJEabV1IKZ0fUPmMtG7jdo3uKl9WXr6FL8
         Qmq4LTnHwNwWyjuXLL9wZU9j6Jp4zuTML3DdPh/t4eJa7RCw+Sccsl9FnAA/bnQyYu9Y
         R5E1W/x6wwVClY7OytsPwIHJDuyOU75AUWZrzD0SXQKbC/xGv9zmAOh9F+yGxtwSb0Pv
         A0xg==
X-Gm-Message-State: ACrzQf26SWj6a5bT/2RbEjI01aPKwf5xjIv93CH4VvxZ61t2RTRR3ia3
	VMIZlYSu+mALV9Wamjgv8ZjwFdn+B9E=
X-Google-Smtp-Source: AMsMyM4S9kSD55W37QENZHEYU49luhjhzkmireJSK7Ymv366JL8Od8txEIlLujsFh5OQeRQhYPcEmA==
X-Received: by 2002:a05:600c:2d05:b0:3cf:8e60:c223 with SMTP id x5-20020a05600c2d0500b003cf8e60c223mr22563675wmf.188.1668025281063;
        Wed, 09 Nov 2022 12:21:21 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m3-20020a05600c3b0300b003b4ff30e566sm4168055wms.3.2022.11.09.12.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 12:21:20 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 3/5] python3targetconfig.bbclass: use PYTHONPATH to point to the target config
Date: Wed,  9 Nov 2022 21:21:10 +0100
Message-Id: <20221109202112.2035727-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221109202112.2035727-1-alex@linutronix.de>
References: <20221109202112.2035727-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 20:21:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173053

There is no need to patch native python so that it looks in the target
sysroot; the same can be achieved with just an environment variable.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python3targetconfig.bbclass               |  1 +
 .../classes-recipe/setuptools3_legacy.bbclass |  2 +-
 ...fig-append-STAGING_LIBDIR-python-sys.patch | 28 -------------------
 .../recipes-devtools/python/python3_3.11.0.bb |  1 -
 4 files changed, 2 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch

diff --git a/meta/classes-recipe/python3targetconfig.bbclass b/meta/classes-recipe/python3targetconfig.bbclass
index 02fdb0c03f..22305fe176 100644
--- a/meta/classes-recipe/python3targetconfig.bbclass
+++ b/meta/classes-recipe/python3targetconfig.bbclass
@@ -12,6 +12,7 @@ DEPENDS:append = " ${EXTRA_PYTHON_DEPENDS}"
 
 setup_target_config() {
         export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
+        export PYTHONPATH=${STAGING_LIBDIR}/python-sysconfigdata
         export PATH=${STAGING_EXECPREFIXDIR}/python-target-config/:$PATH
 }
 
diff --git a/meta/classes-recipe/setuptools3_legacy.bbclass b/meta/classes-recipe/setuptools3_legacy.bbclass
index 21748f922a..57de956d0a 100644
--- a/meta/classes-recipe/setuptools3_legacy.bbclass
+++ b/meta/classes-recipe/setuptools3_legacy.bbclass
@@ -49,7 +49,7 @@ setuptools3_legacy_do_install() {
         install -d ${D}${PYTHON_SITEPACKAGES_DIR}
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
-        PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
+        PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR}:$PYTHONPATH \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
         build --build-base=${B} install --skip-build ${SETUPTOOLS_INSTALL_ARGS} || \
         bbfatal_log "'${PYTHON_PN} setup.py install ${SETUPTOOLS_INSTALL_ARGS}' execution failed."
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
index 4760895e9f..94f01af83a 100644
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


