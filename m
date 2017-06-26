Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5F31371AFC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 18:34:35 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id b205so3500776itg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 11:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=v2bhSEo45H2bdxUDkBWtM/3ZsIlo05PfhGObVaWhEaM=;
	b=u7aUuEEHXyK931a8wuAf1I+VqtIzEaHKgKDu0gJPjJmHCAxtPOB5amdWaSZlpfUSeE
	OVPOHU2eEd7H9OM8gZ+pSqgNPXSSmkgfMmknu94NpL7NLanx7/6iSw+pgIXgWHjFDnbs
	jodT+Ipzy5I/SRwRgPHbiJEMGV77g1Ch5uPQnFFtaTWFPgZCgK05dqVXbUQndfLz8hOP
	xkWXANc2JvvyhIrnrUHTnP0KaHtRDhvcBduWFp/0NrmVDmrDvD4Tm2LR7qXm1RB3iqUH
	3ZlYy4KNS4H8sNjkPed4ltkqAidk8FFSWQ/UkvXviuthkQOG1D6O8fsoIkPnUmHH7ztc
	SmZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=v2bhSEo45H2bdxUDkBWtM/3ZsIlo05PfhGObVaWhEaM=;
	b=M1Zu8fDYDHTNcry8U8fyiLRhv/2j0CLaX05iAz8XbPQAmaTjvE5pDNxNjKetjMIQoR
	mHMtitYJwFv4Z2gSj2BuI/rI06S1erYu/E59H7OaOWqbNwwb6rDqO7oZt9bfRMR7aECn
	OW87WIsr3157RIf34pjd5Q0UWaasTXX9oKLj/105fnu1E+ZkwgwDC2iMdMnoqy3zLnu6
	E8Z+B86p/ELCsmu2l98dGLZPsJsjK4GQ0EeWcTMxrEVqidZjWck7B4hMvdpvlC89dZxE
	/UBS/V2Bitc9LPndyYr6DYYFcYTEQHAB52Tml2JYHOllB+UHbsJaOv3+b3YvcRJRPftw
	zbKQ==
X-Gm-Message-State: AKS2vOzO5Aei6IkzgLC+IuW1fD6q0pjtqNB0XwCAlOL2eQzVMxM3bq7D
	FD+Msq6T1doFow==
X-Received: by 10.36.107.68 with SMTP id v65mr1358206itc.79.1498502077208;
	Mon, 26 Jun 2017 11:34:37 -0700 (PDT)
Received: from mbedesk.Sonatest.net
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by smtp.googlemail.com with ESMTPSA id
	s94sm429641ioi.20.2017.06.26.11.34.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Jun 2017 11:34:36 -0700 (PDT)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: otavio.salvador@ossystems.com.br, openembedded-core@lists.openembedded.org
Date: Mon, 26 Jun 2017 14:33:54 -0400
Message-Id: <1498502034-13181-1-git-send-email-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] cmake: Use find_program if find_host_program is not available
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
X-List-Received-Date: Mon, 26 Jun 2017 18:34:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

CMake does not define the `find_host_program` command we've
been using in the cross-compiling code path.  It was
provided by a widely used Android toolchain file.  For
compatibility, continue to use `find_host_program` if
available, but otherwise use just `find_program`.

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
 meta/recipes-devtools/cmake/cmake.inc              |  1 +
 ...e-find_program-if-find_host_program-is-no.patch | 36 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-FindCUDA-Use-find_program-if-find_host_program-is-no.patch

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index dbd34f5..6aeb25f 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -14,6 +14,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://support-oe-qt4-tools-names.patch \
            file://qt4-fail-silent.patch \
+           file://0001-FindCUDA-Use-find_program-if-find_host_program-is-no.patch \
            "
 
 SRC_URI[md5sum] = "b5dff61f6a7f1305271ab3f6ae261419"
diff --git a/meta/recipes-devtools/cmake/cmake/0001-FindCUDA-Use-find_program-if-find_host_program-is-no.patch b/meta/recipes-devtools/cmake/cmake/0001-FindCUDA-Use-find_program-if-find_host_program-is-no.patch
new file mode 100644
index 0000000..8a61f1f
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/0001-FindCUDA-Use-find_program-if-find_host_program-is-no.patch
@@ -0,0 +1,36 @@
+From 46d25e782ebd9b6c50771b6f30433c58fae03a51 Mon Sep 17 00:00:00 2001
+From: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
+Date: Mon, 26 Jun 2017 11:30:07 -0400
+Subject: [PATCH] cmake: Use find_program if find_host_program is not
+ available
+
+CMake does not define the `find_host_program` command we've been using
+in the cross-compiling code path.  It was provided by a widely used
+Android toolchain file.  For compatibility, continue to use
+`find_host_program` if available, but otherwise use just `find_program`.
+
+Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
+---
+ Modules/FindCUDA.cmake | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/Modules/FindCUDA.cmake b/Modules/FindCUDA.cmake
+index a4dca54..77ca351 100644
+--- a/Modules/FindCUDA.cmake
++++ b/Modules/FindCUDA.cmake
+@@ -679,7 +679,11 @@ if(CMAKE_CROSSCOMPILING)
+   # add known CUDA targetr root path to the set of directories we search for programs, libraries and headers
+   set( CMAKE_FIND_ROOT_PATH "${CUDA_TOOLKIT_TARGET_DIR};${CMAKE_FIND_ROOT_PATH}")
+   macro( cuda_find_host_program )
+-    find_host_program( ${ARGN} )
++    if (COMMAND find_host_program)
++      find_host_program( ${ARGN} )
++    else()
++      find_program( ${ARGN} )
++    endif()
+   endmacro()
+ else()
+   # for non-cross-compile, find_host_program == find_program and CUDA_TOOLKIT_TARGET_DIR == CUDA_TOOLKIT_ROOT_DIR
+--
+2.1.4
+
-- 
2.1.4


