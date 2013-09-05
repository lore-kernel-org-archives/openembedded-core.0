Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id C425E61642
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 04:17:47 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id y10so1238588pdj.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2013 21:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=73Ar0AQTr99KXeL2RcWzBIC5N1H84b9ri/susEMUgpY=;
	b=K+MjzyP8/qanu9BJbWyNs0Qn+qoXdSqmdS5jSzwIfTLDxrTvOdiQUXowPfJtO23B6c
	pkmYhWzD8S5PkjhraPQEvYug7OGYESWXvtKOKHKXYGGN4M1jcS/3EeyV2zjV7kxsvU70
	DoSenjqXHS6g9AHwGdvB+4JxyoppPjF2NM+JauLPmjNCnpIRirFj/MTvUe6qB/i9HING
	p4I6eg5qhQ0Wgk+nyM079gOY4G3m+15FtBL0bpoYlHAXbRSH7lMXSgFAuvMb4m9g7frb
	t9IS4qj8ByCWPC5imNIBeYgZLgEcTKXAvjKSX03nvqQXqKAjUhN6WiNLdNJYYOO1JVRM
	XXYw==
X-Received: by 10.68.113.99 with SMTP id ix3mr6770622pbb.180.1378354669952;
	Wed, 04 Sep 2013 21:17:49 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	tr10sm32571783pbc.22.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Sep 2013 21:17:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Sep 2013 21:16:17 -0700
Message-Id: <97d3a10d805464299a07a118958277b2aefd2704.1378354382.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <01b4612b2453648a4b5f203acd8326b73ef293f3.1378354382.git.raj.khem@gmail.com>
References: <01b4612b2453648a4b5f203acd8326b73ef293f3.1378354382.git.raj.khem@gmail.com>
In-Reply-To: <cover.1378354381.git.raj.khem@gmail.com>
References: <cover.1378354381.git.raj.khem@gmail.com>
Subject: [PATCH 12/13] distutils3.bbclass: Fix typo and use proper values for target sysroot
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
X-List-Received-Date: Thu, 05 Sep 2013 04:17:47 -0000

Since OE-Core times we now have machine specific sysroots
for targets unlike before when we used arch specific sysroots
so reflect that here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/distutils3.bbclass | 11 +++++------
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
1.8.4


