Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0557975C60
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:35 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id ho8so157839981pac.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:in-reply-to:references:content-type
	:content-transfer-encoding;
	bh=HYWgzrrPHtvKs0xmA0K5s3LsTtyNRqaYhB6qVvlzDjQ=;
	b=E2ynMv1/aRDb4YbDsTmFUPIhZ2C3USU9GbrNkP5gacU5lKaHwPTLSjKZpabN37TcRE
	kosjrGqAeher2fs+UrBb2RZb1OsHbUojQ11lbtXTDVig0KGkMshbjwcNC+9dbropM3ZA
	/gJc6FyuXIw5NLBmgMMVf2tDc7k0VxmvQ6JEJ8ol0Q4WJkhf9qLwEkzXcYgyp1R+GW8/
	YFiVW4zS8kgE5ZlpyCYitLS2TNycMQuj+yIL65MFXw5UfPJMsF4wyypJBnIQ6ujKouuw
	I/QTAdpKZpBwkdBKo1YmkK5iqk1tAZbNqLJ/E5T9xU5bjQR7Qbvb84glE0RczWOg4aJi
	8SDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:in-reply-to:references:content-type
	:content-transfer-encoding;
	bh=HYWgzrrPHtvKs0xmA0K5s3LsTtyNRqaYhB6qVvlzDjQ=;
	b=eo5UJNR6/Ol4+5LB95f3y1/qmawLm/PKxB69RODNalR6t8gOv/M9xzjQfcsw/YotHj
	pfVzMG/O3NcMzqvaxlUxeU5zqIgT7PR34f0ZhTDZ87tuf8cp3wUMMK5gHbynpCp3xlT2
	IsI6HJcQccJjw70xtv9n2w3lF4tuAMPnxnoPlPXQxRVWsEFv4Gj1EICIrdjDuOUsxL+C
	95rVc7KWaRhTWAAbRlX78lptwdRgzo4kCPPsGAsVoTy6Jfr00F82WFpkkW3A9H3oDq+m
	GzxPPYwj8ipTybkBG3dZ4DJSopuy+MQr4R6NWLZB3kRB+eKSdnuCysWWOt88b1q010aC
	wq8g==
X-Gm-Message-State: ALoCoQljQFNXU6uzkV2Y61eD3EZPo6fTfzCmvjdNO4zjOFCR43+mPc8GHe52PVkLwO+mGjfgusO90f+Y8z3qdJDJ+YwJk/5OhA==
X-Received: by 10.66.156.134 with SMTP id we6mr28375784pab.92.1453030656623;
	Sun, 17 Jan 2016 03:37:36 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:13 -0800
Message-Id: <9b34b0ba6011cbc872d1bfe815320a4cd1054851.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 40/73] iproute2: Fix build with musl
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:36 -0000
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


