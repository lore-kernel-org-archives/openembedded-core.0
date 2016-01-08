Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 25FC373FA3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:29 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id q19so143325981qke.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=5Qy7NILE14vjntCfb5n9e1m0i0ApZxsoqQm2LiUZx8A=;
	b=SjmGr6x+C9yyA0i/MW6xzyY+CrPEXIrHWdGAPXgstf3zWCPR+taIm7HDPPG9Vzt4ic
	kgQWg76ay+N5Q0jmA0itTAHjNEB4YLymMgss0Qp6akf4cP3GQdu+C+hSzqTLII+zdW9w
	ihDG2mviaSsKg2HHl/pVzPiUu3d55zwBzumytCbwkbg3DOq/OqLsNuUzALMaFF4Iy6D9
	YYpWEr4MgFV6gWCvQGAck6B5T/bVjbHl7J6RAOypk9z+2uwdsv+Q7ww3/Yjs+8HuLBka
	GEjKp1asRQs7dG7G084w7lu0N2UPNLRKds+dwIaJPITgEJmIvyyXILMYDhnyEpRRDH/q
	vfNA==
X-Received: by 10.55.80.68 with SMTP id e65mr144496618qkb.46.1452248370597;
	Fri, 08 Jan 2016 02:19:30 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:18:33 +0000
Message-Id: <4fca82e9f20d672e44593766317c1745419bde73.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 05/53] tcp-wrappers: Fix build with musl
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:30 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../tcp-wrappers/tcp-wrappers-7.6/musl-decls.patch | 31 ++++++++++++++++++++++
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |  4 +++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/musl-decls.patch

diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/musl-decls.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/musl-decls.patch
new file mode 100644
index 0000000..eee640e
--- /dev/null
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/musl-decls.patch
@@ -0,0 +1,31 @@
+__BEGIN_DECLS/__END_DECLS are BSD specific and not defined in musl
+glibc and uclibc had sys/cdefs.h doing it.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: tcp_wrappers_7.6/tcpd.h
+===================================================================
+--- tcp_wrappers_7.6.orig/tcpd.h
++++ tcp_wrappers_7.6/tcpd.h
+@@ -11,7 +11,9 @@
+ #include <netinet/in.h>
+ #include <stdio.h>
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ 
+ /* Structure to describe one communications endpoint. */
+ 
+@@ -252,6 +254,8 @@ extern char *fix_strtok();
+ extern char *my_strtok();
+ #endif
+ 
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index 2630478..5fdbbce 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -43,6 +43,7 @@ SRC_URI = "ftp://ftp.porcupine.org/pub/security/tcp_wrappers_${PV}.tar.gz \
            file://try-from.8 \
            file://safe_finger.8 \
            file://makefile-fix-parallel.patch \
+           file://musl-decls.patch \
            "
 
 SRC_URI[md5sum] = "e6fa25f71226d090f34de3f6b122fb5a"
@@ -73,6 +74,9 @@ EXTRA_OEMAKE = "'CC=${CC}' \
 
 EXTRA_OEMAKE_NETGROUP = "-DNETGROUP -DUSE_GETDOMAIN"
 EXTRA_OEMAKE_NETGROUP_libc-uclibc = "-DUSE_GETDOMAIN"
+EXTRA_OEMAKE_NETGROUP_libc-musl = "-DUSE_GETDOMAIN"
+
+EXTRA_OEMAKE_append_libc-musl = " 'LIBS='"
 
 do_compile () {
 	oe_runmake 'TABLES=-DHOSTS_DENY=\"${sysconfdir}/hosts.deny\" -DHOSTS_ALLOW=\"${sysconfdir}/hosts.allow\"' \
-- 
2.7.0


