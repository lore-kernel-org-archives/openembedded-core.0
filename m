Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B0ACDB46B
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 08:18:10 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38583.1782116282507010311
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 01:18:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=YV1+V3wQ;
 spf=pass (domain: konsulko.com, ip: 209.85.221.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-462cdb88d01so2677605f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 01:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1782116280; x=1782721080; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kM/jlj8gRBxXuOOtVYA1MIzr9lLGh/xZD4tYieV5NGc=;
        b=YV1+V3wQfOWzTj8Q4EFojXCHJXaTbtnTW7S0myUMNotb71sNag3nZj1zHVV9/PsetB
         4UDkQTHJi7xs77B5K42dwKUr3OV4Hwtd5zgJIkSyoTIHbGM1QRBHYx29Xus2oIoNSF0X
         N5B8emXOgBEJQTgToq2bPc6gSLmaukWDLxgxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782116280; x=1782721080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kM/jlj8gRBxXuOOtVYA1MIzr9lLGh/xZD4tYieV5NGc=;
        b=RCp4cv8O13M3L01wBYHY2qupww2WAdp5zzr9ndfk3pM4DgDwxMd5KwdUeg5I7G2fta
         44fw7/7+e5SLPrsKtB9TGECP4WbcATO8/JU2TRngaSVujez+9gaQCrFurRvPfEww9zzt
         M9DEiG61toVk2YzR5vQB/UB6/bwZu2x0nLtIROVQxT0fCERRP4kvtQMORGOZk+wqNx/h
         vOsG8UY7ArVAQ3DKxUI0kj69QtFKnbtotCGGHDboUwsXOjw3kJqLZwUS3Aafr3b8sXEA
         p1tUaVhm5WgBBhzvlHObI9xLEtadLO5RNyqXiZrUOMZ13GoV8l8uVYmmh430p00Zs5L9
         idfg==
X-Gm-Message-State: AOJu0YwjqM5gKy3YNSVDrdeXTKmV/phvlAj3/iNTRqhDAGfuhJ/QA542
	jchPCp7mvjvPPb6Do+sLKLXCm4kvifQsLDAkcMdtUWQVnKBn8+eqMR068/muJqLYKSJxVAZNsPz
	NxTrv
X-Gm-Gg: AfdE7clpf66CUcpNxKJ6li+Zi58J0yS/KI0JpH9xSEh9Bq8HvsEz+y6u1O0Xo1OB19+
	kkKZ/OD4vKuhgK6IFt7HuCdo9+3DTdaBTZPnHzMfvpj2oFEVEaYrokGQ/gQoeefOpxPdNARfKQj
	cuXMUl4A8oV05hskFqkdC81nioLF7qmU4DpclzEOQTS/q6rFMFkPbXCXH2zBMi/mYiMa0CMqGG5
	SCarKQpdAbWlrMeU1bwdmR8UH4d62fJdfe+Duc/vsTIKUK+AVPlRG6CNSjreg9y4J1UOlI8b7h4
	WaJSzx36VEqJG6QrtphsBpRN5U8qUK8T9H7JNCFtwZrKzC6fI7jmSZL7jWOg0w4iQ9LBPYt5VOb
	ucO5vS+8Cws2nPmjeF7G9c3c3C0Yih/4plfNxDdz8ipdxB9kz5301963ZCOd1Z93OBVJY9eJ0Ls
	wXOtoAWMJvlV6QLckMgoDA73t25Q==
X-Received: by 2002:a05:6000:2f85:b0:45e:dc0a:bcb with SMTP id ffacd0b85a97d-4651e2e1bcemr17942425f8f.22.1782116280048;
        Mon, 22 Jun 2026 01:18:00 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666cea9581sm22381239f8f.0.2026.06.22.01.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 01:17:59 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH] python3-numpy: Upgrade 2.4.6 -> 2.5.0
Date: Mon, 22 Jun 2026 11:17:56 +0300
Message-ID: <20260622081756.3078004-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 08:18:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239274

Upgrade to release 2.5.0:

Numpy 2.5.0 is a transitional release. It drops support for Python 3.11,
marking the end of distutils, and expires a large number of deprecations
made in the 2.0.x release. It also improves free threading and brings
sorting into compliance with the array-api standard with the addition of
descending sorts. There is also a fair amount of preparation for Python
3.15, which will be supported starting with the first rc.

- Distutils has been removed
- Many expired deprecations
- Many new deprecations
- Many static typing improvements
- Improved support for free threading
- Support for descending sorts

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-and-so-on-for-libraries-by-default-.patch | 69 -------------------
 .../python3-numpy/fix_reproducibility.patch   | 40 -----------
 ...-numpy_2.4.6.bb => python3-numpy_2.5.0.bb} |  4 +-
 3 files changed, 1 insertion(+), 112 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
 delete mode 100644 meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
 rename meta/recipes-devtools/python/{python3-numpy_2.4.6.bb => python3-numpy_2.5.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
deleted file mode 100644
index ba99997653..0000000000
--- a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From e6a9ec520a5924af57ad5d117bc45cf6d8bcdb9a Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 10 Dec 2015 13:20:30 +0200
-Subject: [PATCH] Don't search /usr and so on for libraries by default to
-
- avoid host contamination.
-
-Upstream-Status: Inappropriate (As the code stands, this is a hack)
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- numpy/distutils/system_info.py | 42 +++++-----------------------------
- 1 file changed, 6 insertions(+), 36 deletions(-)
-
-diff --git a/numpy/distutils/system_info.py b/numpy/distutils/system_info.py
-index e428b47..65d95ed 100644
---- a/numpy/distutils/system_info.py
-+++ b/numpy/distutils/system_info.py
-@@ -326,44 +326,14 @@ def add_system_root(library_root):
-         add_system_root(os.path.join(conda_dir, 'Library'))
- 
- else:
--    default_lib_dirs = libpaths(['/usr/local/lib', '/opt/lib', '/usr/lib',
--                                 '/opt/local/lib', '/sw/lib'], platform_bits)
-     default_runtime_dirs = []
--    default_include_dirs = ['/usr/local/include',
--                            '/opt/include',
--                            # path of umfpack under macports
--                            '/opt/local/include/ufsparse',
--                            '/opt/local/include', '/sw/include',
--                            '/usr/include/suitesparse']
--    default_src_dirs = ['.', '/usr/local/src', '/opt/src', '/sw/src']
--
--    default_x11_lib_dirs = libpaths(['/usr/X11R6/lib', '/usr/X11/lib',
--                                     '/usr/lib'], platform_bits)
--    default_x11_include_dirs = ['/usr/X11R6/include', '/usr/X11/include']
--
--    if os.path.exists('/usr/lib/X11'):
--        globbed_x11_dir = glob('/usr/lib/*/libX11.so')
--        if globbed_x11_dir:
--            x11_so_dir = os.path.split(globbed_x11_dir[0])[0]
--            default_x11_lib_dirs.extend([x11_so_dir, '/usr/lib/X11'])
--            default_x11_include_dirs.extend(['/usr/lib/X11/include',
--                                             '/usr/include/X11'])
--
--    with open(os.devnull, 'w') as tmp:
--        try:
--            p = subprocess.Popen(["gcc", "-print-multiarch"], stdout=subprocess.PIPE,
--                         stderr=tmp)
--        except (OSError, DistutilsError):
--            # OSError if gcc is not installed, or SandboxViolation (DistutilsError
--            # subclass) if an old setuptools bug is triggered (see gh-3160).
--            pass
--        else:
--            triplet = str(p.communicate()[0].decode().strip())
--            if p.returncode == 0:
--                # gcc supports the "-print-multiarch" option
--                default_x11_lib_dirs += [os.path.join("/usr/lib/", triplet)]
--                default_lib_dirs += [os.path.join("/usr/lib/", triplet)]
- 
-+    default_lib_dirs = libpaths(['/deadir/lib'], platform_bits)
-+    default_include_dirs = ['/deaddir/include']
-+    default_src_dirs = ['.', '/deaddir/src']
-+
-+    default_x11_lib_dirs = libpaths(['/deaddir/lib'], platform_bits)
-+    default_x11_include_dirs = ['/deaddir/include']
- 
- if os.path.join(sys.prefix, 'lib') not in default_lib_dirs:
-     default_lib_dirs.insert(0, os.path.join(sys.prefix, 'lib'))
diff --git a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
deleted file mode 100644
index ca5dde1f32..0000000000
--- a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From b8bae174cfca4541a7288edcfdbc340d54f2673a Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Fri, 29 Sep 2023 22:53:24 +0100
-Subject: [PATCH] This regex decides whether to use O3 opimisation on numpy or
- not.
-
-It includes "od", which happens to be a substring of "reproducible"
-but not "qemux86-world".
-
-The regex will run against all compiler options including things like:
-
--fmacro-prefix-map=/XXX/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.0/numpy-1.26.0=/usr/src/debug/python3-numpy/1.26.0-r0
-
-i.e. including build paths.
-
-Reduce the regex to something deterministic for our builds, assuming
-nobody builds in /home/debug:full/
-
-The autobuilder race depended upon whether qemux86-world or the
-reproducible target ran first and won the race to populate sstate.
-
-Upstream-Status: Inappropriate [upstream have dropped distutils and switched to meson]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
----
- numpy/distutils/ccompiler_opt.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/numpy/distutils/ccompiler_opt.py b/numpy/distutils/ccompiler_opt.py
-index 4dea2f9..00f563f 100644
---- a/numpy/distutils/ccompiler_opt.py
-+++ b/numpy/distutils/ccompiler_opt.py
-@@ -991,7 +991,7 @@ def __init__(self):
-             ("cc_is_nocc",     "", ""),
-         )
-         detect_args = (
--           ("cc_has_debug",  ".*(O0|Od|ggdb|coverage|debug:full).*", ""),
-+           ("cc_has_debug",  ".*debug:full.*", ""),
-            ("cc_has_native",
-                 ".*(-march=native|-xHost|/QxHost|-mcpu=a64fx).*", ""),
-            # in case if the class run with -DNPY_DISABLE_OPTIMIZATION
diff --git a/meta/recipes-devtools/python/python3-numpy_2.4.6.bb b/meta/recipes-devtools/python/python3-numpy_2.5.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-numpy_2.4.6.bb
rename to meta/recipes-devtools/python/python3-numpy_2.5.0.bb
index 2c892e9756..db15435f87 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.4.6.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.5.0.bb
@@ -8,12 +8,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=26080bf81b2662c7119d3ef28ae197fd"
 SRCNAME = "numpy"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
-           file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
-           file://fix_reproducibility.patch \
            file://run-ptest \
            file://0001-python-sysroot.patch \
            "
-SRC_URI[sha256sum] = "f3a3570c4a2a16746ac2c31a7c7c7b0c186b95ce902e33db6f28094ed7387dda"
+SRC_URI[sha256sum] = "5a129578019311b6e56bdd714250f19b518f7dceeeb8d1af5490f4942d3f891c"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.47.3


