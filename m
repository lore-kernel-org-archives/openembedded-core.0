Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id B837D6011B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 15:56:44 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id er2so7041116pad.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 08:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=p0HnVPe0cbONfg7udyp8+Mph6WYDezR5gNkUbvUlr4Q=;
	b=nNep3xiB3ltMSVlDPh45s9SFoZZ1jcvayi3gVxpq+v6S3TMzImswbEAtILyx7IiWdl
	z/J2CLCKYKmKAnNtOWq8XhJjHypUu+ZAF0fhroU3JuIIkEM7b4IyLh4We4UxB0XFFGPP
	LDrwUrTlrJ2/kTpAkLBpRRzST+Z1qeDVvPAI+STPVHZ99sNp7aZsLK+2vubCPsCh8j0L
	AzfNj8RnEqp0yQ+//+7Xjx2OrmqGNUrW877wOW8M8Cd6ezpaUSlHmgrpJKo3GDPDab4e
	KW4tt4GKFMN37plkzBm0Ew+w1Y93IR3MTzAc96F+tl3cwmTNa/Scg1snMIq8HfOffLS+
	g8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=p0HnVPe0cbONfg7udyp8+Mph6WYDezR5gNkUbvUlr4Q=;
	b=TeMjHZiiTpHjkE+9442W3fAWKj6Mvqw3hwlemyUbvnRY68n84VncfkstrKUWZNOoYg
	pI/iUC0V7m+DYXV6NdHNb2i69CjQmKBgjJmcfBF62d642OWUjcLzGP22kXmhfR/kNPtF
	AXk0P9ZD0k5UsI/oYd7BA+HJO3PIcROPFUQ0i0N2VcFnZC0faTqeN/tc87iT6dqheaYO
	zEtUgmIefbPGfX38h3CCqpQm7JFBPsUcQ134itKfSWNzFYa16cmdKT3ezIErhfWZ+4td
	G3q5/Rx89J+8rjL1IBReuqKiJJupstDLEsABRiY1z3cOua+PSdbB7UEqm0pVxDduEpzm
	Cpng==
X-Gm-Message-State: AOPr4FW14BrJosOwoHjRjk9zepYDeGu6x8WLNb2KPp2ZxIcx+ZEvE/efHIHOBlN15kUcmQ==
X-Received: by 10.66.199.66 with SMTP id ji2mr14017095pac.34.1460563005241;
	Wed, 13 Apr 2016 08:56:45 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	q72sm51994172pfa.70.2016.04.13.08.56.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Apr 2016 08:56:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Apr 2016 08:54:14 -0700
Message-Id: <1460562854-3755-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: bruce.ashfield@windriver.com
Subject: [PATCH] socat: Use c_ispeed and c_ospeed based upon libc
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
X-List-Received-Date: Wed, 13 Apr 2016 15:56:46 -0000

musl calls them __c_ispeed and __c_ospeed
and we can not use get/set APIs because the get APIs
will return the value from iflags and not from *speed
element from termios struct

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-Access-c_ispeed-and-c_ospeed-via-APIs.patch | 53 ++++++++++++++--------
 1 file changed, 33 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-connectivity/socat/socat/0001-Access-c_ispeed-and-c_ospeed-via-APIs.patch b/meta/recipes-connectivity/socat/socat/0001-Access-c_ispeed-and-c_ospeed-via-APIs.patch
index 367b48f..c0e27f3 100644
--- a/meta/recipes-connectivity/socat/socat/0001-Access-c_ispeed-and-c_ospeed-via-APIs.patch
+++ b/meta/recipes-connectivity/socat/socat/0001-Access-c_ispeed-and-c_ospeed-via-APIs.patch
@@ -1,39 +1,52 @@
-From 545d3dec8c91d6074516ffcfa79323ddf9d83839 Mon Sep 17 00:00:00 2001
+From fb10ab134d630705cae0c7be42437cc289af7d32 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 15 Mar 2016 21:36:02 +0000
-Subject: [PATCH] Access c_ispeed and c_ospeed via APIs
+Subject: [PATCH] Use __c_ispeed and __c_ospeed on musl
 
-Use cfsetispeed(), cfsetospeed(), cfgetispeed, and cfgetospeed()
-instead of operating on c_ispeed and c_ospeed termios structure
-members directly because they are not guaranteed to exist on all
-libc implementations
+Original intention of these asserts is to find if termios structure
+is mapped correctly to locally define union, the get* APIs for
+baudrate would not do the right thing since they do not return the
+value from c_ospeed/c_ispeed but the value which is stored in iflag
+for baudrate.
+
+So we check if we are on Linux but not using glibc then we use
+__c_ispeed and __c_ospeed as defined in musl, however these are
+internal elements of structs it should not have been used this
+way.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
-Upstream-Status: Submitted
+Upstream-Status: Pending
 
- xioinitialize.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
+ xioinitialize.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
 
 diff --git a/xioinitialize.c b/xioinitialize.c
-index 9f50155..632ca4c 100644
+index 9f50155..8fb2e4c 100644
 --- a/xioinitialize.c
 +++ b/xioinitialize.c
-@@ -65,10 +65,10 @@ int xioinitialize(void) {
+@@ -65,6 +65,12 @@ int xioinitialize(void) {
  #if HAVE_TERMIOS_ISPEED && (ISPEED_OFFSET != -1) && (OSPEED_OFFSET != -1)
  #if defined(ISPEED_OFFSET) && (ISPEED_OFFSET != -1)
  #if defined(OSPEED_OFFSET) && (OSPEED_OFFSET != -1)
--      tdata.termarg.c_ispeed = 0x56789abc;
--      tdata.termarg.c_ospeed = 0x6789abcd;
--      assert(tdata.termarg.c_ispeed == tdata.speeds[ISPEED_OFFSET]);
--      assert(tdata.termarg.c_ospeed == tdata.speeds[OSPEED_OFFSET]);
-+      cfsetispeed(&tdata.termarg, 0x56789abc);
-+      cfsetospeed(&tdata.termarg, 0x6789abcd);
-+      assert(cfgetispeed(&tdata.termarg) == tdata.speeds[ISPEED_OFFSET]);
-+      assert(cfgetospeed(&tdata.termarg) == tdata.speeds[OSPEED_OFFSET]);
++#if defined(__linux__) && !defined(__GLIBC__)
++      tdata.termarg.__c_ispeed = 0x56789abc;
++      tdata.termarg.__c_ospeed = 0x6789abcd;
++      assert(tdata.termarg.__c_ispeed == tdata.speeds[ISPEED_OFFSET]);
++      assert(tdata.termarg.__c_ospeed == tdata.speeds[OSPEED_OFFSET]);
++#else
+       tdata.termarg.c_ispeed = 0x56789abc;
+       tdata.termarg.c_ospeed = 0x6789abcd;
+       assert(tdata.termarg.c_ispeed == tdata.speeds[ISPEED_OFFSET]);
+@@ -72,6 +78,7 @@ int xioinitialize(void) {
+ #endif
  #endif
  #endif
++#endif
+    }
  #endif
+ 
 -- 
-1.9.1
+2.8.0
 
-- 
2.8.0


