Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0E75073D0B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 11:34:19 +0000 (UTC)
Received: by widdi4 with SMTP id di4so124744093wid.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 04:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DjUXl8KigfkjhuC5vL/ymRX/zw+dslVaJaF2EROTqdg=;
	b=cVugZCK8idMo8NaElHD66t3RSxDF8gkf4hZj7jUXK2Brra3m3HKIUFF4M27tks2zaR
	qjuq40u+rDLCzS55q8VmAey2GEV4rbBogxfyuBnqOUxfH313i/lCnwHFFrvTKPfWwl79
	qpC87VwAHgld/pOfGrwZ5QK7+dqhwcR62hUmnPCrt0GdF1RFUXwqCrg0HzRYyGWiCgBj
	cKGRs4HIZgl5l1iJd5hwiw9y3RWHoUCz1XKtpAoTzCceqc238Vl/z0DJSH1dFI4vKkFi
	x4qz1pqXDDZa+F63gEiwYA6OFTzPJSAFjvViuLE5CLeonOrLGI1qq6RIefuvEUmTN9aj
	Urhg==
X-Received: by 10.194.81.104 with SMTP id z8mr2204269wjx.45.1428665660601;
	Fri, 10 Apr 2015 04:34:20 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	mc20sm3021927wic.15.2015.04.10.04.34.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Apr 2015 04:34:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Apr 2015 13:34:29 +0200
Message-Id: <1428665669-16128-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1428665669-16128-1-git-send-email-Martin.Jansa@gmail.com>
References: <1428665669-16128-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [dylan][PATCH 2/2] binutils: backport patch to fix build with gcc-4.9
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
X-List-Received-Date: Fri, 10 Apr 2015 11:34:20 -0000

* backported from 2.23.2, fixes:
work/x86_64-linux/binutils-native/2.23.1-r3/binutils-2.23.1/gas/write.c:409:24:
  error: 'dummy.fr_type' may be used uninitialized in this function [-Werror=maybe-uninitialized]
   gas_assert (prev_frag->fr_type != 0);
                        ^
work/x86_64-linux/binutils-native/2.23.1-r3/binutils-2.23.1/gas/write.c:392:9: note: 'dummy' was declared here
   fragS dummy, *prev_frag = &dummy;
         ^

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.23.1.inc |  1 +
 ...in_frchains_together_1-Reorder-assertion-.patch | 30 ++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-write.c-chain_frchains_together_1-Reorder-assertion-.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.23.1.inc b/meta/recipes-devtools/binutils/binutils-2.23.1.inc
index 7b3366a..6a6811b 100644
--- a/meta/recipes-devtools/binutils/binutils-2.23.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.23.1.inc
@@ -31,6 +31,7 @@ SRC_URI = "\
      file://binutils-fix-over-array-bounds-issue.patch \
      file://replace_macros_with_static_inline.patch \
      file://0001-Fix-MMIX-build-breakage-from-bfd_set_section_vma-cha.patch \
+     file://0001-write.c-chain_frchains_together_1-Reorder-assertion-.patch \
      "
 
 BACKPORT = "\
diff --git a/meta/recipes-devtools/binutils/binutils/0001-write.c-chain_frchains_together_1-Reorder-assertion-.patch b/meta/recipes-devtools/binutils/binutils/0001-write.c-chain_frchains_together_1-Reorder-assertion-.patch
new file mode 100644
index 0000000..ffe6852
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0001-write.c-chain_frchains_together_1-Reorder-assertion-.patch
@@ -0,0 +1,30 @@
+From c50d883cb61ff9917464cb695a0fd83fdb0f9c20 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@bigpond.net.au>
+Date: Mon, 21 Jan 2013 13:48:31 +0000
+Subject: [PATCH] write.c (chain_frchains_together_1): Reorder assertion to
+ avoid uninit warning.
+
+Upstream-Status: Backport from 2.23.2
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ gas/write.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gas/write.c b/gas/write.c
+index a467147..56ebb6c 100644
+--- a/gas/write.c
++++ b/gas/write.c
+@@ -406,8 +406,8 @@ chain_frchains_together_1 (segT section, struct frchain *frchp)
+ 	  prev_fix = frchp->fix_tail;
+ 	}
+     }
+-  gas_assert (prev_frag->fr_type != 0);
+-  gas_assert (prev_frag != &dummy);
++  gas_assert (prev_frag != &dummy
++	      && prev_frag->fr_type != 0);
+   prev_frag->fr_next = 0;
+   return prev_frag;
+ }
+-- 
+2.3.5
+
-- 
2.3.5


