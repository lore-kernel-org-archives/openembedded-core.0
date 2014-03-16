Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 49B9C6F616
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Mar 2014 05:41:10 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id x10so4247215pdj.20
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Mar 2014 22:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=0JirO+1PjyHqNdE4/dYEhexmZL3u05rxzhv1OgzGLbI=;
	b=ApPsL5Q5uwcm1OLEaeWw4OoljensUBJZ0PFLtNcS7Bg+DrOM3DNbA6cWEc0+tzzuoi
	/njU0emFBEjTBJPu0UWDWHJESg7mEX1FFM4GzSkh/9XiSUq3nzHFs1sIzoXDpvV+7BsL
	AizmziwEtb8S4sX4rcpcrepVymfYutqfd+sRuaI2sfWHcYaLAJ9YYzp93u5EGQqEYOxp
	Ck8mYYi5Pg75UCVKtAkat1Yk9C9aTCrT96tXuo1pS9MgJLkC9Q0GS/FHSafxFbl1OeBd
	7xuRbivFNDTwidikVGo6cnFbtbqY9O//7YCKePhclIsfzsq1P10bO8iNI1/+yCXL9d9T
	oerg==
X-Received: by 10.68.137.136 with SMTP id qi8mr17992005pbb.79.1394948472156;
	Sat, 15 Mar 2014 22:41:12 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	vo1sm51397193pab.32.2014.03.15.22.41.11 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Mar 2014 22:41:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Mar 2014 22:42:31 -0700
Message-Id: <aa89e2f5e677b6f237bb063502628435c71c81bb.1394948105.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <f781f5c6b9ef505eb86992a27cfb6e3e480db408.1394948105.git.raj.khem@gmail.com>
References: <f781f5c6b9ef505eb86992a27cfb6e3e480db408.1394948105.git.raj.khem@gmail.com>
In-Reply-To: <cover.1394948105.git.raj.khem@gmail.com>
References: <cover.1394948105.git.raj.khem@gmail.com>
Subject: [PATCH 6/7] intltool: Define DATADIRNAME=share for uclibc based systems
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
X-List-Received-Date: Sun, 16 Mar 2014 05:41:11 -0000

This otherwise makes localedir to point to prefix/lib
which is wrong location for locale splitting and we end
with unpackaged locale files e.g. systemd throws this

WARNING: QA Issue: systemd: Files/directories were installed but not
shipped
  /usr/lib/locale
  /usr/lib/locale/fr
  /usr/lib/locale/pl
  /usr/lib/locale/ru
  /usr/lib/locale/it
  /usr/lib/locale/fr/LC_MESSAGES
  /usr/lib/locale/fr/LC_MESSAGES/systemd.mo
  /usr/lib/locale/pl/LC_MESSAGES
  /usr/lib/locale/pl/LC_MESSAGES/systemd.mo
  /usr/lib/locale/ru/LC_MESSAGES
  /usr/lib/locale/ru/LC_MESSAGES/systemd.mo
  /usr/lib/locale/it/LC_MESSAGES
  /usr/lib/locale/it/LC_MESSAGES/systemd.mo

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../intltool/intltool-0.50.2/uclibc.patch             | 19 +++++++++++++++++++
 meta/recipes-devtools/intltool/intltool_0.50.2.bb     |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/intltool/intltool-0.50.2/uclibc.patch

diff --git a/meta/recipes-devtools/intltool/intltool-0.50.2/uclibc.patch b/meta/recipes-devtools/intltool/intltool-0.50.2/uclibc.patch
new file mode 100644
index 0000000..145c181
--- /dev/null
+++ b/meta/recipes-devtools/intltool/intltool-0.50.2/uclibc.patch
@@ -0,0 +1,19 @@
+on uclibc systems localedir should point to /usr/'share' as usual.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: intltool-0.50.2/intltool.m4
+===================================================================
+--- intltool-0.50.2.orig/intltool.m4	2014-03-15 22:09:01.016627665 -0700
++++ intltool-0.50.2/intltool.m4	2014-03-15 22:12:09.732631206 -0700
+@@ -173,6 +173,9 @@
+     AC_CHECK_FUNC(bind_textdomain_codeset,
+       [DATADIRNAME=share], [DATADIRNAME=lib])
+     ;;
++    *-*-*uclibc*)
++    [DATADIRNAME=share]
++    ;;
+     *)
+     [DATADIRNAME=lib]
+     ;;
diff --git a/meta/recipes-devtools/intltool/intltool_0.50.2.bb b/meta/recipes-devtools/intltool/intltool_0.50.2.bb
index dffce21..483239d 100644
--- a/meta/recipes-devtools/intltool/intltool_0.50.2.bb
+++ b/meta/recipes-devtools/intltool/intltool_0.50.2.bb
@@ -3,6 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI += "file://intltool-nowarn.patch \
+           file://uclibc.patch \
            ${NATIVEPATCHES} \
            "
 
-- 
1.9.0


