Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 212C56102C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2020 01:45:32 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id k3so8826795pgc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 17:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QYot0LRgF+2iUduliRApA2Pn1UubImzLA+UcgkM59hI=;
	b=Yddf1kA4+hLpGus3eLLRvP01OVbuvVpDhwGfs8pLBy04L/1m2m1+73JGPLofz1UutY
	5bYzYUjbFb/IOfOtvAXd3TooMmscE4zF3YbZvHTrxArFQvx2GA/0RbJ6E8RwrnwvLSq3
	dU14c7HQcdAK4mTMD8kfMA4HSOI9fx5wM53nOO8HXrrovOD9hW+rEnFH7Gdur6s8BJLw
	ttv9cLzt89LXzsELk+DJuNHddE+UAUQRmcPaYzNwEP8Xj7Pqf7IYYoE/4Mtqt6AjI3/f
	W1ee2/hfOhVEq7xwZ0xra6Iz+vm6gRoS+Ud2GFB3hktR8jH0Bw8EmtdaqkvXzjngW9V0
	ujlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QYot0LRgF+2iUduliRApA2Pn1UubImzLA+UcgkM59hI=;
	b=QMtcVQdYZsIYAyt6OuELc24B4JDPWVvE5dy4o65FuzwbYE8+MM6dpWXe3hYrBRxLlG
	wBaGJqGVAk4rYkPsRmPMQ6KPgcFQOskpr/fTEBcjEc8netKhOaGsJxEDpmp0x/FWsZa8
	H2sMK6p8lGaw11PfCejGHivcTrO9tos29hVp2KQk+Lz4bNmkNBCvAbxUJnvgB93oB4mJ
	Ckky1iw67l2J5flntBnuRyDxOUHNf3a/VS5MjKaI5zbG13AUqwcXclAEuTbIGutQ/o79
	INfpZuFjZwvZCEniGjwF+RWZ3DbGfBe6dLoXOzei72LBM1fuAbjuUm/cQ8uQLYsgP0i8
	AdwA==
X-Gm-Message-State: APjAAAWy6OFs3TRcGV9Z2EMiikndvXtq87QICquzxmKZJJoFJMDPblLL
	qrAoZHXHlDuDvAtT+uoX301/xOKG+vU=
X-Google-Smtp-Source: APXvYqxtFwZ2i2MKa4hSQRO7AY0vhsuGFNfZKfXde2KgjKbw5xxlvSB5g5QgaxDDX4YJcr+7mZjY6A==
X-Received: by 2002:a63:3e09:: with SMTP id l9mr28773266pga.149.1580780733500; 
	Mon, 03 Feb 2020 17:45:33 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1852])
	by smtp.gmail.com with ESMTPSA id o11sm762431pjs.6.2020.02.03.17.45.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 03 Feb 2020 17:45:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Feb 2020 17:45:36 -0800
Message-Id: <20200204014536.2524501-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] webkitgtk: Prefer -pthread over -lpthread
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
X-List-Received-Date: Tue, 04 Feb 2020 01:45:33 -0000
Content-Transfer-Encoding: 8bit

-pthread is compiler driver option which links in needed dependencies
for pthreads along with -lpthread, this aids in fixing build failures
on rv64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-Enable-THREADS_PREFER_PTHREAD_FLAG.patch | 45 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.26.2.bb  |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch
new file mode 100644
index 0000000000..268118b5ca
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch
@@ -0,0 +1,45 @@
+From 8ee7806ad2d5606967f7a1529a113fb9d1a386de Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 3 Feb 2020 17:06:27 -0800
+Subject: [PATCH] Enable THREADS_PREFER_PTHREAD_FLAG
+
+Fixes build failures on risv64
+
+Taken from https://trac.webkit.org/changeset/231843/webkit
+
+ Enable THREADS_PREFER_PTHREAD_FLAG. This uses -pthread instead of
+-lpthread, fixing the 64-bit RISC-V build of the GTK+ port due to
+missing atomic primitives.
+
+Upstream-Status: Submitted [https://trac.webkit.org/changeset/231843/webkit]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/cmake/OptionsGTK.cmake     | 2 ++
+ Source/cmake/OptionsJSCOnly.cmake | 1 +
+ 2 files changed, 3 insertions(+)
+
+diff --git a/Source/cmake/OptionsGTK.cmake b/Source/cmake/OptionsGTK.cmake
+index d3beef19..6a92856f 100644
+--- a/Source/cmake/OptionsGTK.cmake
++++ b/Source/cmake/OptionsGTK.cmake
+@@ -17,6 +17,8 @@ set(WEBKITGTK_HEADER_INSTALL_DIR "${CMAKE_INSTALL_INCLUDEDIR}/webkitgtk-${WEBKIT
+ set(INTROSPECTION_INSTALL_GIRDIR "${CMAKE_INSTALL_FULL_DATADIR}/gir-1.0")
+ set(INTROSPECTION_INSTALL_TYPELIBDIR "${LIB_INSTALL_DIR}/girepository-1.0")
+ 
++set(THREADS_PREFER_PTHREAD_FLAG ON)
++
+ find_package(Cairo 1.14.0 REQUIRED)
+ find_package(Fontconfig 2.8.0 REQUIRED)
+ find_package(Freetype 2.4.2 REQUIRED)
+diff --git a/Source/cmake/OptionsJSCOnly.cmake b/Source/cmake/OptionsJSCOnly.cmake
+index b2e87418..326ade23 100644
+--- a/Source/cmake/OptionsJSCOnly.cmake
++++ b/Source/cmake/OptionsJSCOnly.cmake
+@@ -1,3 +1,4 @@
++set(THREADS_PREFER_PTHREAD_FLAG ON)
+ find_package(Threads REQUIRED)
+ 
+ if (MSVC)
+-- 
+2.25.0
+
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.26.2.bb
index a223cfd451..a184d833c4 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.26.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.26.2.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch \
            file://0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch \
            file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch \
+           file://0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch \
            file://x32_support.patch \
            file://cross-compile.patch \
            file://0001-Fix-build-with-musl.patch \
-- 
2.25.0


