Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id EA59D6B230
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 17:16:19 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id bg4so5065386pad.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 10:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=LndFte9GLWTkgHpx8LPeoALoln0KiZhzfWaLBH+p3qg=;
	b=V34Q+763gmpq7JqIhtiUIKucDrs9NUQU16x52UFYcQ2Kn9cSqgibklaV6Yhl4j/Gz/
	FUpxq7Gp5rVL29WKKNX4Ldm8C/m5fNYaThboIdFrPoxKgQDtbTaDzgsZYmUYpBYaZ0eO
	YRKIsu6Q/Lnzc1gIWWkkCbFe8UWFTabUKGXsfvhLyfARVPH6sdNfuikhW201U3ip12MA
	ONX4/AHd4EnEKcAQqkiOo5QwlPoC3etple2iNSylppgaEU39KkKSgBkvoxpp+FYdXA5j
	FkoNvShNUC5sm71M6D7erLyRKafEgzWhbJlBqNWrJC++P3qocYcuZ18bijddFezx06cZ
	ypJw==
X-Received: by 10.68.169.161 with SMTP id af1mr22723435pbc.22.1377623780992;
	Tue, 27 Aug 2013 10:16:20 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id t9sm25769021pba.46.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 10:16:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2013 10:15:13 -0700
Message-Id: <28512aab61554f13ec34600fa75c8202322cbeaa.1377623208.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
References: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
In-Reply-To: <cover.1377623208.git.raj.khem@gmail.com>
References: <cover.1377623208.git.raj.khem@gmail.com>
Subject: [PATCH 14/20] distutils3.bbclass: Fix typo and use proper values for target sysroot
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
X-List-Received-Date: Tue, 27 Aug 2013 17:16:20 -0000

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
1.8.3.4


