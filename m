Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 301E772A85
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 19:43:38 +0000 (UTC)
Received: by iecrt8 with SMTP id rt8so51091773iec.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 12:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6Gf89aRT4+QK5c51p0Db19WMgJ3bTMYiQpLWmiy+oAw=;
	b=y5v+up7zf38dG0t0122YZYDxcX8Ddi2SjW8E4rpcwQPW1xm58tycLlrC1a1rLvAoza
	w2isinzUPfaxeV/pGICz6dZ4A1q5ZqdQPoikaGX9WkI7cnOU7QaWxK07r0dUZtgQYFQX
	BPURZPz3vZc2jhHOgblw5mm/az7+wWem2wCjowxQakyYoED6i7KKPXfexMcxlHe8CErW
	Z4OXpmGIOrGFj+WiqF8l09+6Yjq18fLDPEzfHjiuehDe6HfaSLQKwXx56YlneGJJZERI
	OPspwWD8yl/tRWdA5bxCFE6ZreZKYgczvnZECJTmPRXB88W44IDUu2Fn5UeG72+mhHVw
	bpsA==
X-Received: by 10.43.60.76 with SMTP id wr12mr5401748icb.83.1430336619392;
	Wed, 29 Apr 2015 12:43:39 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id 71sm22506ioe.16.2015.04.29.12.43.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Apr 2015 12:43:38 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Apr 2015 12:43:27 -0700
Message-Id: <1430336607-19925-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [fido][PATCH] busybox: remove CVE-2014-9645 patch (already upstream in 1.23.x)
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
X-List-Received-Date: Wed, 29 Apr 2015 19:43:42 -0000

The CVE-2014-9645 fix was merged in Busybox prior to the 1.23.0
release [1]. The fix was then reworked in Busybox 1.23.1, in such
a way that the original change was no longer required [2].

Although oe-core's CVE-2014-9645 patch still applies cleanly to
Busybox 1.23.1 and 1.23.2, applying it partially reverts the second
version of the upstream fix.

  [1] http://git.busybox.net/busybox/commit/modutils/modprobe.c?h=1_23_stable&id=4e314faa0aecb66717418e9a47a4451aec59262b
  [2] http://git.busybox.net/busybox/commit/modutils/modprobe.c?h=1_23_stable&id=1ecfe811fe2f70380170ef7d820e8150054e88ca

This is a fido (busybox 1.23.1) backport of the fix already in
oe-core master (busybox 1.23.2):

  http://git.openembedded.org/openembedded-core/commit/?id=a753d3d8884b96baad5ed1a03335a81586420b86

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ..._busybox_reject_module_names_with_slashes.patch | 41 ----------------------
 meta/recipes-core/busybox/busybox_1.23.1.bb        |  1 -
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
diff --git a/meta/recipes-core/busybox/busybox_1.23.1.bb b/meta/recipes-core/busybox/busybox_1.23.1.bb
index 1742390..7c3ed84 100644
--- a/meta/recipes-core/busybox/busybox_1.23.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.23.1.bb
@@ -30,7 +30,6 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://login-utilities.cfg \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
-           file://CVE-2014-9645_busybox_reject_module_names_with_slashes.patch \
 "
 
 SRC_URI[tarball.md5sum] = "5c94d6301a964cd91619bd4d74605245"
-- 
1.9.1


