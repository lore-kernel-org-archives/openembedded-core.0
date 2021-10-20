Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA4DC433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 18:57:31 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.1847.1634756250330423840
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Oct 2021 11:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=py5zhlIu;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id m14so3731736pfc.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Oct 2021 11:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0ks90K9MwaBKtR2HRJyctyE/Lk8KVxLKDC4L8a91Eb0=;
        b=py5zhlIu8MT6f2knUNgI/YR1JfYiVraoxJKcaA7Ow0TCz5uT7IOvak/ua8tgrdW/X1
         tTqoJKsjY99zvcYWZYWiOIB3hZWX9dCIi3ccXPUglsiVX7T6qi7u9c7IqZ4GdGFlewuW
         vDEBicXA8BQk3PBmd7mb1GHQUJMn1aWMHJ3KEjSZhyY5Iwadq8uQ8qtZ0M58fv4wD9a+
         xvh5Rc+WK6s2R2kQ4ExwAwdPXjX0tNjcEe4T+Fj88q2AUUcrEzLqtoDLS7LBhggTqjOP
         LYcoRCq0RdlWvUNdoUYsGnUEpVZkVjT6s5ndjcP8WNtr19d2Y6gknoJ2JIGmq1bDrV3L
         R87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0ks90K9MwaBKtR2HRJyctyE/Lk8KVxLKDC4L8a91Eb0=;
        b=42+Zg5a75cZj6hQfGoVtWAFunb4TbSVeoRYgGxU7wYd/MqCmFMPuThVTtOGL6MmS0J
         RmM6K5VOpG4U1xocNthjjtxqk0hGQLCGYs7+h3K+CgKvILYiCDINehURPjgKsXMVPv7K
         zCn+gkkHJZa2eKCnQqe+7K9YmxfYWmhB1XN3+C/bVXUXozLQVZRyiKpxIGAskD0oNn/A
         biaVpfAFCbuuQ10qf0qQ/ILY2nYFu4AY+eOgMjb5Lnm/Ig+PZMy1uOMERPi8iutzAN9I
         UuenY4z1TU72VlwJFWftPxw0L1zm78hlZKFa8a1bZV7DOP0QqkhAJlPb9DBJ936gaaOa
         WheQ==
X-Gm-Message-State: AOAM532ZVudAGTEvMkINqidcy7ptXhXDOM76faPZ22necKi61t8vKX34
	HYD1kkMtpFZBQIAEI7tCcys04spej/k=
X-Google-Smtp-Source: 
 ABdhPJy8CBDBBauJc6xYDIM2kwvG0+YKKsunFmPHT0jwJtgfkH7DALR40Ae7y5DI6mc4UzDDGrQNTg==
X-Received: by 2002:a05:6a00:21c2:b0:44c:fa0b:f72 with SMTP id
 t2-20020a056a0021c200b0044cfa0b0f72mr732382pfj.13.1634756249419;
        Wed, 20 Oct 2021 11:57:29 -0700 (PDT)
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830::17e1])
        by smtp.gmail.com with ESMTPSA id
 q8sm6714206pja.52.2021.10.20.11.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 11:57:28 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 1/2] python3-setuptools: _distutils/sysconfig fix
Date: Wed, 20 Oct 2021 18:57:24 +0000
Message-Id: <20211020185725.2566453-1-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Oct 2021 18:57:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157267

Add patch to append STAGING_LIBDIR python-sysconfigdata to sys.path so
that packages which set SETUPTOOLS_USE_DISUTILS='local' cross-compile
properly with python3-setuptools-native.

Fixes:
ModuleNotFoundError: No module named '_sysconfigdata'

References:
https://setuptools.pypa.io/en/latest/deprecated/distutils-legacy.html#porting-from-distutils

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 ...nfig-append-STAGING_LIBDIR-python-sy.patch | 34 +++++++++++++++++++
 .../python/python3-setuptools_58.2.0.bb       |  5 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch
new file mode 100644
index 0000000000..565cf8ae8d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch
@@ -0,0 +1,34 @@
+From 44349672cbff8945693c8d2821c82e9f04bfc8b5 Mon Sep 17 00:00:00 2001
+From: Tim Orling <timothy.t.orling@intel.com>
+Date: Wed, 20 Oct 2021 17:38:10 +0000
+Subject: [PATCH] _distutils/sysconfig: append
+ STAGING_LIBDIR/python-sysconfigdata to sys.path
+
+When python modules set SETUPTOOLS_USE_DISTULS='local', this uses the
+vendored _distutils in setuptools rather than distutils in the Standard
+Library. This is needed so that target configuration can be used with
+python3-setuptools-native.
+
+Based on python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
+from Alex Kanavin <alex.kanavin@gmail.com>
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
+---
+ setuptools/_distutils/sysconfig.py | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/setuptools/_distutils/sysconfig.py b/setuptools/_distutils/sysconfig.py
+index 8832b3e..bbc7c08 100644
+--- a/setuptools/_distutils/sysconfig.py
++++ b/setuptools/_distutils/sysconfig.py
+@@ -461,6 +461,8 @@ def _init_posix():
+         platform=sys.platform,
+         multiarch=getattr(sys.implementation, '_multiarch', ''),
+     ))
++    if 'STAGING_LIBDIR' in os.environ:
++        sys.path.append(os.environ['STAGING_LIBDIR']+'/python-sysconfigdata')
+     try:
+         _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
+     except ImportError:
diff --git a/meta/recipes-devtools/python/python3-setuptools_58.2.0.bb b/meta/recipes-devtools/python/python3-setuptools_58.2.0.bb
index 0a05ac6079..b37c44854c 100644
--- a/meta/recipes-devtools/python/python3-setuptools_58.2.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_58.2.0.bb
@@ -8,7 +8,10 @@ inherit pypi setuptools3
 
 SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
-SRC_URI += "file://0001-change-shebang-to-python3.patch"
+SRC_URI += "\
+    file://0001-change-shebang-to-python3.patch \
+    file://0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch \
+"
 
 SRC_URI[sha256sum] = "2c55bdb85d5bb460bd2e3b12052b677879cffcf46c0c688f2e5bf51d36001145"
 
-- 
2.30.2


