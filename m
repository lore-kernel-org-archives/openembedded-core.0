Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A34C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 15:05:01 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web09.7897.1646406300040285012
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:05:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=volNHABH;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id
 z12-20020a17090ad78c00b001bf022b69d6so7061167pju.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=eVP1AmyGiQRKGlz+d+IgyahZ3cLxLJqpedWGZPy8t1s=;
        b=volNHABHakZA2sE/DVcrFBMrvHO7IftuLftK+OwrHJ6thIuKV64VxLozwzLClHlNia
         TbVdkRmcY5DCCw978WstLCK+yST0PnEcOC0lgPJuItUYtrvjv84A78i2VlJG1P0sh2yb
         HX6bAhHoe2vtwr8eCBGwns3KWMY3r1f6mNcVzJIhaEXSzxIFlHyEaY/g0FKftoxYBiJW
         fVKZtbdvdlqEgzMMyWo4v7yTyYWhYvKxyssWSK+a1Xwjl/EIm54VCg8IEJL7VJdpvRFi
         0Qg8D/xp/FZdlVvyZp5SK+fovLfDfQFgKeMJCpoROOIHBARBRB3cJFd4WMlHDJvnwXdk
         4FvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eVP1AmyGiQRKGlz+d+IgyahZ3cLxLJqpedWGZPy8t1s=;
        b=Vg4YdsBGzrL8Q/8ojjGIg47dTmHxaiJpjj2HsokKe2jqu/W6emoNmajsrSsOY53fif
         lpTvFBTeQCyYPJazMzESpcc5azrhowgoDI/bT9MIxq6dBTrHoRbWZzTDtFXD2rzPgg7c
         JbCZFnkzQWJzd+faGn0Ojrf0EKAHj9gI4rlp0Ujr+CQGQhqeiJCz7zmWWpVy+VisSD8z
         CXea1QrGjz+FHJgdNn19UKy3+VPyc7UIkd7fWl5Z7YalxHYTPVL3v24Rx2EpE0HmPW0X
         timIlykyURlCCjPx1v9WZNz91vdDGVy/jEnC9UKpT4qj9QESHAEEPAMpmU8w+DrnfN+A
         ywDw==
X-Gm-Message-State: AOAM5325JtdRArOep8+gZnaB2saA+treVJHK0MOSm3Axgerml6uDM5lO
	cDhKRiwhWOqw8zvpJWCUOIM3/4UEsvW/O2Yj6+M=
X-Google-Smtp-Source: 
 ABdhPJy1pZYL8VPXwWY/E3YB22abXKnfCJIBDkSkDFh/A+WV+PmJKsySq+tWcnoU2NsLd8IfD5vInw==
X-Received: by 2002:a17:902:8a85:b0:151:b3c6:87f8 with SMTP id
 p5-20020a1709028a8500b00151b3c687f8mr6372553plo.129.1646406298516;
        Fri, 04 Mar 2022 07:04:58 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f194-20020a6238cb000000b004f6ce898c61sm80400pfa.77.2022.03.04.07.04.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 07:04:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/18] expat: fix CVE-2022-25313
Date: Fri,  4 Mar 2022 05:04:14 -1000
Message-Id: 
 <8105700b1d6d23c87332f453bdc7379999bb4b03.1646406001.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646406001.git.steve@sakoman.com>
References: <cover.1646406001.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 15:05:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162725

In Expat (aka libexpat) before 2.4.5, an attacker can trigger stack
exhaustion in build_model via a large nesting depth in the DTD element.

Backport patch from:
https://github.com/libexpat/libexpat/pull/558/commits/9b4ce651b26557f16103c3a366c91934ecd439ab

Also add patch which fixes a regression introduced in the above fix:
https://github.com/libexpat/libexpat/pull/566

CVE: CVE-2022-25313

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../expat/CVE-2022-25313-regression.patch     | 131 ++++++++++
 .../expat/expat/CVE-2022-25313.patch          | 230 ++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.9.bb        |   2 +
 3 files changed, 363 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-25313-regression.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-25313.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2022-25313-regression.patch b/meta/recipes-core/expat/expat/CVE-2022-25313-regression.patch
new file mode 100644
index 0000000000..af255e8cb5
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2022-25313-regression.patch
@@ -0,0 +1,131 @@
+From b12f34fe32821a69dc12ff9a021daca0856de238 Mon Sep 17 00:00:00 2001
+From: Samanta Navarro <ferivoz@riseup.net>
+Date: Sat, 19 Feb 2022 23:59:25 +0000
+Subject: [PATCH] Fix build_model regression.
+
+The iterative approach in build_model failed to fill children arrays
+correctly. A preorder traversal is not required and turned out to be the
+culprit. Use an easier algorithm:
+
+Add nodes from scaffold tree starting at index 0 (root) to the target
+array whenever children are encountered. This ensures that children
+are adjacent to each other. This complies with the recursive version.
+
+Store only the scaffold index in numchildren field to prevent a direct
+processing of these children, which would require a recursive solution.
+This allows the algorithm to iterate through the target array from start
+to end without jumping back and forth, converting on the fly.
+
+Co-authored-by: Sebastian Pipping <sebastian@pipping.org>
+---
+ lib/xmlparse.c | 79 ++++++++++++++++++++++++++------------------
+ 1 file changed, 47 insertions(+), 32 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index c479a258..84885b5a 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -7373,39 +7373,58 @@ build_model(XML_Parser parser) {
+    *
+    * The iterative approach works as follows:
+    *
+-   * - We use space in the target array for building a temporary stack structure
+-   *   while that space is still unused.
+-   *   The stack grows from the array's end downwards and the "actual data"
+-   *   grows from the start upwards, sequentially.
+-   *   (Because stack grows downwards, pushing onto the stack is a decrement
+-   *   while popping off the stack is an increment.)
++   * - We have two writing pointers, both walking up the result array; one does
++   *   the work, the other creates "jobs" for its colleague to do, and leads
++   *   the way:
+    *
+-   * - A stack element appears as a regular XML_Content node on the outside,
+-   *   but only uses a single field -- numchildren -- to store the source
+-   *   tree node array index.  These are the breadcrumbs leading the way back
+-   *   during pre-order (node first) depth-first traversal.
++   *   - The faster one, pointer jobDest, always leads and writes "what job
++   *     to do" by the other, once they reach that place in the
++   *     array: leader "jobDest" stores the source node array index (relative
++   *     to array dtd->scaffold) in field "numchildren".
+    *
+-   * - The reason we know the stack will never grow into (or overlap with)
+-   *   the area with data of value at the start of the array is because
+-   *   the overall number of elements to process matches the size of the array,
+-   *   and the sum of fully processed nodes and yet-to-be processed nodes
+-   *   on the stack, cannot be more than the total number of nodes.
+-   *   It is possible for the top of the stack and the about-to-write node
+-   *   to meet, but that is safe because we get the source index out
+-   *   before doing any writes on that node.
++   *   - The slower one, pointer dest, looks at the value stored in the
++   *     "numchildren" field (which actually holds a source node array index
++   *     at that time) and puts the real data from dtd->scaffold in.
++   *
++   * - Before the loop starts, jobDest writes source array index 0
++   *   (where the root node is located) so that dest will have something to do
++   *   when it starts operation.
++   *
++   * - Whenever nodes with children are encountered, jobDest appends
++   *   them as new jobs, in order.  As a result, tree node siblings are
++   *   adjacent in the resulting array, for example:
++   *
++   *     [0] root, has two children
++   *       [1] first child of 0, has three children
++   *         [3] first child of 1, does not have children
++   *         [4] second child of 1, does not have children
++   *         [5] third child of 1, does not have children
++   *       [2] second child of 0, does not have children
++   *
++   *   Or (the same data) presented in flat array view:
++   *
++   *     [0] root, has two children
++   *
++   *     [1] first child of 0, has three children
++   *     [2] second child of 0, does not have children
++   *
++   *     [3] first child of 1, does not have children
++   *     [4] second child of 1, does not have children
++   *     [5] third child of 1, does not have children
++   *
++   * - The algorithm repeats until all target array indices have been processed.
+    */
+   XML_Content *dest = ret; /* tree node writing location, moves upwards */
+   XML_Content *const destLimit = &ret[dtd->scaffCount];
+-  XML_Content *const stackBottom = &ret[dtd->scaffCount];
+-  XML_Content *stackTop = stackBottom; /* i.e. stack is initially empty */
++  XML_Content *jobDest = ret; /* next free writing location in target array */
+   str = (XML_Char *)&ret[dtd->scaffCount];
+ 
+-  /* Push source tree root node index onto the stack */
+-  (--stackTop)->numchildren = 0;
++  /* Add the starting job, the root node (index 0) of the source tree  */
++  (jobDest++)->numchildren = 0;
+ 
+   for (; dest < destLimit; dest++) {
+-    /* Pop source tree node index off the stack */
+-    const int src_node = (int)(stackTop++)->numchildren;
++    /* Retrieve source tree array index from job storage */
++    const int src_node = (int)dest->numchildren;
+ 
+     /* Convert item */
+     dest->type = dtd->scaffold[src_node].type;
+@@ -7427,16 +7446,12 @@ build_model(XML_Parser parser) {
+       int cn;
+       dest->name = NULL;
+       dest->numchildren = dtd->scaffold[src_node].childcnt;
+-      dest->children = &dest[1];
++      dest->children = jobDest;
+ 
+-      /* Push children to the stack
+-       * in a way where the first child ends up at the top of the
+-       * (downwards growing) stack, in order to be processed first. */
+-      stackTop -= dest->numchildren;
++      /* Append scaffold indices of children to array */
+       for (i = 0, cn = dtd->scaffold[src_node].firstchild;
+-           i < dest->numchildren; i++, cn = dtd->scaffold[cn].nextsib) {
+-        (stackTop + i)->numchildren = (unsigned int)cn;
+-      }
++           i < dest->numchildren; i++, cn = dtd->scaffold[cn].nextsib)
++        (jobDest++)->numchildren = (unsigned int)cn;
+     }
+   }
+ 
diff --git a/meta/recipes-core/expat/expat/CVE-2022-25313.patch b/meta/recipes-core/expat/expat/CVE-2022-25313.patch
new file mode 100644
index 0000000000..470d66e9dd
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2022-25313.patch
@@ -0,0 +1,230 @@
+From 9b4ce651b26557f16103c3a366c91934ecd439ab Mon Sep 17 00:00:00 2001
+From: Samanta Navarro <ferivoz@riseup.net>
+Date: Tue, 15 Feb 2022 11:54:29 +0000
+Subject: [PATCH] Prevent stack exhaustion in build_model
+
+It is possible to trigger stack exhaustion in build_model function if
+depth of nested children in DTD element is large enough. This happens
+because build_node is a recursively called function within build_model.
+
+The code has been adjusted to run iteratively. It uses the already
+allocated heap space as temporary stack (growing from top to bottom).
+
+Output is identical to recursive version. No new fields in data
+structures were added, i.e. it keeps full API and ABI compatibility.
+Instead the numchildren variable is used to temporarily keep the
+index of items (uint vs int).
+
+Documentation and readability improvements kindly added by Sebastian.
+
+Proof of Concept:
+
+1. Compile poc binary which parses XML file line by line
+
+```
+cat > poc.c << EOF
+ #include <err.h>
+ #include <expat.h>
+ #include <stdio.h>
+
+ XML_Parser parser;
+
+ static void XMLCALL
+ dummy_element_decl_handler(void *userData, const XML_Char *name,
+                            XML_Content *model) {
+   XML_FreeContentModel(parser, model);
+ }
+
+ int main(int argc, char *argv[]) {
+   FILE *fp;
+   char *p = NULL;
+   size_t s = 0;
+   ssize_t l;
+   if (argc != 2)
+     errx(1, "usage: poc poc.xml");
+   if ((parser = XML_ParserCreate(NULL)) == NULL)
+     errx(1, "XML_ParserCreate");
+   XML_SetElementDeclHandler(parser, dummy_element_decl_handler);
+   if ((fp = fopen(argv[1], "r")) == NULL)
+     err(1, "fopen");
+   while ((l = getline(&p, &s, fp)) > 0)
+     if (XML_Parse(parser, p, (int)l, XML_FALSE) != XML_STATUS_OK)
+       errx(1, "XML_Parse");
+   XML_ParserFree(parser);
+   free(p);
+   fclose(fp);
+   return 0;
+ }
+EOF
+cc -std=c11 -D_POSIX_C_SOURCE=200809L -lexpat -o poc poc.c
+```
+
+2. Create XML file with a lot of nested groups in DTD element
+
+```
+cat > poc.xml.zst.b64 << EOF
+KLUv/aQkACAAPAEA+DwhRE9DVFlQRSB1d3UgWwo8IUVMRU1FTlQgdXd1CigBAHv/58AJAgAQKAIA
+ECgCABAoAgAQKAIAECgCABAoAgAQKHwAAChvd28KKQIA2/8gV24XBAIAECkCABApAgAQKQIAECkC
+ABApAgAQKQIAEClVAAAgPl0+CgEA4A4I2VwwnQ==
+EOF
+base64 -d poc.xml.zst.b64 | zstd -d > poc.xml
+```
+
+3. Run Proof of Concept
+
+```
+./poc poc.xml
+```
+
+Co-authored-by: Sebastian Pipping <sebastian@pipping.org>
+
+Upstream-Status: Backport
+https://github.com/libexpat/libexpat/pull/558/commits/9b4ce651b26557f16103c3a366c91934ecd439ab
+
+CVE: CVE-2022-25313
+
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+
+---
+ expat/lib/xmlparse.c | 116 +++++++++++++++++++++++++++++--------------
+ 1 file changed, 79 insertions(+), 37 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 4b43e613..594cf12c 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -7317,44 +7317,15 @@ nextScaffoldPart(XML_Parser parser) {
+   return next;
+ }
+ 
+-static void
+-build_node(XML_Parser parser, int src_node, XML_Content *dest,
+-           XML_Content **contpos, XML_Char **strpos) {
+-  DTD *const dtd = parser->m_dtd; /* save one level of indirection */
+-  dest->type = dtd->scaffold[src_node].type;
+-  dest->quant = dtd->scaffold[src_node].quant;
+-  if (dest->type == XML_CTYPE_NAME) {
+-    const XML_Char *src;
+-    dest->name = *strpos;
+-    src = dtd->scaffold[src_node].name;
+-    for (;;) {
+-      *(*strpos)++ = *src;
+-      if (! *src)
+-        break;
+-      src++;
+-    }
+-    dest->numchildren = 0;
+-    dest->children = NULL;
+-  } else {
+-    unsigned int i;
+-    int cn;
+-    dest->numchildren = dtd->scaffold[src_node].childcnt;
+-    dest->children = *contpos;
+-    *contpos += dest->numchildren;
+-    for (i = 0, cn = dtd->scaffold[src_node].firstchild; i < dest->numchildren;
+-         i++, cn = dtd->scaffold[cn].nextsib) {
+-      build_node(parser, cn, &(dest->children[i]), contpos, strpos);
+-    }
+-    dest->name = NULL;
+-  }
+-}
+-
+ static XML_Content *
+ build_model(XML_Parser parser) {
++  /* Function build_model transforms the existing parser->m_dtd->scaffold
++   * array of CONTENT_SCAFFOLD tree nodes into a new array of
++   * XML_Content tree nodes followed by a gapless list of zero-terminated
++   * strings. */
+   DTD *const dtd = parser->m_dtd; /* save one level of indirection */
+   XML_Content *ret;
+-  XML_Content *cpos;
+-  XML_Char *str;
++  XML_Char *str; /* the current string writing location */
+ 
+   /* Detect and prevent integer overflow.
+    * The preprocessor guard addresses the "always false" warning
+@@ -7380,10 +7351,81 @@ build_model(XML_Parser parser) {
+   if (! ret)
+     return NULL;
+ 
+-  str = (XML_Char *)(&ret[dtd->scaffCount]);
+-  cpos = &ret[1];
++  /* What follows is an iterative implementation (of what was previously done
++   * recursively in a dedicated function called "build_node".  The old recursive
++   * build_node could be forced into stack exhaustion from input as small as a
++   * few megabyte, and so that was a security issue.  Hence, a function call
++   * stack is avoided now by resolving recursion.)
++   *
++   * The iterative approach works as follows:
++   *
++   * - We use space in the target array for building a temporary stack structure
++   *   while that space is still unused.
++   *   The stack grows from the array's end downwards and the "actual data"
++   *   grows from the start upwards, sequentially.
++   *   (Because stack grows downwards, pushing onto the stack is a decrement
++   *   while popping off the stack is an increment.)
++   *
++   * - A stack element appears as a regular XML_Content node on the outside,
++   *   but only uses a single field -- numchildren -- to store the source
++   *   tree node array index.  These are the breadcrumbs leading the way back
++   *   during pre-order (node first) depth-first traversal.
++   *
++   * - The reason we know the stack will never grow into (or overlap with)
++   *   the area with data of value at the start of the array is because
++   *   the overall number of elements to process matches the size of the array,
++   *   and the sum of fully processed nodes and yet-to-be processed nodes
++   *   on the stack, cannot be more than the total number of nodes.
++   *   It is possible for the top of the stack and the about-to-write node
++   *   to meet, but that is safe because we get the source index out
++   *   before doing any writes on that node.
++   */
++  XML_Content *dest = ret; /* tree node writing location, moves upwards */
++  XML_Content *const destLimit = &ret[dtd->scaffCount];
++  XML_Content *const stackBottom = &ret[dtd->scaffCount];
++  XML_Content *stackTop = stackBottom; /* i.e. stack is initially empty */
++  str = (XML_Char *)&ret[dtd->scaffCount];
++
++  /* Push source tree root node index onto the stack */
++  (--stackTop)->numchildren = 0;
++
++  for (; dest < destLimit; dest++) {
++    /* Pop source tree node index off the stack */
++    const int src_node = (int)(stackTop++)->numchildren;
++
++    /* Convert item */
++    dest->type = dtd->scaffold[src_node].type;
++    dest->quant = dtd->scaffold[src_node].quant;
++    if (dest->type == XML_CTYPE_NAME) {
++      const XML_Char *src;
++      dest->name = str;
++      src = dtd->scaffold[src_node].name;
++      for (;;) {
++        *str++ = *src;
++        if (! *src)
++          break;
++        src++;
++      }
++      dest->numchildren = 0;
++      dest->children = NULL;
++    } else {
++      unsigned int i;
++      int cn;
++      dest->name = NULL;
++      dest->numchildren = dtd->scaffold[src_node].childcnt;
++      dest->children = &dest[1];
++
++      /* Push children to the stack
++       * in a way where the first child ends up at the top of the
++       * (downwards growing) stack, in order to be processed first. */
++      stackTop -= dest->numchildren;
++      for (i = 0, cn = dtd->scaffold[src_node].firstchild;
++           i < dest->numchildren; i++, cn = dtd->scaffold[cn].nextsib) {
++        (stackTop + i)->numchildren = (unsigned int)cn;
++      }
++    }
++  }
+ 
+-  build_node(parser, 0, ret, &cpos, &str);
+   return ret;
+ }
+ 
diff --git a/meta/recipes-core/expat/expat_2.2.9.bb b/meta/recipes-core/expat/expat_2.2.9.bb
index c0103767b1..4d945a295e 100644
--- a/meta/recipes-core/expat/expat_2.2.9.bb
+++ b/meta/recipes-core/expat/expat_2.2.9.bb
@@ -15,6 +15,8 @@ SRC_URI = "git://github.com/libexpat/libexpat.git;protocol=https;branch=master \
            file://CVE-2022-23990.patch \
            file://CVE-2022-25235.patch \
            file://CVE-2022-25236.patch \
+           file://CVE-2022-25313.patch \
+           file://CVE-2022-25313-regression.patch \
            file://libtool-tag.patch \
          "
 
-- 
2.25.1


