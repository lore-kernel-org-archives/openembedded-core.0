Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 164576D2D6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 04:43:09 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id lf10so371477pab.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 21:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9HxX0morkYr/PJLA1bnEB6zpIzer06EY9yQHeDN5Qcs=;
	b=SwLxOzgAKLX57LkOWHeuuR63fubiYoH9kJwqkUMI64ZoovK7WU4CPwv13vysTzfZ4g
	FKB4ktFZ9Xmw8GuFj0885IM9aMuOAFZAmk929OZhoQJBwpawuPnxeg3g+wN7YMy2rsf+
	D8zC37vC5Bf4804HrE94mKg85ouvfIDws2FtmUjMSwEptPq4yjoGlDVTS21dtIxVzWfo
	Jsdske67mechbsarfeSkU/IKqC1F2GzRuHE6UuGkdExbBLuDV9+BjlMzxL07f5JUeKAK
	CcPpspNAQ4as6lEx4895hShWgUFWhkjM98b4aiFliLOMPcP5h2EZfI+EIuYtYeGbyFs7
	X8MA==
X-Received: by 10.66.140.40 with SMTP id rd8mr1033400pab.119.1383108191134;
	Tue, 29 Oct 2013 21:43:11 -0700 (PDT)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	og5sm38581502pbb.10.2013.10.29.21.43.09 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 29 Oct 2013 21:43:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2013 21:42:39 -0700
Message-Id: <1383108159-18756-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH][dylan] elfutils-native: Update the patch to include the missing pieces needed for tests
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
X-List-Received-Date: Wed, 30 Oct 2013 04:43:10 -0000

In the last patch we missed similar update for test/line2addr.c
which meant that the build still failed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../elfutils/elfutils/fix-build-gcc-4.8.patch       | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils/fix-build-gcc-4.8.patch b/meta/recipes-devtools/elfutils/elfutils/fix-build-gcc-4.8.patch
index a7c3519..0e28690 100644
--- a/meta/recipes-devtools/elfutils/elfutils/fix-build-gcc-4.8.patch
+++ b/meta/recipes-devtools/elfutils/elfutils/fix-build-gcc-4.8.patch
@@ -25,11 +25,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Upstream-Status: Inappropriate [Caused by an earlier patch]
 
-Index: elfutils-0.155/src/addr2line.c
+Index: elfutils-0.148/src/addr2line.c
 ===================================================================
---- elfutils-0.155.orig/src/addr2line.c
-+++ elfutils-0.155/src/addr2line.c
-@@ -447,10 +447,10 @@ handle_address (const char *string, Dwfl
+--- elfutils-0.148.orig/src/addr2line.c	2013-09-23 17:46:45.513586538 -0700
++++ elfutils-0.148/src/addr2line.c	2013-09-23 17:46:46.329586558 -0700
+@@ -447,10 +447,10 @@
        bool parsed = false;
        int i, j;
        char *name = NULL;
@@ -42,3 +42,16 @@ Index: elfutils-0.155/src/addr2line.c
  	{
  	default:
  	  break;
+Index: elfutils-0.148/tests/line2addr.c
+===================================================================
+--- elfutils-0.148.orig/tests/line2addr.c	2013-09-23 17:46:45.521586538 -0700
++++ elfutils-0.148/tests/line2addr.c	2013-09-23 17:46:46.329586558 -0700
+@@ -132,7 +132,7 @@
+     {
+       struct args a = { .arg = argv[cnt] };
+ 
+-      switch (sscanf (a.arg, "%a[^:]:%d", &a.file, &a.line))
++      switch (sscanf (a.arg, "%m[^:]:%d", &a.file, &a.line))
+ 	{
+ 	default:
+ 	case 0:
-- 
1.8.3.2


