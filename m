Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 94B9A77F79
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 14:47:59 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id v202so14791180itb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 07:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=gGGtZaqzeBsNZcd4BYyCEd+j4O4sbBut1XJ3A+U8PiE=;
	b=ZV562IhPaeYoztiBid1PlN6GEAPrZTYpTDgyVh8NgUTPatjg7vKIzb/favPamO8U+l
	geN3qoNfIgkEQNPjPrA6kS5IbM0dITDRqQYdjGT2n5cla1IEFNS8+BbtM8BmZZmlHW67
	5f074ctLxNduJPvBxN6XpaoN6i+F6awxwdEAGFfu8eWGL2L1o9KEW9Sf16I2NIOKuoLK
	TZzEG+K8ar9zoMdNNIKrHNCkGYsERa4qXscFsg1chg4lk48Qxthi+VisfpwfHWq3sxFF
	Na9+4GWTTB0Th2r/yXVKayLlMPQg8V5pBJa6rZ6RS2l+TFT/Affwtd4dxD6bo+QTIt2w
	d/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gGGtZaqzeBsNZcd4BYyCEd+j4O4sbBut1XJ3A+U8PiE=;
	b=gxrwR3qLFATieOKdEbAJh2RN159yre2b2/2kj3Ry1GbZDlM9dwqEKYdut1nyievgNv
	c8o6Ai0hBxvHdTfhq4/Jw173krg8tBPYjPOBBuFwJ0h/KA1w9yCYWcuSltmRJyjokWgc
	Aj13Jo538zaVRTs8Pe0wlOcQGvv5NZSBhiNTGRm9frx6iaonB1xPAssVlw/G+AexXYPU
	IGmPJ2b+SnEywxX3iRRQ4yyK6Drw0UXJ7T0WsFSYHhTGM+GZk1C2A+yJ77XgH+abKh/B
	DLgOp5r/Jh8fm76CI1G4FDnRrKBgRxMgje5LzZw2gteu0TL0VOH+PXH2B9ygO7QxZuyA
	+z1Q==
X-Gm-Message-State: AKS2vOwfj8qeMj3VEvz/giMyDO07cjylel6+OAqRr91jNRpKak2eLfYN
	GK2bz+8rkPL7+g==
X-Received: by 10.36.44.136 with SMTP id i130mr3034255iti.42.1498574880593;
	Tue, 27 Jun 2017 07:48:00 -0700 (PDT)
Received: from mbedesk.Sonatest.net
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by smtp.googlemail.com with ESMTPSA id
	h67sm1439292itb.19.2017.06.27.07.47.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 Jun 2017 07:48:00 -0700 (PDT)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: otavio.salvador@ossystems.com.br, openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2017 10:47:31 -0400
Message-Id: <b4d0ec34dfa75c3b902c7c7eb0e7233756c95b3f.1498574121.git.maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1498574121.git.maxime.roussinbelanger@gmail.com>
References: <cover.1498574121.git.maxime.roussinbelanger@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v3] cmake: Use find_program if find_host_program is not available
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
X-List-Received-Date: Tue, 27 Jun 2017 14:48:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

CMake does not define the `find_host_program` command we've
been using in the cross-compiling code path.  It was
provided by a widely used Android toolchain file.  For
compatibility, continue to use `find_host_program` if
available, but otherwise use just `find_program`.

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
Changes in v3:
	- Moved the Upstream-Status to the patch itself.

 meta/recipes-devtools/cmake/cmake.inc              |  1 +
 ...e-find_program-if-find_host_program-is-no.patch | 40 ++++++++++++++++++++++
 2 files changed, 41 insertions(+)
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
index 0000000..9b820db
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/0001-FindCUDA-Use-find_program-if-find_host_program-is-no.patch
@@ -0,0 +1,40 @@
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
+Upstream-Status: Accepted
+[https://gitlab.kitware.com/cmake/cmake/merge_requests/1009]
+        - Will be in 3.10
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


