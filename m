Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id AF2AD72407
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 01:19:31 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id g10so22246446pdj.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 17:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=gihqxqzaeFo7YA87kRmDpfnAwTnKa8349jno7LU/Tq4=;
	b=jooK13WuqqxTtnFh32xo1SJAzVXMURqQ5+4lXaZ2jEfLt2ll4FRm9tY9F8UQjjO2lJ
	xJCEloFhwAdFLQQgeHjz9yENJPMbafwCd92sycmcIJO1DEGM/n0hYia/tgEIOO4Zactg
	jDpBiHZlJep8xTrfP+7w6cexXwUcv4yIIkYTsa4LK7VFZ7St1yVz/ogETVpzCnNFMSlY
	FnKU2doZeBY0/fy/6oCVioRyUnVJdRfBejzxCrfFp5rzkMSI6bplkyEpgvQWp9/sRHLM
	vR9T4xcm7/sj7HVSfdFEL2kXZmvCgEEEiE8eI37I2q80HNDM6UBB2T6Vx8FbMn495vqQ
	o13g==
X-Received: by 10.68.134.164 with SMTP id pl4mr1381052pbb.128.1422407972333;
	Tue, 27 Jan 2015 17:19:32 -0800 (PST)
Received: from Pahoa2.mvista.com (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id y4sm2808851pdj.59.2015.01.27.17.19.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 Jan 2015 17:19:31 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jan 2015 17:19:28 -0800
Message-Id: <1422407968-28111-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Armin Kuster <akuster@mvista.com>
Subject: [MASTER][PATCH] busybox: cve-2014-9645
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
X-List-Received-Date: Wed, 28 Jan 2015 01:19:35 -0000

From: Armin Kuster <akuster@mvista.com>

modprobe,rmmod: reject module names with slashes

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 ..._busybox_reject_module_names_with_slashes.patch | 41 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.22.1.bb        |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2014-9645_busybox_reject_module_names_with_slashes.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2014-9645_busybox_reject_module_names_with_slashes.patch b/meta/recipes-core/busybox/busybox/CVE-2014-9645_busybox_reject_module_names_with_slashes.patch
new file mode 100644
index 0000000..4e76067
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2014-9645_busybox_reject_module_names_with_slashes.patch
@@ -0,0 +1,41 @@
+Upstream-status: Backport
+http://git.busybox.net/busybox/commit/?id=4e314faa0aecb66717418e9a47a4451aec59262b
+
+CVE-2014-9645 fix.
+
+[YOCTO #7257]
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+From 4e314faa0aecb66717418e9a47a4451aec59262b Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Thu, 20 Nov 2014 17:24:33 +0000
+Subject: modprobe,rmmod: reject module names with slashes
+
+function                                             old     new   delta
+add_probe                                             86     113     +27
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+Index: busybox-1.22.1/modutils/modprobe.c
+===================================================================
+--- busybox-1.22.1.orig/modutils/modprobe.c
++++ busybox-1.22.1/modutils/modprobe.c
+@@ -238,6 +238,17 @@ static void add_probe(const char *name)
+ {
+ 	struct module_entry *m;
+ 
++	/*
++	 * get_or_add_modentry() strips path from name and works
++	 * on remaining basename.
++	 * This would make "rmmod dir/name" and "modprobe dir/name"
++	 * to work like "rmmod name" and "modprobe name",
++	 * which is wrong, and can be abused via implicit modprobing:
++	 * "ifconfig /usbserial up" tries to modprobe netdev-/usbserial.
++	 */
++	if (strchr(name, '/'))
++		bb_error_msg_and_die("malformed module name '%s'", name);
++
+ 	m = get_or_add_modentry(name);
+ 	if (!(option_mask32 & (OPT_REMOVE | OPT_SHOW_DEPS))
+ 	 && (m->flags & MODULE_FLAG_LOADED)
diff --git a/meta/recipes-core/busybox/busybox_1.22.1.bb b/meta/recipes-core/busybox/busybox_1.22.1.bb
index dd61a26..a41879c 100644
--- a/meta/recipes-core/busybox/busybox_1.22.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.22.1.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-build-system-Specify-nostldlib-when-linking-to-.o-fi.patch \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
+           file://CVE-2014-9645_busybox_reject_module_names_with_slashes.patch \
 "
 
 SRC_URI[tarball.md5sum] = "337d1a15ab1cb1d4ed423168b1eb7d7e"
-- 
1.9.1


