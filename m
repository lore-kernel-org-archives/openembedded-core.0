Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id E1E44605FF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Dec 2015 19:35:46 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so106311148pab.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Dec 2015 11:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=obypJHODFlm7LcopYqx4VKgDwgS8ZOz5uC1SEs/zWZI=;
	b=ILRyjA2BSwML0dQdOfUA9B/RgJP2MT/YiEY+ZpGEqfe2b96gXKaSPN8v0BujMtzDGE
	aR7sGqc4qVSwbEuPoFztwT4gqD6F29mZRz/bRO72D9uJgN4VcatT3ju7ifyHWY5iA9F0
	XJiPwmJTtgpMgll6BRHT8LiOVqS8MzF7FlZrGDwgJvc/+gwRfF8uVZEi/soplGYf96r4
	zKkGDEaaRc5aISTZh0GLbmabkaUP6iGXAugcwHWlG2NjfFYngoEVvhchi/cAvTwgG1+q
	4WoQl34xGDbWdSDqYb4H03MMjypn49wzL9SYlhg9SQFKW3SImHUMgYZXebnkTyOiJq2n
	oVJg==
X-Received: by 10.66.121.4 with SMTP id lg4mr31065995pab.22.1449344147588;
	Sat, 05 Dec 2015 11:35:47 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	w8sm24789831pfi.41.2015.12.05.11.35.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 05 Dec 2015 11:35:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Dec 2015 11:35:22 -0800
Message-Id: <1449344129-32738-9-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
References: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][jethro][fido] 08/15] libxml2: security fix CVE-2015-7497
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
X-List-Received-Date: Sat, 05 Dec 2015 19:35:48 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 ...97-Avoid-an-heap-buffer-overflow-in-xmlDi.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015-7497-Avoid-an-heap-buffer-overflow-in-xmlDi.patch

diff --git a/meta/recipes-core/libxml/libxml2/0001-CVE-2015-7497-Avoid-an-heap-buffer-overflow-in-xmlDi.patch b/meta/recipes-core/libxml/libxml2/0001-CVE-2015-7497-Avoid-an-heap-buffer-overflow-in-xmlDi.patch
new file mode 100644
index 0000000..955c961
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/0001-CVE-2015-7497-Avoid-an-heap-buffer-overflow-in-xmlDi.patch
@@ -0,0 +1,40 @@
+From 6360a31a84efe69d155ed96306b9a931a40beab9 Mon Sep 17 00:00:00 2001
+From: David Drysdale <drysdale@google.com>
+Date: Fri, 20 Nov 2015 10:47:12 +0800
+Subject: [PATCH] CVE-2015-7497 Avoid an heap buffer overflow in
+ xmlDictComputeFastQKey
+
+For https://bugzilla.gnome.org/show_bug.cgi?id=756528
+It was possible to hit a negative offset in the name indexing
+used to randomize the dictionary key generation
+Reported and fix provided by David Drysdale @ Google
+
+Upstream-Status: Backport
+
+CVE-2015-7497
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ dict.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/dict.c b/dict.c
+index 5f71d55..8c8f931 100644
+--- a/dict.c
++++ b/dict.c
+@@ -486,7 +486,10 @@ xmlDictComputeFastQKey(const xmlChar *prefix, int plen,
+ 	value += 30 * (*prefix);
+ 
+     if (len > 10) {
+-        value += name[len - (plen + 1 + 1)];
++        int offset = len - (plen + 1 + 1);
++	if (offset < 0)
++	    offset = len - (10 + 1);
++	value += name[offset];
+         len = 10;
+ 	if (plen > 10)
+ 	    plen = 10;
+-- 
+2.3.5
+
-- 
2.3.5


