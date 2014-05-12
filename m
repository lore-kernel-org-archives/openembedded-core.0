Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f47.google.com (unknown [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1E87D65EF4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 12:21:35 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id x12so6621779wgg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 05:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=6P8+5Su2KFf2yZ8yrW12e/1BSN5hlG43bJFC52ISyYY=;
	b=CCknDMiRLVUnq2T9bJ6pzX50l/VtMZwEi+ak0T1YlqwsORPIxXyzfPYBkaXLRyxWi6
	Lu+fJTooSPgNsKhQPztS8pjtR6KKWSJ9TZDA9xiYkck/pqSjnoVBZdZxqaIpWONndDCV
	FQyGqLZJmLHVd1TAyroj5LIdwj6DiYok1QJ/tV+yjYpawuMudLLgHpXqBHnvzZeE6Y45
	30tlnzz1Mz1Q5cLMyiZWk3IHnDTCmyorRfKetDOZlActuk5rXlCVy8fykRiufcY6zuhR
	A2o+MbcOiIfTA7B5+DWICzPWDf2QI1Ypc/xNwWBpPVN2KDiRznS7qFemkID/jzNwe97X
	ANGg==
X-Gm-Message-State: ALoCoQn1lzDUZqEvVfCp5MNPsuiMnB6/W7plGXwDMGOE2r6Q7wjRScA82FJUZjohWcZbPbok5dN3
X-Received: by 10.194.201.73 with SMTP id jy9mr1928735wjc.51.1399896900929;
	Mon, 12 May 2014 05:15:00 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	ct2sm17699110wjb.33.2014.05.12.05.14.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 May 2014 05:15:00 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 May 2014 13:14:47 +0100
Message-Id: <1399896893-486-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/7] gst-openmax: fix build with GLib 2.40 onwards
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
X-List-Received-Date: Mon, 12 May 2014 12:21:39 -0000

GLib 2.40 adds g_ptr_array_insert, but gst-openmax is definining that as a
static helper function.  Rename the static function so it doesn't conflict with
GLib's namespace.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gstreamer/gst-openmax/ptr-array.patch          |   46 ++++++++++++++++++++
 .../gstreamer/gst-openmax_0.10.1.bb                |    1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-openmax/ptr-array.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-openmax/ptr-array.patch b/meta/recipes-multimedia/gstreamer/gst-openmax/ptr-array.patch
new file mode 100644
index 0000000..5965bba
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-openmax/ptr-array.patch
@@ -0,0 +1,46 @@
+Rename static functions that use GLib naming conventions as one of them
+(g_ptr_array_insert) has now been added to GLib.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/omx/gstomx_util.c b/omx/gstomx_util.c
+index 423e441..579dbf5 100644
+--- a/omx/gstomx_util.c
++++ b/omx/gstomx_util.c
+@@ -85,7 +85,7 @@ static gboolean initialized;
+  */
+ 
+ static void
+-g_ptr_array_clear (GPtrArray * array)
++omx_g_ptr_array_clear (GPtrArray * array)
+ {
+   guint index;
+   for (index = 0; index < array->len; index++)
+@@ -93,7 +93,7 @@ g_ptr_array_clear (GPtrArray * array)
+ }
+ 
+ static void
+-g_ptr_array_insert (GPtrArray * array, guint index, gpointer data)
++omx_g_ptr_array_insert (GPtrArray * array, guint index, gpointer data)
+ {
+   if (index + 1 > array->len) {
+     g_ptr_array_set_size (array, index + 1);
+@@ -394,7 +394,7 @@ g_omx_core_unload (GOmxCore * core)
+   }
+ 
+   core_for_each_port (core, g_omx_port_free);
+-  g_ptr_array_clear (core->ports);
++  omx_g_ptr_array_clear (core->ports);
+ }
+ 
+ static inline GOmxPort *
+@@ -418,7 +418,7 @@ g_omx_core_new_port (GOmxCore * core, guint index)
+   }
+ 
+   port = g_omx_port_new (core, index);
+-  g_ptr_array_insert (core->ports, index, port);
++  omx_g_ptr_array_insert (core->ports, index, port);
+ 
+   return port;
+ }
diff --git a/meta/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb b/meta/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb
index ea3b66b..4e22f46 100644
--- a/meta/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-openmax/gst-openmax-${PV}.tar.bz2 \
            file://gcc_4.6.patch \
+           file://ptr-array.patch \
            "
 
 inherit autotools
-- 
1.7.10.4


