Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8092F73192
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 23:52:32 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id p187so125048933qkd.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 15:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=R0n7bGzKsVviigxugIaDdruYwWFe6WgHFJohCHdBMYc=;
	b=k/Ir0J6/7uSD0OwKjjcmR/WqH2RCoT0kTa1d5f7Q9O76hDrsse3xZpwDh2SVffHsHB
	FZCouC69uc3xXQBHDa7WfZ05+XdRKjLwMwuQslEJbdUmCFfXHMNgn4THgYigYr85ekb5
	WuJpKXmEdTtcNSrtCxpooL6sZlx4rKBBF4Z16c6Zj+fwerB0vHLWD2PZD1NDRC+6PkqV
	FLJB9jCvezl2/07Jx9Kqw0z43PZYEZCSqKjtLPsLpjnYrUcu2Np9Xt//ApsH06u9Vy8T
	j645+pmQo1+zSP+BHvjmPjLCe2ouGCFCllWhm+DPqJE63PBAXNVxbLaO/kXrfA+uJtYz
	2kdg==
X-Received: by 10.55.74.141 with SMTP id x135mr15214225qka.20.1450569152605;
	Sat, 19 Dec 2015 15:52:32 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id c2sm9785372qkb.41.2015.12.19.15.52.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 Dec 2015 15:52:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Dec 2015 23:52:11 +0000
Message-Id: <f4988c6fbbbe8801912ef6c904e704a56f172cf2.1450568936.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <81170e1970685f34735007c496ce175279d46304.1450568936.git.raj.khem@gmail.com>
References: <81170e1970685f34735007c496ce175279d46304.1450568936.git.raj.khem@gmail.com>
In-Reply-To: <cover.1450568936.git.raj.khem@gmail.com>
References: <cover.1450568936.git.raj.khem@gmail.com>
Subject: [PATCH 02/17] dhcp: Include sys/types.h for u_int* defs
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
X-List-Received-Date: Sat, 19 Dec 2015 23:52:32 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../dhcp/0001-include-missing-sys-types.h.patch    | 56 ++++++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.3.2.bb       |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0001-include-missing-sys-types.h.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp/0001-include-missing-sys-types.h.patch b/meta/recipes-connectivity/dhcp/dhcp/0001-include-missing-sys-types.h.patch
new file mode 100644
index 0000000..6d40290
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/0001-include-missing-sys-types.h.patch
@@ -0,0 +1,56 @@
+From 971491b6d7ab47d2f92f34269a129d0347fba15a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 14 Sep 2015 23:51:38 +0000
+Subject: [PATCH] include missing sys/types.h
+
+Code uses plain typedefs defines in this header but does not include it
+Fixes
+
+error: unknown type name 'u_int16_t'; did you mean 'uint16_t'?
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ dst/dst_api.c     | 1 +
+ dst/dst_support.c | 1 +
+ dst/hmac_link.c   | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/dst/dst_api.c b/dst/dst_api.c
+index a77abd2..7885538 100644
+--- a/dst/dst_api.c
++++ b/dst/dst_api.c
+@@ -49,6 +49,7 @@
+ #include <sys/param.h>
+ #include <sys/stat.h>
+ #include <sys/socket.h>
++#include <sys/types.h>
+ #include <netinet/in.h>
+ 
+ #include "cdefs.h"
+diff --git a/dst/dst_support.c b/dst/dst_support.c
+index 8e08a0c..f353ec6 100644
+--- a/dst/dst_support.c
++++ b/dst/dst_support.c
+@@ -25,6 +25,7 @@
+ #include <sys/stat.h>
+ #include <netinet/in.h>
+ #include <sys/socket.h>
++#include <sys/types.h>
+ 
+ #include "cdefs.h"
+ #include "osdep.h"
+diff --git a/dst/hmac_link.c b/dst/hmac_link.c
+index b812c1c..a7de622 100644
+--- a/dst/hmac_link.c
++++ b/dst/hmac_link.c
+@@ -31,6 +31,7 @@
+ #include <sys/time.h>
+ #include <netinet/in.h>
+ #include <sys/socket.h>
++#include <sys/types.h>
+ 
+ #include "cdefs.h"
+ #include "osdep.h"
+-- 
+2.5.2
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.3.2.bb b/meta/recipes-connectivity/dhcp/dhcp_4.3.2.bb
index b4a05fc..436a32e 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.3.2.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.3.2.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
             file://fixsepbuild.patch \
             file://dhclient-script-drop-resolv.conf.dhclient.patch \
             file://replace-ifconfig-route.patch \
+            file://0001-include-missing-sys-types.h.patch \
            "
 
 SRC_URI[md5sum] = "5a284875dd2c12ddd388416d69156a67"
-- 
2.6.4


