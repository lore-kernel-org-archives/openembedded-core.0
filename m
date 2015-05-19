Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id A01876ABB3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 19:45:15 +0000 (UTC)
Received: by wgbgq6 with SMTP id gq6so29775094wgb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 12:45:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=VFV2PLkzeVlYYpZ9idXJ0Rvrtreltt8HzQNX5nwg/qc=;
	b=B0/mg8955l/6sfy/FiKeucyoqZKjHBxzS/3PbXrQT2LbBLio6/APb8jsElonx/SKq+
	og5ccyJPG8pKHvAlAtG/niUfNb45QrWazWtX67KQlwVocJ4DbGOoxK3ImFYJNj+SoJJn
	9ZmdbTp2seJLNkJNoggvyB8opPNtr8Wg/idsvRQQWnfN0PXEqw79pynvvY8Lzc9BXjP6
	kFXPCnipNnx/GG3y7P8XLHbDvKT+g7S/deDTC4ozE4CdiOChfpURNvXwoW3RaiC04SRC
	TLvhasaMG5fujaN0GYglO8gOr3XNr9ePeoKnBCARqvCW/Imm3vDPJ4V2GHFLqXS1SSN0
	spPg==
X-Gm-Message-State: ALoCoQkoi8jkg6JtIaOej5cbWVYkFZiY9nkv8wkv9k/dRG/Yoy5jbi3U0DlcivWlHG14A674rZSx
X-Received: by 10.194.176.225 with SMTP id cl1mr57119715wjc.45.1432064716585; 
	Tue, 19 May 2015 12:45:16 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id 16sm23206587wjs.41.2015.05.19.12.45.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 May 2015 12:45:15 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 May 2015 20:40:57 +0100
Message-Id: <1432064457-15895-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] midori: fix build with GLib 2.44
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
X-List-Received-Date: Tue, 19 May 2015 19:45:18 -0000

GLib 2.44 introduced a GListStore type which is ambiguous with GtkListStore when
using wildcard using statements.  Use the full type name to fix builds.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/midori/midori/liststore.patch | 29 +++++++++++++++++++++++++
 meta/recipes-sato/midori/midori_0.5.8.bb        |  4 +++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-sato/midori/midori/liststore.patch

diff --git a/meta/recipes-sato/midori/midori/liststore.patch b/meta/recipes-sato/midori/midori/liststore.patch
new file mode 100644
index 0000000..4e5d666
--- /dev/null
+++ b/meta/recipes-sato/midori/midori/liststore.patch
@@ -0,0 +1,29 @@
+GLib 2.44 has a GListStore type which is GLib.ListStore in Vala, resulting in an ambigous type and compile failure.
+
+Fix by using the full type name.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/extensions/history-list.vala b/extensions/history-list.vala
+index 3a864b1..f309c0c 100644
+--- a/extensions/history-list.vala
++++ b/extensions/history-list.vala
+@@ -319,7 +319,7 @@ namespace HistoryList {
+         }
+ 
+         private void create_widgets () {
+-            ListStore model;
++            Gtk.ListStore model;
+             TreeIter iter;
+             TreeIter? active_iter = null;
+ 
+@@ -331,7 +331,7 @@ namespace HistoryList {
+ 
+             var tab_closing_behavior = this.hl_manager.get_integer ("TabClosingBehavior");
+ 
+-            model = new ListStore (2, typeof (string), typeof (int));
++            model = new Gtk.ListStore (2, typeof (string), typeof (int));
+ 
+             model.append (out iter);
+             model.set (iter, TabClosingBehaviorModel.TEXT, _("Do nothing"),
diff --git a/meta/recipes-sato/midori/midori_0.5.8.bb b/meta/recipes-sato/midori/midori_0.5.8.bb
index 5cc42cb..aa1b395 100644
--- a/meta/recipes-sato/midori/midori_0.5.8.bb
+++ b/meta/recipes-sato/midori/midori_0.5.8.bb
@@ -4,7 +4,9 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 DEPENDS = "webkit-gtk libsoup-2.4 openssl python-native python-docutils-native librsvg-native libnotify libxscrnsaver"
 
-SRC_URI = "https://launchpad.net/midori/trunk/0.5.8/+download/${BPN}-${PV}.tar.bz2;subdir=${BPN}-${PV}"
+SRC_URI = "https://launchpad.net/midori/trunk/0.5.8/+download/${BPN}-${PV}.tar.bz2;subdir=${BPN}-${PV} \
+           file://liststore.patch"
+
 SRC_URI[md5sum] = "b89e25e74199d705e74767499a415976"
 SRC_URI[sha256sum] = "af19135fd4c4b04345df4d3592e7939c20f9b40eaca24550e6cb619751aa9381"
 
-- 
2.1.4


