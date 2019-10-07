Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1556D7D537
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 10:11:44 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id r5so14479940wrm.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 03:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ADPa29YN6zvZTfFXViCfZh9sYv3PBPpBd9lwFisx1dw=;
	b=syLUEaDpRjN2rrD2JuOp0Xd83WW/8YNjx5Hy/oSWwxZ93BvXMpwKEtcmo6TZEKhJhE
	7j73sZ1LhFa6DuUNzCGKvFXnB9h9oKHAx2eVWaEbyD5SQ+dO5Ix+1I4NGMTdnws5OPMu
	7mp13Os0pSE9Kn6NlqXc7Tpi3pQVYM8EmPOiyWNj+FdEjcACSlrsyCqoAvJ5AKPuuPhs
	P9a3o0b3MTkB6+F1HNqvBxyeOZQvRg83mZLkaBciuse05VODAXLIl0iDMJByc7XIqHF1
	7HSGYjEzWuI+EZIgp+I9duATVo8n56eXYOfqnr9wCCXbZ4O4i+HK801j3saSm/WJxh5H
	xxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ADPa29YN6zvZTfFXViCfZh9sYv3PBPpBd9lwFisx1dw=;
	b=ZL7S3327zPCXiZHusy1OPee+MQT82vSS+MNlpNz1AeAjw8ncvoMkadUj8072Tk8mO+
	o45YZENN4r8d6YCtLh32xLaatQwKs5zQZA5l4SH40NrCzt7ORBPbQrwycol1c1Qss6E/
	ykAO8Laq+4DFz/NYskPGnyEgcEW4aORHNn1wyB1HrPVRVCM4Q6YmbTcrywBAaN7ph7ZD
	tU7+goDkPVVzaVoKVTiOLqmL8LjtBIplLCZPmWhB7bmKnuh95J3I3ArDah/mJHn9uD30
	IYunbD0fb3r3e1kG1QfbGKwnqKDyJQgPsQtpoJZ/XDnDK68y3VSJih1+1fTIk5cbdANX
	YUAg==
X-Gm-Message-State: APjAAAVBRJ/O1hNWT1qZcpjJ07ENeYBLSm4RY7cVXCH1DUWCEyzecBKt
	uwqcxZ5fG9s3+Ddtep6vAlWs5y1tMDw=
X-Google-Smtp-Source: APXvYqyJ33DHQoiNE3JQeCQmQmZuq4+mP2G+e0ScLejnxQOKXx83rXqqBQRI5eYFJp7emj6Svgj82Q==
X-Received: by 2002:a5d:6b49:: with SMTP id x9mr11025511wrw.80.1570443105278; 
	Mon, 07 Oct 2019 03:11:45 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	q22sm13823289wmj.31.2019.10.07.03.11.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 07 Oct 2019 03:11:44 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2019 11:11:38 +0100
Message-Id: <20191007101138.3722-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191007101138.3722-1-ross.burton@intel.com>
References: <20191007101138.3722-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] meson: fix cross detection
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
X-List-Received-Date: Mon, 07 Oct 2019 10:11:45 -0000
Content-Transfer-Encoding: 8bit

Meson 0.51 onwards detects if a build is cross by whether the host and build
machines match.  However this doesn't work in a number of cross compilation
cases: notably where host is Windows but build is Linux, but also the common
OpenEmbedded case where the host and build machine are both x86-64.

Previously we'd patched this to instead look at whether an executable wrapper is
needed: our cross files always set this to true so all cross builds would be
identified as cross.  However, this breaks build on the target as without a
cross file the early cross build detection fails as we don't yet know if an exe
wrapper is needed.

The neater solution is to simply go back to the older logic: a cross build has
cross files defined.

[ YOCTO #13571 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/meson/meson.inc         |  2 +-
 ...efined-by-the-existance-of-a-cross-f.patch | 28 +++++++++++++++++++
 ...onment.py-do-not-determine-whether-a.patch | 28 -------------------
 3 files changed, 29 insertions(+), 29 deletions(-)
 create mode 100644 meta/recipes-devtools/meson/meson/0001-Cross-build-is-defined-by-the-existance-of-a-cross-f.patch
 delete mode 100644 meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-do-not-determine-whether-a.patch

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index d365bcd8a35..8219d87c741 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -15,7 +15,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://disable-rpath-handling.patch \
            file://cross-prop-default.patch \
            file://0001-environment.py-detect-windows-also-if-the-system-str.patch \
-           file://0001-mesonbuild-environment.py-do-not-determine-whether-a.patch \
+           file://0001-Cross-build-is-defined-by-the-existance-of-a-cross-f.patch \
            file://0001-mesonbuild-environment.py-check-environment-for-vari.patch \
            file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
            file://vala-cross-compile.patch \
diff --git a/meta/recipes-devtools/meson/meson/0001-Cross-build-is-defined-by-the-existance-of-a-cross-f.patch b/meta/recipes-devtools/meson/meson/0001-Cross-build-is-defined-by-the-existance-of-a-cross-f.patch
new file mode 100644
index 00000000000..a5dbb81b088
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0001-Cross-build-is-defined-by-the-existance-of-a-cross-f.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 0b4d1e8afd5428a495f8624ee061f63977b4c268 Mon Sep 17 00:00:00 2001
+From: Jussi Pakkanen <jpakkane@gmail.com>
+Date: Sun, 6 Oct 2019 15:17:32 +0300
+Subject: [PATCH] Cross build is defined by the existance of a cross file.
+
+---
+ mesonbuild/environment.py | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
+index e5d041b4..03c65688 100644
+--- a/mesonbuild/environment.py
++++ b/mesonbuild/environment.py
+@@ -611,7 +611,7 @@ class Environment:
+         self.first_invocation = True
+ 
+     def is_cross_build(self) -> bool:
+-        return not self.machines.matches_build_machine(MachineChoice.HOST)
++        return self.coredata.is_cross_build()
+ 
+     def dump_coredata(self):
+         return coredata.save(self.coredata, self.get_build_dir())
+-- 
+2.20.1
+
diff --git a/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-do-not-determine-whether-a.patch b/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-do-not-determine-whether-a.patch
deleted file mode 100644
index 8cb11879f4d..00000000000
--- a/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-do-not-determine-whether-a.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From ec9c4a22424a5d55fcf213a55d03f096ec24bcae Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 25 Mar 2019 18:18:33 +0100
-Subject: [PATCH] mesonbuild/environment.py: do not determine whether a build
- is cross by comparing architectures
-
-This can, and does, go wrong when our host architecture is same as the target one(e.g. x86_64).
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- mesonbuild/environment.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 84a7596..9a029f4 100644
---- a/mesonbuild/environment.py
-+++ b/mesonbuild/environment.py
-@@ -520,7 +520,7 @@ class Environment:
-         self.first_invocation = True
- 
-     def is_cross_build(self) -> bool:
--        return not self.machines.matches_build_machine(MachineChoice.HOST)
-+        return self.need_exe_wrapper()
- 
-     def dump_coredata(self):
-         return coredata.save(self.coredata, self.get_build_dir())
-- 
2.20.1


