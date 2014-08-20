Return-Path: <paul.betafive@gmail.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id D3F7662252
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Aug 2014 15:15:18 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id v6so6902779lbi.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Aug 2014 08:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=knn/LHgkY+FbJ8OsvRUHY91/ScqZq1GXnUqBxSoj0n0=;
	b=FEKsiwt7/M56FP5u7pgaGPZyKzwB+yih1nfKb9htXM2gBMCZ7ngFz7XMjjYzf/r9ko
	c9gn7BrkSVx0iLAVMXPddJaQmFAJHRUSd9Qb83OUwIf1Y9ugQl9iqQWxiOL2s6akyBXO
	Fn2H9nc9k5nkz+1v8dK73fE9Fpw6X5fmrUlZJI1IADMxigeIC/mZPjYO9IeqbIYJg6dO
	VwVzGMnhQPnQl3fGuV9h+tKPgKKg21rCWDrLfUYWIxCo3091NOh8WRzXNAamaAvutDrB
	oJAgck7YtV+GyBq2CPZc8VRuRej5U3FaHv53F+EsY1ZxyhR3Ag+y9pH/kJ3hibiq1WEb
	0G7w==
X-Received: by 10.112.25.102 with SMTP id b6mr40660798lbg.17.1408547719216;
	Wed, 20 Aug 2014 08:15:19 -0700 (PDT)
Received: from localhost.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id o3sm37498776lbh.24.2014.08.20.08.15.17
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Aug 2014 08:15:18 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Aug 2014 15:15:12 +0000
Message-Id: <1408547712-29911-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] mc: Fix musl build failure
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
X-List-Received-Date: Wed, 20 Aug 2014 15:15:25 -0000

The CTRL macro just needs to be defined.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-extended/mc/mc/mc-CTRL.patch | 31 +++++++++++++++++++++++++++++++
 meta/recipes-extended/mc/mc_4.7.5.2.bb    |  4 +++-
 meta/recipes-extended/mc/mc_4.8.12.bb     |  4 +++-
 3 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/mc/mc/mc-CTRL.patch

diff --git a/meta/recipes-extended/mc/mc/mc-CTRL.patch b/meta/recipes-extended/mc/mc/mc-CTRL.patch
new file mode 100644
index 0000000..d532bde
--- /dev/null
+++ b/meta/recipes-extended/mc/mc/mc-CTRL.patch
@@ -0,0 +1,31 @@
+Fix build with musl by ensuring CTRL is defined.
+
+musl does not define CTRL in <termios.h>, we could include <sys/ttydefaults.h>
+explicitly but it's easier just to ensure CTRL is defined.
+
+This patch is taken from Sabotage Linux, the license statement for patches and
+build scripts in Sabotage Linux says:
+
+    To the extent possible under law, Christian Neukirchen has waived
+    all copyright and related or neighboring rights to this work.
+
+    http://creativecommons.org/publicdomain/zero/1.0/
+
+Therefore this should be good to include in OpenEmbedded.
+
+Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
+
+Upstream-status: Pending
+
+diff -u mc-4.8.1.7.org/lib/tty/tty-ncurses.c mc-4.8.1.7/lib/tty/tty-ncurses.c
+--- mc-4.8.1.7.org/lib/tty/tty-ncurses.c
++++ mc-4.8.1.7/lib/tty/tty-ncurses.c
+@@ -65,7 +65,7 @@
+ 
+ /*** file scope macro definitions ****************************************************************/
+ 
+-#if defined(_AIX) && !defined(CTRL)
++#if !defined(CTRL)
+ #define CTRL(x) ((x) & 0x1f)
+ #endif
+ 
diff --git a/meta/recipes-extended/mc/mc_4.7.5.2.bb b/meta/recipes-extended/mc/mc_4.7.5.2.bb
index 0e4434c..b47eb02 100644
--- a/meta/recipes-extended/mc/mc_4.7.5.2.bb
+++ b/meta/recipes-extended/mc/mc_4.7.5.2.bb
@@ -8,7 +8,9 @@ RDEPENDS_${PN} = "ncurses-terminfo"
 
 PR = "r3"
 
-SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2"
+SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
+           file://mc-CTRL.patch \
+           "
 
 SRC_URI[md5sum] = "bdae966244496cd4f6d282d80c9cf3c6"
 SRC_URI[sha256sum] = "a68338862bb30017eb65ed569a58e80ab66ae8cef11c886440c9e9f4d1efc6ab"
diff --git a/meta/recipes-extended/mc/mc_4.8.12.bb b/meta/recipes-extended/mc/mc_4.8.12.bb
index b897193..bc462e3 100644
--- a/meta/recipes-extended/mc/mc_4.8.12.bb
+++ b/meta/recipes-extended/mc/mc_4.8.12.bb
@@ -6,7 +6,9 @@ SECTION = "console/utils"
 DEPENDS = "ncurses glib-2.0"
 RDEPENDS_${PN} = "ncurses-terminfo"
 
-SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2"
+SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
+           file://mc-CTRL.patch \
+           "
 
 SRC_URI[md5sum] = "a64c426364bfaee56b628f6c0738aade"
 SRC_URI[sha256sum] = "1054fcc27a488771cbe5b85d7c10135fa1cd1b7682a19930d44b51a023e39396"
-- 
2.0.4


