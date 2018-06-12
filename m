Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 9956778DC7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 11:26:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jun 2018 04:26:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,214,1526367600"; d="scan'208";a="58555113"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 12 Jun 2018 04:26:04 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 9D3DC5800AF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 04:26:02 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2018 14:18:14 +0300
Message-Id: <1528802295-11278-11-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1528802295-11278-1-git-send-email-maxin.john@intel.com>
References: <1528802295-11278-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 11/12] bluez5: upgrade to 5.50
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
X-List-Received-Date: Tue, 12 Jun 2018 11:26:03 -0000

Refresh the following patch:
        0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...-obexd-without-systemd-in-the-user-sessio.patch | 45 +++++++++-------------
 .../bluez5/{bluez5_5.49.bb => bluez5_5.50.bb}      |  4 +-
 2 files changed, 21 insertions(+), 28 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.49.bb => bluez5_5.50.bb} (91%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch
index 2fde7bc..da71409 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch
@@ -1,3 +1,4 @@
+From 99ccdbe155028c4c789803a429072675b87d0c3a Mon Sep 17 00:00:00 2001
 From: Giovanni Campagna <gcampagna-cNUdlRotFMnNLxjTenLetw@public.gmane.org>
 Date: Sat, 12 Oct 2013 17:45:25 +0200
 Subject: [PATCH] Allow using obexd without systemd in the user session
@@ -14,19 +15,18 @@ configuration. See thread:
 http://thread.gmane.org/gmane.linux.bluez.kernel/38725/focus=38843
 
 Signed-off-by: Javier Viguera <javier.viguera@digi.com>
+
 ---
- Makefile.obexd                      | 4 ++--
- obexd/src/org.bluez.obex.service    | 4 ----
- obexd/src/org.bluez.obex.service.in | 4 ++++
- 3 files changed, 6 insertions(+), 6 deletions(-)
- delete mode 100644 obexd/src/org.bluez.obex.service
- create mode 100644 obexd/src/org.bluez.obex.service.in
+ Makefile.obexd                                                  | 4 ++--
+ obexd/src/{org.bluez.obex.service => org.bluez.obex.service.in} | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+ rename obexd/src/{org.bluez.obex.service => org.bluez.obex.service.in} (76%)
 
 diff --git a/Makefile.obexd b/Makefile.obexd
-index 2e33cbc72f2b..d5d858c857b4 100644
+index c462692..0325f66 100644
 --- a/Makefile.obexd
 +++ b/Makefile.obexd
-@@ -2,12 +2,12 @@
+@@ -1,12 +1,12 @@
  if SYSTEMD
  systemduserunitdir = @SYSTEMD_USERUNITDIR@
  systemduserunit_DATA = obexd/src/obex.service
@@ -39,25 +39,18 @@ index 2e33cbc72f2b..d5d858c857b4 100644
 -EXTRA_DIST += obexd/src/obex.service.in obexd/src/org.bluez.obex.service
 +EXTRA_DIST += obexd/src/obex.service.in obexd/src/org.bluez.obex.service.in
  
- obex_plugindir = $(libdir)/obex/plugins
+ if OBEX
  
-diff --git a/obexd/src/org.bluez.obex.service b/obexd/src/org.bluez.obex.service
-deleted file mode 100644
-index a53808884554..000000000000
+diff --git a/obexd/src/org.bluez.obex.service b/obexd/src/org.bluez.obex.service.in
+similarity index 76%
+rename from obexd/src/org.bluez.obex.service
+rename to obexd/src/org.bluez.obex.service.in
+index a538088..9c815f2 100644
 --- a/obexd/src/org.bluez.obex.service
-+++ /dev/null
-@@ -1,4 +0,0 @@
--[D-BUS Service]
--Name=org.bluez.obex
--Exec=/bin/false
--SystemdService=dbus-org.bluez.obex.service
-diff --git a/obexd/src/org.bluez.obex.service.in b/obexd/src/org.bluez.obex.service.in
-new file mode 100644
-index 000000000000..9c815f246b77
---- /dev/null
 +++ b/obexd/src/org.bluez.obex.service.in
-@@ -0,0 +1,4 @@
-+[D-BUS Service]
-+Name=org.bluez.obex
+@@ -1,4 +1,4 @@
+ [D-BUS Service]
+ Name=org.bluez.obex
+-Exec=/bin/false
 +Exec=@libexecdir@/obexd
-+SystemdService=dbus-org.bluez.obex.service
+ SystemdService=dbus-org.bluez.obex.service
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.49.bb b/meta/recipes-connectivity/bluez5/bluez5_5.50.bb
similarity index 91%
rename from meta/recipes-connectivity/bluez5/bluez5_5.49.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.50.bb
index b79bda2..6627143 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.49.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.50.bb
@@ -2,8 +2,8 @@ require bluez5.inc
 
 REQUIRED_DISTRO_FEATURES = "bluez5"
 
-SRC_URI[md5sum] = "f210e84db707d66af3b889084a6f8bef"
-SRC_URI[sha256sum] = "33301d7a514c73d535ee1f91c2aed1af1f2e53efe11d3ac06bcf0d7abed2ce95"
+SRC_URI[md5sum] = "8e35c67c81a55d3ad4c9f22280dae178"
+SRC_URI[sha256sum] = "5ffcaae18bbb6155f1591be8c24898dc12f062075a40b538b745bfd477481911"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
-- 
2.4.0


