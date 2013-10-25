Return-Path: <cazfi74@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1BB1B6D385
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2013 07:39:25 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id o14so436019lbi.28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2013 00:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IlD9TY7SiflkX789tWNXbAfChhyL7+ELf2yHYSk9MHM=;
	b=zLaChHcgn003VFPmkBpRlHdlbC1jEhIWpHTbWfI8jJui3zSxg0pvmut6HKYLEnlGCg
	ijclTf+dCU1SJNXrsvIrlX7g4PBHJPMmtiJeJApBwIpIzxvDkE4liGSnFsvMNiw/a987
	suVYbqHWOQxHG7n9fVsZkN5YqXkOIwqL5TTiloc8yGrqc13/gvFgrnPWTLByWhTOPJif
	OOtkRL1Al+fvCXqus0mn1R1iXWDvJSuq6AGM/8UWQjkvAY4CBGvsb3oF0usbF369HOOP
	BnMq8FauidPoPGANAmt/Xz3KFOkagjOArpXMhtPWtJScLNA+hv+eY2eorjLvKGtO9LEu
	5gqQ==
X-Received: by 10.152.88.74 with SMTP id be10mr4358419lab.4.1382686767477;
	Fri, 25 Oct 2013 00:39:27 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id u18sm1619156lbp.4.2013.10.25.00.39.26
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 25 Oct 2013 00:39:26 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1VZbzR-00083t-F9; Fri, 25 Oct 2013 10:39:25 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2013 10:39:21 +0300
Message-Id: <b4d752157bb874d686fb25ae43e4dc499596c22c.1382686685.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <cover.1382686685.git.cazfi74@gmail.com>
References: <cover.1382686685.git.cazfi74@gmail.com>
Subject: [PATCH 1/4] libxcb: fix build with automake-1.14
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
X-List-Received-Date: Fri, 25 Oct 2013 07:39:26 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../xcb/libxcb/automake_1.14_fix.patch             | 27 ++++++++++++++++++++++
 meta/recipes-graphics/xcb/libxcb_1.9.1.bb          |  2 +-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xcb/libxcb/automake_1.14_fix.patch

diff --git a/meta/recipes-graphics/xcb/libxcb/automake_1.14_fix.patch b/meta/recipes-graphics/xcb/libxcb/automake_1.14_fix.patch
new file mode 100644
index 0000000..0f1fc54
--- /dev/null
+++ b/meta/recipes-graphics/xcb/libxcb/automake_1.14_fix.patch
@@ -0,0 +1,27 @@
+Upstream-Status: Backport
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd libxcb-1.9.1/configure.ac libxcb-1.9.1/configure.ac
+--- libxcb-1.9.1/configure.ac	2013-05-30 18:38:01.000000000 +0300
++++ libxcb-1.9.1/configure.ac	2013-10-24 23:15:10.542507543 +0300
+@@ -7,15 +7,16 @@
+         1.9.1,
+         [xcb@lists.freedesktop.org])
+ AC_CONFIG_SRCDIR([xcb.pc.in])
+-# Set common system defines for POSIX extensions, such as _GNU_SOURCE
+-# Must be called before any macros that run the compiler (like AC_PROG_LIBTOOL)
+-# to avoid autoconf errors.
+-AC_USE_SYSTEM_EXTENSIONS
+
+ # Initialize Automake
+ AM_INIT_AUTOMAKE([foreign dist-bzip2])
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+
++# Set common system defines for POSIX extensions, such as _GNU_SOURCE
++# Must be called before any macros that run the compiler (like AC_PROG_LIBTOOL)
++# to avoid autoconf errors.
++AC_USE_SYSTEM_EXTENSIONS
++
+ AM_PATH_PYTHON([2.6])
+
+ PKG_CHECK_MODULES(CHECK, [check >= 0.9.4], [HAVE_CHECK=yes], [HAVE_CHECK=no])
diff --git a/meta/recipes-graphics/xcb/libxcb_1.9.1.bb b/meta/recipes-graphics/xcb/libxcb_1.9.1.bb
index a40a1c1..b654800 100644
--- a/meta/recipes-graphics/xcb/libxcb_1.9.1.bb
+++ b/meta/recipes-graphics/xcb/libxcb_1.9.1.bb
@@ -3,7 +3,7 @@ include libxcb.inc
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7"
 
-PR = "r0"
+SRC_URI += "file://automake_1.14_fix.patch"
 
 DEPENDS += "libxdmcp"
 
-- 
1.8.4.rc3


