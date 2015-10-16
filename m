Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 25CC47570D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 08:00:08 +0000 (UTC)
Received: by payp3 with SMTP id p3so65988131pay.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 01:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=mrefdyqDs2GoOkwhgr3+x49EghG8uPPG0kT7tqDrnyY=;
	b=OHpcUQc7sStcSOR6xQDFTQ4+O9lAH9AZrT3m1kc2JVIy01urXMJfqTOzbUcj0oAoxA
	9a5vMiN6bwoeh7s/WITfMjX/vXO/rCtbJMxC3FaY9SH6mZWTVR+u46EfazwZM2Pg4Cxm
	EyOjtggk/XSAbdfCeg2G77XRqtFc6HJWcPISavbUL1LMg1sNzceHrtfXJZ8q2g9fWUt/
	dXKteCyluDWP/Sgyoaa0ZQmRaeitKcDTg2OneN9uuCvsPNkYTwvaX/YbuAcTuWmyMvgC
	Hy2/SQsdlD303oBupSfDWjlHncpf3nTLXcYl/+YQy43fyYf5QaoSPxX51owmFaXCUqHV
	pEjw==
X-Received: by 10.66.61.205 with SMTP id s13mr14625692par.96.1444982408992;
	Fri, 16 Oct 2015 01:00:08 -0700 (PDT)
Received: from imac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169]) by smtp.gmail.com with ESMTPSA id
	ln10sm19671535pab.29.2015.10.16.01.00.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Oct 2015 01:00:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Oct 2015 00:59:59 -0700
Message-Id: <f1163114774c99a10a7a8914218db5405dc0326d.1444982178.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <10ea250a6d2383cde4f6c3f72e0f527c3b82de42.1444982178.git.raj.khem@gmail.com>
References: <10ea250a6d2383cde4f6c3f72e0f527c3b82de42.1444982178.git.raj.khem@gmail.com>
In-Reply-To: <cover.1444982178.git.raj.khem@gmail.com>
References: <cover.1444982178.git.raj.khem@gmail.com>
Subject: [PATCH 5/9] coreutils: Do not use host paths in getloadavg.m4
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
X-List-Received-Date: Fri, 16 Oct 2015 08:00:09 -0000

helps configure QA pass when building for uclibc

Change-Id: I42e9542829bc3678ee777d0a8768aecdf77eaead
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/coreutils/coreutils-6.9/loadavg.patch | 18 ++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_6.9.bb           |  1 +
 2 files changed, 19 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils-6.9/loadavg.patch

diff --git a/meta/recipes-core/coreutils/coreutils-6.9/loadavg.patch b/meta/recipes-core/coreutils/coreutils-6.9/loadavg.patch
new file mode 100644
index 0000000..c72efd4
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils-6.9/loadavg.patch
@@ -0,0 +1,18 @@
+Remove hardcoded paths so OE's configure QA does not detect it and fail the builds
+For cross compilation is less interesting to look into host paths for target libraries anyway
+
+Upstream-Status: Inappropriate [OE Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: coreutils-6.9/m4/getloadavg.m4
+===================================================================
+--- coreutils-6.9.orig/m4/getloadavg.m4
++++ coreutils-6.9/m4/getloadavg.m4
+@@ -49,7 +49,6 @@ if test $gl_have_func = no; then
+   # There is a commonly available library for RS/6000 AIX.
+   # Since it is not a standard part of AIX, it might be installed locally.
+   gl_getloadavg_LIBS=$LIBS
+-  LIBS="-L/usr/local/lib $LIBS"
+   AC_CHECK_LIB(getloadavg, getloadavg,
+ 	       [LIBS="-lgetloadavg $LIBS"], [LIBS=$gl_getloadavg_LIBS])
+ fi
diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
index 8d5b96d..e9f82ab 100644
--- a/meta/recipes-core/coreutils/coreutils_6.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
@@ -26,6 +26,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.bz2 \
            file://coreutils-build-with-acl.patch \
            file://coreutils-fix-texinfo.patch \
            file://fix_for_manpage_building.patch \
+           file://loadavg.patch \
            "
 
 SRC_URI[md5sum] = "c9607d8495f16e98906e7ed2d9751a06"
-- 
2.6.1


