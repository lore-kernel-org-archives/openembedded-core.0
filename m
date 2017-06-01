Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7F1D977DCA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 15:37:33 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id h4so58597017oib.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Jun 2017 08:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7+SK1iJH4DCPuIOAbkv+umjmSh0vLQEjvrWd1qdx5Vw=;
	b=jb/BEE1fUlQgqK3ncoThNAYdFRDnsv+LYg5Kg4WkIq3co+yLsEPIi3dgzBJfRNOoT5
	PzZauWSkCLLX1SZOK9FSNamTSBci1kuYs6VVKWY0wYXaPTp+k1pQheQE+Imz0zeCatIT
	TpWadb+B8+6AbXVZQfGpm5RpyGSUdsoCqZccs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7+SK1iJH4DCPuIOAbkv+umjmSh0vLQEjvrWd1qdx5Vw=;
	b=TTtbD94kKSqEwBkNH99m4UEsL/mkVJcQ0LE2kUAAQnsGskUsjVvCRiXhuS+ynUG4f8
	lE7EKohrdMchdUmwCElEXk0urkbg6kdHIuYpf2ofPHLafW2qtBkVPoFD/zLENweWbeg7
	6U5ycsc7pY462ZWpDMvwuOxvcNREno5W1KLF5cSaEpvSNvcC4/6s/YIBn14sHrowj2O1
	nxVwmmSXeMd5vKHh8d3LC92MXG4IjUIgpxmtwT/plLZZqymrMDrJGBDRstp5aFWmwa0i
	0vW8KmS3NZ4QYRyezKOhcFi0c7RUSUYOKWPZhf3chqWtSJkmrpeGDPmlc1zl+Mn+R/+Q
	KKfg==
X-Gm-Message-State: AODbwcBrg98bOoeZx1RepYRgBfUdi2jvFMJXZIt02K1nr3GBOUnWiPts
	wZhoM30ZeqUE/nI1AfdtJQ==
X-Received: by 10.202.229.15 with SMTP id c15mr1399292oih.45.1496331454171;
	Thu, 01 Jun 2017 08:37:34 -0700 (PDT)
Received: from aura.cortijodelrio.net
	(CableLink67-82.telefonia.InterCable.net. [201.172.67.82])
	by smtp.googlemail.com with ESMTPSA id
	c50sm9088799ote.29.2017.06.01.08.37.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Jun 2017 08:37:33 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Jun 2017 10:37:05 -0500
Message-Id: <1496331426-6553-2-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1496331426-6553-1-git-send-email-daniel.diaz@linaro.org>
References: <1496331426-6553-1-git-send-email-daniel.diaz@linaro.org>
MIME-Version: 1.0
Subject: [PATCH 2/3][pyro] piglit: add patch for lack of gbm_bo_map
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
X-List-Received-Date: Thu, 01 Jun 2017 15:37:33 -0000
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

Upstream-Status: Submitted [piglit@lists.freedesktop.org]

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 ...fine-GBM_BO_MAP-only-when-symbol-is-found.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-CMake-define-GBM_BO_MAP-only-when-symbol-is-found.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-CMake-define-GBM_BO_MAP-only-when-symbol-is-found.patch b/meta/recipes-graphics/piglit/piglit/0001-CMake-define-GBM_BO_MAP-only-when-symbol-is-found.patch
new file mode 100644
index 0000000..0750676
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-CMake-define-GBM_BO_MAP-only-when-symbol-is-found.patch
@@ -0,0 +1,48 @@
+From 6b6acee8841d092e5066b1bec2ba1c49cce4f91f Mon Sep 17 00:00:00 2001
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
+Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
+Reviewed-by: Jan Vesely <jan.vesely@rutgers.edu>
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
-- 
1.9.1


