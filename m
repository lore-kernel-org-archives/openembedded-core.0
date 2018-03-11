Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9526F788AC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 00:42:33 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id t3so10103622wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 16:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Zd+ASWflU58KCV7sUXGlpJQm4nwNnOG9/c1rEA28RDs=;
	b=RKDX/PMx9jaaEVGQa6Az38en0P/UGKWUhoM8BoAhRiz0/5IrazMq9Vb9douMv8Vl4T
	7SyAjk2M1sIfyf1xQOjDlUnXI+S7s7fshXQHrmigFHBNcdeRNIV7x7eib7B/kNySDNk7
	UymX+PJaZYeKeYPxn6nvvfKYyB7jpehkAPQQzjf2CIJc5Inl0WhqrFFN+26vOEEhCh5e
	SA1O9ii7ImB9hdUhVrJ9VYTyQg1mE3nDAV2Nj6lXSka6uByhfJzmI/yJCWsw8XJBD7Hq
	1CaFwttB7kFgLZftSZAF+f+zS8ctrqq0NtyJ9y6d5p9rrbhi16aai/FzJYQ+GJfdg9eo
	Gzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Zd+ASWflU58KCV7sUXGlpJQm4nwNnOG9/c1rEA28RDs=;
	b=jF4NTWgcimWtLm7uZn3HbkiLzLM+krwYdntBdRbRMvxZ1wEmEiTkqu8juWgGMyNtfj
	w1ajI/4HeKBhu0hQ2G4oyB+VqhKc53/XIvfEdwpP6V4RyJQLzDJzaAiVq4+5gRzaKDEo
	KaIhb+Zt/Shm854r0ygg9Ixm5l81gYX4ElF9YVW+Kv1pQl21Boi4Z2n2hjba0xrj8G/n
	+4IyFdj6TEMbYcexQ4+oocdXbRDbsVjkchJSf94H989YAGyoIhhLTFNxYTs3y10rGuZ5
	0sWvZ0b4QYlAlPK6ECBCE+EO4NGWlhIDlIQoCKciUw/1eRwVoKuhVZ0240JyC9o8zQg6
	qrJg==
X-Gm-Message-State: AElRT7F/5nO5crUU9ajt92lxQFzxj/Pytt4j9uKqKKI3UCYdQMW8NgPk
	fZGuPJwd/T9rI3tz2biGXEE=
X-Google-Smtp-Source: AG47ELspQFVoydh8QoJhE3gtDJW6FO7KLS1nA04IFaXZ5F+7eaPg49GUnVcjusRoHA0n08sldiWBWw==
X-Received: by 10.28.20.84 with SMTP id 81mr2286530wmu.70.1520728954153;
	Sat, 10 Mar 2018 16:42:34 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	b45sm5356908wrb.79.2018.03.10.16.42.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 10 Mar 2018 16:42:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 11 Mar 2018 00:42:13 +0000
Message-Id: <ce18ec34549cf11d84a906c2abe7a492b8687c4f.1520728802.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <cover.1520728802.git.Martin.Jansa@gmail.com>
References: <cover.1520728802.git.Martin.Jansa@gmail.com>
Subject: [morty][PATCH 01/16] gnutls_3.5.3.bb: Fix native build on distro with kernel < 3.4.17
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
X-List-Received-Date: Sun, 11 Mar 2018 00:42:33 -0000

From: Khem Raj <raj.khem@gmail.com>

When using distros which use old kernels gnutls fails to build
due to missing SYS_getrandom, therefore we need to check for this
before using it.
Fixes errorr e.g.

| ../../../gnutls-3.5.3/lib/nettle/rnd-linux.c: In function 'have_getrandom':
| ../../../gnutls-3.5.3/lib/nettle/rnd-linux.c:59:42: error: 'SYS_getrandom' undeclared (first use in this function)
|  #  define getrandom(dst,s,flags) syscall(SYS_getrandom, (void*)dst, (size_t)s, (unsigned int)flags)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../gnutls/gnutls/check_SYS_getrandom.patch        | 35 ++++++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.5.3.bb        |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/check_SYS_getrandom.patch

diff --git a/meta/recipes-support/gnutls/gnutls/check_SYS_getrandom.patch b/meta/recipes-support/gnutls/gnutls/check_SYS_getrandom.patch
new file mode 100644
index 0000000000..535c22af14
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/check_SYS_getrandom.patch
@@ -0,0 +1,35 @@
+From f26c3979ab0325edb2e410d287bc501cf00e0ac0 Mon Sep 17 00:00:00 2001
+From: Nikos Mavrogiannopoulos <nmav@redhat.com>
+Date: Mon, 22 Aug 2016 16:32:34 +0200
+Subject: [PATCH] rnd-linux: added check for SYS_getrandom being defined
+
+This allows to compile the getrandom() code in old Linux systems
+which do not have the system call defined.
+---
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ lib/nettle/rnd-linux.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/lib/nettle/rnd-linux.c b/lib/nettle/rnd-linux.c
+index d7f07a6..7a24d05 100644
+--- a/lib/nettle/rnd-linux.c
++++ b/lib/nettle/rnd-linux.c
+@@ -56,7 +56,11 @@ static dev_t _gnutls_urandom_fd_rdev = 0;
+ # else
+ #  include <sys/syscall.h>
+ #  undef getrandom
+-#  define getrandom(dst,s,flags) syscall(SYS_getrandom, (void*)dst, (size_t)s, (unsigned int)flags)
++#  if defined(SYS_getrandom)
++#   define getrandom(dst,s,flags) syscall(SYS_getrandom, (void*)dst, (size_t)s, (unsigned int)flags)
++#  else
++#   define getrandom(dst,s,flags) -1
++#  endif
+ # endif
+ 
+ static unsigned have_getrandom(void)
+--
+libgit2 0.24.0
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.5.3.bb b/meta/recipes-support/gnutls/gnutls_3.5.3.bb
index b2dbb07124..04005883a9 100644
--- a/meta/recipes-support/gnutls/gnutls_3.5.3.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.5.3.bb
@@ -4,6 +4,7 @@ SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
             file://0001-configure.ac-fix-sed-command.patch \
             file://use-pkg-config-to-locate-zlib.patch \
             file://0001-Use-correct-include-dir-with-minitasn.patch \
+            file://check_SYS_getrandom.patch \
             file://CVE-2016-7444.patch \
            "
 SRC_URI[md5sum] = "6c2c7f40ddf52933ee3ca474cb8cb63c"
-- 
2.15.1


