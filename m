Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5F9877BD97
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jul 2019 23:21:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Jul 2019 16:21:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,320,1559545200"; d="scan'208";a="346424871"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga005.jf.intel.com with ESMTP; 28 Jul 2019 16:21:07 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jul 2019 07:20:55 +0800
Message-Id: <1564356060-13772-2-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564356060-13772-1-git-send-email-anuj.mittal@intel.com>
References: <1564356060-13772-1-git-send-email-anuj.mittal@intel.com>
Subject: [thud][PATCH 2/7] gstreamer1.0-plugins-base: fix CVE-2019-9928
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
X-List-Received-Date: Sun, 28 Jul 2019 23:21:07 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../gstreamer1.0-plugins-base/CVE-2019-9928.patch  | 33 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.14.4.bb  |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2019-9928.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2019-9928.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2019-9928.patch
new file mode 100644
index 0000000..0ad7245
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2019-9928.patch
@@ -0,0 +1,33 @@
+From f672277509705c4034bc92a141eefee4524d15aa Mon Sep 17 00:00:00 2001
+From: Tobias Ronge <tobiasr@axis.com>
+Date: Thu, 14 Mar 2019 10:12:27 +0100
+Subject: [PATCH] gstrtspconnection: Security loophole making heap overflow
+
+The former code allowed an attacker to create a heap overflow by
+sending a longer than allowed session id in a response and including a
+semicolon to change the maximum length. With this change, the parser
+will never go beyond 512 bytes.
+
+Upstream-Status: Backport
+CVE: CVE-2019-9928
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ gst-libs/gst/rtsp/gstrtspconnection.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gst-libs/gst/rtsp/gstrtspconnection.c b/gst-libs/gst/rtsp/gstrtspconnection.c
+index a6755bedd..c0429064a 100644
+--- a/gst-libs/gst/rtsp/gstrtspconnection.c
++++ b/gst-libs/gst/rtsp/gstrtspconnection.c
+@@ -2461,7 +2461,7 @@ build_next (GstRTSPBuilder * builder, GstRTSPMessage * message,
+           maxlen = sizeof (conn->session_id) - 1;
+           /* the sessionid can have attributes marked with ;
+            * Make sure we strip them */
+-          for (i = 0; session_id[i] != '\0'; i++) {
++          for (i = 0; i < maxlen && session_id[i] != '\0'; i++) {
+             if (session_id[i] == ';') {
+               maxlen = i;
+               /* parse timeout */
+-- 
+2.21.0
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.4.bb
index 12c9bbc..0d8b033 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.4.bb
@@ -20,6 +20,7 @@ SRC_URI = " \
             file://0010-gl-Add-switch-for-explicitely-enabling-disabling-GBM.patch \
             file://0011-gl-Add-switches-for-explicitely-enabling-disabling-P.patch \
             file://link-with-libvchostif.patch \
+            file://CVE-2019-9928.patch \
             "
 SRC_URI[md5sum] = "4dbe20c1bf44191c2b8833234df5cb2a"
 SRC_URI[sha256sum] = "ca6139490e48863e7706d870ff4e8ac9f417b56f3b9e4b3ce490c13b09a77461"
-- 
2.7.4


