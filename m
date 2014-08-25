Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id C2B2F70FD4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 23:41:22 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id w10so20810751pde.18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 16:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=K1cpzsC9VaP0mSvIOFHc/0D5jK6opFaJFlq2eOlXM8w=;
	b=pKjarJAb/4wJv2/d9vc2D39SCixcbTJwuKg5L3/b7wEfGvV6/HeypxJsaUuM/FFoh2
	xle1kUMi+88YtfdOTF8NKaEgGPVYXZGP5emnTnXQ7NeuWPuVQtE4exzpFUDdYr1L+m4h
	wP5wKPyPx0q3t2n/sQj9X2ELAvSOHs2w6IWjD34XS4TuBJ/1JjMTyDfGqfrDY2C+Fl60
	vfc8hRPCd3qqYzlLDfqIOvShBm8DNA2bE7qrgmhcxPGEwINgJuE4PX65ejXhtpGAOCab
	9JRagmjxYHJph50D7HtQ1aLoGDdmfc7AALFUSfhz9BmTjqAWpjUMEC14akk93HMB6qh6
	KPPg==
X-Received: by 10.68.221.166 with SMTP id qf6mr33047607pbc.12.1409010083813;
	Mon, 25 Aug 2014 16:41:23 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id r2sm1615785pdj.29.2014.08.25.16.41.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Aug 2014 16:41:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Aug 2014 16:45:03 -0700
Message-Id: <84ad851facf8a9f7e8c0ee7e8341714227e127c4.1409010172.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <20ca5b9e346abbb3015f8a67a249858d8195df11.1409010172.git.raj.khem@gmail.com>
References: <20ca5b9e346abbb3015f8a67a249858d8195df11.1409010172.git.raj.khem@gmail.com>
In-Reply-To: <cover.1409010172.git.raj.khem@gmail.com>
References: <cover.1409010172.git.raj.khem@gmail.com>
Subject: [PATCH 3/4] uclibc: Support systemd builds
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
X-List-Received-Date: Mon, 25 Aug 2014 23:41:22 -0000

Systemd needs some extra defines e.g.
ADJ_NANO and IPTOS_CLASS_CS6

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-git.inc            |    2 +
 ...IPTOS_CLASS_-macros-according-to-RFC-2474.patch |   75 ++++++++++++++++++++
 .../uclibc-git/0001-timex-Sync-with-glibc.patch    |   33 +++++++++
 3 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-Define-IPTOS_CLASS_-macros-according-to-RFC-2474.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-timex-Sync-with-glibc.patch

diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index a6b9f65..a2b2353 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -23,5 +23,7 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master \
 	file://0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch \
 	file://0001-Add-eventfd_read-and-eventfd_write.patch \
 	file://0002-wire-setns-syscall.patch \
+	file://0001-Define-IPTOS_CLASS_-macros-according-to-RFC-2474.patch \
+	file://0001-timex-Sync-with-glibc.patch \
 	"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-Define-IPTOS_CLASS_-macros-according-to-RFC-2474.patch b/meta/recipes-core/uclibc/uclibc-git/0001-Define-IPTOS_CLASS_-macros-according-to-RFC-2474.patch
new file mode 100644
index 0000000..d613823
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/0001-Define-IPTOS_CLASS_-macros-according-to-RFC-2474.patch
@@ -0,0 +1,75 @@
+From be8ed13a90c528adfbe3c8543946bb2c5a2ad713 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 25 Aug 2014 15:50:36 -0700
+Subject: [PATCH] Define IPTOS_CLASS_* macros according to RFC 2474
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-status: Pending
+---
+ include/netinet/ip.h | 42 ++++++++++++++++++++++++++++++------------
+ 1 file changed, 30 insertions(+), 12 deletions(-)
+
+diff --git a/include/netinet/ip.h b/include/netinet/ip.h
+index 19e1249..3fe58b9 100644
+--- a/include/netinet/ip.h
++++ b/include/netinet/ip.h
+@@ -188,7 +188,25 @@ struct ip_timestamp
+ #define	IPTOS_DSCP_EF		0xb8
+ 
+ /*
+- * Definitions for IP type of service (ip_tos)
++ * In RFC 2474, Section 4.2.2.1, the Class Selector Codepoints subsume
++ * the old ToS Precedence values.
++ */
++#define	IPTOS_CLASS_MASK		0xe0
++#define	IPTOS_CLASS(class)		((class) & IPTOS_CLASS_MASK)
++#define	IPTOS_CLASS_CS0			0x00
++#define	IPTOS_CLASS_CS1			0x20
++#define	IPTOS_CLASS_CS2			0x40
++#define	IPTOS_CLASS_CS3			0x60
++#define	IPTOS_CLASS_CS4			0x80
++#define	IPTOS_CLASS_CS5			0xa0
++#define	IPTOS_CLASS_CS6			0xc0
++#define	IPTOS_CLASS_CS7			0xe0
++
++#define	IPTOS_CLASS_DEFAULT		IPTOS_CLASS_CS0
++
++/*
++ * Definitions for IP type of service (ip_tos) [deprecated; use DSCP
++ * and CS definitions above instead.]
+  */
+ #define	IPTOS_TOS_MASK		0x1E
+ #define	IPTOS_TOS(tos)		((tos) & IPTOS_TOS_MASK)
+@@ -199,18 +217,18 @@ struct ip_timestamp
+ #define	IPTOS_MINCOST		IPTOS_LOWCOST
+ 
+ /*
+- * Definitions for IP precedence (also in ip_tos) (hopefully unused)
++ * Definitions for IP precedence (also in ip_tos) [also deprecated.]
+  */
+-#define	IPTOS_PREC_MASK			0xe0
+-#define	IPTOS_PREC(tos)                ((tos) & IPTOS_PREC_MASK)
+-#define	IPTOS_PREC_NETCONTROL		0xe0
+-#define	IPTOS_PREC_INTERNETCONTROL	0xc0
+-#define	IPTOS_PREC_CRITIC_ECP		0xa0
+-#define	IPTOS_PREC_FLASHOVERRIDE	0x80
+-#define	IPTOS_PREC_FLASH		0x60
+-#define	IPTOS_PREC_IMMEDIATE		0x40
+-#define	IPTOS_PREC_PRIORITY		0x20
+-#define	IPTOS_PREC_ROUTINE		0x00
++#define	IPTOS_PREC_MASK			IPTOS_CLASS_MASK
++#define	IPTOS_PREC(tos)			IPTOS_CLASS(tos)
++#define	IPTOS_PREC_NETCONTROL		IPTOS_CLASS_CS7
++#define	IPTOS_PREC_INTERNETCONTROL	IPTOS_CLASS_CS6
++#define	IPTOS_PREC_CRITIC_ECP		IPTOS_CLASS_CS5
++#define	IPTOS_PREC_FLASHOVERRIDE	IPTOS_CLASS_CS4
++#define	IPTOS_PREC_FLASH		IPTOS_CLASS_CS3
++#define	IPTOS_PREC_IMMEDIATE		IPTOS_CLASS_CS2
++#define	IPTOS_PREC_PRIORITY		IPTOS_CLASS_CS1
++#define	IPTOS_PREC_ROUTINE		IPTOS_CLASS_CS0
+ 
+ /*
+  * Definitions for options.
+-- 
+2.1.0
+
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-timex-Sync-with-glibc.patch b/meta/recipes-core/uclibc/uclibc-git/0001-timex-Sync-with-glibc.patch
new file mode 100644
index 0000000..5d6a0a5
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/0001-timex-Sync-with-glibc.patch
@@ -0,0 +1,33 @@
+From f489cc44a209f6c4370e94c9c788fc9cc4820be1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 25 Aug 2014 16:22:57 -0700
+Subject: [PATCH] timex: Sync with glibc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-status: Pending
+---
+ include/sys/timex.h | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/include/sys/timex.h b/include/sys/timex.h
+index 9082a28..57059bd 100644
+--- a/include/sys/timex.h
++++ b/include/sys/timex.h
+@@ -67,8 +67,12 @@ struct timex
+ #define ADJ_ESTERROR		0x0008	/* estimated time error */
+ #define ADJ_STATUS		0x0010	/* clock status */
+ #define ADJ_TIMECONST		0x0020	/* pll time constant */
+-#define ADJ_TICK		0x4000	/* tick value */
+-#define ADJ_OFFSET_SINGLESHOT	0x8001	/* old-fashioned adjtime */
++#define ADJ_TAI			0x0080  /* set TAI offset */
++#define ADJ_MICRO		0x1000  /* select microsecond resolution */
++#define ADJ_NANO		0x2000  /* select nanosecond resolution */
++#define ADJ_TICK		0x4000  /* tick value */
++#define ADJ_OFFSET_SINGLESHOT	0x8001  /* old-fashioned adjtime */
++#define ADJ_OFFSET_SS_READ	0xa001  /* read-only adjtime */
+ 
+ /* xntp 3.4 compatibility names */
+ #define MOD_OFFSET	ADJ_OFFSET
+-- 
+2.1.0
+
-- 
1.7.10.4


