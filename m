Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2A982779DC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 16:47:41 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id b5so20939053pgg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 09:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xODqT3ih+2vyp2B11XSOUzR5hLj5cUtsUv5e+iH1EbY=;
	b=q5P5swXrcUMQO8LxdgnOxlB/EaLYuGFPkiGU4HCdYxpW1CrGe4D3mtz4jrMl8+MHeK
	jbZyOl5UtgnfNGfG4gYlQzDGNX/UjhmakatA8/bV9jAJlmlh/bD5qb8C2BiRn45prZqk
	aDFZwfUDgWo9miQOVeVLusxEXYzWUSZ2FyIQbzIX5bIYYRLe64Bi9A0nstc3opitI3qj
	rQgo7YXieHIiA+uviGwMTVl2FGYV8wHuxpbhkMYJ4f4CM8ItYoyysq4hHPZ/GIcU02oR
	7H2TJnEMmLl5FRjRq7VMY4xXb2gyKb6Rlp9Hosjoq0P6NYE2/gqOCP5p3WmD4pVImIu4
	TElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xODqT3ih+2vyp2B11XSOUzR5hLj5cUtsUv5e+iH1EbY=;
	b=Zaz1cWp7YG6FZxlMzSHtH9BqYDtB9N8P3kjnTafG3MCkgp8Z3c11hn3RrRgIrD/cZR
	vjsCxxsYCQVal5+WgDvVqelkrBdNnrK5H3crkfDSAJfre8frlHs+u1ZeH2tkcOAZNGEu
	5xPPTByq36oCtO+XHtzzf0DFRShFqsyokPFyKbLFMVd1pNlt0PPo8oX650RJbLHMMi+3
	gBQy2svkAln9gg1mJdAM0bp3MwByenRHLikvVTNVgpCg1w/jfp4zWactxb2SgOuSKmp2
	K7WVP+2ij04Lt6YI89FJu5LzBJWFd/SayK1E8JSYEaTwzdSdq+f1hfJyBpx7avXgRs+Y
	IKyA==
X-Gm-Message-State: AFeK/H2ROJLOQpPGbHoeKGFtc21ltAbGhi/Kad91759r3KFqdgGf73OsAcZ+nTdMVcRISQ==
X-Received: by 10.84.204.8 with SMTP id a8mr11585949ple.4.1490028463132;
	Mon, 20 Mar 2017 09:47:43 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	k2sm34536513pga.29.2017.03.20.09.47.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Mar 2017 09:47:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Mar 2017 09:47:32 -0700
Message-Id: <8cb58fb8ef823e066545ed53af376b872fd0073d.1490028304.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1490028304.git.raj.khem@gmail.com>
References: <cover.1490028304.git.raj.khem@gmail.com>
Subject: [PATCH 1/4] ltp: Fix __sighandler_t for mips
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
X-List-Received-Date: Mon, 20 Mar 2017 16:47:42 -0000

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


