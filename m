Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id AE7A177B13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 17:10:57 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id b5so10888393pgg.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 10:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xODqT3ih+2vyp2B11XSOUzR5hLj5cUtsUv5e+iH1EbY=;
	b=h0ca2Otsjb+2oGejdqQNs6Zp9ZAou2n2F7D0gSjBLslRQnAWe9n7sp1tq+jwjXfsBZ
	R3oqxqH+NSXKc/k4wOMglH3ljSG0z7pV22fs94E8vHXnlBMTcvqzDPrFufvwwo23jnps
	7Faal1jWXwolN453BMI2/bBOl+dllnLXlzIlZ+N7fjzWFOlJGV9befEtaV9QakEM8iiC
	O5FHeXZnYtLyAYRGSPQ1AaCyClLbGwXaMVMor93StApVpgquHBRxe334AXkpepbwoNRI
	bP4L4Kq+xm4E2ykZmT1ujFJFzwJ63wQh2hqoJTLyVftqIGMC/nH4dNzeBqbn4U8tmQZ8
	dX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xODqT3ih+2vyp2B11XSOUzR5hLj5cUtsUv5e+iH1EbY=;
	b=JJtXOKNgrj981wvLd5npO8waeUUUgdn7hEkW60S+Y79J/7Nslw85ZrkZv5fhzN8tIn
	V6wdUYCQGaLbLG4TfrG3Ub/iQPfl6Hg0gE6VPq4F5zLxVgIHj3Xd04MilBLakbPfONAb
	KB5dZKGCLMbDCr5FMABLc2boILAc0jTiWvcZVUyJ4XcyBaVrqjUl979NCaOnvaBN32I7
	yuRtpv4nPYs1eq6++ilDchtdfQI6yqgY0naErZ7gqGaYIMvJpj3rZp70LidFCJDJiuS6
	A908e0ELrUXlvkoD5FZAyTqP/0kXiPAgkQ8glogmy1WgKzBEah3Gi4KcLT4AiaJ5Idjh
	Qg9w==
X-Gm-Message-State: AFeK/H2g42v/LGow9Blz2UKuAAAA+dRyeEHeVfPkIEv8iq/i2PZbExoOAlIJcCv6gVod9w==
X-Received: by 10.98.36.81 with SMTP id r78mr17898920pfj.178.1489770658882;
	Fri, 17 Mar 2017 10:10:58 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	e13sm18071597pgn.38.2017.03.17.10.10.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Mar 2017 10:10:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Mar 2017 10:10:45 -0700
Message-Id: <20170317171045.11750-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH] ltp: Fix __sighandler_t for mips
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
X-List-Received-Date: Fri, 17 Mar 2017 17:10:58 -0000

mips definition of kernel_sigaction was added later
and the patch did not apply to mips part which ended
in ltp failing to compile on mips parts

In file included from rt_sigaction01.c:42:0:
../../../../include/lapi/rt_sigaction.h:39:2: error: unknown type name '__sighandler_t'
  __sighandler_t k_sa_handler;
  ^~~~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...n.h-Use-sighandler_t-instead-of-__sighand.patch | 31 ++++++++++++----------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp/0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch b/meta/recipes-extended/ltp/ltp/0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch
index fc82ff9239..b26aa133e9 100644
--- a/meta/recipes-extended/ltp/ltp/0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch
+++ b/meta/recipes-extended/ltp/ltp/0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch
@@ -13,23 +13,29 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  testcases/kernel/syscalls/rt_sigsuspend/Makefile | 3 +++
  2 files changed, 4 insertions(+), 1 deletion(-)
 
-diff --git a/include/lapi/rt_sigaction.h b/include/lapi/rt_sigaction.h
-index 3a5a763..870918c 100644
---- a/include/lapi/rt_sigaction.h
-+++ b/include/lapi/rt_sigaction.h
-@@ -34,7 +34,7 @@
- #define INVAL_SA_PTR ((void *)-1)
- 
+Index: git/include/lapi/rt_sigaction.h
+===================================================================
+--- git.orig/include/lapi/rt_sigaction.h
++++ git/include/lapi/rt_sigaction.h
+@@ -36,12 +36,12 @@
+ #if defined(__mips__)
+ struct kernel_sigaction {
+ 	unsigned int sa_flags;
+-	__sighandler_t k_sa_handler;
++	sighandler_t k_sa_handler;
+ 	sigset_t sa_mask;
+ };
+ #else
  struct kernel_sigaction {
 -	__sighandler_t k_sa_handler;
 +	sighandler_t k_sa_handler;
  	unsigned long sa_flags;
  	void (*sa_restorer) (void);
  	sigset_t sa_mask;
-diff --git a/testcases/kernel/syscalls/rt_sigsuspend/Makefile b/testcases/kernel/syscalls/rt_sigsuspend/Makefile
-index 37bc3a9..2ca7f7c 100644
---- a/testcases/kernel/syscalls/rt_sigsuspend/Makefile
-+++ b/testcases/kernel/syscalls/rt_sigsuspend/Makefile
+Index: git/testcases/kernel/syscalls/rt_sigsuspend/Makefile
+===================================================================
+--- git.orig/testcases/kernel/syscalls/rt_sigsuspend/Makefile
++++ git/testcases/kernel/syscalls/rt_sigsuspend/Makefile
 @@ -19,4 +19,7 @@
  top_srcdir		?= ../../../..
  
@@ -38,6 +44,3 @@ index 37bc3a9..2ca7f7c 100644
 +CFLAGS	+= -D_GNU_SOURCE
 +
  include $(top_srcdir)/include/mk/generic_leaf_target.mk
--- 
-2.7.0
-
-- 
2.12.0


