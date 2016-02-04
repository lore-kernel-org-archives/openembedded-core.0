Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0E07977315
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 23:04:31 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id o185so57356015pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Feb 2016 15:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=B4lcP23k/2wlGKS5KTVvgdb3CmZD63VD6NuHnS/zI/s=;
	b=zmcz9mt8v41WIcRuP8iz196Dv+Cn3H9k/YuMeeukal3fKX4bO0DH2lfhNIUadlT+JE
	jJAHp+d/jtP4WInXZX68RRuM0CCKF2jlEbc3Hfz7rr/7U1T5IRzm9aPRpk9kfn0FjQ7U
	KxNwAs4Ip9Dmy3a9m3k1EQI3YELiQZ5xiH7Kh2ec4kSz/FIWzZkQqVXgnlvl8G8aFuHr
	NxFqr4Sb8VLs70InECqsjX7nf7RbLEo3hVye+q9+F17hWdSI5nMo5s5+oaUwsLtR2WQg
	k5GU96GSeAGX3NLCDXqyB+oV2jFOnZ9p1CXpyaWaNsjf7uDh2AnL0aNlDmzW6HUD0hLg
	5NYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=B4lcP23k/2wlGKS5KTVvgdb3CmZD63VD6NuHnS/zI/s=;
	b=c6CtXfB9lXK3GMqVtS32NF7Vqk3+PpgOW3RD3ivLQIXBhxye6ZnII+MJgCPk/gLZU/
	//IXIcV62Yg+T60o0vx+hUiVEwlemkDawHBlru0eOfNaxLJBv6KA75aNBcsJpH0XWoLt
	5WFIgU2ir2Zh1+OGBC813WXfC/avKLjCtcatI2Bs2TOrrPbtC8e5bDN7kYK0VOa6Ybjx
	Pg9Rqw/L5GrUITH6SyyhBuU/y9TiHlZttrNivpn8O2gJ3/2wpMG+pDjwcSYNGzeUoHq4
	C7+fvLlfd8SBQgBHKFxG1VWoCl2XH2xYeH4CTIEi//ST2/+hZAT4ci+WYqtjxyyWo8J+
	ZAaw==
X-Gm-Message-State: AG10YOS1DWBPm8w1mwVjfUy/CzvYUkxOzwyvzmmRAxTQ4o4f+5uC30yeQCwUMnvcTPJKuw==
X-Received: by 10.98.33.77 with SMTP id h74mr14977680pfh.157.1454627072120;
	Thu, 04 Feb 2016 15:04:32 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	76sm19535589pft.44.2016.02.04.15.04.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Feb 2016 15:04:31 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 15:04:16 -0800
Message-Id: <1454627058-26663-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454627058-26663-1-git-send-email-armccurdy@gmail.com>
References: <1454627058-26663-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/5] gstreamer1.0-plugins-bad_git: avoid including <sys/poll.h> directly
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
X-List-Received-Date: Thu, 04 Feb 2016 23:04:32 -0000

musl libc generates warnings if <sys/poll.h> is included directly.

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


