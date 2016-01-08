Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7ADF176FE2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:57 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id o11so348663641qge.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:in-reply-to:references:content-type
	:content-transfer-encoding;
	bh=HYWgzrrPHtvKs0xmA0K5s3LsTtyNRqaYhB6qVvlzDjQ=;
	b=lVi8R9JeusZbI1mR3hZsV9ZjB5bhHSxuWWWxpnc1Blr/MOaVMp61Bq1gD9z/EwKTP9
	AFnL0MtBfyV+tUoKp6FU03NF4nB0RutrBDp26Invme0KlUA6LN+dghJ+GLTpf3b8VjuL
	vgHF6Pot11HDmHhce7mCVPlZ7hENmxmZcq8iwRz4fgNv97zWVic4kpOovmofvs76zj0K
	aXiFVbu+lpozlrOCWyPILJjHfXuNNpYGVZMczr6gbnRZ5L6cgu4G7aARzc39kTLyRil0
	HnL9FxiZU22h604SfjZkZnwXVnCScPzQ/k1kALCoW8FHL00SoXbhScNjF2ZdhEe4kPaq
	TTKQ==
X-Received: by 10.140.238.88 with SMTP id j85mr142606372qhc.88.1452248397869; 
	Fri, 08 Jan 2016 02:19:57 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:19:13 +0000
Message-Id: <bfb8f8a878bf84371eda95fc8d868a7429ffb8af.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 45/53] iproute2: Fix build with musl
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../iproute2/iproute2/iproute2-4.3.0-musl.patch    | 97 ++++++++++++++++++++++
 .../iproute2/iproute2_4.3.0.bb                     |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/iproute2-4.3.0-musl.patch

diff --git a/meta/recipes-connectivity/iproute2/iproute2/iproute2-4.3.0-musl.patch b/meta/recipes-connectivity/iproute2/iproute2/iproute2-4.3.0-musl.patch
new file mode 100644
index 0000000..1b415a5
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2/iproute2-4.3.0-musl.patch
@@ -0,0 +1,97 @@
+From 48596709d8ab59727b79a5c6db33ebb251c36543 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 19 Nov 2015 17:44:25 +0100
+Subject: [PATCH] Avoid in6_addr redefinition
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Due to both <netinet/in.h> and <linux/in6.h> being included, the
+in6_addr is being redefined: once from the C library headers and once
+from the kernel headers. This causes some build failures with for
+example the musl C library:
+
+In file included from ../include/linux/xfrm.h:4:0,
+                 from xfrm.h:29,
+                 from ipxfrm.c:39:
+../include/linux/in6.h:32:8: error: redefinition of ‘struct in6_addr’
+ struct in6_addr {
+        ^
+In file included from .../output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/netdb.h:9:0,
+                 from ipxfrm.c:34:
+.../output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/netinet/in.h:24:8: note: originally defined here
+ struct in6_addr
+        ^
+
+In order to fix this, use just the C library header <netinet/in.h>.
+
+Original patch taken from
+http://git.alpinelinux.org/cgit/aports/tree/main/iproute2/musl-fixes.patch.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+Upstream-Status: Pending
+
+ include/libiptc/ipt_kernel_headers.h | 2 --
+ include/linux/if_bridge.h            | 1 -
+ include/linux/netfilter.h            | 2 --
+ include/linux/xfrm.h                 | 1 -
+ 4 files changed, 6 deletions(-)
+
+diff --git a/include/libiptc/ipt_kernel_headers.h b/include/libiptc/ipt_kernel_headers.h
+index 7e87828..9566be5 100644
+--- a/include/libiptc/ipt_kernel_headers.h
++++ b/include/libiptc/ipt_kernel_headers.h
+@@ -15,12 +15,10 @@
+ #else /* libc5 */
+ #include <sys/socket.h>
+ #include <linux/ip.h>
+-#include <linux/in.h>
+ #include <linux/if.h>
+ #include <linux/icmp.h>
+ #include <linux/tcp.h>
+ #include <linux/udp.h>
+ #include <linux/types.h>
+-#include <linux/in6.h>
+ #endif
+ #endif
+diff --git a/include/linux/if_bridge.h b/include/linux/if_bridge.h
+index ee197a3..f823aa4 100644
+--- a/include/linux/if_bridge.h
++++ b/include/linux/if_bridge.h
+@@ -15,7 +15,6 @@
+ 
+ #include <linux/types.h>
+ #include <linux/if_ether.h>
+-#include <linux/in6.h>
+ 
+ #define SYSFS_BRIDGE_ATTR	"bridge"
+ #define SYSFS_BRIDGE_FDB	"brforward"
+diff --git a/include/linux/netfilter.h b/include/linux/netfilter.h
+index b71b4c9..3e4e6ae 100644
+--- a/include/linux/netfilter.h
++++ b/include/linux/netfilter.h
+@@ -4,8 +4,6 @@
+ #include <linux/types.h>
+ 
+ #include <linux/sysctl.h>
+-#include <linux/in.h>
+-#include <linux/in6.h>
+ 
+ /* Responses from hook functions. */
+ #define NF_DROP 0
+diff --git a/include/linux/xfrm.h b/include/linux/xfrm.h
+index b8f5451..a9761a5 100644
+--- a/include/linux/xfrm.h
++++ b/include/linux/xfrm.h
+@@ -1,7 +1,6 @@
+ #ifndef _LINUX_XFRM_H
+ #define _LINUX_XFRM_H
+ 
+-#include <linux/in6.h>
+ #include <linux/types.h>
+ 
+ /* All of the structures in this file may not change size as they are
+-- 
+2.6.3
+
diff --git a/meta/recipes-connectivity/iproute2/iproute2_4.3.0.bb b/meta/recipes-connectivity/iproute2/iproute2_4.3.0.bb
index 0b3d896..60f0a8d 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_4.3.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_4.3.0.bb
@@ -3,6 +3,7 @@ require iproute2.inc
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://configure-cross.patch \
            file://0001-iproute2-de-bash-scripts.patch \
+           file://iproute2-4.3.0-musl.patch \
           "
 SRC_URI[md5sum] = "1a2bbb80cfc7ab3f3e987e18b3207c2f"
 SRC_URI[sha256sum] = "f03b1188dd6c039512424de82ff7a8f3b446680bd4e908ff42a7b9b137422995"
-- 
2.7.0


