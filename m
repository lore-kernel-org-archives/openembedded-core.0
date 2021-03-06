Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.7412.1615038390289031837
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Mar 2021 05:46:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=ZGdr15fj;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1615038390;
  x=1646574390;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8g5HB/+epcv8afA6Y+6i1LBvzf9+c1i98HxlCMqtc0c=;
  b=ZGdr15fjAWssS1IOfbqb0Mu/4jmFAP5hNXVVArzDrX6zrJZXiHQ7rqgn
   Jb1Awg66WaotY9i4FOVU+zsHKW3Ny/1FMbwdGf/1KkqY/+XhOxvw6zUAa
   5qQQcVtZuBuXHZz1xn5bled0HzFO9RlsjHnD6rh98sQk6AbuJlIJFTU66
   OGfy1ycK3Q1YkUWjvWUSqk8q6j8NICopX+56T9x8ACgG1b9lWRRNNRrkH
   ik9Lu61yIkz08yn7nEEh2I0xL+7Qcl1qCjmLSWMoVx11SPw7/+qdA498Z
   cz3nMXY0040sGjhugkSVd9gC+J0mq8QngxXL+E/yqhOXhHczRKGRoR5XB
   A==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] meson: Correctly set uid/gid of installed files
Date: Sat, 6 Mar 2021 14:46:22 +0100
Message-ID: <20210306134622.16988-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

In 0.57.0, the uid and gid arguments passed to os.chown() when using
install_mode were accidentally swapped, causing files to end up with
incorrect owner/group if the owner and group are not the same.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-devtools/meson/meson.inc         |  1 +
 ...ectly-set-uid-gid-of-installed-files.patch | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/meson/meson/0001-minstall-Correctly-set-uid-gid-of-installed-files.patch

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 622c22affd..8454d18c28 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -14,6 +14,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://disable-rpath-handling.patch \
            file://cross-prop-default.patch \
            file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
+           file://0001-minstall-Correctly-set-uid-gid-of-installed-files.patch \
            "
 SRC_URI[sha256sum] = "72e1c782ba9bda204f4a1ed57f98d027d7b6eb9414c723eebbd6ec7f1955c8a6"
 
diff --git a/meta/recipes-devtools/meson/meson/0001-minstall-Correctly-set-uid-gid-of-installed-files.patch b/meta/recipes-devtools/meson/meson/0001-minstall-Correctly-set-uid-gid-of-installed-files.patch
new file mode 100644
index 0000000000..d55b7cc7c7
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0001-minstall-Correctly-set-uid-gid-of-installed-files.patch
@@ -0,0 +1,28 @@
+From 3f6f4964dc79ae986f44afe1687922381f237edd Mon Sep 17 00:00:00 2001
+From: Peter Kjellerstedt <pkj@axis.com>
+Date: Wed, 3 Mar 2021 12:47:28 +0100
+Subject: [PATCH] minstall: Correctly set uid/gid of installed files
+
+In commit caab4d3d, the uid and gid arguments passed to os.chown() by
+set_chown() were accidentally swapped, causing files to end up with
+incorrect owner/group if the owner and group are not the same.
+
+Upstream-Status: Backport [https://github.com/mesonbuild/meson/commit/6226ac26ef63335bfb817db02b3f295c78214a82]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ mesonbuild/minstall.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mesonbuild/minstall.py b/mesonbuild/minstall.py
+index 785ff5869..07da408aa 100644
+--- a/mesonbuild/minstall.py
++++ b/mesonbuild/minstall.py
+@@ -148,7 +148,7 @@ def set_chown(path: str, user: T.Optional[str] = None, group: T.Optional[str] =
+         Use a real function rather than a lambda to help mypy out. Also real
+         functions are faster.
+         """
+-        real_os_chown(path, gid, uid, dir_fd=dir_fd, follow_symlinks=follow_symlinks)
++        real_os_chown(path, uid, gid, dir_fd=dir_fd, follow_symlinks=follow_symlinks)
+ 
+     try:
+         os.chown = chown
