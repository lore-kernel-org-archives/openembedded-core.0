Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2235.1792709281575017209
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 15:48:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=f0ZjL5ho;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20261022224759a49d78894f00020756-qehtzq@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20261022224759a49d78894f00020756
        for <openembedded-core@lists.openembedded.org>;
        Fri, 23 Oct 2026 00:47:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=TEvpwfCOpJgS4ByKDb2wHA6M5TAcELEk1HZfLpnXSlk=;
 b=f0ZjL5hoYCTpbB+Y+lghc2JlCqBi6mZhL2nFRsAO4iQoJvbhp9qocntTWL5ckgyrv0Vy2h
 aNuqXu6ujnoZM//ClJqDt75AekOnl4kAZpShG5rTJHAQ4CxeINvWPfx24CgTPW1Ogb0f6CWu
 ELGDclNfODHI1YyOIoKWkLJ1GYv8nWr/3b4GFJFN+jsCCM4OSSaveInCx85LT5TT6Dh4gmG7
 6r8ZE7aHBXtpB+snenjwV0Zv59Fpy+Y2BNL9VCq9ohU5NBdVJ4xGAFRsnNy0CW8lzKXkqJJT
 MoIEm1zibF41rQwVWzKCXAMuspw1lMRJu5nEiktBYXqCwyPBqgyJfmgA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 05/15] glibc: patch CVE-2026-19542
Date: Fri, 23 Oct 2026 00:46:58 +0200
Message-ID: <20261022224711.3783258-5-peter.marko@siemens.com>
In-Reply-To: <20261022224711.3783258-1-peter.marko@siemens.com>
References: <20261022224711.3783258-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 22:48:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248461
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch [1] which is [2] backported to 3.41 (oldest release still
receiving security updates) which is mentioned in [3].

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=9318c2571576017d280a31b7b9ab576c9b696b1a
[2] https://sourceware.org/git/?p=glibc.git;a=commit;h=e2789c46e3bfdcd67a82bea9946b315c179e83d3
[3] https://security-tracker.debian.org/tracker/CVE-2026-19542

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../glibc/glibc/0035-CVE-2026-19542.patch     | 99 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0035-CVE-2026-19542.patch

diff --git a/meta/recipes-core/glibc/glibc/0035-CVE-2026-19542.patch b/meta/recipes-core/glibc/glibc/0035-CVE-2026-19542.patch
new file mode 100644
index 00000000000..5c82606792c
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0035-CVE-2026-19542.patch
@@ -0,0 +1,99 @@
+From 9318c2571576017d280a31b7b9ab576c9b696b1a Mon Sep 17 00:00:00 2001
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
+Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+(cherry picked from commit e2789c46e3bfdcd67a82bea9946b315c179e83d3)
+
+CVE: CVE-2026-19542
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=9318c2571576017d280a31b7b9ab576c9b696b1a]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ misc/tsearch.c | 31 +++++++++++--------------------
+ 1 file changed, 11 insertions(+), 20 deletions(-)
+
+diff --git a/misc/tsearch.c b/misc/tsearch.c
+index d15260baed..350fe15bf0 100644
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
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index b7f6278c95a..eb198427d1a 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -67,6 +67,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0032-CVE-2026-5450.patch \
            file://0033-CVE-2026-6791.patch \
            file://0034-CVE-2026-6368.patch \
+           file://0035-CVE-2026-19542.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
