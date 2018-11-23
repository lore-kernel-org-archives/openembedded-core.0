Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id E3D676C689
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 15:32:15 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c14so7094614wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 07:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=1wUa8kywcosc57O/dW6EkXUepQIyL5OgEhVE9AkRYLk=;
	b=AeSZl4LdQjX6o0Ic546UrlYzyQCCJptVkEKo0CwvqOUSR3lKIVNotzckWVEbn0czyN
	I5SBG7TpZ1snubUXVd1Tie6b1opTpctPTv/a10FJS0vsRhvb2z8nnqroaP82DV3Wu31i
	FvPCVODmhK29KAJfBpkIWSuRZac+DIYlUNYxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=1wUa8kywcosc57O/dW6EkXUepQIyL5OgEhVE9AkRYLk=;
	b=g6Vf/13639i+9/L0RBfp2zBiPWLMS2C5DH38ZvJOV6xSfZ9lOsjoR9FzDiTt9PrDRf
	asudRh11Sgo6dcBPqXM+JIZuTkz3SSIr3ECJPQcK/44mD7w3gxrvbo2pKmIyp7k7iKmY
	5As7FnLnlazVkix4nskE07rafv3L7HICuFcDnoV11U/uTA1cleaCl9wivBJT9xaPBjnK
	i7EZKTva2nexE7wxMA7LLYLFsm+YnzpBZ0Ir8j1FFE9XEgLM8mtrvqhM6mVcrXV9amRY
	xtPbj2V1f/08ZIJU3OyAA4OnsjIO4pWDQRGdbjeU2x7GxRo5rJ+q79v7KqXeVhy4f6L6
	B3PQ==
X-Gm-Message-State: AA+aEWYmTwXTqRHuCMbGof7nryjbNR7CHIqmMvdOTsb6UcPF974dYHky
	HcwPD+iC2nYLX5HYB3eGr1lPobHSApE=
X-Google-Smtp-Source: AFSGD/W4TEymE5lMHDH2MCe/SY8CP0aYRbsj7Fv/BAoeVrkWQbUuFj3i4bIgXQnJKNIJgX9+grQHSA==
X-Received: by 2002:adf:9591:: with SMTP id p17-v6mr497837wrp.48.1542987135999;
	Fri, 23 Nov 2018 07:32:15 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f2sm10848928wru.14.2018.11.23.07.32.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Nov 2018 07:32:15 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Nov 2018 15:32:13 +0000
Message-Id: <20181123153213.28467-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] meson: Disable rpath stripping at install time
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
X-List-Received-Date: Fri, 23 Nov 2018 15:32:16 -0000

As discussed in https://github.com/mesonbuild/meson/issues/2567 there
needs to be a way to allow our rpath options passed to the linker to be
preserved, else we run into weird build failures.

(e.g. libmodulemd-native used by libdnf can't find libyaml)

Disable this for now until upstream come up with a better way of handling
this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/meson/meson.inc         |  1 +
 ...pport-building-allarch-recipes-again.patch | 13 ++++------
 .../meson/meson/disable-rpath-handling.patch  | 26 +++++++++++++++++++
 3 files changed, 32 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-devtools/meson/meson/disable-rpath-handling.patch

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 32c6bfe5d3a..f8786959036 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -12,6 +12,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://gi-flags.patch \
            file://gtkdoc-flags.patch \
            file://0001-python-module-do-not-manipulate-the-environment-when.patch \
+           file://disable-rpath-handling.patch \
            "
 SRC_URI[sha256sum] = "92d8afd921751261e36151643464efd3394162f69efbe8cd53e0a66b1cf395eb"
 SRC_URI[md5sum] = "31bda3519d8c0eb3438267268a78085e"
diff --git a/meta/recipes-devtools/meson/meson/0001-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0001-Support-building-allarch-recipes-again.patch
index f6dd2309168..96be104a52f 100644
--- a/meta/recipes-devtools/meson/meson/0001-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Support-building-allarch-recipes-again.patch
@@ -11,11 +11,11 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
  mesonbuild/environment.py | 1 +
  1 file changed, 1 insertion(+)
 
-diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index a0580a2..712b1e8 100644
---- a/mesonbuild/environment.py
-+++ b/mesonbuild/environment.py
-@@ -73,6 +73,7 @@ from .compilers import (
+Index: meson-0.47.2/mesonbuild/environment.py
+===================================================================
+--- meson-0.47.2.orig/mesonbuild/environment.py
++++ meson-0.47.2/mesonbuild/environment.py
+@@ -75,6 +75,7 @@ from .compilers import (
  build_filename = 'meson.build'
  
  known_cpu_families = (
@@ -23,6 +23,3 @@ index a0580a2..712b1e8 100644
      'aarch64',
      'arm',
      'e2k',
--- 
-2.12.0
-
diff --git a/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch b/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch
new file mode 100644
index 00000000000..4b1fb57dd44
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch
@@ -0,0 +1,26 @@
+We need to allow our rpaths generated through the compiler flags to make it into 
+our binaries. Therefore disable the meson manipulations of these unless there
+is a specific directive to do something differently in the project.
+
+RP 2018/11/23
+
+Upstream-Status: Submitted [https://github.com/mesonbuild/meson/issues/2567]
+
+Index: meson-0.47.2/mesonbuild/minstall.py
+===================================================================
+--- meson-0.47.2.orig/mesonbuild/minstall.py
++++ meson-0.47.2/mesonbuild/minstall.py
+@@ -486,8 +486,11 @@ class Installer:
+                         printed_symlink_error = True
+             if os.path.isfile(outname):
+                 try:
+-                    depfixer.fix_rpath(outname, install_rpath, final_path,
+-                                       install_name_mappings, verbose=False)
++                    if install_rpath:
++                        depfixer.fix_rpath(outname, install_rpath, final_path,
++                                           install_name_mappings, verbose=False)
++                    else:
++                        print("RPATH changes at install time disabled")
+                 except SystemExit as e:
+                     if isinstance(e.code, int) and e.code == 0:
+                         pass
-- 
2.17.1


