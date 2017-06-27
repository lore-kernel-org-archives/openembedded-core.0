Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2FABC77FF9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 14:15:05 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id z62so18128502ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 07:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4T4rb/80fHcJN+DP7hIcJvP3qlcIp7qBRZFn+Qva9ck=;
	b=KmyfTvkRF+5444H4WNC3tG1YHjO/xhDgPqMG09ybHaGWLzBOh7Ayhf+icChbBDBTPz
	8fkY5yHRCNGEwxUp0oUIZnjquepiSPzX8nVlPfH7iQnxN4cufn91l/spHwSSn8Em66IF
	aGo+erpdBbj2X8a2KiKY8tQJ5907JBZWSMhya3vzRKXjtSoYBIriUCq0c/kzG+zmHYjH
	kGa1Gy74rfCC2FlKOsQzhesCb+AusQ2gYvM7jnwU2br7bzvT8CH6thoJG4uWibfssUft
	JRGlYNLmoAbhHxobqbjgPPxRPai3gw2n+AGHIjDzgfHGCWa8+FacxnSzVymEKXkiFS/p
	wSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4T4rb/80fHcJN+DP7hIcJvP3qlcIp7qBRZFn+Qva9ck=;
	b=Cd0NapJ05oceQAZI2shIbqDZ4JLwpb74+XfqIaQVQcLmwVM/gmHoKkpeExXfU6NvK1
	a7Ma1EJFGGtPkUEfXSL1Zlq+XvizQBIElmELfo/hCT4jETBuUuZ1bElPZ/mUIaq/UZZi
	hCntwDj3gQAVf5ChpJvzC9L+lPHfIHsxFCbMIhNUbQXeRfV8Pj/iOxJI0KplwaFd1w45
	frLsbo9MiJ4MVTod28ldDXpoRAAuK/NKpgaWB1zTvpav0ouI6xpKYqYHYt3Ib+Jiy1Ww
	iSLn/rht5boIAmlyLiGsdr5Jhxb+gpfd14Q/vXjOEx7taHrJ2f19aMSKn5suQv5xuPiB
	bZeg==
X-Gm-Message-State: AKS2vOzEzTfZc9P2CIRk9YANF4TTGg7tIymB6lwCTsD4tt7znec/Sx65
	3kfnEp12ks3JFA==
X-Received: by 10.107.59.216 with SMTP id i207mr6703854ioa.204.1498572906950; 
	Tue, 27 Jun 2017 07:15:06 -0700 (PDT)
Received: from mbedesk.Sonatest.net
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by smtp.googlemail.com with ESMTPSA id
	e34sm1588202ioj.62.2017.06.27.07.15.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 Jun 2017 07:15:06 -0700 (PDT)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: otavio.salvador@ossystems.com.br, openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2017 10:14:52 -0400
Message-Id: <0e65f660ddffdd30bc934af4751266026eab7790.1498512911.git.maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1498512911.git.maxime.roussinbelanger@gmail.com>
References: <cover.1498512911.git.maxime.roussinbelanger@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v2 1/1] cmake: Use find_program if find_host_program is not available
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
X-List-Received-Date: Tue, 27 Jun 2017 14:15:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

CMake does not define the `find_host_program` command we've
been using in the cross-compiling code path.  It was
provided by a widely used Android toolchain file.  For
compatibility, continue to use `find_host_program` if
available, but otherwise use just `find_program`.

Upstream-Status: Accepted [https://gitlab.kitware.com/cmake/cmake/merge_requests/1009]
	- Will be in 3.10

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
Changes in v2:
	- Add upstream-status

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


