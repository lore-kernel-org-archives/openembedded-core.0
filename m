Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398BAC25B7C
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:04:19 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.5493.1716368649341137943
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=WqbeXW7p;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=PaJqT28kRfflpaUTFrMlSoAXkU+JIt/tchM+Ue7aNrc=; b=WqbeXW7pxEQuCf8B2Fr2nwvxdB
	zKpOJXgpVjVtpHOn03AKdveNJKuPFItgjUBEEwukgUMiMaTaHhrcM7tYHPlx8mmbxOpeJBc9tv8OA
	aICnzAOZIhaWlHpoxe5qp6EpgHv+SBKclBLVmSKifhguhtu5kEWopQeVbKTlqehfnosl06zT9VMQE
	IolzcUk514gz5UNjyAJS/WQC/krz9HKn4Ot2ibxtm0lcqWtmZGZtm2SXk/QI3uElU8t/Z2m6YAcrn
	fqQ7nw1y/zketzPKySHQo5UNHdMcL0oIGnz2BLhqhJ3z+V4fB6s/apnvSI2+l1CkSqMSRaZ0vpWjW
	qTwoiqmQ==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1s9htH-000MfC-7F; Wed, 22 May 2024 11:04:07 +0200
Received: from [185.17.218.86] (helo=zen..)
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1s9htG-0007QK-2i;
	Wed, 22 May 2024 11:04:07 +0200
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [PATCH 2/2] ofono: upgrade 2.4 -> 2.7
Date: Wed, 22 May 2024 11:03:50 +0200
Message-ID: <20240522090350.2513076-2-martin@geanix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240522090350.2513076-1-martin@geanix.com>
References: <20240522090350.2513076-1-martin@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27283/Wed May 22 10:29:37 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199693

Remove 0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch as
TEMP_FAILURE_RETRY usage has been removed in upstream commit 765c6655
("treewide: Use L_TFR macro").

Remove 0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch
as likely()/unlikely() has been removed in upstream commit dbbbebf9
("mbimmodem: Remove usage of likely and unlikely").

Remove the do_configure:prepend() that purges the bundled ell directory,
as it isn't needed when passing --enable-external-ell in EXTRA_OECONF.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---
 ...tional-TEMP_FAILURE_RETRY-macro-copy.patch | 36 -------------------
 ...ith-ell-0.39-by-restoring-unlikely-m.patch | 28 ---------------
 .../ofono/{ofono_2.4.bb => ofono_2.7.bb}      |  9 +----
 3 files changed, 1 insertion(+), 72 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono/0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch
 delete mode 100644 meta/recipes-connectivity/ofono/ofono/0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch
 rename meta/recipes-connectivity/ofono/{ofono_2.4.bb => ofono_2.7.bb} (82%)

diff --git a/meta/recipes-connectivity/ofono/ofono/0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch b/meta/recipes-connectivity/ofono/ofono/0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch
deleted file mode 100644
index 8a5a300adc..0000000000
--- a/meta/recipes-connectivity/ofono/ofono/0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 22b52db4842611ac31a356f023fc09595384e2ad Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 23 May 2019 18:11:22 -0700
-Subject: [PATCH] mbim: add an optional TEMP_FAILURE_RETRY macro copy
-
-Fixes build on musl which does not provide this macro
-
-Upstream-Status: Submitted [https://lists.ofono.org/pipermail/ofono/2019-May/019370.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- drivers/mbimmodem/mbim-private.h | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/drivers/mbimmodem/mbim-private.h b/drivers/mbimmodem/mbim-private.h
-index e159235..51693ea 100644
---- a/drivers/mbimmodem/mbim-private.h
-+++ b/drivers/mbimmodem/mbim-private.h
-@@ -21,6 +21,15 @@
- 
- #define align_len(len, boundary) (((len)+(boundary)-1) & ~((boundary)-1))
- 
-+#ifndef TEMP_FAILURE_RETRY
-+#define TEMP_FAILURE_RETRY(expression) ({     \
-+  __typeof(expression) __result;              \
-+  do {                                        \
-+    __result = (expression);                  \
-+  } while (__result == -1 && errno == EINTR); \
-+  __result; })
-+#endif
-+
- enum mbim_control_message {
- 	MBIM_OPEN_MSG = 0x1,
- 	MBIM_CLOSE_MSG = 0x2,
--- 
-2.21.0
-
diff --git a/meta/recipes-connectivity/ofono/ofono/0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch b/meta/recipes-connectivity/ofono/ofono/0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch
deleted file mode 100644
index 3655b3fd66..0000000000
--- a/meta/recipes-connectivity/ofono/ofono/0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 76e4054801350ebd4a44057379431a33d460ad0f Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Wed, 21 Apr 2021 11:01:34 +0000
-Subject: [PATCH] mbim: Fix build with ell-0.39 by restoring unlikely macro
- from ell/util.h
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- drivers/mbimmodem/mbim-private.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/drivers/mbimmodem/mbim-private.h b/drivers/mbimmodem/mbim-private.h
-index 51693eae..d917312c 100644
---- a/drivers/mbimmodem/mbim-private.h
-+++ b/drivers/mbimmodem/mbim-private.h
-@@ -30,6 +30,10 @@
-   __result; })
- #endif
- 
-+/* used to be part of ell/util.h before 0.39:
-+   https://git.kernel.org/pub/scm/libs/ell/ell.git/commit/?id=2a682421b06e41c45098217a686157f576847021 */
-+#define unlikely(x) __builtin_expect(!!(x), 0)
-+
- enum mbim_control_message {
- 	MBIM_OPEN_MSG = 0x1,
- 	MBIM_CLOSE_MSG = 0x2,
diff --git a/meta/recipes-connectivity/ofono/ofono_2.4.bb b/meta/recipes-connectivity/ofono/ofono_2.7.bb
similarity index 82%
rename from meta/recipes-connectivity/ofono/ofono_2.4.bb
rename to meta/recipes-connectivity/ofono/ofono_2.7.bb
index 5e1e5f3b6a..bc1f3efd04 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.4.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.7.bb
@@ -10,10 +10,8 @@ DEPENDS = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
 SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
     file://ofono \
-    file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch \
-    file://0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch \
 "
-SRC_URI[sha256sum] = "93580adc1afd1890dc516efb069de0c5cdfef014415256ddfb28ab172df2d11d"
+SRC_URI[sha256sum] = "dabf6ef06b94beaad65253200abe3887046a4e722f4fe373c4264f357ae47ad3"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
@@ -30,11 +28,6 @@ PACKAGECONFIG[bluez] = "--enable-bluetooth, --disable-bluetooth, bluez5"
 
 EXTRA_OECONF += "--enable-test --enable-external-ell"
 
-do_configure:prepend() {
-    bbnote "Removing bundled ell from ${S}/ell to prevent including it"
-    rm -rf ${S}/ell
-}
-
 do_install:append() {
     install -d ${D}${sysconfdir}/init.d/
     install -m 0755 ${UNPACKDIR}/ofono ${D}${sysconfdir}/init.d/ofono
-- 
2.44.0


