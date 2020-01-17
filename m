Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 02F187FBBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 17:14:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47znjq5KnyzCl
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 18:14:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1579281279;
	bh=VJcgys1BEQNPimbAYP6oNGoeglmOH+wjxTwrfaV6HnA=;
	h=From:To:Subject:Date:From;
	b=aiGXfwCVJooLBAEctDCle3/9OLxUeEmCPRdcF1X5hKb6c28W2bbFwi3tpbM8A4qev
	2M9wN3AKlqOiLO5SYWeuZnT/vYNNXxzyMG9jHTR/clCWrunKMdX3Se58BAJW2cocl6
	r4EgTYaZ0smpLygxaxVkco0v7BjYVm6sCcsns/CMKQV3DAho8bRG7R259M5r3eFpOb
	8pLJFa3qCqvsrAcOMHtYNn/GTbESVhygmiMwvXyBeaLnZXtp95DzDdDH9P4bBn2SYG
	l3tPqzyJi/bbm3f/EsuoEN56Q8x0oxjptOXGzHA9S8OPv/XawwU6UqKbPqZJqSk69K
	NqJWd9eIn+WCIySUM6hwxZq61vqytKQ38fsLDuNoOlqX95+IeGeEwZ18ZjQr5AOERN
	RAR/5D/1M/F6GGhGsqfltd2n2BTVEss9Ra4z0cGTXx9ePDndWlBsEyFFJiP5keTsr3
	bY1EoMqYueL8NDC9CF96qX5nFnp8/PVCehh4vB3QlUjOr1BXQP5PSmRjlJgn/hPKyQ
	0s4SgenU/BxpLz2TTuMXhkyBoFSsGvKJ6yoJ24H077QaODr6fk/gEo8GTj8XmSFdbP
	aTrJErWHBvFhptOJaXZojXO8jnsNdLxWsxPQHJBt+tacb33IB8GjUGxawndLzxFG6c
	xb488k5cXv2Frmfw9lCO648k=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 19:14:27 +0200
Message-Id: <20200117171436.17131-7-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] glibc: fix CVE-2019-19126
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
X-List-Received-Date: Fri, 17 Jan 2020 17:14:39 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Backport from 2.30 stable branch and drop NEWS section.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../glibc/glibc/CVE-2019-19126.patch          | 32 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.29.bb         |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2019-19126.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2019-19126.patch b/meta/recipes-core/glibc/glibc/CVE-2019-19126.patch
new file mode 100644
index 0000000000..aead04c485
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2019-19126.patch
@@ -0,0 +1,32 @@
+From 37c90e117310728a4ad1eb998c0bbe7d79c4a398 Mon Sep 17 00:00:00 2001
+From: =?utf8?q?Marcin=20Ko=C5=9Bcielnicki?= <mwk@0x04.net>
+Date: Thu, 21 Nov 2019 00:20:15 +0100
+Subject: [PATCH] rtld: Check __libc_enable_secure before honoring
+ LD_PREFER_MAP_32BIT_EXEC (CVE-2019-19126) [BZ #25204]
+
+The problem was introduced in glibc 2.23, in commit
+b9eb92ab05204df772eb4929eccd018637c9f3e9
+("Add Prefer_MAP_32BIT_EXEC to map executable pages with MAP_32BIT").
+
+(cherry picked from commit d5dfad4326fc683c813df1e37bbf5cf920591c8e)
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commit;h=37c90e117310728a4ad1eb998c0bbe7d79c4a398]
+CVE: CVE-2019-19126
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+diff --git a/sysdeps/unix/sysv/linux/x86_64/64/dl-librecon.h b/sysdeps/unix/sysv/linux/x86_64/64/dl-librecon.h
+index 975cbe2..df2cdfd 100644
+--- a/sysdeps/unix/sysv/linux/x86_64/64/dl-librecon.h
++++ b/sysdeps/unix/sysv/linux/x86_64/64/dl-librecon.h
+@@ -31,7 +31,8 @@
+    environment variable, LD_PREFER_MAP_32BIT_EXEC.  */
+ #define EXTRA_LD_ENVVARS \
+   case 21:								  \
+-    if (memcmp (envline, "PREFER_MAP_32BIT_EXEC", 21) == 0)		  \
++    if (!__libc_enable_secure						  \
++	&& memcmp (envline, "PREFER_MAP_32BIT_EXEC", 21) == 0)		  \
+       GLRO(dl_x86_cpu_features).feature[index_arch_Prefer_MAP_32BIT_EXEC] \
+ 	|= bit_arch_Prefer_MAP_32BIT_EXEC;				  \
+     break;
+-- 
+2.9.3
diff --git a/meta/recipes-core/glibc/glibc_2.29.bb b/meta/recipes-core/glibc/glibc_2.29.bb
index c6b2caad42..28af4d1ba4 100644
--- a/meta/recipes-core/glibc/glibc_2.29.bb
+++ b/meta/recipes-core/glibc/glibc_2.29.bb
@@ -56,6 +56,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0030-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
            file://0001-x86-64-memcmp-Use-unsigned-Jcc-instructions-on-size-.patch \
            file://CVE-2019-9169.patch \
+           file://CVE-2019-19126.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


