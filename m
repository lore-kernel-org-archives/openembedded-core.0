Return-Path: <amery@hanoverdisplays.com>
Received: from mail.hanoverdisplays.com (mail.hanoverdisplays.com [62.7.92.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3EE6A72F24
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Aug 2017 22:42:43 +0000 (UTC)
Received: from localhost (192.168.0.21) by mail.hanoverdisplays.com
	(192.168.0.31) with Microsoft SMTP Server (TLS) id 14.3.319.2;
	Thu, 3 Aug 2017 23:37:37 +0100
From: Alejandro Mery <amery@hanoverdisplays.com>
To: <openembedded-core@lists.openembedded.org>, Armin Kuster
	<akuster808@gmail.com>
Date: Thu, 3 Aug 2017 23:37:02 +0100
Message-ID: <20170803223702.83936-2-amery@hanoverdisplays.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170803223702.83936-1-amery@hanoverdisplays.com>
References: <20170803223702.83936-1-amery@hanoverdisplays.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.0.21]
X-GFI-SMTP-Submission: 1
X-GFI-SMTP-HelloDomain: localhost
X-GFI-SMTP-RemoteIP: 192.168.0.21
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com>
Subject: [poky][pyro][PATCH 1/1] linux-libc-headers: fix duplicate IFF_LOWER_UP DORMANT ECHO on musl
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
X-List-Received-Date: Thu, 03 Aug 2017 22:42:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

musl _does_ define IFF_LOWER_UP DORMANT ECHO so we should
prevent redefinition of these when on musl.

As per the included patch, this can be triggered by
(from connman 6to4.c):
    include <errno.h>
    include <stdio.h>
    include <stdlib.h>
    include <string.h>
    include <sys/socket.h>
    include <netinet/in.h>
    include <arpa/inet.h>
    include <net/if.h>
    include <linux/ip.h>
    include <linux/if_tunnel.h>
    include <linux/netlink.h>
    include <linux/rtnetlink.h>
    include <sys/ioctl.h>
    include <unistd.h>

In file included from ../git/src/6to4.c:34:0:
.../usr/include/linux/if.h:97:2: error: expected identifier before numeric constant
  IFF_LOWER_UP   = 1<<16, /* __volatile__ */
  ^

This is because at that time, IFF_LOWER_UP has been converted
to 0x10000 already:
enum net_device_flags {
 0x10000 = 1<<16,
 0x20000 = 1<<17,
 0x40000 = 1<<18,

};

Backport a patch that addresses this.

(From OE-Core rev: 24dc2200047bae5d32c168d2625d96ac08a93d3d)

Signed-off-by: André Draszik <adraszik@tycoint.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ....h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch | 46 ++++++++++++++++++++++
 .../linux-libc-headers/linux-libc-headers_4.10.bb  |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch
new file mode 100644
index 0000000000..bde2132ebf
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch
@@ -0,0 +1,46 @@
+Content-Type: text/plain; charset="utf-8"
+MIME-Version: 1.0
+Content-Transfer-Encoding: 7bit
+Subject: [v2,2/3] uapi glibc compat: fix build if libc defines IFF_ECHO
+From: Hauke Mehrtens <hauke@hauke-m.de>
+X-Patchwork-Id: 9686293
+Message-Id: <20170418210036.26039-3-hauke@hauke-m.de>
+To: davem@davemloft.net, netdev@vger.kernel.org
+Cc: linux-kernel@vger.kernel.org, jarod@redhat.com, jogo@openwrt.org,
+ david.heidelberger@ixit.cz, maillist-linux@barfooze.de,
+ mikko.rapeli@iki.fi, dwmw2@infradead.org, Hauke Mehrtens <hauke@hauke-m.de>
+Date: Tue, 18 Apr 2017 23:00:35 +0200
+
+musl 1.1.15 defines IFF_ECHO and the other net_device_flags options.
+When a user application includes linux/if.h and net/if.h the compile
+will fail.
+
+Activate __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO only when
+it is needed. This should also make this work in case glibc will add
+these defines.
+
+Acked-by: Mikko Rapeli <mikko.rapeli@iki.fi>
+Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
+---
+Upstream-Status: Submitted [https://patchwork.kernel.org/patch/9686293/]
+Signed-off-by: André Draszik <adraszik@tycoint.com>
+Acked-by: Stephane Ayotte <sayotte@tycoint.com>
+ include/uapi/linux/libc-compat.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/uapi/linux/libc-compat.h b/include/uapi/linux/libc-compat.h
+index 43a81136ea6e..ce2fa8a4ced6 100644
+--- a/include/uapi/linux/libc-compat.h
++++ b/include/uapi/linux/libc-compat.h
+@@ -64,9 +64,11 @@
+ /* Everything up to IFF_DYNAMIC, matches net/if.h until glibc 2.23 */
+ #define __UAPI_DEF_IF_NET_DEVICE_FLAGS 0
+ /* For the future if glibc adds IFF_LOWER_UP, IFF_DORMANT and IFF_ECHO */
++#ifndef IFF_ECHO
+ #ifndef __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO
+ #define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 1
+ #endif /* __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO */
++#endif /* IFF_ECHO */
+ 
+ #else /* _NET_IF_H */
+ 
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.10.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.10.bb
index 108446aa34..29262789a8 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.10.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.10.bb
@@ -4,6 +4,7 @@ SRC_URI_append_libc-musl = "\
     file://0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch \
     file://0002-libc-compat.h-prevent-redefinition-of-struct-ethhdr.patch \
     file://0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch \
+    file://0001-libc-compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch \
    "
 
 SRC_URI[md5sum] = "b5e7f6b9b2fe1b6cc7bc56a3a0bfc090"
-- 
2.13.0



