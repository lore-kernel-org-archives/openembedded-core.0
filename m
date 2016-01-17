Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id D0914731AC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:36:59 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id e65so142592195pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=5Qy7NILE14vjntCfb5n9e1m0i0ApZxsoqQm2LiUZx8A=;
	b=A5a5INs3ot+9WL27OSmZovk+PzuYlde0e0/76pyeqBPWtkYWDuovu50NW56i2u2wrx
	2Eog9gEFp7r34QpMiqOvdgzhtFdzywmnl1gdf8yCEJwQjzxM6cLFwHcPML6NS2gWt6RZ
	J7YgpuInu7G+m7JRaAtaI2a5sfoXOfAv0cFbPtVKh1T8A8gvi6RHQzCTOK5Nb6FL592m
	XS9HRl8fgfaKhRSPqRQMld0Vs1jH3qkZdPWs6Oj9AdMWULk+UHskHIBPLbDKfeMgGEro
	rlqbSO/x/iCYKovodOiqSYZTPAziuiTOyeOdSUm8q1esMaBEks6go+pwwubV9apEUee+
	F6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=5Qy7NILE14vjntCfb5n9e1m0i0ApZxsoqQm2LiUZx8A=;
	b=UHO9G1qeW/isYkbPt0Fedal2s4C49thVxmadNHk7SG6oFjKxfz1tTDy3jNCBxfSDaR
	LL1uQDoF/dfuIMshU81Ox6334baqO2pk6TTchDfLofmeeRdEgPdAO5ZE+UILMJcGfsmW
	sJxMWZiWVNFlbFzvVbx5zIsO65FEjbqZ/qkjZXZOYQgUf38712w5z75YTFgPf0kQHnfU
	ccxHuWn3gCfyth2EqX3KcvmzEUk3kwEUjCJD8pitpgQXi/7kPQ4GjNyJyvp9vskRJIrQ
	brikksqFVDPDxRXaKM87xyyskG86kyM0h06mB8qf+OBwnoDqGbH8MhtGfprHu+IeZVMC
	kBpA==
X-Gm-Message-State: ALoCoQkdYXQonltKhpxdIFtx5sQqN2e2W1XSZVGDDtj6gHXTbm//+E4OJmqUo2P0sViflFyxeAovBVKMyUg3UT/JGsQLp9KHrg==
X-Received: by 10.98.64.215 with SMTP id f84mr28703722pfd.113.1453030620491;
	Sun, 17 Jan 2016 03:37:00 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.36.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:36:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:35:37 -0800
Message-Id: <38bac862e61ba8caa4644ff71ac8e386fcfd4302.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 04/73] tcp-wrappers: Fix build with musl
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
X-List-Received-Date: Sun, 17 Jan 2016 11:36:59 -0000

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


