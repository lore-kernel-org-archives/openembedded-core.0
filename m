Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 77094771D4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 15:31:11 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id r129so123450725wmr.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 07:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=NFOYEZztvWZy0Cdx9PbVSIjsi5+Bu8UVAzFAWpWO0GY=;
	b=O43yi0pUbpRDONe+hmxJdyVRgAzUCaoJW82Ac6lbzj1SjPzsXbqxuCB985LJmA9aqd
	RZaM+FpTFldyFWeXC8OC6JGS/AaaVqOK2jk6kjWRr1iIj0q8McGEQgY9TM38/06rOgYJ
	XSDW0FTXT3+wsOHsqPelEv85RZ27tm8p4NjxOktZdsmJ7BcXQnhSKkXlBAfHEiznuUKo
	bMA+gGExE2WgcUhBP/MQJ9XDhRFXbWEuL+GOkN735FhL22cTHGg3fMxpXRMN5NViucsD
	MA7bXtzLFLDqn+EVxx+eAMZ58xwmOcv0JbpxLMH47mvngG+ZcajPzq5trWJRE9rfKTVh
	pHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=NFOYEZztvWZy0Cdx9PbVSIjsi5+Bu8UVAzFAWpWO0GY=;
	b=D3oEi/guYj7E0j5sQMzbHpI4qoEHHnqufQcoyHwn6hFGpI2DFSwFu4BNcs/J5DfrQK
	e4DuVCwewFfigm3B/Pr2bppzpvPcMF1ZKhpDGi3O4mXTF1EtR67LzMNE+92o7i5uyO6R
	vw5URjE8KceJfz5fMUf0ubMvTWn2pD+KWG4uIJw0cuFkW7BIbwTpxlQcngnHkUJA0STw
	NPKPzW1XEEHms718CV9dMhoyuVZXgbPzcLZXqQFeAvegsD9FiLXVQ0iQThX/e7cyXyqE
	6KjV0SaNH61dc/jnvd1/+iQDFfN1sHXuEAukPKwFsu2B8C0aFhvZ/UzWfGPGRXMxiBC1
	V8Eg==
X-Gm-Message-State: AG10YOQZ8rZhYqRkd6whP4JQ6pmp9ElNFvCgk/eQPj0KoVjcxTPFc8FMdjNjJ+0KYiLZjaE8
X-Received: by 10.194.191.229 with SMTP id hb5mr29022218wjc.164.1454427072248; 
	Tue, 02 Feb 2016 07:31:12 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	ei9sm1997189wjd.40.2016.02.02.07.31.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Feb 2016 07:31:11 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 15:31:07 +0000
Message-Id: <1454427067-8939-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH][jethro] busybox: fix build of last applet
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
X-List-Received-Date: Tue, 02 Feb 2016 15:31:13 -0000

If CONFIG_FEATURE_LAST_SMALL is enabled the build fails because of a broken
__UT_NAMESIZE test.

[ YOCTO #8869 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../busybox/busybox/0001-randconfig-fix.patch      | 33 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.23.2.bb        |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-randconfig-fix.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-randconfig-fix.patch b/meta/recipes-core/busybox/busybox/0001-randconfig-fix.patch
new file mode 100644
index 0000000..415ec34
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-randconfig-fix.patch
@@ -0,0 +1,33 @@
+If CONFIG_FEATURE_LAST_SMALL is enabled the build fails because of a broken
+__UT_NAMESIZE test.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 932302666b0354ede63504d1bef8393cab28db8b Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Sun, 11 Oct 2015 16:58:18 +0200
+Subject: [PATCH] randconfig fix
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+ miscutils/last.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/miscutils/last.c b/miscutils/last.c
+index 6d8b584..f8f3437 100644
+--- a/miscutils/last.c
++++ b/miscutils/last.c
+@@ -34,7 +34,8 @@
+ 	&& ((UT_LINESIZE != 32) || (UT_NAMESIZE != 32) || (UT_HOSTSIZE != 256))
+ #error struct utmpx member char[] size(s) have changed!
+ #elif defined __UT_LINESIZE \
+-	&& ((__UT_LINESIZE != 32) || (__UT_NAMESIZE != 64) || (__UT_HOSTSIZE != 256))
++	&& ((__UT_LINESIZE != 32) || (__UT_NAMESIZE != 32) || (__UT_HOSTSIZE != 256))
++/* __UT_NAMESIZE was checked with 64 above, but glibc-2.11 definitely uses 32! */
+ #error struct utmpx member char[] size(s) have changed!
+ #endif
+ 
+-- 
+2.6.4
+
diff --git a/meta/recipes-core/busybox/busybox_1.23.2.bb b/meta/recipes-core/busybox/busybox_1.23.2.bb
index 2559823..7258df0 100644
--- a/meta/recipes-core/busybox/busybox_1.23.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.23.2.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-chown-fix-help-text.patch \
            file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch \
            file://0002-Passthrough-r-to-linker.patch \
+           file://0001-randconfig-fix.patch \
            file://mount-via-label.cfg \
            file://sha1sum.cfg \
            file://sha256sum.cfg \
-- 
2.6.4


