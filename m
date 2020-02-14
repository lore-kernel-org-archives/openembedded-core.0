Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9704F610B6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 22:33:30 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id u12so5278700pgb.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 14:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IcALXInf1QWwEnsjWJ97178VdT3OjwjgPyXtHRUpi18=;
	b=lKSXYda4fgfQW4lh6nfFKLxKNEhRHYSllk5f5J9jVC0uMAd/UvODHZdJoCPZy5xzcR
	67BdQSAEt0I35e0b3olKTprVs9kf84XYv+KJ5pjGwUuwm1WiMv23eFd7andGfSJaZbXf
	m3ZVcs7DaZJBUqxQjK+WWqcOPgUz1GSShAkEmasSOUKCG0IVuBT/Ql9oGEDyMI0oLW9V
	p9dR6tzL1EFTxnCPTHL/Z/sdNrfX4EGw9iKtCmVbLubiTCUndCkeiO3GE47J9vhFVloI
	+ObRRePqENMLeDiEB3v69M2nb78Roj+y+JMaWZJ/2N/+j8a2oFz9EjI6XYaFxGYFwx20
	G8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IcALXInf1QWwEnsjWJ97178VdT3OjwjgPyXtHRUpi18=;
	b=pM3XzOqCKPCy8kKUwjOKRCJkmrH1Bod5sWNojWDYoKN52sjkgQooYMiYSovwajQu+7
	xgcZrE3fbrAw3TICE80+B6ApQLypDPYYfSrNxK2WosNm9K4cefWqLgJfoYeG0+85YfKY
	UQ/LKcIZPAmKvBNLvXBYkE/K4wvzPPdCMhxdaSLqgwSm6TYdfvN3n9C+vg7tA9fGHTtl
	UWYBoBXDz/rfyq8pEs7jIOwaMt4qmAow0Zgo9FLV79Epre7KQ96K1F855Bz5VPN7/251
	zuCo7NypqGQcQQQLd3YjLaekvvicsuD/PUGGFIKNRV19R4On+46aBxHCFsNdPuPYK4tp
	FGRA==
X-Gm-Message-State: APjAAAWfzoHsfkSH0k5VXnm21rp8EhYUb8hJncF03fiMfdNbOXTx4vD4
	9sHSeIBWqy5YlRS3WznSaq39gNkM1cc=
X-Google-Smtp-Source: APXvYqyXmwhQV2YffDGtYe0e0A7ZYRtg5X9NcfsSIlu/g+iQQfevtFWOasd8d1qs7vwX81cFTf4tXw==
X-Received: by 2002:a63:5c10:: with SMTP id q16mr5884391pgb.35.1581719611047; 
	Fri, 14 Feb 2020 14:33:31 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::709])
	by smtp.gmail.com with ESMTPSA id a9sm7934911pfo.35.2020.02.14.14.33.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 14:33:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Feb 2020 14:33:34 -0800
Message-Id: <20200214223334.2473195-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] db: Fix timespec length assumptions
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
X-List-Received-Date: Fri, 14 Feb 2020 22:33:30 -0000
Content-Transfer-Encoding: 8bit

This should fix the vdso crashes seen with kernel 5.0+

python3[11312] general protection fault ip:b7e966b0 sp:bf8175cc error:0 in libc.so[b7e8b000+6b000]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...001-clock-Do-not-define-own-timespec.patch | 45 +++++++++++++++++++
 meta/recipes-support/db/db_5.3.28.bb          |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-support/db/db/0001-clock-Do-not-define-own-timespec.patch

diff --git a/meta/recipes-support/db/db/0001-clock-Do-not-define-own-timespec.patch b/meta/recipes-support/db/db/0001-clock-Do-not-define-own-timespec.patch
new file mode 100644
index 0000000000..9d51a44a26
--- /dev/null
+++ b/meta/recipes-support/db/db/0001-clock-Do-not-define-own-timespec.patch
@@ -0,0 +1,45 @@
+From 96b303caf70a7635953c36e5bfb9ad6e75cb7637 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 14 Feb 2020 14:12:59 -0800
+Subject: [PATCH] clock: Do not define own timespec
+
+timespec is provided by libc and its best left to libc
+os_gettime takes a db_timespec and passed its address to clock_gettime
+which assumes that db_timespec and timespec are same but actually
+its 12-bytes here and libc has 16-bytes
+
+This can cause problems especially with 64bit time_t
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/dbinc/clock.h | 17 +----------------
+ 1 file changed, 1 insertion(+), 16 deletions(-)
+
+--- a/src/dbinc/clock.h
++++ b/src/dbinc/clock.h
+@@ -44,22 +44,8 @@
+ extern "C" {
+ #endif
+ 
+-/*
+- * This declaration is POSIX-compatible.  Because there are lots of different
+- * time.h include file patterns out there, it's easier to declare our own name
+- * in all cases than to try and discover if a system has a struct timespec.
+- * For the same reason, and because we'd have to #include <sys/time.h> in db.h,
+- * we don't export any timespec structures in the DB API, even in places where
+- * it would make sense, like the replication statistics information.
+- */
+-typedef struct {
+-	time_t	tv_sec;				/* seconds */
+-#ifdef HAVE_MIXED_SIZE_ADDRESSING
+-	int32_t tv_nsec;
+-#else
+-	long	tv_nsec;			/* nanoseconds */
+-#endif
+-} db_timespec;
++#include <time.h>
++#define db_timespec struct timespec
+ 
+ /* Operations on timespecs */
+ #undef	timespecclear
diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index a2969055a6..badb79f9ea 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -26,6 +26,7 @@ SRC_URI += "file://fix-parallel-build.patch \
             file://0001-configure-Add-explicit-tag-options-to-libtool-invoca.patch \
             file://sequence-type.patch \
             file://0001-Fix-libc-compatibility-by-renaming-atomic_init-API.patch \
+            file://0001-clock-Do-not-define-own-timespec.patch \
            "
 # We are not interested in official latest 6.x versions;
 # let's track what debian is using.
-- 
2.25.0


