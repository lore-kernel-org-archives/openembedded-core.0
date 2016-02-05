Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8D7DC77081
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 21:35:08 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 71so664342pfv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 13:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VmHpxI7139LrSb24H7Jhrcc+QYe4OZ3ZiiTlL5MCp1g=;
	b=r5W3yNTicuFktuEDMbNGwSZ3aHRz197g4xysbfKo8xKggKMechhXVhAep+9w5LKBmf
	gI1HwJvLm8etgF7PSXYPgBRYO+sQUQ6SEvz0DIwGWNyR0E9H5ck9aUS0/GfSzrF79yzF
	ZLLygp+gMcyiPtr1ttMxi7+RlFJj10uNHNXUipeQtClh72cgkj40P3bMDXyPI3Q5Fx11
	RC5lE9A5HNDxYovBAIMYi9BbwcVMxjZCQptHIU/IjPrAL1duo8heN3p3Di80MKSg79BP
	dxDwVU9/e3ACwCFVH7SU9KbYuJ5i9Jc6L6iedGFmZB4Eyx/eshXfv5tKmu6Hcp6yLn3g
	64hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VmHpxI7139LrSb24H7Jhrcc+QYe4OZ3ZiiTlL5MCp1g=;
	b=e4LnbA6QLSw5u/LUK70WNY2i9mPgj87ACib8cLxyYST/aMpHx3Sx9wQEE8svAHvTHi
	kMe0Yt0kIeay3TkYU8X6bw/GyMC0yjEmFCKj3QvDfjMkyILVsFTT0261icD+3LoEoezv
	+N2EYj95m3Ktkmi8iVuWUS4zxJ2exDK9pTgBAfp+Mbh56nQ129t+GsAQekiT94LIqaYx
	M8pFK7uHvSDxIncY/Pjy+PIavjEP56tL1w3pEoLl2JhE1zfO6dwQaZRGVpRQwwUsq62c
	HHRQcPAU64Fd/Jtg/hV9/LXMO0ZEP3atSa098bfGmMQy/AVkt1qXk9PArxgITZI/P5vN
	o6Iw==
X-Gm-Message-State: AG10YOQ6G+Lb7tuObf5i2OgQeTPCYRBC8Uyy+mwzGSFQkJb27CSOpyF7TUyFXYB7nNQQsw==
X-Received: by 10.98.0.7 with SMTP id 7mr23221011pfa.5.1454708109998;
	Fri, 05 Feb 2016 13:35:09 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id f4sm13813513pfj.0.2016.02.05.13.35.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 13:35:09 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Feb 2016 13:34:54 -0800
Message-Id: <1454708096-1570-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454708096-1570-1-git-send-email-armccurdy@gmail.com>
References: <1454708096-1570-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 3/5] gstreamer1.0-plugins-bad_git: avoid including <sys/poll.h> directly
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
X-List-Received-Date: Fri, 05 Feb 2016 21:35:09 -0000

musl libc generates warnings if <sys/poll.h> is included directly.

The warnings only cause problems for the git versions (-Werror is
turned off for GStreamer stable releases).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../avoid-including-sys-poll.h-directly.patch      | 30 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_git.bb      |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/avoid-including-sys-poll.h-directly.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/avoid-including-sys-poll.h-directly.patch
new file mode 100644
index 0000000..357fd78
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/avoid-including-sys-poll.h-directly.patch
@@ -0,0 +1,30 @@
+From 72561a0fca562d03567ace7b4cfc94992cd6525c Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Wed, 3 Feb 2016 18:05:41 -0800
+Subject: [PATCH] avoid including <sys/poll.h> directly
+
+musl libc generates warnings if <sys/poll.h> is included directly.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ sys/dvb/gstdvbsrc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sys/dvb/gstdvbsrc.c b/sys/dvb/gstdvbsrc.c
+index b93255f..49f145a 100644
+--- a/sys/dvb/gstdvbsrc.c
++++ b/sys/dvb/gstdvbsrc.c
+@@ -93,7 +93,7 @@
+ #include <gst/gst.h>
+ #include <gst/glib-compat-private.h>
+ #include <sys/ioctl.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <fcntl.h>
+ #include <errno.h>
+ #include <stdio.h>
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
index 99690a3..0ebf622 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
@@ -12,6 +12,7 @@ SRC_URI = " \
     git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common \
     file://configure-allow-to-disable-libssh2.patch \
     file://fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch \
+    file://avoid-including-sys-poll.h-directly.patch \
 "
 
 PV = "1.7.1+git${SRCPV}"
-- 
1.9.1


