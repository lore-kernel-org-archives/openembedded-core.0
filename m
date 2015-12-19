Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 40C9473197
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 23:52:33 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id p187so125049085qkd.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 15:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=yz7L4BYY34ME3EvjQbDQf825eCP4Id84ysjETU8VzTw=;
	b=KWWY/b7ldVS9k1TJfl5xw3qk+S16GlfpT9efvbVuwMuchq3bAvmTnnXrkiNrl+yEVG
	C/FaBFo1+uhAWfCDBuz7Y9r/78gJZEUk0SY7YyTtnff7Mzec2ZNj5HVPlWs0Szz2D68X
	M62dChYRWomRT82eYVhJFMAxH4MGKiZZH0sCPfxvTqLPOAq9u+KzeE1K5ubxl4gF+1Qx
	KzOkCCV0mEzYMEFrx3w+UtScF7lnepvCz+p75eDfc7g2oA+mjFbikWGfo3J3Xe2wf/5E
	T2+YzdITvyYeNTX1761uq0JcXHvCj/bHJiSyanCqB7/Ve02l0NxZwSAXrv2XI7nDtAEH
	t77g==
X-Received: by 10.55.81.132 with SMTP id f126mr15131122qkb.88.1450569154589;
	Sat, 19 Dec 2015 15:52:34 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id c2sm9785372qkb.41.2015.12.19.15.52.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 Dec 2015 15:52:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Dec 2015 23:52:14 +0000
Message-Id: <bef3d325becb97f49bff40f27ae7125dc2d17566.1450568936.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <81170e1970685f34735007c496ce175279d46304.1450568936.git.raj.khem@gmail.com>
References: <81170e1970685f34735007c496ce175279d46304.1450568936.git.raj.khem@gmail.com>
In-Reply-To: <cover.1450568936.git.raj.khem@gmail.com>
References: <cover.1450568936.git.raj.khem@gmail.com>
Subject: [PATCH 05/17] tcp-wrappers: Fix build with musl
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
X-List-Received-Date: Sat, 19 Dec 2015 23:52:34 -0000

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
2.6.4


