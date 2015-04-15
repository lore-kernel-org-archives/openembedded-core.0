Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 67CC873CEB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 02:54:04 +0000 (UTC)
Received: by igbqf9 with SMTP id qf9so31051199igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 19:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=bDs6drV9XHW7uodxaXCiE7JAoCmDNICZYz2jwB4AltE=;
	b=CE7jlmptjGDGkEdZgUD3wnktppfyt3S/akf/xCaJ79SHVa+9A7YdziwA/Xmx0RZU/A
	h3Arg/9vUcT7OfbkGG7pzrIhNaJd67s8ecEZWwaqnevfHgPdt0IKy3Pph7d41LXBhvw+
	QBh+xLSpSS9mNbOUhum6FYOOLaXs14J9BYQB/2sIOHb2ycjpyuxGLK7SUx5tc7mh1W9s
	EWEoPTRXjwyYJpM84/EYI7Ob7ZAsyxdXbSqqPTBBghqhtUOHGUdNLSMqYSGr7Y80wzAb
	5VI77MtjTR2bHom3EtCyoxK6h6roVyF9Ni2Tl4MLMfK0Cca/3OppebnDf8Qapn1fzMnh
	SOPg==
X-Received: by 10.107.31.206 with SMTP id f197mr33491693iof.19.1429066445859; 
	Tue, 14 Apr 2015 19:54:05 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id r1sm2297629igp.20.2015.04.14.19.54.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Apr 2015 19:54:05 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Apr 2015 19:53:53 -0700
Message-Id: <1429066433-14601-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] busybox: remove CVE-2014-9645 patch (already upstream in 1.23.x)
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
X-List-Received-Date: Wed, 15 Apr 2015 02:54:07 -0000

The CVE-2014-9645 fix was merged in Busybox prior to the 1.23.0
release [1]. The fix was then reworked in Busybox 1.23.1, in such
a way that the original change was no longer required [2].

Although oe-core's CVE-2014-9645 patch still applies cleanly to
Busybox 1.23.1 and 1.23.2, applying it partially reverts the second
version of the upstream fix.

  [1] http://git.busybox.net/busybox/commit/modutils/modprobe.c?h=1_23_stable&id=4e314faa0aecb66717418e9a47a4451aec59262b
  [2] http://git.busybox.net/busybox/commit/modutils/modprobe.c?h=1_23_stable&id=1ecfe811fe2f70380170ef7d820e8150054e88ca

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ..._busybox_reject_module_names_with_slashes.patch | 41 ----------------------
 meta/recipes-core/busybox/busybox_1.23.2.bb        |  1 -
 2 files changed, 42 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2014-9645_busybox_reject_module_names_with_slashes.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2014-9645_busybox_reject_module_names_with_slashes.patch b/meta/recipes-core/busybox/busybox/CVE-2014-9645_busybox_reject_module_names_with_slashes.patch
deleted file mode 100644
index 4e76067..0000000
--- a/meta/recipes-core/busybox/busybox/CVE-2014-9645_busybox_reject_module_names_with_slashes.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Upstream-status: Backport
-http://git.busybox.net/busybox/commit/?id=4e314faa0aecb66717418e9a47a4451aec59262b
-
-CVE-2014-9645 fix.
-
-[YOCTO #7257]
-
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
-From 4e314faa0aecb66717418e9a47a4451aec59262b Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Thu, 20 Nov 2014 17:24:33 +0000
-Subject: modprobe,rmmod: reject module names with slashes
-
-function                                             old     new   delta
-add_probe                                             86     113     +27
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
----
-Index: busybox-1.22.1/modutils/modprobe.c
-===================================================================
---- busybox-1.22.1.orig/modutils/modprobe.c
-+++ busybox-1.22.1/modutils/modprobe.c
-@@ -238,6 +238,17 @@ static void add_probe(const char *name)
- {
- 	struct module_entry *m;
- 
-+	/*
-+	 * get_or_add_modentry() strips path from name and works
-+	 * on remaining basename.
-+	 * This would make "rmmod dir/name" and "modprobe dir/name"
-+	 * to work like "rmmod name" and "modprobe name",
-+	 * which is wrong, and can be abused via implicit modprobing:
-+	 * "ifconfig /usbserial up" tries to modprobe netdev-/usbserial.
-+	 */
-+	if (strchr(name, '/'))
-+		bb_error_msg_and_die("malformed module name '%s'", name);
-+
- 	m = get_or_add_modentry(name);
- 	if (!(option_mask32 & (OPT_REMOVE | OPT_SHOW_DEPS))
- 	 && (m->flags & MODULE_FLAG_LOADED)
diff --git a/meta/recipes-core/busybox/busybox_1.23.2.bb b/meta/recipes-core/busybox/busybox_1.23.2.bb
index 0af292d..b1b9032 100644
--- a/meta/recipes-core/busybox/busybox_1.23.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.23.2.bb
@@ -30,7 +30,6 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://login-utilities.cfg \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
-           file://CVE-2014-9645_busybox_reject_module_names_with_slashes.patch \
 "
 
 SRC_URI[tarball.md5sum] = "7925683d7dd105aabe9b6b618d48cc73"
-- 
1.9.1


