Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 86C35788D6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 00:42:38 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id z81so10086249wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 16:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=LcrIMGCbcTlMIpVB0HqTLZDFlnwtKzoL1OuggqeTsS8=;
	b=NBYmdFvdDppsXfYOZOFbbGskKdMXK6eUaa1NPGncdwlt6mRU15A0dwZexGfV0weoT7
	skP4PCJ8QgO0Jup9U08WBXkC36jGN+7PY1FxYv8ZNGwmh7j9Wh/XYy1T1D0oC+Kc3sQX
	nZl3mc/o6EX4+YzUgyR7w5tkjhetU3Mpx/QAs2iq3iZGX/8BsJEjqT6s6borG95m3CuE
	4oLixAWaigkCD8/uh4DYoE5xZgBsMqW0URyWuUxuSci645Xk1p15KuuldQIjNH6Kh1vI
	suQTNT99GezdbAzWaJ5njkXAas+oBGqibKQI0c6Z2rCnVPNSCNFi8Y9N6eRTDUuu+pAH
	Pznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=LcrIMGCbcTlMIpVB0HqTLZDFlnwtKzoL1OuggqeTsS8=;
	b=CEhP+jFEqA7lNCSnmKJB6dBuD5mqivpVIwjRkunpWf2+H4hne0AOy2HaSArYRl/7TE
	opV8Bhe2fFgzMdJoWzr8+aDq152VmvkHcXho0OVG72Dt4Xs2qhWDoVXn/giTl06yMW5G
	Ve2RvtMjVrS991Qla4Y01niE3knnVznLnUQvddaJ2Uqem7WmyKU/SlYtkEfpfKFKoctw
	idE98iKrlpdajEx7MFYPtfmSA87SxyZ0SeHV1PZhPuSZBqyLVYSgztAxmNIvtPxyE4uU
	Dn2SdXCq2B/RB58Be9kRn1OVR+vIIraVFGFWyoVR6IiQq1bIAAZfXETDMbSB/gvhtZX5
	LzQA==
X-Gm-Message-State: AElRT7H6oWltbYBBhCgnSlwT5XwrzpNWBmLG15j0S5Ocuwt+rdkI3mvz
	XoBwCuDYWlA7EdV6q10UDnaIIw==
X-Google-Smtp-Source: AG47ELsDYxarAcqgAl9VizXzqpRYbrbV9RnD4rMTfPJy+YVRsu5/ZhKu5hDzifegSTAj7URV9xMDSg==
X-Received: by 10.28.10.81 with SMTP id 78mr2049858wmk.115.1520728959400;
	Sat, 10 Mar 2018 16:42:39 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 55sm5540043wrz.6.2018.03.10.16.42.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 10 Mar 2018 16:42:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 11 Mar 2018 00:42:17 +0000
Message-Id: <e54f26a0dbfc8de22ce8326ac77d1097d13f6e2c.1520728802.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <cover.1520728802.git.Martin.Jansa@gmail.com>
References: <cover.1520728802.git.Martin.Jansa@gmail.com>
Subject: [morty][PATCH 05/16] gcc-6: Add fix for missing no-PIE flags
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
X-List-Received-Date: Sun, 11 Mar 2018 00:42:39 -0000

From: Stephen Arnold <stephen.arnold42@gmail.com>

Fixes build on hardened PAX host with gcc-5 (linker error on relocs).
Completes no-PIE config by adding to ALL_* flags variables.
Borrowed from Gentoo gcc patches, tested on 2 hardened amd64 hosts.

Upstream-Status: Inappropriate [configuration]

Commited by: Gentoo Toolchain Project <toolchain@gentoo.org>
(From OE-Core rev: c178791cd78d5a9ebc4d7b7790e647a9bafe9cf2)

Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fcb236ea7cd1ac052719187fefed60ebf1a30ac8)
---
 meta/recipes-devtools/gcc/gcc-6.3.inc              |  1 +
 .../gcc/gcc-6.3/0054_all_nopie-all-flags.patch     | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.3/0054_all_nopie-all-flags.patch

diff --git a/meta/recipes-devtools/gcc/gcc-6.3.inc b/meta/recipes-devtools/gcc/gcc-6.3.inc
index 7cf25ab1b6..4f04c012c1 100644
--- a/meta/recipes-devtools/gcc/gcc-6.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.3.inc
@@ -79,6 +79,7 @@ SRC_URI = "\
            file://0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
            file://0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
            file://0048-sync-gcc-stddef.h-with-musl.patch \
+           file://0054_all_nopie-all-flags.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0054_all_nopie-all-flags.patch b/meta/recipes-devtools/gcc/gcc-6.3/0054_all_nopie-all-flags.patch
new file mode 100644
index 0000000000..73ab9502dc
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.3/0054_all_nopie-all-flags.patch
@@ -0,0 +1,22 @@
+Need to pass NO_PIE_CFLAGS to ALL_* so gcc doesn't fail when
+we compile it with older gcc and pie.
+
+Upstream-Status: Inappropriate [configuration]
+
+Maintained by: Gentoo Toolchain Project <toolchain@gentoo.org>
+Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>
+
+--- a/gcc/Makefile.in	2015-06-25 19:18:12.000000000 +0200
++++ b/gcc/Makefile.in	2016-04-22 00:12:54.029178860 +0200
+@@ -991,10 +991,10 @@ ALL_CXXFLAGS = $(T_CFLAGS) $(CFLAGS-$@)
+ ALL_CPPFLAGS = $(INCLUDES) $(CPPFLAGS)
+
+ # This is the variable to use when using $(COMPILER).
+-ALL_COMPILERFLAGS = $(ALL_CXXFLAGS)
++ALL_COMPILERFLAGS = $(NO_PIE_CFLAGS) $(ALL_CXXFLAGS)
+
+ # This is the variable to use when using $(LINKER).
+-ALL_LINKERFLAGS = $(ALL_CXXFLAGS)
++ALL_LINKERFLAGS = $(NO_PIE_CFLAGS) $(ALL_CXXFLAGS)
+
+ # Build and host support libraries.
-- 
2.15.1


