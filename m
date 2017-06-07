Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5A30F78145
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 14:51:55 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id o65so6575266oif.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jun 2017 07:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=vOzv5KCvkh2jZcBoNSZChfNH7vBLk5jwOucPcWo1T+c=;
	b=hLVXlT1zIMSmyVrNB+2po+90kDmSKkER/CIPR38kvCGMCZXs+CDGVOJ6eQ5o/RyxtN
	CmPdtu9nLNWEUzvR7bSgjPHJfxm2mQ+gwMqyXEsNewecx+Gd+/rHiduqJVgel6Q/s7p6
	QdopXNIbpCFznKOzw9d5e63iF+spXA0YjEU8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vOzv5KCvkh2jZcBoNSZChfNH7vBLk5jwOucPcWo1T+c=;
	b=gGlwQPeRKXnzrdcSGhdc4n3VYCU/yIq4uUwQXo62uYSimqb7zKBY8jOS8c8v/9f/as
	4rycbIjXn0QGgheSG+dWPNw2AFVj4XIjTIFvrdly6Wsg5MGtdQjcAsCazDCP0rGJcJmn
	bCVMPsT9MA6P5hQ/Ex3hAgIlDdGH0BgJ5sBGbJcRW20D983sj9AelR1KNz7i3r+kJZ/7
	aK/n20z2VAg/2MGfYyEncWO6YJRx5sy/YLBO4C4iY8991LBZpunJTyJQqD5n5w4lB9Dw
	kDBh6vzz2dc+mUWfdvUw3iJt16+aLQuoeH8FWmopVBoTPbFhTGRkySehurkaOrr5qT3t
	Kbtg==
X-Gm-Message-State: AODbwcAo0ChRbmAMkoFGehyh+1z8VmpJzHZaVSH/oNZj6Zhedj7qU2oR
	yKznU7qvhh+DiDSaq2tOOQ==
X-Received: by 10.202.85.3 with SMTP id j3mr6036576oib.207.1496847117091;
	Wed, 07 Jun 2017 07:51:57 -0700 (PDT)
Received: from aura.cortijodelrio.net
	(CableLink67-82.telefonia.InterCable.net. [201.172.67.82])
	by smtp.googlemail.com with ESMTPSA id
	f35sm986880otd.15.2017.06.07.07.51.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Jun 2017 07:51:56 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jun 2017 09:51:20 -0500
Message-Id: <1496847081-30528-2-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1496847081-30528-1-git-send-email-daniel.diaz@linaro.org>
References: <1496847081-30528-1-git-send-email-daniel.diaz@linaro.org>
MIME-Version: 1.0
Subject: [PATCH 2/3 v2][pyro] piglit: add patch for lack of gbm_bo_map
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
X-List-Received-Date: Wed, 07 Jun 2017 14:51:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

[Backported from master.]

[Piglit Bug #100978] -- https://bugs.freedesktop.org/show_bug.cgi?id=100978

When linking against Mali 450 r6, errors like the following
can be seen:
  ../../../../lib/libpiglitutil_gl.so.0: undefined reference to `gbm_bo_unmap'
  ../../../../lib/libpiglitutil_gl.so.0: undefined reference to `gbm_bo_map'
  collect2: error: ld returned 1 exit status
  make[2]: *** [bin/point-sprite] Error 1

This is due to gbm_bo_map() and gbm_bo_unmap() being recently
added but not yet implemented by all graphics drivers.

Instead of relying on GBM's version, actually try to link
against those symbols.

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
v2: Embed upstream status into patch; add patch into recipe.

 ...fine-GBM_BO_MAP-only-when-symbol-is-found.patch | 51 ++++++++++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb         |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-CMake-define-GBM_BO_MAP-only-when-symbol-is-found.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-CMake-define-GBM_BO_MAP-only-when-symbol-is-found.patch b/meta/recipes-graphics/piglit/piglit/0001-CMake-define-GBM_BO_MAP-only-when-symbol-is-found.patch
new file mode 100644
index 0000000..8b63424
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-CMake-define-GBM_BO_MAP-only-when-symbol-is-found.patch
@@ -0,0 +1,51 @@
+From 47697aee05a112422acf203982085e7b3e6c05b2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
+Date: Thu, 4 May 2017 00:57:39 -0500
+Subject: [PATCH 1/4] CMake: define GBM_BO_MAP only when symbol is found
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+gbm_bo_map() and _unmap() have been added recently to Mesa,
+and this update may not have reached all implementations of
+GBM, such as the one provided by Mali r6, where said
+definitions can be found in the header file but not in the
+library itself. This leads to errors like the following when
+linking:
+  ../../../../lib/libpiglitutil_gl.so.0: undefined reference to `gbm_bo_unmap'
+  ../../../../lib/libpiglitutil_gl.so.0: undefined reference to `gbm_bo_map'
+  collect2: error: ld returned 1 exit status
+  make[2]: *** [bin/point-sprite] Error 1
+
+Instead of relying on the header file, actually try to link
+using that symbol to determine if PIGLIT_HAS_GBM_BO_MAP
+should be defined.
+
+Upstream-Status: Submitted [piglit@lists.freedesktop.org]
+
+Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
+Reviewed-by: Jan Vesely <jan.vesely@rutgers.edu>
+Reviewed-by: Dylan Baker <dylan@pnwbakers.com>
+---
+ CMakeLists.txt | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a4ff99e..cc26fa8 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -141,8 +141,9 @@ IF(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
+ 	if(GBM_FOUND)
+ 		set(PIGLIT_HAS_GBM True)
+ 		add_definitions(-DPIGLIT_HAS_GBM)
+-		if (GBM_VERSION VERSION_EQUAL "12.1" OR GBM_VERSION VERSION_GREATER "12.1")
+-			set(PIGLIT_HAS_GBM_BO_MAP True)
++		set(CMAKE_REQUIRED_LIBRARIES ${CMAKE_REQUIRED_LIBRARIES} ${GBM_LIBRARIES})
++		CHECK_FUNCTION_EXISTS(gbm_bo_map PIGLIT_HAS_GBM_BO_MAP)
++		if (PIGLIT_HAS_GBM_BO_MAP)
+ 			add_definitions(-DPIGLIT_HAS_GBM_BO_MAP)
+ 		endif()
+ 	endif(GBM_FOUND)
+-- 
+1.9.1
+
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index eae3eed..19db86c 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 SRC_URI = "git://anongit.freedesktop.org/piglit \
            file://0001-cmake-install-bash-completions-in-the-right-place.patch \
            file://0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch \
+           file://0001-CMake-define-GBM_BO_MAP-only-when-symbol-is-found.patch \
            "
 
 # From 2017-02-06
-- 
1.9.1


