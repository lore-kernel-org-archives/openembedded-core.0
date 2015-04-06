Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id A4A3B73D1E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 17:37:15 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so25069058igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Apr 2015 10:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=wMX6zBmApsk5feHHvzhwxV8AMNdLth+jMX1xl4UjZi8=;
	b=KsdcDnKCyjpbVIFi/faPFqT5kkzV5rtP9sSAzfwIYZIuOVtUjJFs948/QHXRyF4zhc
	JHNlRTzALEeOT/VvmUt0SZPCteCwBNwR0xUHhIEr7wM3pBb2leebqA9G0C6eKxFl9k1y
	aY0Bae+Czsp+o5ArfPxjjD+e/+asYmemmwWhPS9CZFPAUzakJ1EJpnCnfE9IIdfwtVaw
	96YaoKYUFHhwqcXMqlQkon4/tJyRDkcMonsrugs7D52ZmeOcp3NuQQsHxOpREGp5rXII
	Pl6vivUI4NFWzMKwr+icDvWhXIN8E+MmiyPh7hEHQsVmvHp/1mdoq81iKz3lv9jj5KsU
	+Yaw==
X-Received: by 10.107.170.77 with SMTP id t74mr15826997ioe.85.1428341836581;
	Mon, 06 Apr 2015 10:37:16 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id 7sm3063135iol.43.2015.04.06.10.37.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Apr 2015 10:37:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Apr 2015 17:36:51 +0000
Message-Id: <4b0a974703148c9553a74a8f5c1dc8f30df562f2.1428341478.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
References: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428341477.git.raj.khem@gmail.com>
References: <cover.1428341477.git.raj.khem@gmail.com>
Subject: [PATCH 23/24] libxml2: Contain glibc-extentions under __GLIBC__
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
X-List-Received-Date: Mon, 06 Apr 2015 17:37:16 -0000

Makes it more portable

Change-Id: I7bbc4cc0ebc26d54248b8433dab94db207615445
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ine-pthread-definitions-for-glibc-complia.patch | 32 ++++++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.2.bb          |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-threads-Define-pthread-definitions-for-glibc-complia.patch

diff --git a/meta/recipes-core/libxml/libxml2/0001-threads-Define-pthread-definitions-for-glibc-complia.patch b/meta/recipes-core/libxml/libxml2/0001-threads-Define-pthread-definitions-for-glibc-complia.patch
new file mode 100644
index 0000000..c653a81
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/0001-threads-Define-pthread-definitions-for-glibc-complia.patch
@@ -0,0 +1,32 @@
+From 6750cc564a17c812555cca587660240ccffaaed3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 4 Apr 2015 08:50:40 -0700
+Subject: [PATCH] threads: Define pthread* definitions for glibc compliant libs
+
+This code is assuming glibc but not explicitly saying it
+so lets make it so. Fixes following on musl
+
+threads.c:80:27: error: macro "pthread_equal" requires 2 arguments, but
+only 1 given
+|  extern int pthread_equal ()
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ threads.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: libxml2-2.9.2/threads.c
+===================================================================
+--- libxml2-2.9.2.orig/threads.c
++++ libxml2-2.9.2/threads.c
+@@ -47,7 +47,7 @@
+ #ifdef HAVE_PTHREAD_H
+ 
+ static int libxml_is_threaded = -1;
+-#ifdef __GNUC__
++#if defined(__GNUC__) && defined(__GLIBC__)
+ #ifdef linux
+ #if (__GNUC__ == 3 && __GNUC_MINOR__ >= 3) || (__GNUC__ > 3)
+ extern int pthread_once (pthread_once_t *__once_control,
diff --git a/meta/recipes-core/libxml/libxml2_2.9.2.bb b/meta/recipes-core/libxml/libxml2_2.9.2.bb
index 1affff1..79a395c 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.2.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.2.bb
@@ -1,7 +1,9 @@
 require libxml2.inc
 
 SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;name=testtar \
-            file://72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch"
+            file://72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch \
+	    file://0001-threads-Define-pthread-definitions-for-glibc-complia.patch \
+	   "
 
 SRC_URI[libtar.md5sum] = "9e6a9aca9d155737868b3dc5fd82f788"
 SRC_URI[libtar.sha256sum] = "5178c30b151d044aefb1b08bf54c3003a0ac55c59c866763997529d60770d5bc"
-- 
2.1.4


