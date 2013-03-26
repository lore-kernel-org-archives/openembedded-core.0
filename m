Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKXNs-00076e-RG
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:10:11 +0100
Received: by mail-wi0-f177.google.com with SMTP id hm14so1173896wib.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 09:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=wq1aJGYJ1uedtWsJBjKqPKTFA75oShzJUPHkPnIT998=;
	b=ebPZ34zGugvzn6pxP2w+YzIa1RCabpFstdDWcMrfng/lmN75c+WIrgUGiSLEmDy4XA
	g6ZpwCJZNKM4KFPPNBfIy4mOx6D5+j6QIhvyZcCF79qTFAyYS0owUy+NXq+BrrV3UpyZ
	k20YkKadlc7eZgSZVJrXPm4DjErZUskt16pMWFW4tPn+lFYUQ14dtzSAgQY1q4UuD6VQ
	6mFRcjAqem6jsEjCV53ZvkgqH1i4vQYk5uGwA4krrjzyqJTARE68DxkVE74/EUl+HD/S
	/tOlqbQpEYmDeIQoMq4vyw1kMBLValH+8bQ7n4S1WgB0cAvDvgp8hfJ/IBudxtjPsXZO
	SXKw==
X-Received: by 10.180.182.36 with SMTP id eb4mr4533964wic.8.1364316785008;
	Tue, 26 Mar 2013 09:53:05 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bk1sm4522670wib.2.2013.03.26.09.53.03
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Mar 2013 09:53:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 16:50:00 +0000
Message-Id: <dc3f0c6ad60041592921b68ad17edba55b40f1d8.1364316411.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnuolb+WDmYrj2lNH8RcdbLkgBQtMvamnXQiGZsz2ruDg+nJVWzjmKnpeeuh33UT+N87JNq
Subject: [PATCH 02/24] busybox: add strictatime support to mount
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2013 17:10:18 -0000
X-List-Received-Date: Tue, 26 Mar 2013 17:10:18 -0000

systemd uses strictatime when mounting tmpfs.  Luckily this is already supported
upstream, so backport the patch from git.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../busybox/busybox-1.20.2/strict-atime.patch      |   49 ++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.20.2.bb        |    3 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/busybox/busybox-1.20.2/strict-atime.patch

diff --git a/meta/recipes-core/busybox/busybox-1.20.2/strict-atime.patch b/meta/recipes-core/busybox/busybox-1.20.2/strict-atime.patch
new file mode 100644
index 0000000..8696427
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox-1.20.2/strict-atime.patch
@@ -0,0 +1,49 @@
+Add support for the "strictatime" mount option.
+
+Upstream-Status: Backport [9ad8979ff15e1b894ee1f4bb6a2535a1a2c20d65]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+Index: busybox-1.20.2/util-linux/mount.c
+===================================================================
+--- busybox-1.20.2.orig/util-linux/mount.c	2012-07-02 15:08:25.000000000 +0100
++++ busybox-1.20.2/util-linux/mount.c	2013-03-22 15:37:31.340277463 +0000
+@@ -113,6 +113,12 @@
+ #ifndef MS_RELATIME
+ # define MS_RELATIME    (1 << 21)
+ #endif
++#ifndef MS_STRICTATIME
++# define MS_STRICTATIME (1 << 24)
++#endif
++
++/* Any ~MS_FOO value has this bit set: */
++#define BB_MS_INVERTED_VALUE (1u << 31)
+ 
+ #include "libbb.h"
+ #if ENABLE_FEATURE_MOUNT_LABEL
+@@ -239,6 +245,7 @@
+ 		/* "nomand"      */ ~MS_MANDLOCK,
+ 		/* "relatime"    */ MS_RELATIME,
+ 		/* "norelatime"  */ ~MS_RELATIME,
++		/* "strictatime" */ MS_STRICTATIME,
+ 		/* "loud"        */ ~MS_SILENT,
+ 		/* "rbind"       */ MS_BIND|MS_RECURSIVE,
+ 
+@@ -295,6 +302,7 @@
+ 		"nomand\0"
+ 		"relatime\0"
+ 		"norelatime\0"
++		"strictatime\0"
+ 		"loud\0"
+ 		"rbind\0"
+ 
+@@ -466,8 +474,8 @@
+ 		// Find this option in mount_options
+ 		for (i = 0; i < ARRAY_SIZE(mount_options); i++) {
+ 			if (strcasecmp(option_str, options) == 0) {
+-				long fl = mount_options[i];
+-				if (fl < 0)
++				unsigned long fl = mount_options[i];
++				if (fl & BB_MS_INVERTED_VALUE)
+ 					flags &= fl;
+ 				else
+ 					flags |= fl;
diff --git a/meta/recipes-core/busybox/busybox_1.20.2.bb b/meta/recipes-core/busybox/busybox_1.20.2.bb
index a02cd38..c09a492 100644
--- a/meta/recipes-core/busybox/busybox_1.20.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.20.2.bb
@@ -30,7 +30,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://stat-usr-bin.patch \
            file://busybox-syslog.service.in \
            file://busybox-klogd.service.in \
-           file://testsuite-du-du-k-works-fix-false-positive.patch"
+           file://testsuite-du-du-k-works-fix-false-positive.patch \
+           file://strict-atime.patch"
 
 SRC_URI[tarball.md5sum] = "e025414bc6cd79579cc7a32a45d3ae1c"
 SRC_URI[tarball.sha256sum] = "eb13ff01dae5618ead2ef6f92ba879e9e0390f9583bd545d8789d27cf39b6882"
-- 
1.7.10.4



