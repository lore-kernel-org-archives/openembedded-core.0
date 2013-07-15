Return-Path: <morphis@gravedo.de>
Received: from gravedo.de (gravedo.de [85.214.79.159])
	by mail.openembedded.org (Postfix) with ESMTP id E0BC661663
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 17:34:02 +0000 (UTC)
Received: by gravedo.de (Postfix, from userid 5001)
	id 833243B3465A; Mon, 15 Jul 2013 19:34:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	URIBL_BLOCKED autolearn=ham version=3.3.1
Received: from localhost (dslb-088-070-152-175.pools.arcor-ip.net
	[88.70.152.175])
	by gravedo.de (Postfix) with ESMTPSA id 935C83B34553;
	Mon, 15 Jul 2013 19:33:59 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2013 17:33:54 +0000
Message-Id: <1373909634-31509-1-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH v2] wpa-supplicant: backport patch to fix dbus interface for autoscan functionality
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
X-List-Received-Date: Mon, 15 Jul 2013 17:34:03 -0000

See https://lists.connman.net/pipermail/connman/2013-July/014871.html for details about
the issue with connman and http://lists.shmoo.com/pipermail/hostap/2013-July/028167.html
about the upstream submission of the patch.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 .../wpa-supplicant/wpa-supplicant-2.0.inc          |  3 +-
 .../register-autoscan-correctly.patch              | 49 ++++++++++++++++++++++
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/register-autoscan-correctly.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
index 8d7233a..ce669a1 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
@@ -20,7 +20,8 @@ SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://wpa_supplicant.conf \
            file://wpa_supplicant.conf-sane \
            file://99_wpa_supplicant \
-           file://fix-libnl3-host-contamination.patch"
+           file://fix-libnl3-host-contamination.patch \
+           file://register-autoscan-correctly.patch"
 
 S = "${WORKDIR}/wpa_supplicant-${PV}"
 
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/register-autoscan-correctly.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/register-autoscan-correctly.patch
new file mode 100644
index 0000000..4881295
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/register-autoscan-correctly.patch
@@ -0,0 +1,49 @@
+From 199f871006f756911a844dfadbc6e8b98e1088ef Mon Sep 17 00:00:00 2001
+From: Tomasz Bursztyka <tomasz.bursztyka@linux.intel.com>
+Date: Mon, 1 Jul 2013 16:07:40 +0300
+Subject: [PATCH] dbus: Register the AutoScan method call at the right place
+
+Signed-hostap: Tomasz Bursztyka <tomasz.bursztyka@linux.intel.com>
+---
+ wpa_supplicant/dbus/dbus_new.c | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/wpa_supplicant/dbus/dbus_new.c b/wpa_supplicant/dbus/dbus_new.c
+index 8bc6618..d076d2d 100644
+--- a/wpa_supplicant/dbus/dbus_new.c
++++ b/wpa_supplicant/dbus/dbus_new.c
+@@ -1917,15 +1917,6 @@ static const struct wpa_dbus_method_desc wpas_dbus_global_methods[] = {
+ 		  END_ARGS
+ 	  }
+ 	},
+-#ifdef CONFIG_AUTOSCAN
+-	{ "AutoScan", WPAS_DBUS_NEW_IFACE_INTERFACE,
+-	  (WPADBusMethodHandler) &wpas_dbus_handler_autoscan,
+-	  {
+-		  { "arg", "s", ARG_IN },
+-		  END_ARGS
+-	  }
+-	},
+-#endif /* CONFIG_AUTOSCAN */
+ 	{ NULL, NULL, NULL, { END_ARGS } }
+ };
+ 
+@@ -2649,6 +2640,15 @@ static const struct wpa_dbus_method_desc wpas_dbus_interface_methods[] = {
+ 	  }
+ 	},
+ #endif /* CONFIG_AP */
++#ifdef CONFIG_AUTOSCAN
++	{ "AutoScan", WPAS_DBUS_NEW_IFACE_INTERFACE,
++	  (WPADBusMethodHandler) &wpas_dbus_handler_autoscan,
++	  {
++		  { "arg", "s", ARG_IN },
++		  END_ARGS
++	  }
++	},
++#endif /* CONFIG_AUTOSCAN */
+ 	{ NULL, NULL, NULL, { END_ARGS } }
+ };
+ 
+-- 
+1.8.1.2
+
-- 
1.8.1.2


