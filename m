Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2161C65F45
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 16:05:44 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id a1so1201036wgh.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 May 2014 09:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1mY93TbJoWDQ/5Pn6P3qk/0YjiuCGG6/RR//6R0yT2M=;
	b=HJQZ0GSdpkG5UFfQWAZdrKnW5+3lIsy15uqGs5PsvZ55gPOjZxKO0P7V0370xb1TSp
	0v5rQ3ImsrenX+StynoivuAhVXMxu/+CnwjGmEPBJ5SbW2j5XFFBigeoiBqbIn7f10Kw
	AsI1UErPw2aA8VJV7ordo7Y7a1X+234C9q4G0FLSIRiiHdTYa1G6Dfu+Ee7Qn5aFe5Je
	NN+/MMLUTm+vyrg0d6vxq1D7whf+ms2vv27HDhdxABVAI9FokTSPV7fgG3t30ztUGAIm
	0ljaar6fPJNav3eCC+ep77B9PyGxG0hP0N2m5NdVoW7X57jXXx9jZDR727WZ6Xd1TE+N
	pdvg==
X-Gm-Message-State: ALoCoQkcSbKQ83WgRpKkaajb3rpTjubNlTrGEW7ZlDa9bdQfNoFaKAZvwwQcxmR9/Roi3CUNGSmX
X-Received: by 10.194.203.170 with SMTP id kr10mr39662207wjc.19.1399478745213; 
	Wed, 07 May 2014 09:05:45 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	cd10sm32480474wib.0.2014.05.07.09.05.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 May 2014 09:05:44 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 May 2014 17:05:33 +0100
Message-Id: <1399478735-27819-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1399478735-27819-1-git-send-email-ross.burton@intel.com>
References: <1399478735-27819-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/5] libxcb: disable check to avoid floating dependencies
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
X-List-Received-Date: Wed, 07 May 2014 16:05:47 -0000

The "check" module is checked for in configure without any way to explicitly
enable or disable it, but it isn't a build dependency of libxcb.  If it's found
libxslt is also checked for, which is a build dependency but will only be used
if check is also present.

As the libxcb unit test suite is minimal at present, forcibly disable the test
for check and remove the libxslt-native build dependency.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libxcb.inc          |    5 ++--
 .../xorg-lib/libxcb/disable-check.patch            |   25 ++++++++++++++++++++
 2 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxcb/disable-check.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxcb.inc b/meta/recipes-graphics/xorg-lib/libxcb.inc
index 75a43a5..453f550 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb.inc
+++ b/meta/recipes-graphics/xorg-lib/libxcb.inc
@@ -10,10 +10,11 @@ BBCLASSEXTEND = "native nativesdk"
 SECTION = "x11/libs"
 LICENSE = "MIT-X"
 
-DEPENDS = "xcb-proto xproto libxau libxslt-native xcb-proto-native libpthread-stubs"
+DEPENDS = "xcb-proto xproto libxau xcb-proto-native libpthread-stubs"
 
 SRC_URI = "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.bz2 \
-           file://xcbincludedir.patch"
+           file://xcbincludedir.patch \
+           file://disable-check.patch"
 
 PACKAGES_DYNAMIC = "^libxcb-.*"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxcb/disable-check.patch b/meta/recipes-graphics/xorg-lib/libxcb/disable-check.patch
new file mode 100644
index 0000000..5f59a2b
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxcb/disable-check.patch
@@ -0,0 +1,25 @@
+The "check" package is checked for without an explicit enable/disable option,
+which can lead to non-deterministic build issues with both check and libxslt.
+
+As the unit test suite is minimal at present, simply disable the test suite.  In
+the future if the test suite is expanded this can be made conditional on the
+ptest DISTRO_FEATURE.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+
+diff --git a/configure.ac b/configure.ac
+index 6d7c9a5..22cceb9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -21,7 +21,8 @@ AC_USE_SYSTEM_EXTENSIONS
+ 
+ AM_PATH_PYTHON([2.6])
+ 
+-PKG_CHECK_MODULES(CHECK, [check >= 0.9.4], [HAVE_CHECK=yes], [HAVE_CHECK=no])
++dnl PKG_CHECK_MODULES(CHECK, [check >= 0.9.4], [HAVE_CHECK=yes], [HAVE_CHECK=no])
++HAVE_CHECK=no
+ AM_CONDITIONAL(HAVE_CHECK, test x$HAVE_CHECK = xyes)
+ 
+ AC_CONFIG_HEADERS([src/config.h])
\ No newline at end of file
-- 
1.7.10.4


