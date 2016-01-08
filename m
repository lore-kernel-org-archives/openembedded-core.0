Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id C45937708E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:58 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id n135so198828681qka.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=PFmPMXnLhYCeeJtrnDY4krMYirY7+yDXIRX2YIyzuQU=;
	b=Kv48Vl+pSRG4ObZ6ie24LyGixvjmbu85Dxs0DnDm2+/KTzkJXvG5s3nFy5k2Rn+BWU
	5ipxYSeub4UC5X4PgNfIEM5Syi/a9XVJ6lUA1PJmliIjhxtIuEUsSnnvOO/scqQClMmD
	YuCUU4RRirO8lM4BNhCu1+fv5nNOEwSDKD9dUS9F6sXn4qCmZD0xsSKzFRCT8fCmNiAs
	xkgoYJYKAiF+2cmRovXVGYPCt6mbGrFQTNvcLjufdCVMCht1RuinNO8hAGHzVnfoPLlC
	VO4kda7WHvlPehG/Rz/jzEFz1lR9/ykAuBd62RJumrwbPrngrPCy2m8Cs0YD7kKmWa9Y
	1DrA==
X-Received: by 10.55.75.144 with SMTP id y138mr52304977qka.96.1452248399173;
	Fri, 08 Jan 2016 02:19:59 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:19:15 +0000
Message-Id: <16cd992060286eb326495d0d6c61fe1fa47e02e6.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 47/53] nspr: Drop older glibc code
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:59 -0000

This was not only getting included for libc5 but also for not-glibc libc
implementations e.g. musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-Remove-the-check-for-LINUX-glibc-case.patch | 35 ++++++++++++++++++++++
 meta/recipes-support/nspr/nspr_4.11.bb             |  9 ++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-support/nspr/nspr/0001-Remove-the-check-for-LINUX-glibc-case.patch

diff --git a/meta/recipes-support/nspr/nspr/0001-Remove-the-check-for-LINUX-glibc-case.patch b/meta/recipes-support/nspr/nspr/0001-Remove-the-check-for-LINUX-glibc-case.patch
new file mode 100644
index 0000000..5b17355
--- /dev/null
+++ b/meta/recipes-support/nspr/nspr/0001-Remove-the-check-for-LINUX-glibc-case.patch
@@ -0,0 +1,35 @@
+From 9b9c95e0390395c7e9ad24a882deb87a50846059 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 8 Aug 2015 17:10:34 -0700
+Subject: [PATCH] Remove the check for LINUX == glibc case
+
+Here it does not consider the case where musl can be an options it does
+consider the bionic case with !defined(ANDROID) but musl does not define
+and musl'ism defines like that
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ pr/src/misc/prnetdb.c | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/pr/src/misc/prnetdb.c b/pr/src/misc/prnetdb.c
+index b86248f..dc83a56 100644
+--- a/pr/src/misc/prnetdb.c
++++ b/pr/src/misc/prnetdb.c
+@@ -61,10 +61,7 @@ PRLock *_pr_dnsLock = NULL;
+ #define _PR_HAVE_GETPROTO_R_POINTER
+ #endif
+ 
+-#if defined(SOLARIS) || (defined(BSDI) && defined(_REENTRANT)) \
+-	|| (defined(LINUX) && defined(_REENTRANT) \
+-        && !(defined(__GLIBC__) && __GLIBC__ >= 2) \
+-        && !defined(ANDROID))
++#if defined(SOLARIS) || (defined(BSDI) && defined(_REENTRANT))
+ #define _PR_HAVE_GETPROTO_R
+ #define _PR_HAVE_GETPROTO_R_POINTER
+ #endif
+-- 
+2.1.4
+
diff --git a/meta/recipes-support/nspr/nspr_4.11.bb b/meta/recipes-support/nspr/nspr_4.11.bb
index 3048641..3dabcb6 100644
--- a/meta/recipes-support/nspr/nspr_4.11.bb
+++ b/meta/recipes-support/nspr/nspr_4.11.bb
@@ -13,6 +13,15 @@ SRC_URI = "http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz
 
 SRC_URI += "file://nspr.pc.in"
 
+CACHED_CONFIGUREVARS_append_libc-musl = " CFLAGS='${CFLAGS} -D_PR_POLL_AVAILABLE \
+                                          -D_PR_HAVE_OFF64_T -D_PR_INET6 -D_PR_HAVE_INET_NTOP \
+                                          -D_PR_HAVE_GETHOSTBYNAME2 -D_PR_HAVE_GETADDRINFO \
+                                          -D_PR_INET6_PROBE'"
+
+SRC_URI_append_libc-musl = "\
+        file://0001-Remove-the-check-for-LINUX-glibc-case.patch \
+        "
+
 UPSTREAM_CHECK_URI = "http://ftp.mozilla.org/pub/nspr/releases/"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)/"
 
-- 
2.7.0


