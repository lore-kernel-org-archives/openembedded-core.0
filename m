Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 89C8076FFA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 14:30:30 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP; 26 Aug 2016 07:30:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,581,1464678000"; 
   d="scan'208";a="1525555"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by orsmga004.jf.intel.com with ESMTP; 26 Aug 2016 07:30:30 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 17:28:22 +0300
Message-Id: <580f60aaec7179470e3293074f58ff7da9739ef7.1472221205.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 07/28] libglade: remove the recipe
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
X-List-Received-Date: Fri, 26 Aug 2016 14:30:30 -0000

Libglade has been obsolete for several years and is used by nothing in oe-core;
it will be moved to meta-oe so that old recipes still present there continue to build.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../libglade/libglade-2.6.4/glade-cruft.patch      | 102 -----
 .../libglade/libglade-2.6.4/no-xml2.patch          | 501 ---------------------
 .../libglade-2.6.4/python_environment.patch        |  14 -
 meta/recipes-gnome/libglade/libglade_2.6.4.bb      |  31 --
 4 files changed, 648 deletions(-)
 delete mode 100644 meta/recipes-gnome/libglade/libglade-2.6.4/glade-cruft.patch
 delete mode 100644 meta/recipes-gnome/libglade/libglade-2.6.4/no-xml2.patch
 delete mode 100644 meta/recipes-gnome/libglade/libglade-2.6.4/python_environment.patch
 delete mode 100644 meta/recipes-gnome/libglade/libglade_2.6.4.bb

diff --git a/meta/recipes-gnome/libglade/libglade-2.6.4/glade-cruft.patch b/meta/recipes-gnome/libglade/libglade-2.6.4/glade-cruft.patch
deleted file mode 100644
index c5d5864..0000000
--- a/meta/recipes-gnome/libglade/libglade-2.6.4/glade-cruft.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-Upstream-Status: Pending
-
-diff -ur libglade-2.4.0~/configure.in libglade-2.4.0/configure.in
---- libglade-2.4.0~/configure.in	2004-05-17 12:38:31.000000000 +0100
-+++ libglade-2.4.0/configure.in	2004-07-28 16:53:09.000000000 +0100
-@@ -147,6 +147,18 @@
- AM_CONDITIONAL(HAVE_PYTHON, $have_python)
- AC_SUBST(PYTHON)
- 
-+AC_MSG_CHECKING([for cruft in libgtk])
-+AC_TRY_LINK([
-+#include <gtk/gtk.h>
-+#include <stdio.h>
-+],      [ gtk_tree_get_type (); return 0; ],
-+        [ AC_MSG_RESULT(yes)
-+          have_cruft=yes ],
-+        [ AC_MSG_RESULT(no)
-+	  AC_DEFINE(DISABLE_CRUFT,,[leave out support for old, broken widgets])
-+          have_cruft=no ])
-+AC_SUBST(DISABLE_CRUFT)
-+
- dnl add debugging options ...
- changequote(,)dnl
- if test "x$GCC" = xyes; then
-Only in libglade-2.4.0: configure.in.orig
-diff -ur libglade-2.4.0~/glade/glade-gtk.c libglade-2.4.0/glade/glade-gtk.c
---- libglade-2.4.0~/glade/glade-gtk.c	2004-03-13 13:47:35.000000000 +0000
-+++ libglade-2.4.0/glade/glade-gtk.c	2004-07-28 16:53:52.000000000 +0100
-@@ -213,6 +213,8 @@
- 	gtk_clist_column_titles_hide (GTK_CLIST (w));
- }
- 
-+#ifndef DISABLE_CRUFT
-+
- static void
- tree_set_selection_mode (GladeXML *xml, GtkWidget *w,
- 			 const char *name, const char *value)
-@@ -238,6 +240,8 @@
-     gtk_tree_set_view_lines (GTK_TREE (w), BOOL (value));
- }
- 
-+#endif
-+
- static void
- list_set_selection_mode (GladeXML *xml, GtkWidget *w,
- 			 const char *name, const char *value)
-@@ -254,6 +258,7 @@
-     gtk_check_menu_item_set_show_toggle (GTK_CHECK_MENU_ITEM (w), BOOL (value));
- }
- 
-+#ifndef DISABLE_CRUFT
- static void
- text_set_text (GladeXML *xml, GtkWidget *w,
- 	       const char *name, const char *value)
-@@ -262,6 +267,7 @@
- 
-     gtk_editable_insert_text (GTK_EDITABLE (w), value, -1, &pos);
- }
-+#endif
- 
- static void
- radio_menu_item_set_group (GladeXML *xml, GtkWidget *w,
-@@ -1125,13 +1131,17 @@
-     glade_register_custom_prop (GTK_TYPE_CLIST, "selection_mode", clist_set_selection_mode);
-     glade_register_custom_prop (GTK_TYPE_CLIST, "shadow_type", clist_set_shadow_type);
-     glade_register_custom_prop (GTK_TYPE_CLIST, "show_titles", clist_set_show_titles);
-+#ifndef DISABLE_CRUFT
-     glade_register_custom_prop (GTK_TYPE_TREE, "selection_mode", tree_set_selection_mode);
-     glade_register_custom_prop (GTK_TYPE_TREE, "view_mode", tree_set_view_mode);
-     glade_register_custom_prop (GTK_TYPE_TREE, "view_line", tree_set_view_line);
-+#endif
-     glade_register_custom_prop (GTK_TYPE_LIST, "selection_mode", list_set_selection_mode);
-     glade_register_custom_prop (GTK_TYPE_CHECK_MENU_ITEM, "always_show_toggle",
- 				check_menu_item_set_always_show_toggle);
-+#ifndef DISABLE_CRUFT
-     glade_register_custom_prop (GTK_TYPE_TEXT, "text", text_set_text);
-+#endif
-     glade_register_custom_prop (GTK_TYPE_RADIO_MENU_ITEM, "group",
- 				radio_menu_item_set_group);
-     glade_register_custom_prop (GTK_TYPE_TOOLBAR, "tooltips", toolbar_set_tooltips);
-@@ -1288,8 +1298,10 @@
- 			   glade_standard_build_children, NULL);
-     glade_register_widget (GTK_TYPE_TEAROFF_MENU_ITEM, glade_standard_build_widget,
- 			   NULL, NULL);
-+#ifndef DISABLE_CRUFT
-     glade_register_widget (GTK_TYPE_TEXT, glade_standard_build_widget,
- 			   NULL, NULL);
-+#endif
-     glade_register_widget (GTK_TYPE_TEXT_VIEW, glade_standard_build_widget,
- 			   NULL, NULL);
-     glade_register_widget (GTK_TYPE_TIPS_QUERY, glade_standard_build_widget,
-@@ -1304,8 +1316,10 @@
- 			   glade_standard_build_children, NULL);
-     glade_register_widget (GTK_TYPE_TOOL_BUTTON, glade_standard_build_widget,
- 			   NULL, NULL);
-+#ifndef DISABLE_CRUFT
-     glade_register_widget (GTK_TYPE_TREE, glade_standard_build_widget,
- 			   NULL, NULL);
-+#endif
-     glade_register_widget (GTK_TYPE_TREE_VIEW, glade_standard_build_widget,
- 			   NULL, NULL);
-     glade_register_widget (GTK_TYPE_VBUTTON_BOX, glade_standard_build_widget,
diff --git a/meta/recipes-gnome/libglade/libglade-2.6.4/no-xml2.patch b/meta/recipes-gnome/libglade/libglade-2.6.4/no-xml2.patch
deleted file mode 100644
index dc4c092..0000000
--- a/meta/recipes-gnome/libglade/libglade-2.6.4/no-xml2.patch
+++ /dev/null
@@ -1,501 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-diff -urN libglade-2.4.2.orig/configure.in libglade-2.4.2/configure.in
---- libglade-2.4.2.orig/configure.in	2005-02-11 12:42:58.000000000 +0100
-+++ libglade-2.4.2/configure.in	2005-03-22 01:22:00.000000000 +0100
-@@ -52,11 +52,33 @@
- AC_PATH_PROG(PKG_CONFIG, pkg-config, no)
- 
- PKG_CHECK_MODULES(LIBGLADE, [dnl
--  libxml-2.0 >= required_libxml_version dnl
-   atk >= required_atk_version dnl
-   gtk+-2.0 >= required_gtk_version dnl
-   glib-2.0 >= required_glib_version])
- 
-+disable_xml2=no
-+AC_ARG_WITH([libxml2],
-+  AC_HELP_STRING([--without-libxml2], [Don't use libxml2, use Glib's GMarkupParser instead]),
-+  [disable_xml2=yes],
-+  [disable_xml2=no])
-+
-+AC_MSG_CHECKING([if we are using libxml2])
-+if test "x$disable_xml2" == "xno"; then
-+  AC_MSG_RESULT(yes)
-+  PKG_CHECK_MODULES(XML2, libxml-2.0 >= 2.4.10)
-+  PKGCFG_REQUIRE_LIBXML2="libxml-2.0"
-+  LIBGLADE_CFLAGS="$LIBGLADE_CFLAGS $XML2_CFLAGS"
-+  LIBGLADE_LIBS="$LIBGLADE_LIBS $XML2_LIBS"
-+else
-+  LIBGLADE_CFLAGS="$LIBGLADE_CFLAGS -DUSE_GMARKUP_PARSER"
-+  PKGCFG_REQUIRE_LIBXML2=""
-+  AC_MSG_RESULT(no)
-+fi
-+
-+AC_SUBST(XML2_LIBS)
-+AC_SUBST(XML2_CFLAGS)
-+AC_SUBST(PKGCFG_REQUIRE_LIBXML2)
-+
- AC_MSG_CHECKING([for native Win32])
- case "$host" in
-   *-*-mingw*)
-@@ -116,6 +138,21 @@
-   fi
- fi
- 
-+if test "x$disable_xml2" == "xyes"; then
-+  echo "*****************************************************"
-+  echo "  You chose to disable libxml2 and use Glib's"
-+  echo "  GMarkupParser instead." 
-+  echo  
-+  echo "  Please bear in mind that using libglade with"
-+  echo "  GMarkupParser is an experimental feature only."
-+  echo
-+  echo "  Please post problems or success stories to"
-+  echo "  the glade-devel mailing list. Thank you."
-+  echo "*****************************************************"
-+fi
-+
-+
-+
- GTK_DOC_CHECK(1.0)
- 
- dnl gettext stuff ... there is no message catalog for libglade -- libglade
-diff -urN libglade-2.4.2.orig/glade/glade-parser.c libglade-2.4.2/glade/glade-parser.c
---- libglade-2.4.2.orig/glade/glade-parser.c	2004-11-11 11:56:13.000000000 +0100
-+++ libglade-2.4.2/glade/glade-parser.c	2005-03-22 01:20:00.000000000 +0100
-@@ -34,7 +34,15 @@
- #  define dgettext(Domain, String) (String)
- #endif
- 
--#include <libxml/parser.h>
-+#ifdef USE_GMARKUP_PARSER
-+#  include <zlib.h>
-+#else
-+#  include <libxml/parser.h>
-+#endif
-+
-+#ifdef USE_GMARKUP_PARSER
-+#  define xmlChar gchar
-+#endif
- 
- #include "glade-parser.h"
- #include "glade-private.h"
-@@ -508,7 +516,9 @@
-     case PARSER_START:
- 	if (!strcmp(name, "glade-interface")) {
- 	    state->state = PARSER_GLADE_INTERFACE;
--#if 0
-+
-+#ifndef USE_GMARKUP_PARSER
-+ #if 0
- 	    /* check for correct XML namespace */
- 	    for (i = 0; attrs && attrs[i] != NULL; i += 2) {
- 		if (!strcmp(attrs[i], "xmlns") &&
-@@ -518,7 +528,9 @@
- 		    g_warning("unknown attribute `%s' for <glade-interface>",
- 			      attrs[i]);
- 	    }
-+ #endif
- #endif
-+
- 	} else {
- 	    g_warning("Expected <glade-interface>.  Got <%s>.", name);
- 	    state->prev_state = state->state;
-@@ -1063,12 +1075,18 @@
-     }
- }
- 
-+#ifndef USE_GMARKUP_PARSER
-+
- static xmlEntityPtr
- glade_parser_get_entity(GladeParseState *state, const xmlChar *name)
- {
-     return xmlGetPredefinedEntity(name);
- }
- 
-+#endif /* !defined(USE_GMARKUP_PARSER) */
-+
-+#ifndef USE_GMARKUP_PARSER
-+
- static void
- glade_parser_warning(GladeParseState *state, const char *msg, ...)
- {
-@@ -1079,6 +1097,10 @@
-     va_end(args);
- }
- 
-+#endif /* !defined(USE_GMARKUP_PARSER) */
-+
-+#ifndef USE_GMARKUP_PARSER
-+
- static void
- glade_parser_error(GladeParseState *state, const char *msg, ...)
- {
-@@ -1089,6 +1111,10 @@
-     va_end(args);
- }
- 
-+#endif /* !defined(USE_GMARKUP_PARSER) */
-+
-+#ifndef USE_GMARKUP_PARSER
-+
- static void
- glade_parser_fatal_error(GladeParseState *state, const char *msg, ...)
- {
-@@ -1099,6 +1125,10 @@
-     va_end(args);
- }
- 
-+#endif /* !defined(USE_GMARKUP_PARSER) */
-+
-+#ifndef USE_GMARKUP_PARSER
-+
- static xmlSAXHandler glade_parser = {
-     (internalSubsetSAXFunc)NULL,                       /* internalSubset */
-     (isStandaloneSAXFunc)NULL,                         /* isStandalone */
-@@ -1126,6 +1156,82 @@
-     (fatalErrorSAXFunc)glade_parser_fatal_error,       /* fatalError */
- };
- 
-+#else /* USE_GMARKUP_PARSER */
-+
-+static void
-+glade_parser_start_element_wrapper(GMarkupParseContext *context,
-+                                   const gchar         *name, 
-+                                   const gchar        **attr_names,
-+                                   const gchar        **attr_values,
-+                                   gpointer             state,
-+                                   GError             **error)
-+{
-+    guint i = 0;
-+
-+    /* Pack attribute names/values from two separate
-+     *  arrays (GMarkupParser style) into one single
-+     *  array (libxml SAXParser style). This is not
-+     *  very efficient, but we do it to make the
-+     *  GMarkupParser code as little invasive as
-+     *  possible. */
-+
-+    while (attr_names[i] != NULL) {
-+      ++i;
-+    }
-+
-+    if (1)
-+    {
-+        const gchar *attr[(i*2)+1];
-+        guint j, k;
-+       
-+        for (j=0, k=0;  k < i;  j += 2)
-+        {
-+            attr[j] = attr_names[k];
-+            attr[j+1] = attr_values[k];
-+            ++k;
-+        }
-+        attr[i*2] = NULL;
-+
-+        glade_parser_start_element((GladeParseState*)state, name, attr);
-+    }
-+}
-+
-+static void
-+glade_parser_end_element_wrapper(GMarkupParseContext *context, 
-+                                 const gchar         *name,
-+                                 gpointer             state,
-+                                 GError             **err)
-+{
-+    glade_parser_end_element((GladeParseState*)state, name);
-+}
-+
-+static void
-+glade_parser_characters_wrapper(GMarkupParseContext *context, 
-+                                const gchar         *chars, 
-+                                gsize                len,
-+                                gpointer             state,
-+                                GError             **err)
-+{
-+    glade_parser_characters((GladeParseState*)state, chars, (int) len);
-+}
-+
-+static void
-+glade_parser_error(GMarkupParseContext *context, GError *err, gpointer data)
-+{
-+    g_log("Glade-Parser", G_LOG_LEVEL_CRITICAL, "%s", err->message);
-+}
-+
-+static const GMarkupParser   glade_parser = {
-+    glade_parser_start_element_wrapper,  /* element open   */
-+    glade_parser_end_element_wrapper,    /* element close  */
-+    glade_parser_characters_wrapper,     /* text content   */
-+    NULL,                                /* passthrough    */
-+    glade_parser_error,                  /* parse error    */
-+};
-+
-+#endif /* USE_GMARKUP_PARSER */
-+
-+
- static void
- widget_info_free(GladeWidgetInfo *info)
- {
-@@ -1191,6 +1297,9 @@
-  *
-  * Returns: the GladeInterface structure for the XML file.
-  */
-+
-+#ifndef USE_GMARKUP_PARSER
-+
- GladeInterface *
- glade_parser_parse_file(const gchar *file, const gchar *domain)
- {
-@@ -1222,6 +1331,31 @@
-     return state.interface;
- }
- 
-+#else /* defined(USE_GMARKUP_PARSER) */
-+
-+GladeInterface *
-+glade_parser_parse_file(const gchar *file, const gchar *domain)
-+{
-+    GladeInterface  *interface;
-+    GError          *err     = NULL;
-+    gchar           *content = NULL;
-+    gsize            clen;
-+
-+    if (!g_file_get_contents(file, &content, &clen, &err)) {
-+        g_warning("could not load glade file: %s", err->message);
-+        g_error_free(err);
-+        return NULL;
-+    }
-+
-+    interface = glade_parser_parse_buffer(content, (gint) clen, domain);
-+
-+    g_free(content);
-+
-+    return interface;
-+}
-+
-+#endif /* USE_GMARKUP_PARSER */
-+
- /**
-  * glade_parser_parse_buffer
-  * @buffer: a buffer in memory containing XML data.
-@@ -1237,6 +1371,9 @@
-  *
-  * Returns: the GladeInterface structure for the XML buffer.
-  */
-+
-+#ifndef USE_GMARKUP_PARSER
-+
- GladeInterface *
- glade_parser_parse_buffer(const gchar *buffer, gint len, const gchar *domain)
- {
-@@ -1263,6 +1400,161 @@
-     return state.interface;
- }
- 
-+#else /* defined(USE_GMARKUP_PARSER) */
-+
-+
-+static GladeInterface *
-+glade_parser_parse_buffer_internal(const gchar *buffer, gint len, const gchar *domain)
-+{
-+	GMarkupParseContext  *context;
-+	GladeParseState       state = { 0 };
-+	GError               *err   = NULL;
-+
-+	state.interface = NULL;
-+	if (domain)
-+		state.domain = domain;
-+	else
-+		state.domain = textdomain(NULL);
-+
-+	/* FIXME: This strstr() is not safe, as it ignores the len
-+	 *        argument and assumes the buffer is NUL-terminated */
-+	if (strstr(buffer, "<?xml") == NULL) {
-+		g_warning("No XML header found in document!");
-+		return NULL;
-+	}
-+
-+	context = g_markup_parse_context_new(&glade_parser, (GMarkupParseFlags) 0, &state, NULL);
-+
-+	glade_parser_start_document(&state);
-+
-+	if (!g_markup_parse_context_parse(context, buffer, (gssize) len, &err)) {
-+		g_warning("document not well formed: %s", err->message);
-+		g_error_free(err);
-+		if (state.interface)
-+			glade_interface_destroy (state.interface);
-+		return NULL;
-+	}
-+
-+	glade_parser_end_document(&state);
-+
-+	if (state.state != PARSER_FINISH) {
-+		g_warning("did not finish in PARSER_FINISH state!");
-+
-+		if (state.interface)
-+			glade_interface_destroy(state.interface);
-+
-+		return NULL;
-+	}
-+
-+	return state.interface;
-+}
-+
-+struct _gzip_rfc1952_hdr
-+{
-+	guint8	id1, id2, cm, flags;
-+	guint32 mtime;
-+	guint8  xflags;
-+	guint8  os;
-+};
-+
-+static GladeInterface *
-+glade_parser_parse_gzipped_buffer(const gchar *buffer, gint len, const gchar *domain)
-+{
-+	struct _gzip_rfc1952_hdr *hdr = (struct _gzip_rfc1952_hdr*)buffer;
-+	struct z_stream_s         zstream;
-+	GladeInterface           *interface;
-+	const guint8             *cbuf;              /* start of compressed data */
-+	guint8                   *decompress_buf;
-+	gulong                    decompress_len = 0;
-+	gint                      ret;
-+
-+	g_assert(hdr != NULL && hdr->id1 == 0x1f && hdr->id2 == 0x8b);
-+
-+	if (hdr->cm != Z_DEFLATED) {
-+		g_warning("Unknown decompression method %u", (guint) hdr->cm);
-+		return NULL;
-+	}
-+
-+	/* Uncompressed size (modulo 2^32) is last
-+	 *  4 bytes of gzipped file, and little endian.
-+	 *  See RFC 1952 */
-+	decompress_len = GUINT32_FROM_LE(*((guint32*)(((guint8*)buffer) + len - 4)));
-+
-+	/* paranoid mode: glade files > 5MB are unlikely */
-+	g_return_val_if_fail(decompress_len < 5*1024*1024, NULL);
-+
-+	decompress_buf = g_malloc0(decompress_len + 1); /* +1 for NUL-terminator */
-+
-+	/* find start of compressed data, skipping header stuff */
-+	cbuf = (guint8*)buffer + 10;
-+	if (hdr->flags & 0x04) {
-+		guint16 xlen = GUINT16_FROM_LE(*((guint16*)cbuf));
-+		cbuf += xlen + 2;
-+	}
-+	if (hdr->flags & 0x08) {
-+		guint16 onamelen = strlen(cbuf);
-+		cbuf += onamelen + 1;
-+	}
-+	if (hdr->flags & 0x10) {
-+		guint16 commentlen = strlen(cbuf);
-+		cbuf += commentlen + 1;
-+	}
-+	if (hdr->flags & 0x02)
-+	{
-+		cbuf += 2; /* skip header CRC16 */
-+	}
-+
-+	zstream.next_in  = (void*)cbuf;
-+	zstream.avail_in = (uLongf) len - ((void*)cbuf-(void*)buffer) - 4 - 4 +1; 
-+	zstream.next_out = decompress_buf;
-+	zstream.avail_out= decompress_len;
-+	zstream.zalloc   = Z_NULL;
-+	zstream.zfree    = Z_NULL;
-+	zstream.opaque   = Z_NULL;
-+
-+	ret = inflateInit2(&zstream, -MAX_WBITS);
-+
-+	if (ret != Z_OK) {
-+		g_warning("inflateInit2() failed. zlib error code: %d", ret);
-+		g_free(decompress_buf);
-+		return NULL;
-+	}
-+
-+	ret = inflate(&zstream, Z_FINISH);
-+
-+	if (ret != Z_STREAM_END) {
-+		g_warning("zlib decompression failed. zlib error code: %d", ret);
-+		g_free(decompress_buf);
-+		return NULL;
-+	}
-+
-+	interface = glade_parser_parse_buffer_internal(decompress_buf, decompress_len, domain);
-+
-+	g_free(decompress_buf);
-+
-+	return interface;
-+}
-+
-+GladeInterface *
-+glade_parser_parse_buffer(const gchar *buffer, gint len, const gchar *domain)
-+{
-+	g_return_val_if_fail(buffer != NULL, NULL);
-+	g_return_val_if_fail(len > 0, NULL);
-+
-+	/* Check if buffer is gzipped */
-+	if (buffer[0] == 0x1f && buffer[1] == (gchar)0x8b) {
-+		return glade_parser_parse_gzipped_buffer(buffer, len, domain);
-+	}
-+
-+	/* Buffer is cleartext. */
-+	return glade_parser_parse_buffer_internal(buffer, len, domain);
-+}
-+
-+#endif /* USE_GMARKUP_PARSER */
-+
-+
-+#ifndef USE_GMARKUP_PARSER
-+
- static void
- dump_widget(xmlNode *parent, GladeWidgetInfo *info, gint indent)
- {
-@@ -1382,6 +1674,8 @@
- 	xmlNodeAddContent(widget, "  ");
- }
- 
-+#endif /* !defined(USE_GMARKUP_PARSER) */
-+
- /**
-  * glade_interface_dump
-  * @interface: the GladeInterface
-@@ -1390,6 +1684,9 @@
-  * This function dumps the contents of a GladeInterface into a file as
-  * XML.  It is intended mainly as a debugging tool.
-  */
-+
-+#ifndef USE_GMARKUP_PARSER
-+
- void
- glade_interface_dump(GladeInterface *interface, const gchar *filename)
- {
-@@ -1428,6 +1725,17 @@
-     xmlFreeDoc(doc);
- }
- 
-+#else /* defined(USE_GMARKUP_PARSER) */
-+
-+void
-+glade_interface_dump(GladeInterface *interface, const gchar *filename)
-+{
-+    g_warning("glade_interface_dump() is only available with libxml2.");
-+}
-+
-+#endif /* USE_GMARKUP_PARSER */
-+
-+
- #if 0
- int
- main(int argc, char **argv) {
-diff -urN libglade-2.4.2.orig/libglade-2.0.pc.in libglade-2.4.2/libglade-2.0.pc.in
---- libglade-2.4.2.orig/libglade-2.0.pc.in	2001-12-12 15:28:23.000000000 +0100
-+++ libglade-2.4.2/libglade-2.0.pc.in	2005-03-22 01:20:00.000000000 +0100
-@@ -11,7 +11,7 @@
- Name: Libglade
- Description: a library for dynamically loading GLADE interface files
- Version: @VERSION@
--Requires: gtk+-2.0 libxml-2.0
-+Requires: gtk+-2.0 @PKGCFG_REQUIRE_LIBXML2@
- Libs: -L${libdir} -lglade-2.0
- Cflags: -I${includedir}/libglade-2.0
- 
diff --git a/meta/recipes-gnome/libglade/libglade-2.6.4/python_environment.patch b/meta/recipes-gnome/libglade/libglade-2.6.4/python_environment.patch
deleted file mode 100644
index b5b2ec4..0000000
--- a/meta/recipes-gnome/libglade/libglade-2.6.4/python_environment.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Using @PYTHON@ for this path would result in the build system python being 
-referred to. Instead we want to locate python from the environment.
-
-Upstream-Status: Inappropriate [configuration]
-
-diff -ruN libglade-2.6.4-orig//libglade-convert.in libglade-2.6.4/libglade-convert.in
---- libglade-2.6.4-orig//libglade-convert.in	2011-09-22 10:18:28.991164003 +0800
-+++ libglade-2.6.4/libglade-convert.in	2011-09-22 10:18:55.431164003 +0800
-@@ -1,4 +1,4 @@
--#!@PYTHON@
-+#!/usr/bin/env python
- # -*- mode: python -*-
- 
- # yes, this requires python 2.x and an XML parser module (eg. PyExpat)
diff --git a/meta/recipes-gnome/libglade/libglade_2.6.4.bb b/meta/recipes-gnome/libglade/libglade_2.6.4.bb
deleted file mode 100644
index 553e19c..0000000
--- a/meta/recipes-gnome/libglade/libglade_2.6.4.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "Runtime support for the GTK+ interface builder"
-HOMEPAGE = "http://library.gnome.org/devel/libglade/"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-
-LICENSE = "LGPLv2 & LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
-                    file://glade/glade.h;endline=22;md5=a04f461c964ba4b57a172d1fbcd8f8fc \
-                    file://glade/glade-gtk.c;endline=22;md5=766f993433e2642fec87936d319990ff"
-
-SECTION = "libs"
-PR = "r5"
-DEPENDS = "zlib gdk-pixbuf gtk+"
-
-inherit autotools pkgconfig gnomebase gtk-doc distro_features_check
-ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
-GNOME_COMPRESS_TYPE="bz2"
-
-SRC_URI += "file://glade-cruft.patch file://no-xml2.patch file://python_environment.patch"
-
-SRC_URI[archive.md5sum] = "d1776b40f4e166b5e9c107f1c8fe4139"
-SRC_URI[archive.sha256sum] = "64361e7647839d36ed8336d992fd210d3e8139882269bed47dc4674980165dec"
-
-EXTRA_OECONF += "--without-libxml2"
-
-CFLAGS += "-lz"
-
-PACKAGES += " ${PN}-data"
-FILES_${PN} = "${libdir}/lib*.so.*"
-FILES_${PN}-data = "${datadir}/xml/libglade/glade-2.0.dtd"
-FILES_${PN}-dev += "${bindir}/libglade-convert"
-#RDEPENDS_${PN} = "${PN}-data"
-- 
2.9.3


