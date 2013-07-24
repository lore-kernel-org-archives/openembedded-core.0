Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id B1F2F6B33D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:02:31 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id f15so189750eak.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=mA2T7+vnKnoGFoYAbk9xoRHhk35cEuGWoURfQ8s4Gl4=;
	b=Nvoi+BKQYE5K+A+spLYMPgT8Hy7CJ6KzL0a78eXCGs2fGKV7g4nxEDou3ZiyK7LN+i
	ZFp4djtPIKMDhgz3546ELaJ18W2AuTxOmfF/VUp2mJ9TGYPJ9gDT6Ot+oaMSaDDK8UV1
	xPI0EvfAtKpJTmPANDemVq1ibx2epKhXyNq55+93rY+AvSw8RL+y6Bmwff5iwZJXGC89
	NzrM2KRWLJrgIUFp73KmwaDZnhiEnG/HalEchN1C6S6RPSnLzdqG8B+sfoKRLNYnOScd
	Xvmh02Z7Gb+ZVXs1yJUOX59rPjZCwLENphKgZXGVPtDvVMpjSKCCkuq/ljDRkzpxleCp
	VF3Q==
X-Received: by 10.15.31.9 with SMTP id x9mr37260928eeu.103.1374667351955;
	Wed, 24 Jul 2013 05:02:31 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	c3sm65664419eev.3.2013.07.24.05.02.30 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:02:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:02:32 +0200
Message-Id: <9324a1abb24ec870306a61cf45e7261e58ede1d0.1374667312.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
References: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374667312.git.Martin.Jansa@gmail.com>
References: <cover.1374667312.git.Martin.Jansa@gmail.com>
Subject: [PATCH 10/18] minicom: add configure option and PACKAGECONFIG for lockdev
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
X-List-Received-Date: Wed, 24 Jul 2013 12:02:32 -0000

* it's autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../minicom-2.6.2/allow.to.disable.lockdev.patch    | 21 +++++++++++++++++++++
 meta/recipes-extended/minicom/minicom_2.6.2.bb      |  7 ++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/minicom/minicom-2.6.2/allow.to.disable.lockdev.patch

diff --git a/meta/recipes-extended/minicom/minicom-2.6.2/allow.to.disable.lockdev.patch b/meta/recipes-extended/minicom/minicom-2.6.2/allow.to.disable.lockdev.patch
new file mode 100644
index 0000000..f5c0889
--- /dev/null
+++ b/meta/recipes-extended/minicom/minicom-2.6.2/allow.to.disable.lockdev.patch
@@ -0,0 +1,21 @@
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+--- a/configure.in	2013-02-06 18:18:13.000000000 +0100
++++ b/configure.in	2013-07-21 15:31:27.614828894 +0200
+@@ -40,7 +40,13 @@
+ fi
+ 
+ PKG_PROG_PKG_CONFIG
+-if test -n "$PKG_CONFIG"; then
++
++AC_ARG_ENABLE([lockdev],
++        AS_HELP_STRING([--enable-lockdev],
++                       [Enable lockdev support (def: enabled)]),
++        [], [enable_lockdev="yes"])
++
++if test -n "$PKG_CONFIG" && test "x$enable_lockdev" = xyes; then
+ 	PKG_CHECK_MODULES([LOCKDEV], [lockdev], AC_DEFINE([HAVE_LOCKDEV],[1],[Define if you have lockdev]),[:])
+ fi
+ 
diff --git a/meta/recipes-extended/minicom/minicom_2.6.2.bb b/meta/recipes-extended/minicom/minicom_2.6.2.bb
index 0d65e80..558867d 100644
--- a/meta/recipes-extended/minicom/minicom_2.6.2.bb
+++ b/meta/recipes-extended/minicom/minicom_2.6.2.bb
@@ -8,11 +8,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645 \
 
 PR = "r0"
 
-SRC_URI = "http://alioth.debian.org/frs/download.php/3869/minicom-${PV}.tar.gz"
+SRC_URI = "http://alioth.debian.org/frs/download.php/3869/minicom-${PV}.tar.gz \
+           file://allow.to.disable.lockdev.patch \
+"
 
 SRC_URI[md5sum] = "203c56c4b447f45e2301b0cc4e83da3c"
 SRC_URI[sha256sum] = "f3cf215f7914ffa5528e398962176102ad74df27ba38958142f56aa6d15c9168"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[lockdev] = "--enable-lockdev,--disable-lockdev,lockdev"
+
 inherit autotools gettext
 
 do_install() {
-- 
1.8.3.2


