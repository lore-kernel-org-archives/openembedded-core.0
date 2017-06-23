Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7DBB477F69
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 11:42:14 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id k67so11873916wrc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 04:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Hj85tcvkXUAdmVdVARH8hY0oS/CC+nZQZ5Zn4e/MfRE=;
	b=qiAbK4O4tbsj6/grBPZHeu02YM/RwZVQafQefEyXWk6EiHKGWKnP+aozHUPTvziMPf
	VRKY0KY8rVIi3qI/pmaM3YHDJwOgvAqaqA8CCxZRJSqdCAaKIuRAaxKrWGKi7XujmWCU
	16ZAmsrykAAMv9MQz9ohT02TU5jvvJIkeI4taYrqhSMtl7vRJ1IHPzv79offoZvs4nDW
	XPK4NVWToNAP81QCMQzrue9n6emZok6XfeX3H/6SwNfCglZPjk65pMo8U2QrRw7rBJBI
	duj1zlO4afRNdExMnTtTwsw9CiBV3f4VcDg+MPbiNz/VQXAOEFSZIKwUbabxvZYP4y/8
	AhxA==
X-Gm-Message-State: AKS2vOwGcdEdksxP8R29JiAX3k/PFksJDywg5k7g0S+9y490ZX2w+3eg
	1ysStF3AANEhD0A2T9o=
X-Received: by 10.80.135.175 with SMTP id a44mr1532458eda.90.1498218135327;
	Fri, 23 Jun 2017 04:42:15 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id j40sm2102750ede.0.2017.06.23.04.42.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Jun 2017 04:42:14 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Jun 2017 12:42:13 +0100
Message-Id: <20170623114213.30682-1-git@andred.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170622151404.27496-1-git@andred.net>
References: <20170622151404.27496-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2] linux-libc-headers: fix duplicate IFF_LOWER_UP DORMANT ECHO on musl
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
X-List-Received-Date: Fri, 23 Jun 2017 11:42:16 -0000
Content-Type: text/plain; charset=UTF-8
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

Signed-off-by: André Draszik <adraszik@tycoint.com>
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
2.11.0


