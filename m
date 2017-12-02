Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id ED65878416
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Dec 2017 00:37:41 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id s66so11738072wrc.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Dec 2017 16:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=g3LkhP7QZKHbKIstKRYQ7nubt79ldby2Gyfep7Pma2o=;
	b=Mpm77+EqQVHKjvMvMfiGJPLu1P3T84wQah+zO7B4gKTI6FDrVux8kHHqtRCkKIzuyJ
	Rj8H5n4tRtO2THSh/KVhDFpXJHdyBIqbouJjb3vuzK9G/ZTfpNPglKn91DFUcCuqc5BY
	gHxc+ildx/5cuUZwAfkbpF7p86XGEpfDhjJbp1quwGRgZbmKsC6qKkw+aOaF21V7qT6N
	LjHMVawIt9fsaVzGgp6R5aI2ZVxXl4lobuz3vedF1hSxyLXsNKsbYoQDTU4s7bSXuLkP
	A1cHNCr5uof6cXk0kZwca/LzKA6mWHJ/Mq7qbmAtfD0Xkgv50GSEF9gMsQJiayJJiQxC
	gMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=g3LkhP7QZKHbKIstKRYQ7nubt79ldby2Gyfep7Pma2o=;
	b=cQieY7zB57TJHQA0Nr9sN8vhBxgn2K6L9qOOD+VCKVyH5vzuPrfZvgSs5IwkQqX66Q
	B75t6rU4zSck8S9H8VWOduSseAA8U/77rzS+4tjEAR1aKyNvhClWb0und2b3wHC1b5kV
	xD6UzoNh7zrUegWxSR60+NAjhy5/CA3aI/tUWsJ6KuaT4PrM33edbTaxpy1/fykMSnjF
	cXKoqM6Fo+4aEk16AdcKLanEVnoWLCTiLmaoEo32J3v+Ma7ouTBTYSsOH0tmsmOXcu1C
	wItyxsOjzvGKBB2jL2bmAiGYNFsjrJcX7hQlB3vIfgrnWyiQ3ETTn+C+vnR61jBwNtGL
	tkZQ==
X-Gm-Message-State: AJaThX6tc7DfPRtKIGhK2hBTQeiRgftptcodE2iZmyEVMXij8Ao9VMTT
	KG/esm62SUpSg2zXQqrbNlsY3g==
X-Google-Smtp-Source: AGs4zMZ58cNM3OXS65D6S0YUA1SBhniXMHaG5ArDskQRFTO/cAfc8jBr/q21wR9DCao10lX4QLv4Nw==
X-Received: by 10.223.150.118 with SMTP id c51mr6292090wra.202.1512175062655; 
	Fri, 01 Dec 2017 16:37:42 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	q13sm5997879wrg.97.2017.12.01.16.37.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Dec 2017 16:37:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Dec 2017 00:37:37 +0000
Message-Id: <1512175057-78-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20161018011619.31677-1-raj.khem@gmail.com>
References: <20161018011619.31677-1-raj.khem@gmail.com>
Subject: [morty][RESEND][PATCH] gnutls_3.5.3.bb: Fix native build on distro with kernel < 3.4.17
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
X-List-Received-Date: Sat, 02 Dec 2017 00:37:42 -0000

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
---
 .../gnutls/gnutls/check_SYS_getrandom.patch        | 35 ++++++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.5.3.bb        |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/check_SYS_getrandom.patch

diff --git a/meta/recipes-support/gnutls/gnutls/check_SYS_getrandom.patch b/meta/recipes-support/gnutls/gnutls/check_SYS_getrandom.patch
new file mode 100644
index 0000000..535c22a
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
index b2dbb07..0400588 100644
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
2.7.4


