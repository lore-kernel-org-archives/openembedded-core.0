Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7EF1C88E42
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:12 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6326.1788939010332403075
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FWgriBjC;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso34584945e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788939008; x=1789543808; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TNvhUlOorZ08iyUXpiv1XvjTbMXxVanPtdMnuhMpkE0=;
        b=FWgriBjCztCIUHefYIH3c/2IS+kkQp/EcqlZBHzl/LmvypWTicSf5auBj8uP65XZND
         wvihbxfpw1rSwOcQv8aAgUG1eiKqjbqBz27OqaYEhl4p3A6fJRVDwspkLH94Ljmq8R/4
         zlschzIHC72oJAqM0ovac5MS2W9JJGfwYdG0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939008; x=1789543808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TNvhUlOorZ08iyUXpiv1XvjTbMXxVanPtdMnuhMpkE0=;
        b=OVuiZ5dGaKFHyyqXMNKVDXLM9cM6ZBbAlXpyWpKzNPuqOg+xf/vm5D+91O2LmrbSVM
         neUMZ3e+nu0D9ppgPVVMqC6m9B8CJE+tqx3DgY8f3yxEE81HZbQfSoAM2ZeoLwIfsMhf
         k7BHb1d52UdzckgRbWtMcVhV5/V71+FgnVJrfIkllJsY7+6e9CBOJOMHdpgIGw4r+DRa
         eZ6J6MBaIC7XVLTFvcbHVMzvbrgaFQciXJwsB8K9e/S71ReQG0Ly/dV3wSy7QwkIzFo2
         JsHLJov3mSQE5EBF2BO9r450rL4ptKeKEkNAzwUz34GSHWX+QIMH+Ab/aklb9DFjO/F7
         u+tQ==
X-Gm-Message-State: AFuF++naE4K1TFLFH+qjQ406w00mCLHohWh8jWm3gJ2+bu3ppsM3BML7
	zLdwqLPFcS/Bg7QbxVbFHktqIrwxVy52A1xJCQPxyikteXrPTzZML7AzMcW9441NPb5R1YruJP5
	+We3uCqE=
X-Gm-Gg: AYBFou19B2kxKunCZrtZsOh9sTlifhw/7m550wsKq61wlSU5mk7RAPppz0I1aJ6XdPv
	ApY24G2P5ynXE08oMcjeaDjvMyBLed0wEtdM/1Pwav/AWnJV3qz3RbScAxarYVIlukJDV01pHpN
	tD6gcNvBkaiF8inSftBQpzR2SFJ5jLHOdFGIKse/ojxDzpV9SuicV7akWnzusILNoQQEKbGpSzN
	NaV3UQBC7nD9p1PWiAdrJ0nNnG+u4tdClZrWH6wC2Le0E3XdKRm4pqCwv40b6O7A2FPPVPbcIax
	mnNGbiNP0WkVCacGI2VmDS2d95Tb1BFLLmfXDbeeuY72zH4iy9xGDIag6m11B21h5MXVtUvEi7K
	X0VoWqvlAdRx92BjO8nlf24p0c67JlpuM1++XaHUaDjrQjUFu1QHhWqOosD+t+4e1Bp0eQIl5lW
	0dos29ZWIZ09xo/dixilg2CSCuHZRGBPVEF1ceQ+XaNyMBUaB/7jkTWCIsr8B+UpTLRoRJQTcdN
	UM8jG/KIo+sVmUjHOETq9nmwHeObvGJ8732exAAPdzdZMqULlcvnVUMyjfbIh9F90vKKBTmU74=
X-Received: by 2002:a05:600c:4714:b0:49d:462:6eda with SMTP id 5b1f17b1804b1-49d04627387mr242148775e9.28.1788939008005;
        Wed, 09 Sep 2026 00:30:08 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.30.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:30:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 21/38] glibc: fix CVE-2026-19542
Date: Wed,  9 Sep 2026 09:29:20 +0200
Message-ID: <11fef7c21845e03c044305ba57e289831e7518c9.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245430

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Allocate the maximum array sizes directly, instead of resizing
the arrays as needed.  This eliminates alloca usage from the
function, and fixes the out-of-bounds accesses.  The asserts
guard against the bug coming back if the balancing of the tree
turns out not to work correctly.

Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=e2789c46e3bfdcd67a82bea9946b315c179e83d3]
CVE: CVE-2026-19542

Reference:
[1]https://security-tracker.debian.org/tracker/CVE-2026-19542
[2]https://sourceware.org/bugzilla/show_bug.cgi?id=34506
[3]https://sourceware.org/git/?p=glibc.git;a=commit;h=e2789c46e3bfdcd67a82bea9946b315c179e83d3

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: fixed CVE: tag in patch]
---
 .../glibc/glibc/0023-CVE-2026-19542.patch     | 98 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.43.bb         |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0023-CVE-2026-19542.patch

diff --git a/meta/recipes-core/glibc/glibc/0023-CVE-2026-19542.patch b/meta/recipes-core/glibc/glibc/0023-CVE-2026-19542.patch
new file mode 100644
index 00000000000..094a50919dc
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0023-CVE-2026-19542.patch
@@ -0,0 +1,98 @@
+From e2789c46e3bfdcd67a82bea9946b315c179e83d3 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 14 Aug 2026 13:41:16 +0200
+Subject: [PATCH] misc: Fix out-of-bounds array write in tdelete (bug 34506)
+
+Allocate the maximum array sizes directly, instead of resizing
+the arrays as needed.  This eliminates alloca usage from the
+function, and fixes the out-of-bounds accesses.  The asserts
+guard against the bug coming back if the balancing of the tree
+turns out not to work correctly.
+
+CVE: CVE-2026-19542
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=e2789c46e3bfdcd67a82bea9946b315c179e83d3]
+
+Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ misc/tsearch.c | 31 +++++++++++--------------------
+ 1 file changed, 11 insertions(+), 20 deletions(-)
+
+diff --git a/misc/tsearch.c b/misc/tsearch.c
+index 9b2eb34b25..e517dfa712 100644
+--- a/misc/tsearch.c
++++ b/misc/tsearch.c
+@@ -85,6 +85,7 @@
+ #include <assert.h>
+ #include <stdalign.h>
+ #include <stddef.h>
++#include <stdint.h>
+ #include <stdlib.h>
+ #include <string.h>
+ #include <search.h>
+@@ -406,12 +407,13 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
+   int cmp;
+   node *rootp = (node *) vrootp;
+   node root, unchained;
+-  /* Stack of nodes so we remember the parents without recursion.  It's
+-     _very_ unlikely that there are paths longer than 40 nodes.  The tree
+-     would need to have around 250.000 nodes.  */
+-  int stacksize = 40;
++  /* Stack of nodes so we remember the parents without recursion.  The
++     stack size is a conservative approximation of the maximum height
++     of a red-black tree, based on size of the address space.
++     Actual numbers are closer to 57 (32 bit) and 117 (63 bit).  */
++  enum { stacksize = 2 * UINTPTR_WIDTH };
+   int sp = 0;
+-  node **nodestack = alloca (sizeof (node *) * stacksize);
++  node *nodestack[stacksize];
+ 
+   if (rootp == NULL)
+     return NULL;
+@@ -424,14 +426,7 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
+   root = DEREFNODEPTR(rootp);
+   while ((cmp = (*compar) (key, root->key)) != 0)
+     {
+-      if (sp == stacksize)
+-	{
+-	  node **newstack;
+-	  stacksize += 20;
+-	  newstack = alloca (sizeof (node *) * stacksize);
+-	  nodestack = memcpy (newstack, nodestack, sp * sizeof (node *));
+-	}
+-
++      assert (sp < stacksize);
+       nodestack[sp++] = rootp;
+       p = DEREFNODEPTR(rootp);
+       if (cmp < 0)
+@@ -470,13 +465,7 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
+       node upn;
+       for (;;)
+ 	{
+-	  if (sp == stacksize)
+-	    {
+-	      node **newstack;
+-	      stacksize += 20;
+-	      newstack = alloca (sizeof (node *) * stacksize);
+-	      nodestack = memcpy (newstack, nodestack, sp * sizeof (node *));
+-	    }
++	  assert (sp < stacksize);
+ 	  nodestack[sp++] = parentp;
+ 	  parentp = up;
+ 	  upn = DEREFNODEPTR(up);
+@@ -541,6 +530,7 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
+ 		  SETNODEPTR(pp,q);
+ 		  /* Make sure pp is right if the case below tries to use
+ 		     it.  */
++		  assert (sp < stacksize);
+ 		  nodestack[sp++] = pp = LEFTPTR(q);
+ 		  q = RIGHT(p);
+ 		}
+@@ -625,6 +615,7 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
+ 		  SETLEFT(p,RIGHT(q));
+ 		  SETRIGHT(q,p);
+ 		  SETNODEPTR(pp,q);
++		  assert (sp < stacksize);
+ 		  nodestack[sp++] = pp = RIGHTPTR(q);
+ 		  q = LEFT(p);
+ 		}
diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glibc/glibc_2.43.bb
index 9f3a3814d0a..3ef2301191d 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -55,6 +55,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0020-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0021-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch \
            file://0022-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch \
+           file://0023-CVE-2026-19542.patch \
 "
 B = "${WORKDIR}/build-${TARGET_SYS}"
 

