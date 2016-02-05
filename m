Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6785F77294
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 21:35:07 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 66so5721322pfe.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 13:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ac+NwecQPhE6Z5fvpcobTAvcAKO1kYSgnjwD73Ktf/s=;
	b=0KwAYdnMphGgnx+8uJXU1LcB4ox10torXM2qihT4mQ6UXS/IwemBFreC6UOkAvLjhp
	XHQy2ESzAtLnUX5Wx+LUsXHs9d1Ext8oRmw3Lj4gKwcZd7zP9sk6JAM96Bcc/Gd3Y754
	63gHqEAhOQf1CoCJUng0bAU2evah4edVD5m5Sy6tnd87V+Cqkm5txKYK/d0+uW2ADDEh
	6HSrjz34ZbxKfXXgaXgCOkFu2Uo1PI/l6VqsYULRrdt2thgls7UKT7YpEXsX4v0mVx3r
	bicXjY3FIODjnFctr3KwOfKkE6tpx8o9c74JNy1gRJn6BxCzDk5eGvY4th86dpwrJ2Ak
	tZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ac+NwecQPhE6Z5fvpcobTAvcAKO1kYSgnjwD73Ktf/s=;
	b=MUW7wlS8OfoxeQFM3mFBw53I21bkfc6RPaKB8ohEMuVhXSScNkvAX0tUZ4SWFrNA7w
	9iIrd0rBnrq+ZbggI+q/R7VIKzqyYLYUpj+PMtvWy/ITJSFUMTzFA10goL6CaUFaYklt
	oEOJ05JtFWI31y9IdOA7T814ZldtoEA6G/SvrXw1Na4nX074S8AfSdhebqTjTUspaXeC
	Mx2CCejSlyniNlJYmX6lY/MFpIc/f2ztHsQ5iagV4s/B+K5+8D2l7D6AaVjsRZevGlPj
	zM7UF95+eMWP+yy7RBk3jnw5dY8RpzPfX4Pro6aKsuf6323GxJ3hnoxPdmGM+beqTKQN
	R71Q==
X-Gm-Message-State: AG10YOR18qlcj0CXJPsCzd/7+GoMA+X74eCuCpd6H2pw6W5SJzFmB+Uo6zfskGAT2mqx+A==
X-Received: by 10.98.68.86 with SMTP id r83mr23413001pfa.12.1454708108264;
	Fri, 05 Feb 2016 13:35:08 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id f4sm13813513pfj.0.2016.02.05.13.35.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 13:35:07 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Feb 2016 13:34:53 -0800
Message-Id: <1454708096-1570-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454708096-1570-1-git-send-email-armccurdy@gmail.com>
References: <1454708096-1570-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 2/5] gstreamer1.0-plugins-good_git: avoid including <sys/poll.h> directly
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
X-List-Received-Date: Fri, 05 Feb 2016 21:35:08 -0000

musl libc generates warnings if <sys/poll.h> is included directly.

The warnings only cause problems for the git versions (-Werror is
turned off for GStreamer stable releases).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../avoid-including-sys-poll.h-directly.patch      | 44 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-good_git.bb     |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/avoid-including-sys-poll.h-directly.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/avoid-including-sys-poll.h-directly.patch
new file mode 100644
index 0000000..c7f3630
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/avoid-including-sys-poll.h-directly.patch
@@ -0,0 +1,44 @@
+From 4bfe2c8570a4a7080ec662504882969054d8a072 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Wed, 3 Feb 2016 18:12:38 -0800
+Subject: [PATCH] avoid including <sys/poll.h> directly
+
+musl libc generates warnings if <sys/poll.h> is included directly.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ ext/raw1394/gstdv1394src.c  | 2 +-
+ ext/raw1394/gsthdv1394src.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ext/raw1394/gstdv1394src.c b/ext/raw1394/gstdv1394src.c
+index dbc7607..3c42b41 100644
+--- a/ext/raw1394/gstdv1394src.c
++++ b/ext/raw1394/gstdv1394src.c
+@@ -37,7 +37,7 @@
+ #include "config.h"
+ #endif
+ #include <unistd.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/socket.h>
+ #include <errno.h>
+ #include <fcntl.h>
+diff --git a/ext/raw1394/gsthdv1394src.c b/ext/raw1394/gsthdv1394src.c
+index 0b07a37..9785a15 100644
+--- a/ext/raw1394/gsthdv1394src.c
++++ b/ext/raw1394/gsthdv1394src.c
+@@ -36,7 +36,7 @@
+ #include "config.h"
+ #endif
+ #include <unistd.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/socket.h>
+ #include <errno.h>
+ #include <fcntl.h>
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
index 5f36f49..915be73 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
@@ -10,6 +10,7 @@ SRC_URI = " \
     git://anongit.freedesktop.org/gstreamer/gst-plugins-good;name=base \
     git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common \
     file://fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch \
+    file://avoid-including-sys-poll.h-directly.patch \
 "
 
 PV = "1.7.1+git${SRCPV}"
-- 
1.9.1


