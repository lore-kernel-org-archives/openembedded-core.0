Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id B420E73D3A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 02:00:38 +0000 (UTC)
Received: by pabsx10 with SMTP id sx10so71226122pab.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 19:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=mz9kBP70YKLrrxlE8WHb2jHhhENXAz1rwyR8xETsD/E=;
	b=ZXM2HJBDVF99SWf94mMH2hAYwoKzmi8DEHKipDb9SFGD73iaUR4X7PHiRT55jzTszt
	gTmQ2FVK51Zx/gq3fEdmtTDa9SUb0V+IWbehIUutVJB/uobke3kRIc6ZjLID/9nj86c9
	HiFc6NYz+KqNmTvbvpgs3GHlKXmiXDHo48mp++aCaGJcVlW8eovZjUJzWDLVvONhAXNJ
	dEgTAhZpuAqPp3I2EoxP+CBGChkl5ARWX7/0g/l1SBZ+tWX5JBknuzbk0B1y6M5ujQVi
	rwcY6xM9BP4f02xaadT0t0imI+lxcFGloiZp6zfE9qs7sz0rbog1z6tp/YkyqkOnRQVj
	Yj3A==
X-Received: by 10.68.114.194 with SMTP id ji2mr52318527pbb.132.1429149639829; 
	Wed, 15 Apr 2015 19:00:39 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169]) by mx.google.com with ESMTPSA id
	nt15sm5371563pdb.14.2015.04.15.19.00.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Apr 2015 19:00:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Apr 2015 19:00:22 -0700
Message-Id: <ddca1087d411622d8b48c6b36139c2c6fe75f075.1429149397.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <0302d234e93ab28cac466dd5eb96deb9dca3bf41.1429149397.git.raj.khem@gmail.com>
References: <0302d234e93ab28cac466dd5eb96deb9dca3bf41.1429149397.git.raj.khem@gmail.com>
In-Reply-To: <cover.1429149397.git.raj.khem@gmail.com>
References: <cover.1429149397.git.raj.khem@gmail.com>
Subject: [PATCH 05/10] distcc:Include missing fcntl.h in zeroconf
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
X-List-Received-Date: Thu, 16 Apr 2015 02:00:40 -0000

This is exposed by musl

Change-Id: I39ea3a66135d33ed0a9abbd94d3c0f39120e3586
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/distcc/distcc_3.1.bb         |  1 +
 .../files/0001-zeroconf-Include-fcntl.h.patch      | 29 ++++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/distcc/files/0001-zeroconf-Include-fcntl.h.patch

diff --git a/meta/recipes-devtools/distcc/distcc_3.1.bb b/meta/recipes-devtools/distcc/distcc_3.1.bb
index ad0e94f..e4b9313 100644
--- a/meta/recipes-devtools/distcc/distcc_3.1.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.1.bb
@@ -19,6 +19,7 @@ RRECOMMENDS_${PN} = "avahi-daemon"
 
 SRC_URI = "http://distcc.googlecode.com/files/${BPN}-${PV}.tar.bz2 \
            file://separatebuilddir.patch \
+           file://0001-zeroconf-Include-fcntl.h.patch \
            file://default \
            file://distccmon-gnome.desktop \
            file://distcc \
diff --git a/meta/recipes-devtools/distcc/files/0001-zeroconf-Include-fcntl.h.patch b/meta/recipes-devtools/distcc/files/0001-zeroconf-Include-fcntl.h.patch
new file mode 100644
index 0000000..b17ec9c
--- /dev/null
+++ b/meta/recipes-devtools/distcc/files/0001-zeroconf-Include-fcntl.h.patch
@@ -0,0 +1,29 @@
+From 8331fc4759d809512f404e7a27f817ad6d616450 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Apr 2015 18:00:33 -0700
+Subject: [PATCH] zeroconf: Include fcntl.h
+
+We need it for getting deinitions for O_* e.g. O_CREAT
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/zeroconf.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/zeroconf.c b/src/zeroconf.c
+index 414ddc4..31bd33f 100644
+--- a/src/zeroconf.c
++++ b/src/zeroconf.c
+@@ -33,6 +33,7 @@
+ #include <unistd.h>
+ #include <stdlib.h>
+ #include <limits.h>
++#include <fcntl.h>
+ 
+ #include <avahi-common/domain.h>
+ #include <avahi-common/error.h>
+-- 
+2.1.4
+
-- 
2.1.4


