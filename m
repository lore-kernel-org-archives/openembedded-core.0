Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1B31874197
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:23 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id uo6so404040289pac.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=FpeVJ4iDNJebn5KEgzb/mNdudK2G1EhKoxguSbb+3mo=;
	b=dD+DA/fueJO7aISPKs6X3L72NB59JzLhqW3KmnEQ7vRczpi8J8eUJFgOru5lShOy69
	uL5997rAEU63DCV9d+KWRwDnpZpFCQzpOKe/9GLfaCYDf/9k0+JkHccRpK0xZiiAfOk6
	qeuVPRFcVbn3Pt0t3KJOEejx05AYpWrdrpWwgdS0Qb/rC2ZiYYkvrbs9kndyXIBFb3yR
	i5BkAsZvnfvyCiZfnryGkWmhoN3tgmO8lsfneEGIClwbKIhHXtp8/QA3Vmqs3jmg2+2L
	tvI1aqZMuBEWmzcCUrFg7WoN1hj8uErqbNtRg1kS7ZEDJhuNgm33JBuKBGI49tdGWlUp
	gE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=FpeVJ4iDNJebn5KEgzb/mNdudK2G1EhKoxguSbb+3mo=;
	b=cQ9KSENLE10nBVdq+U4ZvmBTocmfyc0XlWNBmuMSsxj0GMah+IBp9zj6roheVoPIJt
	5iyOcn+RoO3YPTyFwB9uxHBxkcpAqU4E+IPMvFsyb1HqS2PDzvwN0h4uLVw7Qm6LSQ5Z
	f+ejz9r8WyvUryd1+/oLR43RBDGd7P9vmnOD08fQv1IRDZdi2ffkw1qPMUWBal5a0HRm
	gZ0M/WpJSuju6h0Cod/suB0I0ONDLArTah1VlkcGpoLQer44CWqEeHlWGgGZAsWr7MxR
	VhLHMTiIo3DQVCVm4u3Bycbj/ceUXoeuUdJA0SOCzK/BZEMyV8ToalMYkaPfofCo8ELE
	QV+A==
X-Gm-Message-State: ALoCoQkAnQkxLjBOvrEvCyjxQcu0tgatlmJl7zE7HiBy3aSn4wOBxL8JCg+erqWvS4eEy8tbqipRfbAf0bVX/PBmwPi8/mRGOQ==
X-Received: by 10.66.122.97 with SMTP id lr1mr28302778pab.68.1453030644489;
	Sun, 17 Jan 2016 03:37:24 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:35:59 -0800
Message-Id: <fb10d8fc69d3f1f033eba70d46cad10fbad05af2.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 26/73] xinetd: Fix build with musl
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:24 -0000

musl relies on external rpc implemetation (libtirpc)
and exposed a bug in configury when checking for rlim_t

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...se-HAVE_SYS_RESOURCE_H-to-guard-sys-resou.patch | 100 +++++++++++++++++++++
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |   5 ++
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-extended/xinetd/xinetd/0001-configure-Use-HAVE_SYS_RESOURCE_H-to-guard-sys-resou.patch

diff --git a/meta/recipes-extended/xinetd/xinetd/0001-configure-Use-HAVE_SYS_RESOURCE_H-to-guard-sys-resou.patch b/meta/recipes-extended/xinetd/xinetd/0001-configure-Use-HAVE_SYS_RESOURCE_H-to-guard-sys-resou.patch
new file mode 100644
index 0000000..3c1b2f6
--- /dev/null
+++ b/meta/recipes-extended/xinetd/xinetd/0001-configure-Use-HAVE_SYS_RESOURCE_H-to-guard-sys-resou.patch
@@ -0,0 +1,100 @@
+From e8b0ffc7ea04cc71dba97a38e1a134aaf2285c2d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 30 Dec 2015 07:14:50 +0000
+Subject: [PATCH] configure: Use HAVE_SYS_RESOURCE_H to guard sys/resource.h
+ inclusion
+
+HAVE_RLIM_T check will not let sys/resource.h to be checked and
+rlim_t is defined in sys/resource.h so the check would fail.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ aclocal.m4 |  2 +-
+ configure  | 14 +++++++-------
+ 2 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/aclocal.m4 b/aclocal.m4
+index 6e6f32c..70e7076 100644
+--- a/aclocal.m4
++++ b/aclocal.m4
+@@ -11,7 +11,7 @@ AC_CACHE_VAL(xinetd_cv_type_$1,
+ #if HAVE_NETDB_H
+ #include <netdb.h>
+ #endif
+-#if HAVE_RLIM_T
++#if HAVE_SYS_RESOURCE_H
+ #include <sys/resource.h>
+ #endif
+ #if HAVE_STDINT_H
+diff --git a/configure b/configure
+index b507d38..bec56ea 100755
+--- a/configure
++++ b/configure
+@@ -7640,7 +7640,7 @@ cat >>conftest.$ac_ext <<_ACEOF
+ #if HAVE_NETDB_H
+ #include <netdb.h>
+ #endif
+-#if HAVE_RLIM_T
++#if HAVE_SYS_RESOURCE_H
+ #include <sys/resource.h>
+ #endif
+ #if HAVE_STDINT_H
+@@ -7686,7 +7686,7 @@ cat >>conftest.$ac_ext <<_ACEOF
+ #if HAVE_NETDB_H
+ #include <netdb.h>
+ #endif
+-#if HAVE_RLIM_T
++#if HAVE_SYS_RESOURCE_H
+ #include <sys/resource.h>
+ #endif
+ #if HAVE_STDINT_H
+@@ -7732,7 +7732,7 @@ cat >>conftest.$ac_ext <<_ACEOF
+ #if HAVE_NETDB_H
+ #include <netdb.h>
+ #endif
+-#if HAVE_RLIM_T
++#if HAVE_SYS_RESOURCE_H
+ #include <sys/resource.h>
+ #endif
+ #if HAVE_STDINT_H
+@@ -7778,7 +7778,7 @@ cat >>conftest.$ac_ext <<_ACEOF
+ #if HAVE_NETDB_H
+ #include <netdb.h>
+ #endif
+-#if HAVE_RLIM_T
++#if HAVE_SYS_RESOURCE_H
+ #include <sys/resource.h>
+ #endif
+ #if HAVE_STDINT_H
+@@ -7824,7 +7824,7 @@ cat >>conftest.$ac_ext <<_ACEOF
+ #if HAVE_NETDB_H
+ #include <netdb.h>
+ #endif
+-#if HAVE_RLIM_T
++#if HAVE_SYS_RESOURCE_H
+ #include <sys/resource.h>
+ #endif
+ #if HAVE_STDINT_H
+@@ -7870,7 +7870,7 @@ cat >>conftest.$ac_ext <<_ACEOF
+ #if HAVE_NETDB_H
+ #include <netdb.h>
+ #endif
+-#if HAVE_RLIM_T
++#if HAVE_SYS_RESOURCE_H
+ #include <sys/resource.h>
+ #endif
+ #if HAVE_STDINT_H
+@@ -7916,7 +7916,7 @@ cat >>conftest.$ac_ext <<_ACEOF
+ #if HAVE_NETDB_H
+ #include <netdb.h>
+ #endif
+-#if HAVE_RLIM_T
++#if HAVE_SYS_RESOURCE_H
+ #include <sys/resource.h>
+ #endif
+ #if HAVE_STDINT_H
+-- 
+2.6.4
+
diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
index 652fe91..6bfaabe 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
@@ -7,6 +7,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=8ad8615198542444f84d28a6cf226dd8"
 
 DEPENDS = ""
+DEPENDS_append_libc-musl = " libtirpc "
 PR = "r2"
 
 # Blacklist a bogus tag in upstream check
@@ -20,6 +21,7 @@ SRC_URI = "git://github.com/xinetd-org/xinetd.git;protocol=https \
       file://Disable-services-from-inetd.conf-if-a-service-with-t.patch \
       file://xinetd-should-be-able-to-listen-on-IPv6-even-in-ine.patch \
       file://xinetd-CVE-2013-4342.patch \
+      file://0001-configure-Use-HAVE_SYS_RESOURCE_H-to-guard-sys-resou.patch \
       file://xinetd.service \
       "
 
@@ -39,6 +41,9 @@ EXTRA_OECONF="--disable-nls"
 PACKAGECONFIG ??= "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--with-libwrap,,tcp-wrappers"
 
+CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc "
+LDFLAGS_append_libc-musl = " -ltirpc "
+
 do_configure() {
 	# Looks like configure.in is broken, so we are skipping
 	# rebuilding configure and are just using the shipped one
-- 
2.7.0


