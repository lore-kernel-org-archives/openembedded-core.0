Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8F13D6B918
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:23:21 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id d41so179581eek.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=mA2T7+vnKnoGFoYAbk9xoRHhk35cEuGWoURfQ8s4Gl4=;
	b=Lfs0+8FUZkgB+0Mm+aG8OSPYaE6TYt5Db22hS7b5iBKWoct6W5GZcf3TP5GyAcECy2
	ZkxhD4bfQ+kAADTtpNFjGyiwTWVrhYczrfOP46v9bW7oYJqckJvOAVlqQypScCB5TTw0
	vyrdnMA5goK3J22idDKnGhEvUcAv9ohvMARDIA9hVBe4lEbVTUbA8wcmr+pfHt3OO1dL
	SXxtkjjak5AQnYCgIGWtx66p2aoXvADy1sTWYK++bqxFEZfGbjtlUZsHvOwkvLmBfBUF
	VGj6Jf4I+WjyQCz8KvvjVXLQniJnAYQCm1tuTP894xx/CPPZwwQWzDePOx9dwgNs9gP0
	vOMQ==
X-Received: by 10.14.111.198 with SMTP id w46mr1320745eeg.66.1376551402024;
	Thu, 15 Aug 2013 00:23:22 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k3sm82028961een.16.2013.08.15.00.23.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:23:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:34 +0200
Message-Id: <0a8166883d24be173743270c07d62c8bbad3bf40.1376551402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 23/33] minicom: add configure option and PACKAGECONFIG for lockdev
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
X-List-Received-Date: Thu, 15 Aug 2013 07:23:22 -0000

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


