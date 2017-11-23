Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5E65D7836D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 03:52:19 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id c123so13466498pga.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 19:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Eka0NFs8zQp8eFDAZa6JQ1VB/m70C4ls4f3Uo2/FQx0=;
	b=nchCupXq2aliKL3HQaK7oEwEKn4BZXGh1m3Ee5eeTdCNHozdBHCYGFn1yz1Ej1L3pL
	8ANnY+xpPQpqNF0vMoQg6c12Rr35VgNT9qVSHvrcvKj6dx31PEqf/tnj01E8hSjBHa58
	nqJ+ViDvWVfmxd8ABxQkOEZSGVRP9hgEIc5uwcsyC0TIh/xi7FpNBvo/HlTqRSRdgrzB
	Fc+IuQBiMih0oDx0KedTQb7s7UT5Bh0ghrp8NydNxJ051JGz7pfA9RuePoDtWNTmylel
	NQ9oRpFVEoP3ORWrRDxHfjT7MBhteOwXheVceF/aoKHH2aZQFK5B6ylXbXCJ2h3NljgA
	6msw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Eka0NFs8zQp8eFDAZa6JQ1VB/m70C4ls4f3Uo2/FQx0=;
	b=SlAWpNxm7wDDcvnWK1NbZn48qe8B22swUbB04mYyf/JUBZWqp18OLEjNHHvvT4ACXo
	gn0tp9i4EbKuvT04b3npL6f/DIVLF0wC7Co3PZKM5JqKt/KgtkdGzL4JAiciDcbM2mX4
	g02M1H7/IE1jgH21joaJrjfSwvRUIbxekptl/6RKUQRUdz+n7I6M8wFvTBap1+DSjs3h
	c5+JElp1/XMGR70RZN5/nhchpZjb02w7Q9UrWQWWCYhYV4Co3wuvc9o69ynjc9FvUXZW
	+Ep2XOVVy3d367eXbUeyKXaQgaQwT3AdwgxOZc0M2+TDecR3FbAKAuHfObmrKoPaYr9K
	7U5g==
X-Gm-Message-State: AJaThX5bOBHvipvL26MGSmiBfNanv3f3E9jOmu4iyuOC/a69vsYMoR6f
	ydu7uH6Nuz04uVoTahQavzm3og==
X-Google-Smtp-Source: AGs4zMbWZEzR8wEYMsHEpOLi2MHCGBnh4RM7MM3GNTEbKb8jG92KbA0BtyXCohzKgBaxd+Gyu1x8Ew==
X-Received: by 10.98.194.150 with SMTP id w22mr6397684pfk.67.1511409140616;
	Wed, 22 Nov 2017 19:52:20 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:844b:1cda:e660:cce8])
	by smtp.gmail.com with ESMTPSA id
	n2sm25625481pgv.69.2017.11.22.19.52.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Nov 2017 19:52:20 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed, 22 Nov 2017 19:52:15 -0800
Message-Id: <1511409137-30823-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511409137-30823-1-git-send-email-akuster808@gmail.com>
References: <1511409137-30823-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] glibc: Security fix CVE-2017-15670
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
X-List-Received-Date: Thu, 23 Nov 2017 03:52:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

The GNU C Library (aka glibc or libc6) before 2.27 contains an off-by-one error leading to a heap-based buffer overflow in the glob function in glob.c, related to the processing of home directories using the ~ operator followed by a long string.

Affects: glibc < 2.27

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/glibc/glibc/CVE-2017-15670.patch | 61 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.26.bb              |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2017-15670.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2017-15670.patch b/meta/recipes-core/glibc/glibc/CVE-2017-15670.patch
new file mode 100644
index 0000000..aeecb92
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2017-15670.patch
@@ -0,0 +1,61 @@
+From a76376df7c07e577a9515c3faa5dbd50bda5da07 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Fri, 20 Oct 2017 18:41:14 +0200
+Subject: [PATCH] CVE-2017-15670: glob: Fix one-byte overflow [BZ #22320]
+
+(cherry picked from commit c369d66e5426a30e4725b100d5cd28e372754f90)
+
+Upstream-Status: Backport
+CVE: CVE-2017-15670
+Affects: glibc < 2.27
+signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ ChangeLog    | 6 ++++++
+ NEWS         | 5 +++++
+ posix/glob.c | 2 +-
+ 3 files changed, 12 insertions(+), 1 deletion(-)
+
+Index: git/NEWS
+===================================================================
+--- git.orig/NEWS
++++ git/NEWS
+@@ -206,6 +206,11 @@ Security related changes:
+ * A use-after-free vulnerability in clntudp_call in the Sun RPC system has been
+   fixed (CVE-2017-12133).
+ 
++  CVE-2017-15670: The glob function, when invoked with GLOB_TILDE,
++  suffered from a one-byte overflow during ~ operator processing (either
++  on the stack or the heap, depending on the length of the user name).
++  Reported by Tim Rühsen.
++
+ The following bugs are resolved with this release:
+ 
+   [984] network: Respond to changed resolv.conf in gethostbyname
+Index: git/posix/glob.c
+===================================================================
+--- git.orig/posix/glob.c
++++ git/posix/glob.c
+@@ -843,7 +843,7 @@ glob (const char *pattern, int flags, in
+ 		  *p = '\0';
+ 		}
+ 	      else
+-		*((char *) mempcpy (newp, dirname + 1, end_name - dirname))
++		*((char *) mempcpy (newp, dirname + 1, end_name - dirname - 1))
+ 		  = '\0';
+ 	      user_name = newp;
+ 	    }
+Index: git/ChangeLog
+===================================================================
+--- git.orig/ChangeLog
++++ git/ChangeLog
+@@ -1,3 +1,9 @@
++2017-10-20  Paul Eggert <eggert@cs.ucla.edu>
++
++       [BZ #22320]
++       CVE-2017-15670
++       * posix/glob.c (__glob): Fix one-byte overflow.
++
+ 2017-08-02  Siddhesh Poyarekar  <siddhesh@sourceware.org>
+ 
+ 	* version.h (RELEASE): Set to "stable"
diff --git a/meta/recipes-core/glibc/glibc_2.26.bb b/meta/recipes-core/glibc/glibc_2.26.bb
index 135ec4f..ed4ea4f 100644
--- a/meta/recipes-core/glibc/glibc_2.26.bb
+++ b/meta/recipes-core/glibc/glibc_2.26.bb
@@ -43,6 +43,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-assert-Suppress-pedantic-warning-caused-by-statement.patch \
            file://0027-glibc-reset-dl-load-write-lock-after-forking.patch \
            file://0028-Bug-4578-add-ld.so-lock-while-fork.patch \
+           file://CVE-2017-15670.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
2.7.4


