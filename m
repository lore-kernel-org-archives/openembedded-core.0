Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 613687BD9A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 07:51:03 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id g24so6805551wmh.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 00:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qmRcDtknq7HzNn5YyLmysxEiGf1hb/6eYHUd/NO5quI=;
	b=KuJ1uFCcAWHr1qwS3BerFWKbRKNmXYHp7K52Nn/8qpMZpAlIRwuWvX37RE9nSGmlWf
	tsI89kuJQ5Wi/8PYbiCYhQdb2+0dxS/C5Tl2ehwamhZVyiq5DegDd90ZquAgCw+zi6h2
	TZHKKMc8EqWT3KHBQz6dfrJFeN+CPDKrrr+qM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qmRcDtknq7HzNn5YyLmysxEiGf1hb/6eYHUd/NO5quI=;
	b=VB9dg9JEAkW4cfuCD09cUgLgL6u7Xq/V9vnXxTSlLfxdHs5Jh5c6dgpSadUe76b/3p
	UDiIatiW3Xd+5INL90Me8Oyq3jrTak7ymPXe5iyP6N0UAGlHwoqxjEMvuye/sv5/CVbq
	WOsBeBODOGFuGiPdytIZcojc6RgBVP0I8kCrIQSxmCAPk3cpD2NInttvTsTy754mhRcc
	mN4w7Z5LnCVcxZAXX2Oye/6dYlwOIw6G/7bxauHpSjqUKdnxZgFyeFrugz88W1wjN89C
	5K9w0MrJuOe59xOeFOit4gpaH8W1EL9j+VIMoxiaIgp9ghkko/HAUb9CaPn8tMsibPEC
	M5hw==
X-Gm-Message-State: APjAAAXfEv0gdX1NNJGEtG0iSE//3AH1cYPRFTcz4sWTR+tJb10c0sge
	eD9DUBbIoHjxs85rO5IYVKEWEl8QtVo=
X-Google-Smtp-Source: APXvYqxybXk/LZUYG/n1ETWxqlcfSOtJfG1dw19o99WAe3Fs89aTdtsE99f4Suhw4V3SMH3dYZTHCQ==
X-Received: by 2002:a05:600c:2201:: with SMTP id
	z1mr1703614wml.169.1571730663528; 
	Tue, 22 Oct 2019 00:51:03 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a2sm4659856wrv.39.2019.10.22.00.51.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 22 Oct 2019 00:51:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2019 08:51:00 +0100
Message-Id: <20191022075100.2846-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] meson: Backport fix to assist meta-oe breakage
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Oct 2019 07:51:03 -0000
Content-Transfer-Encoding: 8bit

Add a backported commit from upstream which helps fix build failures
in meta-oe.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/meson/meson.inc         |  1 +
 ...e971bd320f3df15c1ee74f54858e6792b183.patch | 95 +++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-devtools/meson/meson/dbc9e971bd320f3df15c1ee74f54858e6792b183.patch

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index ae0091c051c..84bcc8409de 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -16,6 +16,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://cross-prop-default.patch \
            file://0001-mesonbuild-environment.py-check-environment-for-vari.patch \
            file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
+           file://dbc9e971bd320f3df15c1ee74f54858e6792b183.patch \
            "
 SRC_URI[sha256sum] = "d60f75f0dedcc4fd249dbc7519d6f3ce6df490033d276ef1cf27453ef4938d32"
 SRC_URI[md5sum] = "7ea7772414dda8ae11072244bf7ba991"
diff --git a/meta/recipes-devtools/meson/meson/dbc9e971bd320f3df15c1ee74f54858e6792b183.patch b/meta/recipes-devtools/meson/meson/dbc9e971bd320f3df15c1ee74f54858e6792b183.patch
new file mode 100644
index 00000000000..7ea8a133e6a
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/dbc9e971bd320f3df15c1ee74f54858e6792b183.patch
@@ -0,0 +1,95 @@
+From dbc9e971bd320f3df15c1ee74f54858e6792b183 Mon Sep 17 00:00:00 2001
+From: Xavier Claessens <xavier.claessens@collabora.com>
+Date: Fri, 11 Oct 2019 11:01:22 -0400
+Subject: [PATCH] Remove duplicated object files in static libraries
+
+When a static library link_whole to a bunch of other static libraries,
+we have to extract all their objects recursively. But that could
+introduce duplicated objects. ar is dumb enough to allow this without
+error, but once the resulting static library is linked into an
+executable or shared library, the linker will complain about duplicated
+symbols.
+
+Upstream-Status: Backport
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+---
+ mesonbuild/backend/backends.py                 |  3 ++-
+ test cases/unit/69 static link/lib/func17.c    |  4 ++++
+ test cases/unit/69 static link/lib/func18.c    |  6 ++++++
+ test cases/unit/69 static link/lib/func19.c    |  7 +++++++
+ test cases/unit/69 static link/lib/meson.build | 12 ++++++++++++
+ 5 files changed, 31 insertions(+), 1 deletion(-)
+ create mode 100644 test cases/unit/69 static link/lib/func17.c
+ create mode 100644 test cases/unit/69 static link/lib/func18.c
+ create mode 100644 test cases/unit/69 static link/lib/func19.c
+
+diff --git a/mesonbuild/backend/backends.py b/mesonbuild/backend/backends.py
+index 947be1cbef..e54809657f 100644
+--- a/mesonbuild/backend/backends.py
++++ b/mesonbuild/backend/backends.py
+@@ -281,7 +281,8 @@ def relpath(self, todir, fromdir):
+                                os.path.join('dummyprefixdir', fromdir))
+ 
+     def flatten_object_list(self, target, proj_dir_to_build_root=''):
+-        return self._flatten_object_list(target, target.get_objects(), proj_dir_to_build_root)
++        obj_list = self._flatten_object_list(target, target.get_objects(), proj_dir_to_build_root)
++        return list(dict.fromkeys(obj_list))
+ 
+     def _flatten_object_list(self, target, objects, proj_dir_to_build_root):
+         obj_list = []
+diff --git a/test cases/unit/69 static link/lib/func17.c b/test cases/unit/69 static link/lib/func17.c
+new file mode 100644
+index 0000000000..d1d8ec498c
+--- /dev/null
++++ b/test cases/unit/69 static link/lib/func17.c	
+@@ -0,0 +1,4 @@
++int func17()
++{
++  return 1;
++}
+diff --git a/test cases/unit/69 static link/lib/func18.c b/test cases/unit/69 static link/lib/func18.c
+new file mode 100644
+index 0000000000..c149085ba4
+--- /dev/null
++++ b/test cases/unit/69 static link/lib/func18.c	
+@@ -0,0 +1,6 @@
++int func17();
++
++int func18()
++{
++  return func17() + 1;
++}
+diff --git a/test cases/unit/69 static link/lib/func19.c b/test cases/unit/69 static link/lib/func19.c
+new file mode 100644
+index 0000000000..69120e4bf8
+--- /dev/null
++++ b/test cases/unit/69 static link/lib/func19.c	
+@@ -0,0 +1,7 @@
++int func17();
++int func18();
++
++int func19()
++{
++  return func17() + func18();
++}
+diff --git a/test cases/unit/69 static link/lib/meson.build b/test cases/unit/69 static link/lib/meson.build
+index 5f04aab6a1..8f95fc4546 100644
+--- a/test cases/unit/69 static link/lib/meson.build	
++++ b/test cases/unit/69 static link/lib/meson.build	
+@@ -66,3 +66,15 @@ libfunc15 = static_library('func15', 'func15.c',
+ libfunc16 = static_library('func16', 'func16.c',
+   link_with : libfunc15,
+   install : true)
++
++# Verify func17.c.o gets included only once into libfunc19, otherwise
++# func19-shared would failed with duplicated symbol.
++libfunc17 = static_library('func17', 'func17.c',
++  install : false)
++libfunc18 = static_library('func18', 'func18.c',
++  link_with : libfunc17,
++  install : false)
++libfunc19 = static_library('func19', 'func19.c',
++  link_whole : [libfunc17, libfunc18],
++  install : false)
++shared_library('func19-shared', link_whole : [libfunc19])
-- 
2.20.1


