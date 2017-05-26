Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym03.jp.fujitsu.com (mgwym03.jp.fujitsu.com [211.128.242.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3069378224
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 02:37:55 +0000 (UTC)
Received: from yt-mxq.gw.nic.fujitsu.com (unknown [192.168.229.66]) by
	mgwym03.jp.fujitsu.com with smtp
	id 475a_0878_a233c2c9_ad11_4705_b353_846d153d5802;
	Fri, 26 May 2017 11:37:53 +0900
Received: from g01jpfmpwkw03.exch.g01.fujitsu.local
	(g01jpfmpwkw03.exch.g01.fujitsu.local [10.0.193.57])
	by yt-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id 1423DAC00F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 11:37:53 +0900 (JST)
Received: from G01JPEXCHKW17.g01.fujitsu.local
	(G01JPEXCHKW17.g01.fujitsu.local [10.0.194.56])
	by g01jpfmpwkw03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	1CB5ABD67C1 for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 11:37:52 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	G01JPEXCHKW17.g01.fujitsu.local (10.0.194.56) with Microsoft SMTP
	Server id 14.3.266.1; Fri, 26 May 2017 11:37:52 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 May 2017 11:39:06 +0900
Message-ID: <1495766346-14491-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] libxslt: Fix CVE-2017-5029
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
X-List-Received-Date: Fri, 26 May 2017 02:37:57 -0000
Content-Type: text/plain

Backport upstream patch to fix CVE-2017-5029.

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 ...for-integer-overflow-in-xsltAddTextString.patch | 80 ++++++++++++++++++++++
 meta/recipes-support/libxslt/libxslt_1.1.29.bb     |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-support/libxslt/libxslt/0001-Check-for-integer-overflow-in-xsltAddTextString.patch

diff --git a/meta/recipes-support/libxslt/libxslt/0001-Check-for-integer-overflow-in-xsltAddTextString.patch b/meta/recipes-support/libxslt/libxslt/0001-Check-for-integer-overflow-in-xsltAddTextString.patch
new file mode 100644
index 0000000..57aaacc
--- /dev/null
+++ b/meta/recipes-support/libxslt/libxslt/0001-Check-for-integer-overflow-in-xsltAddTextString.patch
@@ -0,0 +1,80 @@
+From 08ab2774b870de1c7b5a48693df75e8154addae5 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Thu, 12 Jan 2017 15:39:52 +0100
+Subject: [PATCH] Check for integer overflow in xsltAddTextString
+
+Limit buffer size in xsltAddTextString to INT_MAX. The issue can be
+exploited to trigger an out of bounds write on 64-bit systems.
+
+Originally reported to Chromium:
+
+https://crbug.com/676623
+
+CVE: CVE-2017-5029
+Upstream-Status: Backport
+
+Signed-off-by: Fan Xin <fan.xin@jp.fujitus.com>
+
+---
+ libxslt/transform.c     | 25 ++++++++++++++++++++++---
+ libxslt/xsltInternals.h |  4 ++--
+ 2 files changed, 24 insertions(+), 5 deletions(-)
+
+diff --git a/libxslt/transform.c b/libxslt/transform.c
+index 519133f..02bff34 100644
+--- a/libxslt/transform.c
++++ b/libxslt/transform.c
+@@ -813,13 +813,32 @@ xsltAddTextString(xsltTransformContextPtr ctxt, xmlNodePtr target,
+         return(target);
+ 
+     if (ctxt->lasttext == target->content) {
++        int minSize;
+ 
+-	if (ctxt->lasttuse + len >= ctxt->lasttsize) {
++        /* Check for integer overflow accounting for NUL terminator. */
++        if (len >= INT_MAX - ctxt->lasttuse) {
++            xsltTransformError(ctxt, NULL, target,
++                "xsltCopyText: text allocation failed\n");
++            return(NULL);
++        }
++        minSize = ctxt->lasttuse + len + 1;
++
++        if (ctxt->lasttsize < minSize) {
+ 	    xmlChar *newbuf;
+ 	    int size;
++            int extra;
++
++            /* Double buffer size but increase by at least 100 bytes. */
++            extra = minSize < 100 ? 100 : minSize;
++
++            /* Check for integer overflow. */
++            if (extra > INT_MAX - ctxt->lasttsize) {
++                size = INT_MAX;
++            }
++            else {
++                size = ctxt->lasttsize + extra;
++            }
+ 
+-	    size = ctxt->lasttsize + len + 100;
+-	    size *= 2;
+ 	    newbuf = (xmlChar *) xmlRealloc(target->content,size);
+ 	    if (newbuf == NULL) {
+ 		xsltTransformError(ctxt, NULL, target,
+diff --git a/libxslt/xsltInternals.h b/libxslt/xsltInternals.h
+index 060b178..5ad1771 100644
+--- a/libxslt/xsltInternals.h
++++ b/libxslt/xsltInternals.h
+@@ -1754,8 +1754,8 @@ struct _xsltTransformContext {
+      * Speed optimization when coalescing text nodes
+      */
+     const xmlChar  *lasttext;		/* last text node content */
+-    unsigned int    lasttsize;		/* last text node size */
+-    unsigned int    lasttuse;		/* last text node use */
++    int             lasttsize;		/* last text node size */
++    int             lasttuse;		/* last text node use */
+     /*
+      * Per Context Debugging
+      */
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.29.bb b/meta/recipes-support/libxslt/libxslt_1.1.29.bb
index 2946a74..d27c706 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.29.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.29.bb
@@ -12,6 +12,7 @@ SRC_URI = "ftp://xmlsoft.org/libxslt/libxslt-${PV}.tar.gz \
            file://pkgconfig_fix.patch \
            file://0001-Use-pkg-config-to-find-gcrypt-and-libxml2.patch \
            file://0001-Link-libraries-with-libm.patch \
+           file://0001-Check-for-integer-overflow-in-xsltAddTextString.patch \
            "
 
 SRC_URI[md5sum] = "a129d3c44c022de3b9dcf6d6f288d72e"
-- 
1.9.1


