Return-Path: <wouter@wouterlucas.com>
Received: from h0stless.netw0rk.nl (h0stless.netw0rk.nl [149.210.182.68])
	by mail.openembedded.org (Postfix) with ESMTP id C17957016E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 May 2018 03:31:12 +0000 (UTC)
Received: from c-73-162-69-48.hsd1.ca.comcast.net ([73.162.69.48]
	helo=localhost.localdomain)
	by h0stless.netw0rk.nl with esmtpa (Exim 4.91)
	(envelope-from <wouter@wouterlucas.com>)
	id 1fDM0X-0006j3-Ay; Tue, 01 May 2018 05:31:13 +0200
From: wouterlucas <wouter@wouterlucas.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2018 20:30:57 -0700
Message-Id: <20180501033057.20291-4-wouter@wouterlucas.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180501033057.20291-1-wouter@wouterlucas.com>
References: <20180501033057.20291-1-wouter@wouterlucas.com>
X-Authenticated-Id: wl@wouterlucas.com
Subject: [pyro][PATCH 4/4] gstreamer1.0-plugins-bad: Backport MS PlayReady ContentProtection parsing in gstdashdemux
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
X-List-Received-Date: Tue, 01 May 2018 03:31:13 -0000

Signed-off-by: wouterlucas <wouter@wouterlucas.com>
---
 ...-PlayReady-ContentProtection-parsing.patch | 112 ++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.10.4.bb        |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-mpdparser-MS-PlayReady-ContentProtection-parsing.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-mpdparser-MS-PlayReady-ContentProtection-parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-mpdparser-MS-PlayReady-ContentProtection-parsing.patch
new file mode 100644
index 0000000000..ad4d141483
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-mpdparser-MS-PlayReady-ContentProtection-parsing.patch
@@ -0,0 +1,112 @@
+From cbf3d75b3d693e50722534d30a8f51995a419803 Mon Sep 17 00:00:00 2001
+From: Philippe Normand <philn@igalia.com>
+Date: Fri, 4 Nov 2016 09:56:33 +0100
+Subject: [PATCH] mpdparser: MS PlayReady ContentProtection parsing
+
+The "pro" (PlayReady Object) element contents are now base64-decoded
+and properly stored in Protection events.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=773936
+---
+Upstream-Status: Backport
+Signed-off-by: wouterlucas <wouter@wouterlucas.com>
+
+ ext/dash/gstdashdemux.c |  2 +-
+ ext/dash/gstmpdparser.c | 41 ++++++++++++++++++++++++++++++++++++++++-
+ ext/dash/gstmpdparser.h |  1 +
+ 3 files changed, 42 insertions(+), 2 deletions(-)
+
+diff --git a/ext/dash/gstdashdemux.c b/ext/dash/gstdashdemux.c
+index 271f70f..b10465e 100644
+--- a/ext/dash/gstdashdemux.c
++++ b/ext/dash/gstdashdemux.c
+@@ -745,7 +745,7 @@ gst_dash_demux_send_content_protection_event (gpointer data, gpointer userdata)
+   /* RFC 2141 states: The leading "urn:" sequence is case-insensitive */
+   schemeIdUri = g_ascii_strdown (cp->schemeIdUri, -1);
+   if (g_str_has_prefix (schemeIdUri, "urn:uuid:")) {
+-    pssi_len = strlen (cp->value);
++    pssi_len = cp->value_len;
+     pssi = gst_buffer_new_wrapped (g_memdup (cp->value, pssi_len), pssi_len);
+     GST_LOG_OBJECT (stream, "Queuing Protection event on source pad");
+     /* RFC 4122 states that the hex part of a UUID is in lower case,
+diff --git a/ext/dash/gstmpdparser.c b/ext/dash/gstmpdparser.c
+index 15d6d98..f0b3ceb 100644
+--- a/ext/dash/gstmpdparser.c
++++ b/ext/dash/gstmpdparser.c
+@@ -1313,6 +1313,7 @@ gst_mpdparser_parse_descriptor_type_node (GList ** list, xmlNode * a_node)
+     /* if no value attribute, use XML string representation of the node */
+     gst_mpdparser_get_xml_node_as_string (a_node, &new_descriptor->value);
+   }
++  new_descriptor->value_len = strlen(new_descriptor->value);
+ }
+ 
+ static void
+@@ -1734,6 +1735,44 @@ error:
+ }
+ 
+ static void
++gst_mpdparser_parse_content_protection_node (GList ** list, xmlNode * a_node)
++{
++  gchar *value = NULL;
++  if (gst_mpdparser_get_xml_prop_string (a_node, "value", &value)) {
++    if (!g_strcmp0 (value, "MSPR 2.0")) {
++      xmlNode *cur_node;
++      for (cur_node = a_node->children; cur_node; cur_node = cur_node->next) {
++        if (cur_node->type == XML_ELEMENT_NODE) {
++          if (xmlStrcmp (cur_node->name, (xmlChar *) "pro") == 0) {
++            gsize decoded_len;
++            GstDescriptorType *new_descriptor;
++            new_descriptor = g_slice_new0 (GstDescriptorType);
++            *list = g_list_append (*list, new_descriptor);
++
++            gst_mpdparser_get_xml_prop_string (a_node, "schemeIdUri",
++                &new_descriptor->schemeIdUri);
++
++            gst_mpdparser_get_xml_node_content (cur_node,
++                &new_descriptor->value);
++            g_base64_decode_inplace (new_descriptor->value, &decoded_len);
++            *(new_descriptor->value + decoded_len) = '\0';
++            new_descriptor->value_len = decoded_len;
++            goto beach;
++          }
++        }
++      }
++    } else {
++      gst_mpdparser_parse_descriptor_type_node (list, a_node);
++    }
++  } else {
++    gst_mpdparser_parse_descriptor_type_node (list, a_node);
++  }
++beach:
++  if (value)
++    g_free (value);
++}
++
++static void
+ gst_mpdparser_parse_representation_base_type (GstRepresentationBaseType **
+     pointer, xmlNode * a_node)
+ {
+@@ -1788,7 +1827,7 @@ gst_mpdparser_parse_representation_base_type (GstRepresentationBaseType **
+             (&representation_base->AudioChannelConfiguration, cur_node);
+       } else if (xmlStrcmp (cur_node->name,
+               (xmlChar *) "ContentProtection") == 0) {
+-        gst_mpdparser_parse_descriptor_type_node
++        gst_mpdparser_parse_content_protection_node
+             (&representation_base->ContentProtection, cur_node);
+       }
+     }
+diff --git a/ext/dash/gstmpdparser.h b/ext/dash/gstmpdparser.h
+index 85b97ea..738de68 100644
+--- a/ext/dash/gstmpdparser.h
++++ b/ext/dash/gstmpdparser.h
+@@ -277,6 +277,7 @@ struct _GstDescriptorType
+ {
+   gchar *schemeIdUri;
+   gchar *value;
++  glong value_len;
+ };
+ 
+ struct _GstContentComponentNode
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
index f23d60c3d6..c894945748 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
@@ -18,6 +18,7 @@ SRC_URI = " \
     file://0001-smoothstreaming-use-the-duration-from-the-list-of-fr.patch \
     file://0002-mssdemux-Handle-the-adapter-in-the-subclass-after-bu.patch \
     file://0003-adaptivedemux-minimal-HTTP-context-support.patch \
+    file://0005-mpdparser-MS-PlayReady-ContentProtection-parsing.patch \
     file://0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch \
     file://0009-glimagesink-Downrank-to-marginal.patch \
 "
-- 
2.17.0


