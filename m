Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 31BFD6F60A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Mar 2014 05:41:08 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id r10so4243901pdi.30
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Mar 2014 22:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=6zfREK07thjsgmtnFbpUk1A6wjNb/reWh3/NKxVls7I=;
	b=b6yOSEkyBXHWo2gnQrCB3N4H1PDahP1ZsZsA5NibBsnk9z2RBjS0IVLtWEk9yaE95l
	qqNtx9lweo3+vJctg1lX7axIPfTbl4U+yIdWLTw6noRhrBGs8ElGEf0dS7sMzs4jEVZx
	Jm+Ish3need0ua4U7TNaVB65AQyJc5EEpDNGpYHLn9XEAsJ/iFE/1tiFHHPRCf4pHG1X
	iX5XdCl2OWDpgoy8BPwRRygwcyqWZbmaKhEzVg3/pxg5Iq4iztBcwOYrMSgNPdt1rOuQ
	lS+FPqmUxtLsR4vfsGBq0hTmHwJqrpaABTsVTgfFw+V48b+n7C/7fQrUE/QtcvkpqWjh
	/Vpg==
X-Received: by 10.67.5.7 with SMTP id ci7mr18141701pad.99.1394948470067;
	Sat, 15 Mar 2014 22:41:10 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	vo1sm51397193pab.32.2014.03.15.22.41.09 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Mar 2014 22:41:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Mar 2014 22:42:29 -0700
Message-Id: <4fe38ebdc644fa0880bd83bcf3325fd34070a73e.1394948105.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <f781f5c6b9ef505eb86992a27cfb6e3e480db408.1394948105.git.raj.khem@gmail.com>
References: <f781f5c6b9ef505eb86992a27cfb6e3e480db408.1394948105.git.raj.khem@gmail.com>
In-Reply-To: <cover.1394948105.git.raj.khem@gmail.com>
References: <cover.1394948105.git.raj.khem@gmail.com>
Subject: [PATCH 4/7] glib-2.0: Fix localedir expectations for uclibc
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
X-List-Received-Date: Sun, 16 Mar 2014 05:41:09 -0000

DATADIRNAME is used by many applications using autotools
to install locale data, we get a wrong value for uclibc
systems since it does not recognise it as proper linux
systems and start putting locale info in /usr/lib instead
of /usr/share

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/uclibc.patch | 20 ++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb    |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/uclibc.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/uclibc.patch b/meta/recipes-core/glib-2.0/glib-2.0/uclibc.patch
new file mode 100644
index 0000000..2a154fd
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/uclibc.patch
@@ -0,0 +1,20 @@
+Fix DATADIRNAME on uclibc/Linux
+
+translation files are always installed under PREFIX/share/locale in uclibc
+based systems therefore lets set DATADIRNAME to "share".
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+Index: glib-2.38.2/m4macros/glib-gettext.m4
+===================================================================
+--- glib-2.38.2.orig/m4macros/glib-gettext.m4	2013-11-07 07:29:13.000000000 -0800
++++ glib-2.38.2/m4macros/glib-gettext.m4	2014-03-15 14:51:54.712135644 -0700
+@@ -239,7 +239,7 @@
+ 	      [CATOBJEXT=.mo
+                DATADIRNAME=lib])
+ 	    ;;
+-	    *-*-openbsd*)
++	    *-*-openbsd* | *-*-linux-uclibc*)
+ 	    CATOBJEXT=.mo
+             DATADIRNAME=share
+ 	    ;;
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb
index 6c336f7..4052950 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb
@@ -15,6 +15,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://ptest-paths.patch \
            file://gtest-skip-fixes.patch \
            file://gio-test-race.patch \
+           file://uclibc.patch \
           "
 
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
-- 
1.9.0


