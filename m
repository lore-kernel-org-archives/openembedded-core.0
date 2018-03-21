Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1724578966
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 02:42:42 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id j20so1466546pfi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 19:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eTXoh2QwIJ1k8wQvKVs6eQnXfqoPjAh0EZZyu8+eAtM=;
	b=NMG0goVTGqXi0TDXxFPXWezqKZV2BEfTEc6RI+31vfeEARH7I+xpp0QETLZ1Cu42I1
	Ej4ATlvKcl3aincKxHAHcD61RtEu8KZHwsFRHsz3X52oRaDYmWwBwASXJrEe0DtscOnI
	+cBHmJxSwUWhZFmujIfv0VA8v4+MU4jcNz6fTF+DTrh+OfsFU/VuCi58rwl3mXgfQpn8
	+bEREtUEx3jkIwh4E16JQrfahsj3yeyE1PSJZxcEtjuMRQ9+cIf+419tmYMaj2wrI5zr
	+zShtPYjl2QPILPqLT6s5uCXJ2RBznZSA9yOdOVILOmUo5DGfdzrvwHl0AgwyUlldhte
	i7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eTXoh2QwIJ1k8wQvKVs6eQnXfqoPjAh0EZZyu8+eAtM=;
	b=PUuNBw9MeUIZmnM3K73sLDNryVUJhSR1ZjM3yStoTxXNcQ9LPOWItRuwoLFr3vaPZK
	FrSo5Uqw5GAlNHwBnDHJJufJJ+jnEaL4YKpK3ovVEMDGy2kZcesgGh/0qZlnTFCASWz5
	2P6eOIXoqZkAZ41GLj5O6Gh/g9CRxtKhI6WDuhXdKNdOjUTfwB2IDOSg2g/uFZKKT4In
	pMm57F/UK72hXU1McG3VDV7Rs5iDS6L+HMDnEliTq+U7QnpO6kI3GF9FRnr56mVeaA3K
	Xca7olwNn9bE6nUhd7GJoMIp9eZ7qQPRGaQa5tWv1t7PPh4BrJ1RZWYMpmMmg7bWWiS1
	LXUA==
X-Gm-Message-State: AElRT7F203DRH7FvA9Bbe/bf9PzFa6D+vVXbRfVxgEPRRCBgizbnXV78
	YutzbWRY0MpSA9KnOUkvzbRFhA==
X-Google-Smtp-Source: AG47ELtwIE6uM2RYfz5WiEEA5x9eBxLYsK6D5tttuTmw6VGfMqk+qcx0wMNbdW+KHZYfbUVA8jtVCQ==
X-Received: by 10.98.157.7 with SMTP id i7mr5813703pfd.85.1521600163855;
	Tue, 20 Mar 2018 19:42:43 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	12sm6172559pfr.108.2018.03.20.19.42.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Mar 2018 19:42:42 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2018 19:42:26 -0700
Message-Id: <1521600149-3894-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521600149-3894-1-git-send-email-armccurdy@gmail.com>
References: <1521600149-3894-1-git-send-email-armccurdy@gmail.com>
Subject: [daisy][PATCH 3/6] gmp_4.2.1: fix build for MIPS
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
X-List-Received-Date: Wed, 21 Mar 2018 02:42:43 -0000

The h asm constrain (to extract the high part of a multiplication
result) has not been recognised since gcc 4.4:

  https://gcc.gnu.org/gcc-4.4/changes.html

Drop the MIPS umul_ppmm() implementations which rely on "=h" and fall
back to the older implementations (which use explicit mfhi and mflo
instructions to move the high and low parts of the multiplication
result into their destinations).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit f8b2eb5eb09a1314ef59e58df95e81c1c1ccf1f4)
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../avoid-h-asm-constraint-for-MIPS.patch          | 57 ++++++++++++++++++++++
 meta/recipes-support/gmp/gmp_4.2.1.bb              |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-support/gmp/gmp-4.2.1/avoid-h-asm-constraint-for-MIPS.patch

diff --git a/meta/recipes-support/gmp/gmp-4.2.1/avoid-h-asm-constraint-for-MIPS.patch b/meta/recipes-support/gmp/gmp-4.2.1/avoid-h-asm-constraint-for-MIPS.patch
new file mode 100644
index 0000000..6da0be9
--- /dev/null
+++ b/meta/recipes-support/gmp/gmp-4.2.1/avoid-h-asm-constraint-for-MIPS.patch
@@ -0,0 +1,57 @@
+From d50686de0406a88ef9112f5252103f799982e84a Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Thu, 4 Feb 2016 14:00:00 -0800
+Subject: [PATCH] avoid h asm constraint for MIPS
+
+The h asm constrain (to extract the high part of a multiplication
+result) has not been recognised since gcc 4.4:
+
+  https://gcc.gnu.org/gcc-4.4/changes.html
+
+Drop the MIPS umul_ppmm() implementations which rely on "=h" and fall
+back to the older implementations (which use explicit mfhi and mflo
+instructions to move the high and low parts of the multiplication
+result into their destinations).
+
+Upstream-Status: Inappropriate [upstream has a different solution]
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ longlong.h | 10 ----------
+ 1 file changed, 10 deletions(-)
+
+diff --git a/longlong.h b/longlong.h
+index b53fbee..0193abb 100644
+--- a/longlong.h
++++ b/longlong.h
+@@ -1011,27 +1011,17 @@ extern UWtype __MPN(udiv_qrnnd) _PROTO ((UWtype *, UWtype, UWtype, UWtype));
+ #endif /* __m88000__ */
+ 
+ #if defined (__mips) && W_TYPE_SIZE == 32
+-#if __GNUC__ > 2 || __GNUC_MINOR__ >= 7
+-#define umul_ppmm(w1, w0, u, v) \
+-  __asm__ ("multu %2,%3" : "=l" (w0), "=h" (w1) : "d" (u), "d" (v))
+-#else
+ #define umul_ppmm(w1, w0, u, v) \
+   __asm__ ("multu %2,%3\n\tmflo %0\n\tmfhi %1"				\
+ 	   : "=d" (w0), "=d" (w1) : "d" (u), "d" (v))
+-#endif
+ #define UMUL_TIME 10
+ #define UDIV_TIME 100
+ #endif /* __mips */
+ 
+ #if (defined (__mips) && __mips >= 3) && W_TYPE_SIZE == 64
+-#if __GNUC__ > 2 || __GNUC_MINOR__ >= 7
+-#define umul_ppmm(w1, w0, u, v) \
+-  __asm__ ("dmultu %2,%3" : "=l" (w0), "=h" (w1) : "d" (u), "d" (v))
+-#else
+ #define umul_ppmm(w1, w0, u, v) \
+   __asm__ ("dmultu %2,%3\n\tmflo %0\n\tmfhi %1"				\
+ 	   : "=d" (w0), "=d" (w1) : "d" (u), "d" (v))
+-#endif
+ #define UMUL_TIME 20
+ #define UDIV_TIME 140
+ #endif /* __mips */
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/gmp/gmp_4.2.1.bb b/meta/recipes-support/gmp/gmp_4.2.1.bb
index 362aacf..baec709 100644
--- a/meta/recipes-support/gmp/gmp_4.2.1.bb
+++ b/meta/recipes-support/gmp/gmp_4.2.1.bb
@@ -12,6 +12,7 @@ PR = "r2"
 SRC_URI = "${GNU_MIRROR}/gmp/${BP}.tar.bz2 \
            file://disable-stdc.patch \
            file://gmp_fix_for_automake-1.12.patch \
+           file://avoid-h-asm-constraint-for-MIPS.patch \
            "
 
 SRC_URI[md5sum] = "091c56e0e1cca6b09b17b69d47ef18e3"
-- 
1.9.1


