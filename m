Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f195.google.com (mail-ob0-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 884E97721D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 19:56:41 +0000 (UTC)
Received: by mail-ob0-f195.google.com with SMTP id il1so1885657obb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 11:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Hkf1YyCnYOQo1mett1MT4Quyh2hLq7GsV8Tr1uzt9rY=;
	b=sa07raxpHFlUcikuOBj4aiEuEFek6dJ9EoVOOfGATCs/KD5IvwgsiCq6bXFeInuH3O
	sAwDVBeBUkl3u2cawx9TXuRbeGx3k5/iZksgmyPPcQjg0ToSCgPLDPcus9z7zbf2ZsJR
	12JkAn+v1iVm8x9gNBcfOp7yOYKueVo3WL5U3kmGHgdLY2a7AjCltj29u79+G9NJxyUJ
	7TgR0SLiODznxLWxr3dzE4wwUdgG1pFdgl7h1L9dUuOndQxk7aFOh2xkZo46eTjm0H9g
	xQjqgw8cgPh7YoNurigbcDi0rFF0Dvxb21xEzqxCfSGmTdgCnj7fv+ve0+O9V6Y0L5QI
	r+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Hkf1YyCnYOQo1mett1MT4Quyh2hLq7GsV8Tr1uzt9rY=;
	b=GOVpHSlCJ0xxjOLxCH5oFSybDeM37T4bBYL1pop+Ia2ooq8JHmG1FqbCddf91A0O1l
	n1zV8z6EMwY4gBIHLqTKDQQei1d2azJZgjZ34axmt9ih6jdDeC/8v8gQLE+oiH/5Qkl9
	fZ95AfZv5Xjq06Qs7tWY1Dfkem+883hS4A5wOBr1oJzJW4z08h1wsUzhJrxmWlXlm9rH
	PD728ARY0qI8AnrFmmAK5n/Mr8n41c+cl0BYiKkeDCNPsOdhSoDutLJGxJTDgkOByB/b
	/XKfhwuJ+74RJCErGKyc+C1Wu2OYii7EvntTVYdMk5XUTc5oCNQw6+j/4pIDLsmgCNbR
	/PAA==
X-Gm-Message-State: AG10YOTRNDOZ31ote4hE6IXSirxKURyH6/CoygCGAslA7h6Kn0bzu75ebBVOwNYOiytqaw==
X-Received: by 10.182.105.197 with SMTP id go5mr14298599obb.12.1454702202470; 
	Fri, 05 Feb 2016 11:56:42 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	f9sm10046151obw.13.2016.02.05.11.56.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 11:56:41 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Feb 2016 11:56:19 -0800
Message-Id: <1454702179-30239-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454702179-30239-1-git-send-email-armccurdy@gmail.com>
References: <1454702179-30239-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 4/4] gmp_4.2.1: fix build for MIPS
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
X-List-Received-Date: Fri, 05 Feb 2016 19:56:41 -0000

The h asm constrain (to extract the high part of a multiplication
result) has not been recognised since gcc 4.4:

  https://gcc.gnu.org/gcc-4.4/changes.html

Drop the MIPS umul_ppmm() implementations which rely on "=h" and fall
back to the older implementations (which use explicit mfhi and mflo
instructions to move the high and low parts of the multiplication
result into their destinations).

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
index c25e5ea..5e8ee29 100644
--- a/meta/recipes-support/gmp/gmp_4.2.1.bb
+++ b/meta/recipes-support/gmp/gmp_4.2.1.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a \
 SRC_URI = "https://gmplib.org/download/${BPN}/archive/${BP}.tar.bz2 \
            file://Use-__gnu_inline__-attribute.patch \
            file://gmp_fix_for_automake-1.12.patch \
+           file://avoid-h-asm-constraint-for-MIPS.patch \
 "
 
 SRC_URI[md5sum] = "091c56e0e1cca6b09b17b69d47ef18e3"
-- 
1.9.1


