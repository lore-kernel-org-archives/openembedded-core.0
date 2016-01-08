Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 91FD8769F8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:44 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id o11so348660995qge.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=FpeVJ4iDNJebn5KEgzb/mNdudK2G1EhKoxguSbb+3mo=;
	b=WYlbTIFEV2dWb0gNpu+RuV9IyvN1Hh5CtfyFJBGiQq87WZP9g/U+lLOHRoMH/C4obc
	2YgPqvKLD60qTWvlYKN4M4ol7AHulqpvZ94xgAC/aBFWv4IDTjg8S5Udv0iKws9sTf9B
	5z91qtPPHPoNTFDw6ZpPcPgZaMWMYwDMOSOycckapBDP0FpYHK1jYc92o7IvTGRnfvsA
	XfXEbn72AQyVi9/LI2s+LwybuhIYbu2gtsDQfn9hzx3z1+NKeX57lWzXiKiA2zTTEpu2
	KOs1nhjs1RxvXHE64yWyy0Ra8XzgxkXjzclPzEQO6lFHBh2Th+cxcarw5NGmCS0+q+P8
	ovmw==
X-Received: by 10.140.109.247 with SMTP id l110mr86664031qgf.52.1452248385364; 
	Fri, 08 Jan 2016 02:19:45 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:18:55 +0000
Message-Id: <426cde93044880589aa8c695904608bde608e02b.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 27/53] xinetd: Fix build with musl
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:45 -0000

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


