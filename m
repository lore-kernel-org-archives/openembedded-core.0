Return-Path: <net147@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7074B6FA40
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 02:44:16 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id lj1so10644707pab.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Apr 2014 19:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=K8w9T69jWOxdo7E/Swiec1aajjf5SsXR8idRvYzn0FA=;
	b=gG2sQrkyfI1aR5YNeTylCXRBKPVcuo5e0Eb/5m1Exq7gscQUt8q5m6IwJ2OVJWP8Wy
	NWiJZfERBUhKGTVsky7YAbZvpnpgVR0skz5DPk3SaNBo7PdceKPnQ1h63ZgTaquqJvU3
	ZgMHWslGPGpE4pEIAAzFLyGqng1NUYoY6UC7rO/Bx2t+lGX1j+dRq/3IVdL0cwxzv6BV
	FSg8rpW42kpK1TlQKVaDirztobr3EvR2oBmBcKOmTD5hBVz9rtF/qtYNae3Z+41kzcIE
	iTwk9ZRcTm+kjzPfQp+By5bkzBKVEHuEbsuWgUh+dOZ0+iLMpIoL9uSHioU7qt8bPS+r
	26fA==
X-Received: by 10.66.122.72 with SMTP id lq8mr35164523pab.69.1396406658132;
	Tue, 01 Apr 2014 19:44:18 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id ff4sm2412603pad.24.2014.04.01.19.44.16
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 19:44:17 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Apr 2014 13:50:09 +1100
Message-Id: <1396407010-6283-2-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1396407010-6283-1-git-send-email-net147@gmail.com>
References: <1396407010-6283-1-git-send-email-net147@gmail.com>
Subject: [PATCH 2/3] dbus: backport memory leak patch for error when listing services
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
X-List-Received-Date: Wed, 02 Apr 2014 02:44:20 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/dbus/dbus.inc                    |  1 +
 ...y-freeing-if-error-during-listing-service.patch | 45 ++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus/fixed-memory-freeing-if-error-during-listing-service.patch

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 5d57ff4..5727ae7 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -16,6 +16,7 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://os-test.patch \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
            file://Set-correct-address-when-using-address-systemd.patch \
+           file://fixed-memory-freeing-if-error-during-listing-service.patch \
 "
 
 inherit useradd autotools pkgconfig gettext update-rc.d
diff --git a/meta/recipes-core/dbus/dbus/fixed-memory-freeing-if-error-during-listing-service.patch b/meta/recipes-core/dbus/dbus/fixed-memory-freeing-if-error-during-listing-service.patch
new file mode 100644
index 0000000..96290f4
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus/fixed-memory-freeing-if-error-during-listing-service.patch
@@ -0,0 +1,45 @@
+From 03aeaccbffa97c9237b57ca067e3da7388862129 Mon Sep 17 00:00:00 2001
+From: Radoslaw Pajak <r.pajak@samsung.com>
+Date: Fri, 8 Nov 2013 13:51:32 +0100
+Subject: [PATCH] fixed memory freeing if error during listing services
+
+Upstream-Status: Backport
+
+Signed-off-by: Radoslaw Pajak <r.pajak@samsung.com>
+Reviewed-by: Simon McVittie <simon.mcvittie@collabora.co.uk>
+Bug: https://bugs.freedesktop.org/show_bug.cgi?id=71526
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ bus/activation.c | 2 +-
+ bus/services.c   | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/bus/activation.c b/bus/activation.c
+index fcb7133..ea48a26 100644
+--- a/bus/activation.c
++++ b/bus/activation.c
+@@ -2179,7 +2179,7 @@ bus_activation_list_services (BusActivation *activation,
+ 
+  error:
+   for (j = 0; j < i; j++)
+-    dbus_free (retval[i]);
++    dbus_free (retval[j]);
+   dbus_free (retval);
+ 
+   return FALSE;
+diff --git a/bus/services.c b/bus/services.c
+index 6f380fa..01a720e 100644
+--- a/bus/services.c
++++ b/bus/services.c
+@@ -368,7 +368,7 @@ bus_registry_list_services (BusRegistry *registry,
+   
+  error:
+   for (j = 0; j < i; j++)
+-    dbus_free (retval[i]);
++    dbus_free (retval[j]);
+   dbus_free (retval);
+ 
+   return FALSE;
+-- 
+1.9.0
+
-- 
1.9.0


