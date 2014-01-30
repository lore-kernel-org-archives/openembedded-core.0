Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 997956EA9E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 04:11:57 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id x10so2539870pdj.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 20:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=5c37DQ/soKwXTFv3k84vGQ67lJO+qbbKEbfdsyoydLo=;
	b=YrEfBve6hPOoY68meAOq7BrIVQFhjR6BBOmzToFnJA/fEgrpbTlHxd+988T4ortMuc
	0bn8XMxmGZLNLRz8+IMqR/w0qfynE3ytZxli3qCjB8wypoAbOLtVdiL954kzE2ZAy6mt
	Ndyskqf7PY3GpaTAz2v7/uqhCqWuGI8CDjC/Uv68EvmLejpOJqyYuY1eI0IUMV8ekDX/
	IXT7aBs7wDc80v/yvkbiYc+JDwWijgYUs9O7liNNOtQ6LX6kagqsGw9hy0yufiAd6ddu
	VE1S7Kp4pOLaaEF9bCnPyx/aD5JLBaJ0fl0y7b6+Q3CaufnysoPNobMmt2XrrRhh5l1x
	/D6w==
X-Received: by 10.67.5.233 with SMTP id cp9mr11825368pad.147.1391055118902;
	Wed, 29 Jan 2014 20:11:58 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	iu7sm12388951pbc.45.2014.01.29.20.11.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Jan 2014 20:11:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2014 20:12:34 -0800
Message-Id: <7c9e7a341f96a0afa58c0cb69de129c06853e4c1.1391054829.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <c47e65e2da5790bc54aaf1bca87f2702dac64988.1391054829.git.raj.khem@gmail.com>
References: <c47e65e2da5790bc54aaf1bca87f2702dac64988.1391054829.git.raj.khem@gmail.com>
In-Reply-To: <cover.1391054829.git.raj.khem@gmail.com>
References: <cover.1391054829.git.raj.khem@gmail.com>
Subject: [PATCH 12/15] distutils3.bbclass: Fix typo and use proper values for target sysroot
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
X-List-Received-Date: Thu, 30 Jan 2014 04:11:57 -0000

Since OE-Core times we now have machine specific sysroots
for targets unlike before when we used arch specific sysroots
so reflect that here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/distutils3.bbclass |   11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index f118fa0..9c841e4 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -11,19 +11,18 @@ DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix} \
 distutils3_do_compile() {
          STAGING_INCDIR=${STAGING_INCDIR} \
          STAGING_LIBDIR=${STAGING_LIBDIR} \
-         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+         BUILD_SYS=${BUILD_SYS} HOST_SYS=${MACHINE} \
          ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
          build_ext --include-dirs ${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} \
-         --library-dirs ${STAGING_LIBCDIR}/${PYTHON_DIR} \
+         --library-dirs ${STAGING_LIBDIR}/${PYTHON_DIR} \
          ${DISTUTILS_BUILD_EXT_ARGS} \
          build ${DISTUTILS_BUILD_ARGS} || \
-         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py build_ext ${DISTUTILS_BUILD_ARGS} || \
          bbfatal "${PYTHON_PN} setup.py build_ext execution failed."
 }
 
 distutils3_stage_headers() {
         install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
-        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+        BUILD_SYS=${BUILD_SYS} HOST_SYS=${MACHINE} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
         bbfatal "${PYTHON_PN} setup.py install_headers execution failed."
 }
@@ -33,7 +32,7 @@ distutils3_stage_all() {
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
         PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
-        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+        BUILD_SYS=${BUILD_SYS} HOST_SYS=${MACHINE} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
         bbfatal "${PYTHON_PN} setup.py install (stage) execution failed."
 }
@@ -43,7 +42,7 @@ distutils3_do_install() {
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
-        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+        BUILD_SYS=${BUILD_SYS} HOST_SYS=${MACHINE} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
         bbfatal "${PYTHON_PN} setup.py install execution failed."
 
-- 
1.7.10.4


