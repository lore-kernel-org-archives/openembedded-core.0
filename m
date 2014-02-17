Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id B10466F0C8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 19:32:59 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id rp16so15773638pbb.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 11:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=/ByX30z3khCRV3NhetOQccMTCCJYbP9rWfn92nQydkg=;
	b=jgzA0w1OCoIDoxchkcs2lKzEayPmNgRtfzw2AMC1DXzYHUmqdZuzGJeRS/LbFqDQxR
	0/CcolOHo/aEbZXFpjrRkEoorlsnSClqX2/AvTHKiDex31kn+MJglEyMp8F+q5aHY6gu
	FPKjYKoZ/7mma97zXvwu6K8LolD3Sgo3z2BCOIJxKm0scGu5EVnjAvWl78cwASbsyUHd
	PRHFGdIc2pflG9nLqWRWA0BxsaVzarDXW0R4iZF+4f4faX7vSW8sq4gRpZzhox1M9t06
	/KDS3JP/w6db7fdECOZ57LH2MxJPymAN6D2dmlVWaAkW+9kuxiHNIsC4JSFRW/Wed5VA
	LzdA==
X-Received: by 10.66.156.4 with SMTP id wa4mr28610992pab.49.1392665580922;
	Mon, 17 Feb 2014 11:33:00 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	nm5sm48339985pbc.29.2014.02.17.11.32.59 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Feb 2014 11:33:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Feb 2014 11:34:14 -0800
Message-Id: <1364536e4a64f5c5f1889021ae78300fda2c3790.1392665521.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <74162f3b1e7a4f7da6939103dfee9bb3f16c2c39.1392665521.git.raj.khem@gmail.com>
References: <74162f3b1e7a4f7da6939103dfee9bb3f16c2c39.1392665521.git.raj.khem@gmail.com>
In-Reply-To: <cover.1392665521.git.raj.khem@gmail.com>
References: <cover.1392665521.git.raj.khem@gmail.com>
Subject: [PATCH 2/6] valgrind: Add glibc 2.19 awareness
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
X-List-Received-Date: Mon, 17 Feb 2014 19:32:59 -0000

It wont compile otherwise and fail with errors e.g.

Valgrind requires glibc version 2.2 - 2.17 ...

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../valgrind/valgrind/glibc-2.19.patch             |   23 ++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.9.0.bb   |    1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/glibc-2.19.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/glibc-2.19.patch b/meta/recipes-devtools/valgrind/valgrind/glibc-2.19.patch
new file mode 100644
index 0000000..7714b99
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/glibc-2.19.patch
@@ -0,0 +1,23 @@
+Add support for compiling with glibc 2.19
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: valgrind-3.9.0/configure.ac
+===================================================================
+--- valgrind-3.9.0.orig/configure.ac	2014-02-12 09:03:07.879873700 -0800
++++ valgrind-3.9.0/configure.ac	2014-02-12 09:07:35.099871774 -0800
+@@ -918,6 +918,13 @@
+ 	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
+ 	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
+ 	;;
++     2.19)
++	AC_MSG_RESULT(2.19 family)
++	AC_DEFINE([GLIBC_2_19], 1, [Define to 1 if you're using glibc 2.19.x])
++	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
++	;;
+      darwin)
+ 	AC_MSG_RESULT(Darwin)
+ 	AC_DEFINE([DARWIN_LIBC], 1, [Define to 1 if you're using Darwin])
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
index e1fb568..64da1a2 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://fixed-perl-path.patch \
            file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
            file://sepbuildfix.patch \
+           file://glibc-2.19.patch \
           "
 
 SRC_URI[md5sum] = "0947de8112f946b9ce64764af7be6df2"
-- 
1.7.10.4


