Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 807CD7017D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 07:37:19 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id b71so1170889lfg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 00:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=xlJxS7Nt6tnupZEesfDDswR8qvHGE6braXwx5qZTrKg=;
	b=BOvvNDbmBON04fP3Gvb0yiii3IYkYLLhkstchVtstnBsofjMokE1K1dbsLADsRe2kC
	3NudJ8gr3ZHTXunwC3q3nxy6BwJGVLNAxDouxjMJqsJA3hSmleDwuniHlN+BcndoUY/7
	nnbEpvHUkWGAo+1ZVnVHxs2rmtnMMvaO1Q7P8ykWAoctFFhn71mq3dHcezlATD2PuAG3
	C6qxJHCWKQQP/rF5DaX4S1HFtECGysyu/0dLnoquHuz+gAdr/GxrWx8adB1+eOH1H8//
	07pzcyiCB6utQW+slFTywt0dE81LCrffXddu3P/OWdQVpRNIkDi7Tq87+vTgttGVD4gW
	FYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xlJxS7Nt6tnupZEesfDDswR8qvHGE6braXwx5qZTrKg=;
	b=ZbB/nZHvPluDWqe9Ss+xc2JbrsU3q/Yer6Fa9Fr5rQimnsEFEQLVjFP2qEsaQWLgH+
	HJJnCesdUsxyyPkk7ritFdnmpB28dqg1oH/sHs6rU/vTn7eM2FwHiGXXiCb82yA5MWFk
	XJ+Cu6TiKqh3f+Z5iL/+Kzb2rQWUkM2gqys0UUOi+q03I9ISn1gf6hxCPZQMAdYF5FQL
	IEbsSopj87V+GnF+vy4jOTvxGhAWTzHQMW6i3Wf4184amRfjcIsGoUh542nXnrrZrwQl
	CavDRBsJS+cpEnflWake3l4L1ENee1hRoZH++6MqqX/KjtjE8+n7nBr75N5xRgYS4bnY
	ClQg==
X-Gm-Message-State: AE9vXwMk4wqnU4XZftnsF5Xpd90eobCpsXOg83sXIPKBqjrIYYo2mO8+4TKtj3bVNuruzg==
X-Received: by 10.46.1.5 with SMTP id 5mr12638188ljb.16.1474443440744;
	Wed, 21 Sep 2016 00:37:20 -0700 (PDT)
Received: from localhost.localdomain (m77-218-252-40.cust.tele2.se.
	[77.218.252.40]) by smtp.gmail.com with ESMTPSA id
	s187sm6512429lfd.3.2016.09.21.00.37.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Sep 2016 00:37:19 -0700 (PDT)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2016 09:37:23 +0200
Message-Id: <1474443443-10872-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] libnl: Fix build with musl
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
X-List-Received-Date: Wed, 21 Sep 2016 07:37:21 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

[YOCTO #10313]

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 .../libnl/libnl/0001-Fix-build-with-musl.patch     | 43 ++++++++++++++++++++++
 meta/recipes-support/libnl/libnl_3.2.28.bb         |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-support/libnl/libnl/0001-Fix-build-with-musl.patch

diff --git a/meta/recipes-support/libnl/libnl/0001-Fix-build-with-musl.patch b/meta/recipes-support/libnl/libnl/0001-Fix-build-with-musl.patch
new file mode 100644
index 0000000..8a2dad5
--- /dev/null
+++ b/meta/recipes-support/libnl/libnl/0001-Fix-build-with-musl.patch
@@ -0,0 +1,43 @@
+From 963d9818d13a025b857380c84d53b11c3aceff54 Mon Sep 17 00:00:00 2001
+From: Peter Liu <peter.x.liu@external.atlascopco.com>
+Date: Wed, 21 Sep 2016 09:07:12 +0200
+Subject: [PATCH] Fix build with musl
+
+Upstream-Status: Pending
+
+Due to both <netinet/in.h> and <linux/in6.h> being included, the
+in6_addr is being redefined: once from the C library headers and once
+from the kernel headers. This causes some build failures with for
+example the musl C library:
+| In file included from ../../libnl-3.2.28/include/linux-private/linux/if_bridge.h:18:0,
+|                  from ../../libnl-3.2.28/lib/route/link/bridge.c:26:
+| /mnt/ale-build/tmp/musl/sysroots/itmk2/usr/include/linux/in6.h:32:8: error: redefinition of 'struct in6_addr'
+|  struct in6_addr {
+|         ^~~~~~~~
+| In file included from /mnt/ale-build/tmp/musl/sysroots/itmk2/usr/include/arpa/inet.h:9:0,
+|                  from ../../libnl-3.2.28/include/netlink-private/netlink.h:33,
+|                  from ../../libnl-3.2.28/lib/route/link/bridge.c:20:
+| /mnt/ale-build/tmp/musl/sysroots/itmk2/usr/include/netinet/in.h:23:8: note: originally defined here
+
+In order to fix this, use just the C library header <netinet/in.h>.
+
+Signed-off-by: Peter Liu <peter.x.liu@external.atlascopco.com>
+---
+ include/linux-private/linux/if_bridge.h | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/include/linux-private/linux/if_bridge.h b/include/linux-private/linux/if_bridge.h
+index f24050b..8f7490c 100644
+--- a/include/linux-private/linux/if_bridge.h
++++ b/include/linux-private/linux/if_bridge.h
+@@ -15,7 +15,6 @@
+ 
+ #include <linux/types.h>
+ #include <linux/if_ether.h>
+-#include <linux/in6.h>
+ 
+ #define SYSFS_BRIDGE_ATTR	"bridge"
+ #define SYSFS_BRIDGE_FDB	"brforward"
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/libnl/libnl_3.2.28.bb b/meta/recipes-support/libnl/libnl_3.2.28.bb
index 26982f3..f8f3e53 100644
--- a/meta/recipes-support/libnl/libnl_3.2.28.bb
+++ b/meta/recipes-support/libnl/libnl_3.2.28.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://github.com/thom311/${BPN}/releases/download/${BPN}${@d.getVar
            file://0001-lib-add-utility-function-nl_strerror_l.patch \
            file://0002-lib-switch-to-using-strerror_l-instead-of-strerror_r.patch \
            file://0003-src-switch-to-using-strerror_l-instead-of-strerror_r.patch \
+           file://0001-Fix-build-with-musl.patch \
 "
 UPSTREAM_CHECK_URI = "https://github.com/thom311/${BPN}/releases"
 
-- 
1.9.1


