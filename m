Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3567873193
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 22:29:21 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 6so1150844pfl.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 15:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3GZOMTBKCoXD2zApb/VNJ3H33N90p89TRImRzzzyg6w=;
	b=Isw1lkGGR572fnNkha4LcV3aJVGLdNm51BEpE4JK8JHjw0UBRfQVr+hmTrfM1V5fjs
	3OJejpMlMlWZwoHpls7fxOZwobBRaK2twkSonlLODFjWA6DBfPXlmsfRsPozqCOSXK5O
	/R55OOYg8MjVnZdLs7LhPLE/L14S8eXPP651n3v29gtVw0LHFfvP0kTOzLZ4poYB4H+0
	VinzQQs+MQOyYRZFFUc9dSFbMnSaTWk9G/FJIKX73I416OpTF5AaFE8STUjH6o1z5Mfv
	RIyxkmXPRufng+hpecjPhGUv4uKtvQ3VJP/hul8GflBO9qfY3CRmClUuos1lCjHCjRTw
	1kjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3GZOMTBKCoXD2zApb/VNJ3H33N90p89TRImRzzzyg6w=;
	b=AX+UyHn9kqadVLfZtlE5vHPQXSM+5Ud55TH6LQRsLzyqKOQ4aOznVSVmtPJ27VjK9X
	GS4nkkQRnAxcqWvWrG8/eAKgMDEOxq85M4RQXBo+vIaanbglpQIFFH66KJynvM6CVQpZ
	4Nv6IvVsyw3HaToen9kYE/aiLPoyPLoohhu0KUK797C05qkhQ9slcb0xS2hOAiUKMdM0
	vIMgLHojZ9rQSArMld+JGy9vgyMUPdo1uEmlyV7M86Zvn+GAuRyg/1I27xsjmUCPn0Fr
	c1A+XVHEQmpFDhULj0+uDRAkE7a+RoyWFW8YMhiY/6rSekE181iaCtRUOd+WpTIcmoeF
	vNtQ==
X-Gm-Message-State: AE9vXwNtagYojIvV2appkK1GHuqVmNLNdX8bp32q/l1NzusBMUL06y3t2szmbf4YpdZDsw==
X-Received: by 10.98.73.202 with SMTP id r71mr26503594pfi.36.1474064962466;
	Fri, 16 Sep 2016 15:29:22 -0700 (PDT)
Received: from e6520.adbgroup.pl
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	c66sm54410269pfd.24.2016.09.16.15.29.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Sep 2016 15:29:21 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2016 15:29:11 -0700
Message-Id: <1474064952-21753-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1474064952-21753-1-git-send-email-armccurdy@gmail.com>
References: <1474064952-21753-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/2] dropbear: fix -ltomcrypt -ltommath order when using system libtom libs
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
X-List-Received-Date: Fri, 16 Sep 2016 22:29:23 -0000

To prevent build failures when using system libtom libraries and
linking with --as-needed, LIBTOM_LIBS should be in the order
-ltomcrypt -ltommath, not the other way around, ie libs should be
prepended to LIBTOM_LIBS as they are found, not appended.

Note that LIBTOM_LIBS is not used when linking with the bundled
libtom libs.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/dropbear/dropbear.inc            |  1 +
 .../fix-libtomcrypt-libtommath-ordering.patch      | 48 ++++++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-core/dropbear/dropbear/fix-libtomcrypt-libtommath-ordering.patch

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 923d31c..cdac7ec 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -17,6 +17,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://0003-configure.patch \
            file://0004-fix-2kb-keys.patch \
            file://0007-dropbear-fix-for-x32-abi.patch \
+           file://fix-libtomcrypt-libtommath-ordering.patch \
            file://init \
            file://dropbearkey.service \
            file://dropbear@.service \
diff --git a/meta/recipes-core/dropbear/dropbear/fix-libtomcrypt-libtommath-ordering.patch b/meta/recipes-core/dropbear/dropbear/fix-libtomcrypt-libtommath-ordering.patch
new file mode 100644
index 0000000..de930f2
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/fix-libtomcrypt-libtommath-ordering.patch
@@ -0,0 +1,48 @@
+From 2fd8d2aedad0c50cdf1e43edd2387874b720ad4c Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Fri, 16 Sep 2016 12:18:23 -0700
+Subject: [PATCH] fix libtomcrypt/libtommath ordering
+
+To prevent build failures when using system libtom libraries and
+linking with --as-needed, LIBTOM_LIBS should be in the order
+-ltomcrypt -ltommath, not the other way around, ie libs should be
+prepended to LIBTOM_LIBS as they are found, not appended.
+
+Note that LIBTOM_LIBS is not used when linking with the bundled
+libtom libs.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ configure.ac | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index b6abe4c..85bb8bc 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -390,16 +390,16 @@ AC_ARG_ENABLE(bundled-libtom,
+ 			AC_MSG_NOTICE(Forcing bundled libtom*)
+ 		else
+ 			BUNDLED_LIBTOM=0
+-			AC_CHECK_LIB(tommath, mp_exptmod, LIBTOM_LIBS="$LIBTOM_LIBS -ltommath", 
++			AC_CHECK_LIB(tommath, mp_exptmod, LIBTOM_LIBS="-ltommath $LIBTOM_LIBS",
+ 				[AC_MSG_ERROR([Missing system libtommath and --disable-bundled-libtom was specified])] )
+-			AC_CHECK_LIB(tomcrypt, register_cipher, LIBTOM_LIBS="$LIBTOM_LIBS -ltomcrypt", 
++			AC_CHECK_LIB(tomcrypt, register_cipher, LIBTOM_LIBS="-ltomcrypt $LIBTOM_LIBS",
+ 				[AC_MSG_ERROR([Missing system libtomcrypt and --disable-bundled-libtom was specified])] )
+ 		fi
+ 	],
+ 	[
+ 		BUNDLED_LIBTOM=0
+-		AC_CHECK_LIB(tommath, mp_exptmod, LIBTOM_LIBS="$LIBTOM_LIBS -ltommath", BUNDLED_LIBTOM=1)
+-		AC_CHECK_LIB(tomcrypt, register_cipher, LIBTOM_LIBS="$LIBTOM_LIBS -ltomcrypt", BUNDLED_LIBTOM=1)
++		AC_CHECK_LIB(tommath, mp_exptmod, LIBTOM_LIBS="-ltommath $LIBTOM_LIBS", BUNDLED_LIBTOM=1)
++		AC_CHECK_LIB(tomcrypt, register_cipher, LIBTOM_LIBS="-ltomcrypt $LIBTOM_LIBS", BUNDLED_LIBTOM=1)
+ 	]
+ )
+ 
+-- 
+1.9.1
+
-- 
1.9.1


