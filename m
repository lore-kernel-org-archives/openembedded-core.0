Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id D48E46D000
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 17:02:36 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id u56so716299wes.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 09:02:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=FAeEB3PMbbDPyqbFXsbuxbblrTJslQ1rAHfnSzQmzpo=;
	b=Qd58bbOikhPwhPleBEIp2K45wYTNLIk0f3kjw+e7D0qLIHf5EbhtHuASH6To+NrWzj
	IL0zhBaUEjs1yT2SrzRqOtcAYr2IIo3Q9nh8jhK4ivIujhGDsoh/dyimbuwfqzmenG4i
	TJYcitkxivZrU2lXNHrjyGE0nIFCXJDbq9my0+NSGwkSiynt1n7RROc42lJp9J4+EjLr
	17wBuFlDtjZXjfKD1zOedfkmKLfj+UIiOOOGMIH5pEzZPuUkR70V9oAhcUNs3Nq545Jc
	6Xk7POj0TjGsfSuckBbWLxJU1xbeB/fUV4bXUogwnUKMk5rTBJgg2ANc3p5QL0xLH+mB
	qp+Q==
X-Gm-Message-State: ALoCoQlT1Ici7LZoILhfpXSEWoFg15qcgkI1i+4GgrC12irq/Nob0Nxtd5Pc4EuWEcxfAPW3g5yI
X-Received: by 10.180.104.129 with SMTP id ge1mr21598023wib.6.1384880558107;
	Tue, 19 Nov 2013 09:02:38 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id r4sm7396297wib.6.2013.11.19.09.02.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Nov 2013 09:02:37 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Nov 2013 17:02:30 +0000
Message-Id: <1384880550-26096-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] librsvg: upgrade to 2.40.0
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
X-List-Received-Date: Tue, 19 Nov 2013 17:02:37 -0000

Add local-m4.patch and install a local vapigen.m4 so that we can autoreconf
without needing Vala installed.

Refresh build dependencies removing stale recipes and adding libcroco as it's a mandatory dependency now.

Explicitly disable Vala, with a patch from upstream until 2.40.1.

The GTK+ 2 theme engine has been removed, delete all traces of it.

Add a patch to make GTK+ use deterministic, and a disabled PACKAGECONFIG for it.

Enable parallel make, as some testing shows that it works fine.

Drop librsvg-CVE-2011-3146, merged upstream.  Drop doc_Makefile.patch, our
gtk-doc.mk isn't buggy and this isn't needed anymore.

Merge multiple -dev and -dbg packages into ${PN}-dev and -dbg, and remove the
loader module .a and .la files as they are pointless.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../librsvg/librsvg-2.32.1/doc_Makefile.patch      |   19 -
 .../librsvg-2.32.1/librsvg-CVE-2011-3146.patch     | 1088 --------------------
 .../recipes-gnome/librsvg/librsvg/gtk-option.patch |   59 ++
 meta/recipes-gnome/librsvg/librsvg/local-m4.patch  |   32 +
 meta/recipes-gnome/librsvg/librsvg/vapigen.m4      |   96 ++
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |   58 --
 meta/recipes-gnome/librsvg/librsvg_2.40.0.bb       |   56 +
 7 files changed, 243 insertions(+), 1165 deletions(-)
 delete mode 100644 meta/recipes-gnome/librsvg/librsvg-2.32.1/doc_Makefile.patch
 delete mode 100644 meta/recipes-gnome/librsvg/librsvg-2.32.1/librsvg-CVE-2011-3146.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/gtk-option.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/local-m4.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/vapigen.m4
 delete mode 100644 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
 create mode 100644 meta/recipes-gnome/librsvg/librsvg_2.40.0.bb

diff --git a/meta/recipes-gnome/librsvg/librsvg-2.32.1/doc_Makefile.patch b/meta/recipes-gnome/librsvg/librsvg-2.32.1/doc_Makefile.patch
deleted file mode 100644
index 860d7a9..0000000
--- a/meta/recipes-gnome/librsvg/librsvg-2.32.1/doc_Makefile.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Automake complains about using += before setting with =
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: librsvg-2.32.0/doc/Makefile.am
-===================================================================
---- librsvg-2.32.0.orig/doc/Makefile.am	2010-11-24 13:13:28.000000000 -0800
-+++ librsvg-2.32.0/doc/Makefile.am	2010-11-24 13:13:46.161312119 -0800
-@@ -133,7 +133,7 @@
- 
- # Other files to distribute
- # e.g. EXTRA_DIST += version.xml.in
--EXTRA_DIST += \
-+EXTRA_DIST = \
- 	version.xml.in
- 
- # Files not to distribute
diff --git a/meta/recipes-gnome/librsvg/librsvg-2.32.1/librsvg-CVE-2011-3146.patch b/meta/recipes-gnome/librsvg/librsvg-2.32.1/librsvg-CVE-2011-3146.patch
deleted file mode 100644
index 251f31e..0000000
--- a/meta/recipes-gnome/librsvg/librsvg-2.32.1/librsvg-CVE-2011-3146.patch
+++ /dev/null
@@ -1,1088 +0,0 @@
-librsvg: CVE-2011-3146
-
-Store node type separately in RsvgNode
-
-commit 34c95743ca692ea0e44778e41a7c0a129363de84 upstream
-
-The node name (formerly RsvgNode:type) cannot be used to infer
-the sub-type of RsvgNode that we're dealing with, since for unknown
-elements we put type = node-name. This lead to a (potentially exploitable)
-crash e.g. when the element name started with "fe" which tricked
-the old code into considering it as a RsvgFilterPrimitive.
-http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-3146
-
-https://bugzilla.gnome.org/show_bug.cgi?id=658014
----
- rsvg-base.c         |   68 ++++++++++++++++++++++++++------------------
- rsvg-cairo-draw.c   |    2 +-
- rsvg-filter.c       |   79 +++++++++++++++++++++++++++------------------------
- rsvg-filter.h       |    2 +-
- rsvg-image.c        |    2 +-
- rsvg-marker.c       |    4 +-
- rsvg-mask.c         |    8 ++--
- rsvg-paint-server.c |   25 ++++++++--------
- rsvg-private.h      |   60 ++++++++++++++++++++++++++++++++++++++-
- rsvg-shapes.c       |   25 ++++++++--------
- rsvg-shapes.h       |    2 +-
- rsvg-structure.c    |   25 ++++++++--------
- rsvg-structure.h    |    5 ++-
- rsvg-text.c         |   22 ++++++++------
- 14 files changed, 204 insertions(+), 125 deletions(-)
-
-diff --git a/rsvg-base.c b/rsvg-base.c
-index 1f5c48c..b1a2d8b 100644
---- a/rsvg-base.c
-+++ b/rsvg-base.c
-@@ -147,7 +147,6 @@ rsvg_start_style (RsvgHandle * ctx, RsvgPropertyBag * atts)
- static void
- rsvg_standard_element_start (RsvgHandle * ctx, const char *name, RsvgPropertyBag * atts)
- {
--
-     /*replace this stuff with a hash for fast reading! */
-     RsvgNode *newnode = NULL;
-     if (!strcmp (name, "g"))
-@@ -241,11 +240,11 @@ rsvg_standard_element_start (RsvgHandle * ctx, const char *name, RsvgPropertyBag
-     else if (!strcmp (name, "feFuncA"))
-         newnode = rsvg_new_node_component_transfer_function ('a');
-     else if (!strcmp (name, "feDistantLight"))
--        newnode = rsvg_new_filter_primitive_light_source ('d');
-+        newnode = rsvg_new_node_light_source ('d');
-     else if (!strcmp (name, "feSpotLight"))
--        newnode = rsvg_new_filter_primitive_light_source ('s');
-+        newnode = rsvg_new_node_light_source ('s');
-     else if (!strcmp (name, "fePointLight"))
--        newnode = rsvg_new_filter_primitive_light_source ('p');
-+        newnode = rsvg_new_node_light_source ('p');
-     /* hack to make multiImage sort-of work */
-     else if (!strcmp (name, "multiImage"))
-         newnode = rsvg_new_switch ();
-@@ -259,21 +258,22 @@ rsvg_standard_element_start (RsvgHandle * ctx, const char *name, RsvgPropertyBag
-         newnode = rsvg_new_tspan ();
-     else if (!strcmp (name, "tref"))
-         newnode = rsvg_new_tref ();
--	else {
-+    else {
- 		/* hack for bug 401115. whenever we encounter a node we don't understand, push it into a group. 
- 		   this will allow us to handle things like conditionals properly. */
- 		newnode = rsvg_new_group ();
- 	}
- 
-     if (newnode) {
--        newnode->type = g_string_new (name);
-+        g_assert (RSVG_NODE_TYPE (newnode) != RSVG_NODE_TYPE_INVALID);
-+        newnode->name = (char *) name; /* libxml will keep this while parsing */
-         newnode->parent = ctx->priv->currentnode;
-         rsvg_node_set_atts (newnode, ctx, atts);
-         rsvg_defs_register_memory (ctx->priv->defs, newnode);
-         if (ctx->priv->currentnode) {
-             rsvg_node_group_pack (ctx->priv->currentnode, newnode);
-             ctx->priv->currentnode = newnode;
--        } else if (!strcmp (name, "svg")) {
-+        } else if (RSVG_NODE_TYPE (newnode) == RSVG_NODE_TYPE_SVG) {
-             ctx->priv->treebase = newnode;
-             ctx->priv->currentnode = newnode;
-         }
-@@ -689,10 +689,11 @@ rsvg_end_element (void *data, const xmlChar * name)
-             ctx->priv->handler = NULL;
-         }
- 
--        if (ctx->priv->currentnode
--            && !strcmp ((const char *) name, ctx->priv->currentnode->type->str))
--            rsvg_pop_def_group (ctx);
-+        if (ctx->priv->currentnode &&
-+            !strcmp ((const char *) name, ctx->priv->currentnode->name))
-+                rsvg_pop_def_group (ctx);
- 
-+        /* FIXMEchpe: shouldn't this check that currentnode == treebase or sth like that? */
-         if (ctx->priv->treebase && !strcmp ((const char *)name, "svg"))
-             _rsvg_node_svg_apply_atts ((RsvgNodeSvg *)ctx->priv->treebase, ctx);
-     }
-@@ -706,6 +707,30 @@ _rsvg_node_chars_free (RsvgNode * node)
-     _rsvg_node_free (node);
- }
- 
-+static RsvgNodeChars *
-+rsvg_new_node_chars (const char *text,
-+                     int len)
-+{
-+    RsvgNodeChars *self;
-+
-+    self = g_new (RsvgNodeChars, 1);
-+    _rsvg_node_init (&self->super, RSVG_NODE_TYPE_CHARS);
-+
-+    if (!g_utf8_validate (text, len, NULL)) {
-+        char *utf8;
-+        utf8 = rsvg_make_valid_utf8 (text, len);
-+        self->contents = g_string_new (utf8);
-+        g_free (utf8);
-+    } else {
-+        self->contents = g_string_new_len (text, len);
-+    }
-+
-+    self->super.free = _rsvg_node_chars_free;
-+    self->super.state->cond_true = FALSE;
-+
-+    return self;
-+}
-+
- static void
- rsvg_characters_impl (RsvgHandle * ctx, const xmlChar * ch, int len)
- {
-@@ -715,8 +740,9 @@ rsvg_characters_impl (RsvgHandle * ctx, const xmlChar * ch, int len)
-         return;
- 
-     if (ctx->priv->currentnode) {
--        if (!strcmp ("tspan", ctx->priv->currentnode->type->str) ||
--            !strcmp ("text", ctx->priv->currentnode->type->str)) {
-+        RsvgNodeType type = RSVG_NODE_TYPE (ctx->priv->currentnode);
-+        if (type == RSVG_NODE_TYPE_TSPAN ||
-+            type == RSVG_NODE_TYPE_TEXT) {
-             guint i;
- 
-             /* find the last CHARS node in the text or tspan node, so that we
-@@ -724,7 +750,7 @@ rsvg_characters_impl (RsvgHandle * ctx, const xmlChar * ch, int len)
-             self = NULL;
-             for (i = 0; i < ctx->priv->currentnode->children->len; i++) {
-                 RsvgNode *node = g_ptr_array_index (ctx->priv->currentnode->children, i);
--                if (!strcmp (node->type->str, "RSVG_NODE_CHARS")) {
-+                if (RSVG_NODE_TYPE (node) == RSVG_NODE_TYPE_CHARS) {
-                     self = (RsvgNodeChars*)node;
-                 }
-             }
-@@ -744,21 +770,7 @@ rsvg_characters_impl (RsvgHandle * ctx, const xmlChar * ch, int len)
-         }
-     }
- 
--    self = g_new (RsvgNodeChars, 1);
--    _rsvg_node_init (&self->super);
--
--    if (!g_utf8_validate ((char *) ch, len, NULL)) {
--        char *utf8;
--        utf8 = rsvg_make_valid_utf8 ((char *) ch, len);
--        self->contents = g_string_new (utf8);
--        g_free (utf8);
--    } else {
--        self->contents = g_string_new_len ((char *) ch, len);
--    }
--
--    self->super.type = g_string_new ("RSVG_NODE_CHARS");
--    self->super.free = _rsvg_node_chars_free;
--    self->super.state->cond_true = FALSE;
-+    self = rsvg_new_node_chars ((char *) ch, len);
- 
-     rsvg_defs_register_memory (ctx->priv->defs, (RsvgNode *) self);
-     if (ctx->priv->currentnode)
-diff --git a/rsvg-cairo-draw.c b/rsvg-cairo-draw.c
-index 0b74e22..c01cd17 100644
---- a/rsvg-cairo-draw.c
-+++ b/rsvg-cairo-draw.c
-@@ -147,7 +147,7 @@ _pattern_add_rsvg_color_stops (cairo_pattern_t * pattern,
- 
-     for (i = 0; i < stops->len; i++) {
-         node = (RsvgNode *) g_ptr_array_index (stops, i);
--        if (strcmp (node->type->str, "stop"))
-+        if (RSVG_NODE_TYPE (node) != RSVG_NODE_TYPE_STOP)
-             continue;
-         stop = (RsvgGradientStop *) node;
-         rgba = stop->rgba;
-diff --git a/rsvg-filter.c b/rsvg-filter.c
-index e65be41..ce96c4f 100644
---- a/rsvg-filter.c
-+++ b/rsvg-filter.c
-@@ -495,7 +495,7 @@ rsvg_filter_render (RsvgFilter * self, GdkPixbuf * source,
- 
-     for (i = 0; i < self->super.children->len; i++) {
-         current = g_ptr_array_index (self->super.children, i);
--        if (!strncmp (current->super.type->str, "fe", 2))
-+        if (RSVG_NODE_IS_FILTER_PRIMITIVE (&current->super))
-             rsvg_filter_primitive_render (current, ctx);
-     }
- 
-@@ -703,7 +703,7 @@ rsvg_filter_parse (const RsvgDefs * defs, const char *str)
-         val = rsvg_defs_lookup (defs, name);
-         g_free (name);
- 
--        if (val && (!strcmp (val->type->str, "filter")))
-+        if (val && RSVG_NODE_TYPE (val) == RSVG_NODE_TYPE_FILTER)
-             return (RsvgFilter *) val;
-     }
-     return NULL;
-@@ -754,7 +754,7 @@ rsvg_new_filter (void)
-     RsvgFilter *filter;
- 
-     filter = g_new (RsvgFilter, 1);
--    _rsvg_node_init (&filter->super);
-+    _rsvg_node_init (&filter->super, RSVG_NODE_TYPE_FILTER);
-     filter->filterunits = objectBoundingBox;
-     filter->primitiveunits = userSpaceOnUse;
-     filter->x = _rsvg_css_parse_length ("-10%");
-@@ -978,7 +978,7 @@ rsvg_new_filter_primitive_blend (void)
- {
-     RsvgFilterPrimitiveBlend *filter;
-     filter = g_new (RsvgFilterPrimitiveBlend, 1);
--    _rsvg_node_init (&filter->super.super);
-+    _rsvg_node_init (&filter->super.super, RSVG_NODE_TYPE_FILTER_PRIMITIVE_BLEND);
-     filter->mode = normal;
-     filter->super.in = g_string_new ("none");
-     filter->in2 = g_string_new ("none");
-@@ -1230,7 +1230,7 @@ rsvg_new_filter_primitive_convolve_matrix (void)
- {
-     RsvgFilterPrimitiveConvolveMatrix *filter;
-     filter = g_new (RsvgFilterPrimitiveConvolveMatrix, 1);
--    _rsvg_node_init (&filter->super.super);
-+    _rsvg_node_init (&filter->super.super, RSVG_NODE_TYPE_FILTER_PRIMITIVE_CONVOLVE_MATRIX);
-     filter->super.in = g_string_new ("none");
-     filter->super.result = g_string_new ("none");
-     filter->super.x.factor = filter->super.y.factor = filter->super.width.factor =
-@@ -1471,7 +1471,7 @@ rsvg_new_filter_primitive_gaussian_blur (void)
- {
-     RsvgFilterPrimitiveGaussianBlur *filter;
-     filter = g_new (RsvgFilterPrimitiveGaussianBlur, 1);
--    _rsvg_node_init (&filter->super.super);
-+    _rsvg_node_init (&filter->super.super, RSVG_NODE_TYPE_FILTER_PRIMITIVE_GAUSSIAN_BLUR);
-     filter->super.in = g_string_new ("none");
-     filter->super.result = g_string_new ("none");
-     filter->super.x.factor = filter->super.y.factor = filter->super.width.factor =
-@@ -1607,7 +1607,7 @@ rsvg_new_filter_primitive_offset (void)
- {
-     RsvgFilterPrimitiveOffset *filter;
-     filter = g_new (RsvgFilterPrimitiveOffset, 1);
--    _rsvg_node_init (&filter->super.super);
-+    _rsvg_node_init (&filter->super.super, RSVG_NODE_TYPE_FILTER_PRIMITIVE_OFFSET);
-     filter->super.in = g_string_new ("none");
-     filter->super.result = g_string_new ("none");
-     filter->super.x.factor = filter->super.y.factor = filter->super.width.factor =
-@@ -1648,7 +1648,7 @@ rsvg_filter_primitive_merge_render (RsvgFilterPrimitive * self, RsvgFilterContex
-     for (i = 0; i < upself->super.super.children->len; i++) {
-         RsvgFilterPrimitive *mn;
-         mn = g_ptr_array_index (upself->super.super.children, i);
--        if (strcmp (mn->super.type->str, "feMergeNode"))
-+        if (RSVG_NODE_TYPE (&mn->super) != RSVG_NODE_TYPE_FILTER_PRIMITIVE_MERGE_NODE)
-             continue;
-         in = rsvg_filter_get_in (mn->in, ctx);
-         rsvg_alpha_blt (in, boundarys.x0, boundarys.y0, boundarys.x1 - boundarys.x0,
-@@ -1701,7 +1701,7 @@ rsvg_new_filter_primitive_merge (void)
- {
-     RsvgFilterPrimitiveMerge *filter;
-     filter = g_new (RsvgFilterPrimitiveMerge, 1);
--    _rsvg_node_init (&filter->super.super);
-+    _rsvg_node_init (&filter->super.super, RSVG_NODE_TYPE_FILTER_PRIMITIVE_MERGE);
-     filter->super.result = g_string_new ("none");
-     filter->super.x.factor = filter->super.y.factor = filter->super.width.factor =
-         filter->super.height.factor = 'n';
-@@ -1744,7 +1744,7 @@ rsvg_new_filter_primitive_merge_node (void)
- {
-     RsvgFilterPrimitive *filter;
-     filter = g_new (RsvgFilterPrimitive, 1);
--    _rsvg_node_init (&filter->super);
-+    _rsvg_node_init (&filter->super, RSVG_NODE_TYPE_FILTER_PRIMITIVE_MERGE_NODE);
-     filter->in = g_string_new ("none");
-     filter->super.free = rsvg_filter_primitive_merge_node_free;
-     filter->render = &rsvg_filter_primitive_merge_node_render;
-@@ -1978,7 +1978,7 @@ rsvg_new_filter_primitive_colour_matrix (void)
- {
-     RsvgFilterPrimitiveColourMatrix *filter;
-     filter = g_new (RsvgFilterPrimitiveColourMatrix, 1);
--    _rsvg_node_init (&filter->super.super);
-+    _rsvg_node_init (&filter->super.super, RSVG_NODE_TYPE_FILTER_PRIMITIVE_COLOUR_MATRIX);
-     filter->super.in = g_string_new ("none");
-     filter->super.result = g_string_new ("none");
-     filter->super.x.factor = filter->super.y.factor = filter->super.width.factor =
-@@ -2010,8 +2010,9 @@ struct _RsvgNodeComponentTransferFunc {
-     gint slope;
-     gint intercept;
-     gint amplitude;
--    gdouble exponent;
-     gint offset;
-+    gdouble exponent;
-+    char channel;
- };
- 
- struct _RsvgFilterPrimitiveComponentTransfer {
-@@ -2107,15 +2108,18 @@ rsvg_filter_primitive_component_transfer_render (RsvgFilterPrimitive *
-     for (c = 0; c < 4; c++) {
-         char channel = "RGBA"[c];
-         for (i = 0; i < self->super.children->len; i++) {
--            RsvgNodeComponentTransferFunc *temp;
--            temp = (RsvgNodeComponentTransferFunc *)
--                g_ptr_array_index (self->super.children, i);
--            if (!strncmp (temp->super.type->str, "feFunc", 6))
--                if (temp->super.type->str[6] == channel) {
-+            RsvgNode *child_node;
-+
-+            child_node = (RsvgNode *) g_ptr_array_index (self->super.children, i);
-+            if (RSVG_NODE_TYPE (child_node) == RSVG_NODE_TYPE_FILTER_PRIMITIVE_COMPONENT_TRANSFER) {
-+                RsvgNodeComponentTransferFunc *temp = (RsvgNodeComponentTransferFunc *) child_node;
-+
-+                if (temp->channel == channel) {
-                     functions[ctx->channelmap[c]] = temp->function;
-                     channels[ctx->channelmap[c]] = temp;
-                     break;
-                 }
-+            }
-         }
-         if (i == self->super.children->len)
-             functions[ctx->channelmap[c]] = identity_component_transfer_func;
-@@ -2198,7 +2202,7 @@ rsvg_new_filter_primitive_component_transfer (void)
-     RsvgFilterPrimitiveComponentTransfer *filter;
- 
-     filter = g_new (RsvgFilterPrimitiveComponentTransfer, 1);
--    _rsvg_node_init (&filter->super.super);
-+    _rsvg_node_init (&filter->super.super, RSVG_NODE_TYPE_FILTER_PRIMITIVE_COMPONENT_TRANSFER);
-     filter->super.result = g_string_new ("none");
-     filter->super.in = g_string_new ("none");
-     filter->super.x.factor = filter->super.y.factor = filter->super.width.factor =
-@@ -2272,7 +2276,7 @@ rsvg_new_node_component_transfer_function (char channel)
-     RsvgNodeComponentTransferFunc *filter;
- 
-     filter = g_new (RsvgNodeComponentTransferFunc, 1);
--    _rsvg_node_init (&filter->super);
-+    _rsvg_node_init (&filter->super, RSVG_NODE_TYPE_COMPONENT_TRANFER_FUNCTION);
-     filter->super.free = rsvg_component_transfer_function_free;
-     filter->super.set_atts = rsvg_node_component_transfer_function_set_atts;
-     filter->function = identity_component_transfer_func;
-@@ -2414,7 +2418,7 @@ rsvg_new_filter_primitive_erode (void)
- {
-     RsvgFilterPrimitiveErode *filter;
-     filter = g_new (RsvgFilterPrimitiveErode, 1);
--    _rsvg_node_init (&filter->super.super);
-+    _rsvg_node_init (&filter->super.super, RSVG_NODE_TYPE_FILTER_PRIMITIVE_ERODE);
-     filter->super.in = g_string_new ("none");
-     filter->super.result = g_string_new ("none");
-     filter->super.x.factor = filter->super.y.factor = filter->super.width.factor =
-@@ -2639,7 +2643,7 @@ rsvg_new_filter_primitive_composite (void)
- {
-     RsvgFilterPrimitiveComposite *filter;
-     filter = g_new (RsvgFilterPrimitiveComposite, 1);
--    _rsvg_node_init (&filter->super.super);
-+    _rsvg_node_init (&filter->super.super, RSVG_NODE_TYPE_FILTER_PRIMITIVE_COMPOSITE);
-     filter->mode = COMPOSITE_MODE_OVER;
-     filter->super.in = g_string_new ("none");
-     filter->in2 = g_string_new ("none");
-@@ -2744,7 +2748,7 @@ rsvg_new_filter_primitive_flood (void)
- {
-     RsvgFilterPrimitive *filter;
-     filter = g_new (RsvgFilterPrimitive, 1);
--    _rsvg_node_init (&filter->super);
-+    _rsvg_node_init (&filter->super, RSVG_NODE_TYPE_FILTER_PRIMITIVE_FLOOD);
-     filter->in = g_string_new ("none");
-     filter->result = g_string_new ("none");
-     filter->x.factor = filter->y.factor = filter->width.factor = filter->height.factor = 'n';
-@@ -2920,7 +2924,7 @@ rsvg_new_filter_primitive_displacement_map (void)
- {
-     RsvgFilterPrimitiveDisplacementMap *filter;
-     filter = g_new (RsvgFilterPrimitiveDisplacementMap, 1);
--    _rsvg_node_init (&filter->super.super);
-+    _rsvg_node_init (&filter->super.super, RSVG_NODE_TYPE_FILTER_PRIMITIVE_DISPLACEMENT_MAP);
-     filter->super.in = g_string_new ("none");
-     filter->in2 = g_string_new ("none");
-     filter->super.result = g_string_new ("none");
-@@ -3291,7 +3295,7 @@ rsvg_new_filter_primitive_turbulence (void)
- {
-     RsvgFilterPrimitiveTurbulence *filter;
-     filter = g_new (RsvgFilterPrimitiveTurbulence, 1);
--    _rsvg_node_init (&filter->super.super);
-+    _rsvg_node_init (&filter->super.super, RSVG_NODE_TYPE_FILTER_PRIMITIVE_TURBULENCE);
-     filter->super.in = g_string_new ("none");
-     filter->super.result = g_string_new ("none");
-     filter->super.x.factor = filter->super.y.factor = filter->super.width.factor =
-@@ -3510,7 +3514,7 @@ rsvg_new_filter_primitive_image (void)
- {
-     RsvgFilterPrimitiveImage *filter;
-     filter = g_new (RsvgFilterPrimitiveImage, 1);
--    _rsvg_node_init (&filter->super.super);
-+    _rsvg_node_init (&filter->super.super, RSVG_NODE_TYPE_FILTER_PRIMITIVE_IMAGE);
-     filter->super.in = g_string_new ("none");
-     filter->super.result = g_string_new ("none");
-     filter->super.x.factor = filter->super.y.factor = filter->super.width.factor =
-@@ -3871,8 +3875,8 @@ get_light_colour (RsvgNodeLightSource * source, vector3 colour,
- 
- 
- static void
--rsvg_filter_primitive_light_source_set_atts (RsvgNode * self,
--                                             RsvgHandle * ctx, RsvgPropertyBag * atts)
-+rsvg_node_light_source_set_atts (RsvgNode * self,
-+                                 RsvgHandle * ctx, RsvgPropertyBag * atts)
- {
-     RsvgNodeLightSource *data;
-     const char *value;
-@@ -3904,13 +3908,13 @@ rsvg_filter_primitive_light_source_set_atts (RsvgNode * self,
- }
- 
- RsvgNode *
--rsvg_new_filter_primitive_light_source (char type)
-+rsvg_new_node_light_source (char type)
- {
-     RsvgNodeLightSource *data;
-     data = g_new (RsvgNodeLightSource, 1);
--    _rsvg_node_init (&data->super);
-+    _rsvg_node_init (&data->super, RSVG_NODE_TYPE_LIGHT_SOURCE);
-     data->super.free = _rsvg_node_free;
--    data->super.set_atts = rsvg_filter_primitive_light_source_set_atts;
-+    data->super.set_atts = rsvg_node_light_source_set_atts;
-     data->specularExponent = 1;
-     if (type == 's')
-         data->type = SPOTLIGHT;
-@@ -3960,10 +3964,11 @@ rsvg_filter_primitive_diffuse_lighting_render (RsvgFilterPrimitive * self, RsvgF
- 
-     for (i = 0; i < self->super.children->len; i++) {
-         RsvgNode *temp;
-+
-         temp = g_ptr_array_index (self->super.children, i);
--        if (!strcmp (temp->type->str, "feDistantLight") ||
--            !strcmp (temp->type->str, "fePointLight") || !strcmp (temp->type->str, "feSpotLight"))
-+        if (RSVG_NODE_TYPE (temp) == RSVG_NODE_TYPE_LIGHT_SOURCE) {
-             source = (RsvgNodeLightSource *) temp;
-+        }
-     }
-     if (source == NULL)
-         return;
-@@ -4080,7 +4085,7 @@ rsvg_new_filter_primitive_diffuse_lighting (void)
- {
-     RsvgFilterPrimitiveDiffuseLighting *filter;
-     filter = g_new (RsvgFilterPrimitiveDiffuseLighting, 1);
--    _rsvg_node_init (&filter->super.super);
-+    _rsvg_node_init (&filter->super.super, RSVG_NODE_TYPE_FILTER_PRIMITIVE_DIFFUSE_LIGHTING);
-     filter->super.in = g_string_new ("none");
-     filter->super.result = g_string_new ("none");
-     filter->super.x.factor = filter->super.y.factor = filter->super.width.factor =
-@@ -4135,9 +4140,9 @@ rsvg_filter_primitive_specular_lighting_render (RsvgFilterPrimitive * self, Rsvg
-     for (i = 0; i < self->super.children->len; i++) {
-         RsvgNode *temp;
-         temp = g_ptr_array_index (self->super.children, i);
--        if (!strcmp (temp->type->str, "feDistantLight") ||
--            !strcmp (temp->type->str, "fePointLight") || !strcmp (temp->type->str, "feSpotLight"))
-+        if (RSVG_NODE_TYPE (temp) == RSVG_NODE_TYPE_LIGHT_SOURCE) {
-             source = (RsvgNodeLightSource *) temp;
-+        }
-     }
-     if (source == NULL)
-         return;
-@@ -4259,7 +4264,7 @@ rsvg_new_filter_primitive_specular_lighting (void)
- {
-     RsvgFilterPrimitiveSpecularLighting *filter;
-     filter = g_new (RsvgFilterPrimitiveSpecularLighting, 1);
--    _rsvg_node_init (&filter->super.super);
-+    _rsvg_node_init (&filter->super.super, RSVG_NODE_TYPE_FILTER_PRIMITIVE_SPECULAR_LIGHTING);
-     filter->super.in = g_string_new ("none");
-     filter->super.result = g_string_new ("none");
-     filter->super.x.factor = filter->super.y.factor = filter->super.width.factor =
-@@ -4381,7 +4386,7 @@ rsvg_new_filter_primitive_tile (void)
- {
-     RsvgFilterPrimitiveTile *filter;
-     filter = g_new (RsvgFilterPrimitiveTile, 1);
--    _rsvg_node_init (&filter->super.super);
-+    _rsvg_node_init (&filter->super.super, RSVG_NODE_TYPE_FILTER_PRIMITIVE_TILE);
-     filter->super.in = g_string_new ("none");
-     filter->super.result = g_string_new ("none");
-     filter->super.x.factor = filter->super.y.factor = filter->super.width.factor =
-diff --git a/rsvg-filter.h b/rsvg-filter.h
-index 25dac75..0aeda22 100644
---- a/rsvg-filter.h
-+++ b/rsvg-filter.h
-@@ -64,7 +64,7 @@ RsvgNode    *rsvg_new_filter_primitive_displacement_map     (void);
- RsvgNode    *rsvg_new_filter_primitive_turbulence           (void);
- RsvgNode    *rsvg_new_filter_primitive_image                (void);
- RsvgNode    *rsvg_new_filter_primitive_diffuse_lighting	    (void);
--RsvgNode    *rsvg_new_filter_primitive_light_source	        (char type);
-+RsvgNode    *rsvg_new_node_light_source	                    (char type);
- RsvgNode    *rsvg_new_filter_primitive_specular_lighting    (void);
- RsvgNode    *rsvg_new_filter_primitive_tile                 (void);
- 
-diff --git a/rsvg-image.c b/rsvg-image.c
-index a81dcf5..02882bd 100644
---- a/rsvg-image.c
-+++ b/rsvg-image.c
-@@ -356,7 +356,7 @@ rsvg_new_image (void)
- {
-     RsvgNodeImage *image;
-     image = g_new (RsvgNodeImage, 1);
--    _rsvg_node_init (&image->super);
-+    _rsvg_node_init (&image->super, RSVG_NODE_TYPE_IMAGE);
-     g_assert (image->super.state);
-     image->img = NULL;
-     image->preserve_aspect_ratio = RSVG_ASPECT_RATIO_XMID_YMID;
-diff --git a/rsvg-marker.c b/rsvg-marker.c
-index 591e1e0..c7e76f1 100644
---- a/rsvg-marker.c
-+++ b/rsvg-marker.c
-@@ -84,7 +84,7 @@ rsvg_new_marker (void)
- {
-     RsvgMarker *marker;
-     marker = g_new (RsvgMarker, 1);
--    _rsvg_node_init (&marker->super);
-+    _rsvg_node_init (&marker->super, RSVG_NODE_TYPE_MARKER);
-     marker->orient = 0;
-     marker->orientAuto = FALSE;
-     marker->preserve_aspect_ratio = RSVG_ASPECT_RATIO_XMID_YMID;
-@@ -198,7 +198,7 @@ rsvg_marker_parse (const RsvgDefs * defs, const char *str)
-         val = rsvg_defs_lookup (defs, name);
-         g_free (name);
- 
--        if (val && (!strcmp (val->type->str, "marker")))
-+        if (val && RSVG_NODE_TYPE (val) == RSVG_NODE_TYPE_MARKER)
-             return val;
-     }
-     return NULL;
-diff --git a/rsvg-mask.c b/rsvg-mask.c
-index dd36a38..8e3cba3 100644
---- a/rsvg-mask.c
-+++ b/rsvg-mask.c
-@@ -74,7 +74,7 @@ rsvg_new_mask (void)
-     RsvgMask *mask;
- 
-     mask = g_new (RsvgMask, 1);
--    _rsvg_node_init (&mask->super);
-+    _rsvg_node_init (&mask->super, RSVG_NODE_TYPE_MASK);
-     mask->maskunits = objectBoundingBox;
-     mask->contentunits = userSpaceOnUse;
-     mask->x = _rsvg_css_parse_length ("0");
-@@ -113,7 +113,7 @@ rsvg_mask_parse (const RsvgDefs * defs, const char *str)
-         val = rsvg_defs_lookup (defs, name);
-         g_free (name);
- 
--        if (val && (!strcmp (val->type->str, "mask")))
-+        if (val && RSVG_NODE_TYPE (val) == RSVG_NODE_TYPE_MASK)
-             return val;
-     }
-     return NULL;
-@@ -130,7 +130,7 @@ rsvg_clip_path_parse (const RsvgDefs * defs, const char *str)
-         val = rsvg_defs_lookup (defs, name);
-         g_free (name);
- 
--        if (val && (!strcmp (val->type->str, "clipPath")))
-+        if (val && RSVG_NODE_TYPE (val) == RSVG_NODE_TYPE_CLIP_PATH)
-             return val;
-     }
-     return NULL;
-@@ -168,7 +168,7 @@ rsvg_new_clip_path (void)
-     RsvgClipPath *clip_path;
- 
-     clip_path = g_new (RsvgClipPath, 1);
--    _rsvg_node_init (&clip_path->super);
-+    _rsvg_node_init (&clip_path->super, RSVG_NODE_TYPE_CLIP_PATH);
-     clip_path->units = userSpaceOnUse;
-     clip_path->super.set_atts = rsvg_clip_path_set_atts;
-     clip_path->super.free = _rsvg_node_free;
-diff --git a/rsvg-paint-server.c b/rsvg-paint-server.c
-index 4967e03..7903684 100644
---- a/rsvg-paint-server.c
-+++ b/rsvg-paint-server.c
-@@ -129,11 +129,11 @@ rsvg_paint_server_parse (gboolean * inherit, const RsvgDefs * defs, const char *
- 
-         if (val == NULL)
-             return NULL;
--        if (!strcmp (val->type->str, "linearGradient"))
-+        if (RSVG_NODE_TYPE (val) == RSVG_NODE_TYPE_LINEAR_GRADIENT)
-             return rsvg_paint_server_lin_grad ((RsvgLinearGradient *) val);
--        else if (!strcmp (val->type->str, "radialGradient"))
-+        else if (RSVG_NODE_TYPE (val) == RSVG_NODE_TYPE_RADIAL_GRADIENT)
-             return rsvg_paint_server_rad_grad ((RsvgRadialGradient *) val);
--        else if (!strcmp (val->type->str, "pattern"))
-+        else if (RSVG_NODE_TYPE (val) == RSVG_NODE_TYPE_PATTERN)
-             return rsvg_paint_server_pattern ((RsvgPattern *) val);
-         else
-             return NULL;
-@@ -224,7 +224,7 @@ RsvgNode *
- rsvg_new_stop (void)
- {
-     RsvgGradientStop *stop = g_new (RsvgGradientStop, 1);
--    _rsvg_node_init (&stop->super);
-+    _rsvg_node_init (&stop->super, RSVG_NODE_TYPE_STOP);
-     stop->super.set_atts = rsvg_stop_set_atts;
-     stop->offset = 0;
-     stop->rgba = 0;
-@@ -293,7 +293,7 @@ rsvg_new_linear_gradient (void)
- {
-     RsvgLinearGradient *grad = NULL;
-     grad = g_new (RsvgLinearGradient, 1);
--    _rsvg_node_init (&grad->super);
-+    _rsvg_node_init (&grad->super, RSVG_NODE_TYPE_LINEAR_GRADIENT);
-     _rsvg_affine_identity (grad->affine);
-     grad->has_current_color = FALSE;
-     grad->x1 = grad->y1 = grad->y2 = _rsvg_css_parse_length ("0");
-@@ -376,7 +376,7 @@ rsvg_new_radial_gradient (void)
- {
- 
-     RsvgRadialGradient *grad = g_new (RsvgRadialGradient, 1);
--    _rsvg_node_init (&grad->super);
-+    _rsvg_node_init (&grad->super, RSVG_NODE_TYPE_RADIAL_GRADIENT);
-     _rsvg_affine_identity (grad->affine);
-     grad->has_current_color = FALSE;
-     grad->obj_bbox = TRUE;
-@@ -458,7 +458,7 @@ RsvgNode *
- rsvg_new_pattern (void)
- {
-     RsvgPattern *pattern = g_new (RsvgPattern, 1);
--    _rsvg_node_init (&pattern->super);
-+    _rsvg_node_init (&pattern->super, RSVG_NODE_TYPE_PATTERN);
-     pattern->obj_bbox = TRUE;
-     pattern->obj_cbbox = FALSE;
-     pattern->x = pattern->y = pattern->width = pattern->height = _rsvg_css_parse_length ("0");
-@@ -477,7 +477,8 @@ hasstop (GPtrArray * lookin)
- {
-     unsigned int i;
-     for (i = 0; i < lookin->len; i++) {
--        if (!strcmp (((RsvgNode *) g_ptr_array_index (lookin, i))->type->str, "stop"))
-+        RsvgNode *node = g_ptr_array_index (lookin, i);
-+        if (RSVG_NODE_TYPE (node) == RSVG_NODE_TYPE_STOP)
-             return 1;
-     }
-     return 0;
-@@ -490,7 +491,7 @@ rsvg_linear_gradient_fix_fallback (RsvgLinearGradient * grad)
-     int i;
-     ufallback = grad->fallback;
-     while (ufallback != NULL) {
--        if (!strcmp (ufallback->type->str, "linearGradient")) {
-+        if (RSVG_NODE_TYPE (ufallback) == RSVG_NODE_TYPE_LINEAR_GRADIENT) {
-             RsvgLinearGradient *fallback = (RsvgLinearGradient *) ufallback;
-             if (!grad->hasx1 && fallback->hasx1) {
-                 grad->hasx1 = TRUE;
-@@ -525,7 +526,7 @@ rsvg_linear_gradient_fix_fallback (RsvgLinearGradient * grad)
-                 grad->super.children = fallback->super.children;
-             }
-             ufallback = fallback->fallback;
--        } else if (!strcmp (ufallback->type->str, "radialGradient")) {
-+        } else if (RSVG_NODE_TYPE (ufallback) == RSVG_NODE_TYPE_RADIAL_GRADIENT) {
-             RsvgRadialGradient *fallback = (RsvgRadialGradient *) ufallback;
-             if (!grad->hastransform && fallback->hastransform) {
-                 grad->hastransform = TRUE;
-@@ -555,7 +556,7 @@ rsvg_radial_gradient_fix_fallback (RsvgRadialGradient * grad)
-     int i;
-     ufallback = grad->fallback;
-     while (ufallback != NULL) {
--        if (!strcmp (ufallback->type->str, "radialGradient")) {
-+        if (RSVG_NODE_TYPE (ufallback) == RSVG_NODE_TYPE_RADIAL_GRADIENT) {
-             RsvgRadialGradient *fallback = (RsvgRadialGradient *) ufallback;
-             if (!grad->hascx && fallback->hascx) {
-                 grad->hascx = TRUE;
-@@ -594,7 +595,7 @@ rsvg_radial_gradient_fix_fallback (RsvgRadialGradient * grad)
-                 grad->super.children = fallback->super.children;
-             }
-             ufallback = fallback->fallback;
--        } else if (!strcmp (ufallback->type->str, "linearGradient")) {
-+        } else if (RSVG_NODE_TYPE (ufallback) == RSVG_NODE_TYPE_LINEAR_GRADIENT) {
-             RsvgLinearGradient *fallback = (RsvgLinearGradient *) ufallback;
-             if (!grad->hastransform && fallback->hastransform) {
-                 grad->hastransform = TRUE;
-diff --git a/rsvg-private.h b/rsvg-private.h
-index 288c2de..162917a 100644
---- a/rsvg-private.h
-+++ b/rsvg-private.h
-@@ -255,16 +255,74 @@ struct RsvgSizeCallbackData {
- 
- void _rsvg_size_callback (int *width, int *height, gpointer data);
- 
-+typedef enum {
-+    RSVG_NODE_TYPE_INVALID = 0,
-+
-+    RSVG_NODE_TYPE_CHARS,
-+    RSVG_NODE_TYPE_CIRCLE,
-+    RSVG_NODE_TYPE_CLIP_PATH,
-+    RSVG_NODE_TYPE_COMPONENT_TRANFER_FUNCTION,
-+    RSVG_NODE_TYPE_DEFS,
-+    RSVG_NODE_TYPE_ELLIPSE,
-+    RSVG_NODE_TYPE_FILTER,
-+    RSVG_NODE_TYPE_GROUP,
-+    RSVG_NODE_TYPE_IMAGE,
-+    RSVG_NODE_TYPE_LIGHT_SOURCE,
-+    RSVG_NODE_TYPE_LINE,
-+    RSVG_NODE_TYPE_LINEAR_GRADIENT,
-+    RSVG_NODE_TYPE_MARKER,
-+    RSVG_NODE_TYPE_MASK,
-+    RSVG_NODE_TYPE_PATH,
-+    RSVG_NODE_TYPE_PATTERN,
-+    RSVG_NODE_TYPE_POLYGON,
-+    RSVG_NODE_TYPE_POLYLINE,
-+    RSVG_NODE_TYPE_RADIAL_GRADIENT,
-+    RSVG_NODE_TYPE_RECT,
-+    RSVG_NODE_TYPE_STOP,
-+    RSVG_NODE_TYPE_SVG,
-+    RSVG_NODE_TYPE_SWITCH,
-+    RSVG_NODE_TYPE_SYMBOL,
-+    RSVG_NODE_TYPE_TEXT,
-+    RSVG_NODE_TYPE_TREF,
-+    RSVG_NODE_TYPE_TSPAN,
-+    RSVG_NODE_TYPE_USE,
-+
-+    /* Filter primitives */
-+    RSVG_NODE_TYPE_FILTER_PRIMITIVE = 64,
-+    RSVG_NODE_TYPE_FILTER_PRIMITIVE_BLEND,
-+    RSVG_NODE_TYPE_FILTER_PRIMITIVE_COLOUR_MATRIX,
-+    RSVG_NODE_TYPE_FILTER_PRIMITIVE_COMPONENT_TRANSFER,
-+    RSVG_NODE_TYPE_FILTER_PRIMITIVE_COMPOSITE,
-+    RSVG_NODE_TYPE_FILTER_PRIMITIVE_CONVOLVE_MATRIX,
-+    RSVG_NODE_TYPE_FILTER_PRIMITIVE_DIFFUSE_LIGHTING,
-+    RSVG_NODE_TYPE_FILTER_PRIMITIVE_DISPLACEMENT_MAP,
-+    RSVG_NODE_TYPE_FILTER_PRIMITIVE_ERODE,
-+    RSVG_NODE_TYPE_FILTER_PRIMITIVE_FLOOD,
-+    RSVG_NODE_TYPE_FILTER_PRIMITIVE_GAUSSIAN_BLUR,
-+    RSVG_NODE_TYPE_FILTER_PRIMITIVE_IMAGE,
-+    RSVG_NODE_TYPE_FILTER_PRIMITIVE_MERGE,
-+    RSVG_NODE_TYPE_FILTER_PRIMITIVE_MERGE_NODE,
-+    RSVG_NODE_TYPE_FILTER_PRIMITIVE_OFFSET,
-+    RSVG_NODE_TYPE_FILTER_PRIMITIVE_SPECULAR_LIGHTING,
-+    RSVG_NODE_TYPE_FILTER_PRIMITIVE_TILE,
-+    RSVG_NODE_TYPE_FILTER_PRIMITIVE_TURBULENCE,
-+
-+} RsvgNodeType;
-+
- struct _RsvgNode {
-     RsvgState *state;
-     RsvgNode *parent;
--    GString *type;
-     GPtrArray *children;
-+    RsvgNodeType type;
-+    const char *name; /* owned by the xmlContext, invalid after parsing! */
-     void (*free) (RsvgNode * self);
-     void (*draw) (RsvgNode * self, RsvgDrawingCtx * ctx, int dominate);
-     void (*set_atts) (RsvgNode * self, RsvgHandle * ctx, RsvgPropertyBag *);
- };
- 
-+#define RSVG_NODE_TYPE(node)                ((node)->type)
-+#define RSVG_NODE_IS_FILTER_PRIMITIVE(node) (RSVG_NODE_TYPE((node)) & RSVG_NODE_TYPE_FILTER_PRIMITIVE)
-+
- struct _RsvgNodeChars {
-     RsvgNode super;
-     GString *contents;
-diff --git a/rsvg-shapes.c b/rsvg-shapes.c
-index d481abf..07baf24 100644
---- a/rsvg-shapes.c
-+++ b/rsvg-shapes.c
-@@ -89,7 +89,7 @@ rsvg_new_path (void)
- {
-     RsvgNodePath *path;
-     path = g_new (RsvgNodePath, 1);
--    _rsvg_node_init (&path->super);
-+    _rsvg_node_init (&path->super, RSVG_NODE_TYPE_PATH);
-     path->d = NULL;
-     path->super.free = rsvg_node_path_free;
-     path->super.draw = rsvg_node_path_draw;
-@@ -101,7 +101,6 @@ rsvg_new_path (void)
- struct _RsvgNodePoly {
-     RsvgNode super;
-     gdouble *pointlist;
--    gboolean is_polyline;
-     guint pointlist_len;
- };
- 
-@@ -126,7 +125,8 @@ _rsvg_node_poly_set_atts (RsvgNode * self, RsvgHandle * ctx, RsvgPropertyBag * a
-             rsvg_defs_register_name (ctx->priv->defs, value, self);
-         }
- 
--        rsvg_parse_style_attrs (ctx, self->state, (poly->is_polyline ? "polyline" : "polygon"),
-+        rsvg_parse_style_attrs (ctx, self->state,
-+                                RSVG_NODE_TYPE (self) == RSVG_NODE_TYPE_POLYLINE ? "polyline" : "polygon",
-                                 klazz, id, atts);
-     }
- 
-@@ -160,7 +160,7 @@ _rsvg_node_poly_draw (RsvgNode * self, RsvgDrawingCtx * ctx, int dominate)
-         g_string_append (d, g_ascii_dtostr (buf, sizeof (buf), poly->pointlist[i + 1]));
-     }
- 
--    if (!poly->is_polyline)
-+    if (RSVG_NODE_TYPE (self) == RSVG_NODE_TYPE_POLYGON)
-         g_string_append (d, " Z");
- 
-     rsvg_state_reinherit_top (ctx, self->state, dominate);
-@@ -181,16 +181,15 @@ _rsvg_node_poly_free (RsvgNode * self)
- 
- 
- static RsvgNode *
--rsvg_new_any_poly (gboolean is_polyline)
-+rsvg_new_any_poly (RsvgNodeType type)
- {
-     RsvgNodePoly *poly;
-     poly = g_new (RsvgNodePoly, 1);
--    _rsvg_node_init (&poly->super);
-+    _rsvg_node_init (&poly->super, type);
-     poly->super.free = _rsvg_node_poly_free;
-     poly->super.draw = _rsvg_node_poly_draw;
-     poly->super.set_atts = _rsvg_node_poly_set_atts;
-     poly->pointlist = NULL;
--    poly->is_polyline = is_polyline;
-     poly->pointlist_len = 0;
-     return &poly->super;
- }
-@@ -198,13 +197,13 @@ rsvg_new_any_poly (gboolean is_polyline)
- RsvgNode *
- rsvg_new_polygon (void)
- {
--    return rsvg_new_any_poly (FALSE);
-+    return rsvg_new_any_poly (RSVG_NODE_TYPE_POLYGON);
- }
- 
- RsvgNode *
- rsvg_new_polyline (void)
- {
--    return rsvg_new_any_poly (TRUE);
-+    return rsvg_new_any_poly (RSVG_NODE_TYPE_POLYLINE);
- }
- 
- 
-@@ -275,7 +274,7 @@ rsvg_new_line (void)
- {
-     RsvgNodeLine *line;
-     line = g_new (RsvgNodeLine, 1);
--    _rsvg_node_init (&line->super);
-+    _rsvg_node_init (&line->super, RSVG_NODE_TYPE_LINE);
-     line->super.draw = _rsvg_node_line_draw;
-     line->super.set_atts = _rsvg_node_line_set_atts;
-     line->x1 = line->x2 = line->y1 = line->y2 = _rsvg_css_parse_length ("0");
-@@ -451,7 +450,7 @@ rsvg_new_rect (void)
- {
-     RsvgNodeRect *rect;
-     rect = g_new (RsvgNodeRect, 1);
--    _rsvg_node_init (&rect->super);
-+    _rsvg_node_init (&rect->super, RSVG_NODE_TYPE_RECT);
-     rect->super.draw = _rsvg_node_rect_draw;
-     rect->super.set_atts = _rsvg_node_rect_set_atts;
-     rect->x = rect->y = rect->w = rect->h = rect->rx = rect->ry = _rsvg_css_parse_length ("0");
-@@ -577,7 +576,7 @@ rsvg_new_circle (void)
- {
-     RsvgNodeCircle *circle;
-     circle = g_new (RsvgNodeCircle, 1);
--    _rsvg_node_init (&circle->super);
-+    _rsvg_node_init (&circle->super, RSVG_NODE_TYPE_CIRCLE);
-     circle->super.draw = _rsvg_node_circle_draw;
-     circle->super.set_atts = _rsvg_node_circle_set_atts;
-     circle->cx = circle->cy = circle->r = _rsvg_css_parse_length ("0");
-@@ -703,7 +702,7 @@ rsvg_new_ellipse (void)
- {
-     RsvgNodeEllipse *ellipse;
-     ellipse = g_new (RsvgNodeEllipse, 1);
--    _rsvg_node_init (&ellipse->super);
-+    _rsvg_node_init (&ellipse->super, RSVG_NODE_TYPE_ELLIPSE);
-     ellipse->super.draw = _rsvg_node_ellipse_draw;
-     ellipse->super.set_atts = _rsvg_node_ellipse_set_atts;
-     ellipse->cx = ellipse->cy = ellipse->rx = ellipse->ry = _rsvg_css_parse_length ("0");
-diff --git a/rsvg-shapes.h b/rsvg-shapes.h
-index 7cf6621..baad98f 100644
---- a/rsvg-shapes.h
-+++ b/rsvg-shapes.h
-@@ -34,7 +34,7 @@
- 
- G_BEGIN_DECLS 
- 
--RsvgNode * rsvg_new_path (void);
-+RsvgNode *rsvg_new_path (void);
- RsvgNode *rsvg_new_polygon (void);
- RsvgNode *rsvg_new_polyline (void);
- RsvgNode *rsvg_new_line (void);
-diff --git a/rsvg-structure.c b/rsvg-structure.c
-index b078fea..33889be 100644
---- a/rsvg-structure.c
-+++ b/rsvg-structure.c
-@@ -103,8 +103,10 @@ _rsvg_node_dont_set_atts (RsvgNode * node, RsvgHandle * ctx, RsvgPropertyBag * a
- }
- 
- void
--_rsvg_node_init (RsvgNode * self)
-+_rsvg_node_init (RsvgNode * self,
-+                 RsvgNodeType type)
- {
-+    self->type = type;
-     self->parent = NULL;
-     self->children = g_ptr_array_new ();
-     self->state = g_new (RsvgState, 1);
-@@ -112,7 +114,6 @@ _rsvg_node_init (RsvgNode * self)
-     self->free = _rsvg_node_free;
-     self->draw = _rsvg_node_draw_nothing;
-     self->set_atts = _rsvg_node_dont_set_atts;
--    self->type = NULL;
- }
- 
- void
-@@ -124,8 +125,6 @@ _rsvg_node_finalize (RsvgNode * self)
-     }
-     if (self->children != NULL)
-         g_ptr_array_free (self->children, TRUE);
--    if (self->type != NULL)
--        g_string_free (self->type, TRUE);
- }
- 
- void
-@@ -157,7 +156,7 @@ rsvg_new_group (void)
- {
-     RsvgNodeGroup *group;
-     group = g_new (RsvgNodeGroup, 1);
--    _rsvg_node_init (&group->super);
-+    _rsvg_node_init (&group->super, RSVG_NODE_TYPE_GROUP);
-     group->super.draw = _rsvg_node_draw_children;
-     group->super.set_atts = rsvg_node_group_set_atts;
-     return &group->super;
-@@ -166,8 +165,8 @@ rsvg_new_group (void)
- void
- rsvg_pop_def_group (RsvgHandle * ctx)
- {
--    if (ctx->priv->currentnode != NULL)
--        ctx->priv->currentnode = ctx->priv->currentnode->parent;
-+    g_assert (ctx->priv->currentnode != NULL);
-+    ctx->priv->currentnode = ctx->priv->currentnode->parent;
- }
- 
- void
-@@ -218,7 +217,7 @@ rsvg_node_use_draw (RsvgNode * self, RsvgDrawingCtx * ctx, int dominate)
-         return;
- 
-     state = rsvg_current_state (ctx);
--    if (strcmp (child->type->str, "symbol")) {
-+    if (RSVG_NODE_TYPE (child) != RSVG_NODE_TYPE_SYMBOL) {
-         _rsvg_affine_translate (affine, x, y);
-         _rsvg_affine_multiply (state->affine, affine, state->affine);
- 
-@@ -397,7 +396,7 @@ rsvg_new_svg (void)
- {
-     RsvgNodeSvg *svg;
-     svg = g_new (RsvgNodeSvg, 1);
--    _rsvg_node_init (&svg->super);
-+    _rsvg_node_init (&svg->super, RSVG_NODE_TYPE_SVG);
-     svg->vbox.active = FALSE;
-     svg->preserve_aspect_ratio = RSVG_ASPECT_RATIO_XMID_YMID;
-     svg->x = _rsvg_css_parse_length ("0");
-@@ -444,7 +443,7 @@ rsvg_new_use (void)
- {
-     RsvgNodeUse *use;
-     use = g_new (RsvgNodeUse, 1);
--    _rsvg_node_init (&use->super);
-+    _rsvg_node_init (&use->super, RSVG_NODE_TYPE_USE);
-     use->super.draw = rsvg_node_use_draw;
-     use->super.set_atts = rsvg_node_use_set_atts;
-     use->x = _rsvg_css_parse_length ("0");
-@@ -485,7 +484,7 @@ rsvg_new_symbol (void)
- {
-     RsvgNodeSymbol *symbol;
-     symbol = g_new (RsvgNodeSymbol, 1);
--    _rsvg_node_init (&symbol->super);
-+    _rsvg_node_init (&symbol->super, RSVG_NODE_TYPE_SYMBOL);
-     symbol->vbox.active = FALSE;
-     symbol->preserve_aspect_ratio = RSVG_ASPECT_RATIO_XMID_YMID;
-     symbol->super.draw = _rsvg_node_draw_nothing;
-@@ -498,7 +497,7 @@ rsvg_new_defs (void)
- {
-     RsvgNodeGroup *group;
-     group = g_new (RsvgNodeGroup, 1);
--    _rsvg_node_init (&group->super);
-+    _rsvg_node_init (&group->super, RSVG_NODE_TYPE_DEFS);
-     group->super.draw = _rsvg_node_draw_nothing;
-     group->super.set_atts = rsvg_node_group_set_atts;
-     return &group->super;
-@@ -533,7 +532,7 @@ rsvg_new_switch (void)
- {
-     RsvgNodeGroup *group;
-     group = g_new (RsvgNodeGroup, 1);
--    _rsvg_node_init (&group->super);
-+    _rsvg_node_init (&group->super, RSVG_NODE_TYPE_SWITCH);
-     group->super.draw = _rsvg_node_switch_draw;
-     group->super.set_atts = rsvg_node_group_set_atts;
-     return &group->super;
-diff --git a/rsvg-structure.h b/rsvg-structure.h
-index d672977..7d17c82 100644
---- a/rsvg-structure.h
-+++ b/rsvg-structure.h
-@@ -36,7 +36,7 @@
- 
- G_BEGIN_DECLS 
- 
--RsvgNode * rsvg_new_use (void);
-+RsvgNode *rsvg_new_use (void);
- RsvgNode *rsvg_new_symbol (void);
- RsvgNode *rsvg_new_svg (void);
- RsvgNode *rsvg_new_defs (void);
-@@ -50,6 +50,7 @@ typedef struct _RsvgNodeSvg RsvgNodeSvg;
- 
- struct _RsvgNodeGroup {
-     RsvgNode super;
-+    char *name;
- };
- 
- struct _RsvgNodeSymbol {
-@@ -80,7 +81,7 @@ void rsvg_node_draw         (RsvgNode * self, RsvgDrawingCtx * ctx, int dominate
- void _rsvg_node_draw_children   (RsvgNode * self, RsvgDrawingCtx * ctx, int dominate);
- void _rsvg_node_finalize    (RsvgNode * self);
- void _rsvg_node_free        (RsvgNode * self);
--void _rsvg_node_init        (RsvgNode * self);
-+void _rsvg_node_init        (RsvgNode * self, RsvgNodeType type);
- void _rsvg_node_svg_apply_atts  (RsvgNodeSvg * self, RsvgHandle * ctx);
- 
- G_END_DECLS
-diff --git a/rsvg-text.c b/rsvg-text.c
-index 7066f24..89720de 100644
---- a/rsvg-text.c
-+++ b/rsvg-text.c
-@@ -170,17 +170,19 @@ _rsvg_node_text_type_children (RsvgNode * self, RsvgDrawingCtx * ctx,
-     rsvg_push_discrete_layer (ctx);
-     for (i = 0; i < self->children->len; i++) {
-         RsvgNode *node = g_ptr_array_index (self->children, i);
--        if (!strcmp (node->type->str, "RSVG_NODE_CHARS")) {
-+        RsvgNodeType type = RSVG_NODE_TYPE (node);
-+
-+        if (type == RSVG_NODE_TYPE_CHARS) {
-             RsvgNodeChars *chars = (RsvgNodeChars *) node;
-             GString *str = _rsvg_text_chomp (rsvg_current_state (ctx), chars->contents, lastwasspace);
-             rsvg_text_render_text (ctx, str->str, x, y);
-             g_string_free (str, TRUE);
--        } else if (!strcmp (node->type->str, "tspan")) {
-+        } else if (type == RSVG_NODE_TYPE_TSPAN) {
-             RsvgNodeText *tspan = (RsvgNodeText *) node;
-             rsvg_state_push (ctx);
-             _rsvg_node_text_type_tspan (tspan, ctx, x, y, lastwasspace);
-             rsvg_state_pop (ctx);
--        } else if (!strcmp (node->type->str, "tref")) {
-+        } else if (type == RSVG_NODE_TYPE_TREF) {
-             RsvgNodeTref *tref = (RsvgNodeTref *) node;
-             _rsvg_node_text_type_tref (tref, ctx, x, y, lastwasspace);
-         }
-@@ -206,17 +208,19 @@ _rsvg_node_text_length_children (RsvgNode * self, RsvgDrawingCtx * ctx,
-     int out = FALSE;
-     for (i = 0; i < self->children->len; i++) {
-         RsvgNode *node = g_ptr_array_index (self->children, i);
-+        RsvgNodeType type = RSVG_NODE_TYPE (node);
-+
-         rsvg_state_push (ctx);
-         rsvg_state_reinherit_top (ctx, node->state, 0);
--        if (!strcmp (node->type->str, "RSVG_NODE_CHARS")) {
-+        if (type == RSVG_NODE_TYPE_CHARS) {
-             RsvgNodeChars *chars = (RsvgNodeChars *) node;
-             GString *str = _rsvg_text_chomp (rsvg_current_state (ctx), chars->contents, lastwasspace);
-             *x += rsvg_text_length_text_as_string (ctx, str->str);
-             g_string_free (str, TRUE);
--        } else if (!strcmp (node->type->str, "tspan")) {
-+        } else if (type == RSVG_NODE_TYPE_TSPAN) {
-             RsvgNodeText *tspan = (RsvgNodeText *) node;
-             out = _rsvg_node_text_length_tspan (tspan, ctx, x, lastwasspace);
--        } else if (!strcmp (node->type->str, "tref")) {
-+        } else if (type == RSVG_NODE_TYPE_TREF) {
-             RsvgNodeTref *tref = (RsvgNodeTref *) node;
-             out = _rsvg_node_text_length_tref (tref, ctx, x, lastwasspace);
-         }
-@@ -259,7 +263,7 @@ rsvg_new_text (void)
- {
-     RsvgNodeText *text;
-     text = g_new (RsvgNodeText, 1);
--    _rsvg_node_init (&text->super);
-+    _rsvg_node_init (&text->super, RSVG_NODE_TYPE_TEXT);
-     text->super.draw = _rsvg_node_text_draw;
-     text->super.set_atts = _rsvg_node_text_set_atts;
-     text->x = text->y = text->dx = text->dy = _rsvg_css_parse_length ("0");
-@@ -331,7 +335,7 @@ rsvg_new_tspan (void)
- {
-     RsvgNodeText *text;
-     text = g_new (RsvgNodeText, 1);
--    _rsvg_node_init (&text->super);
-+    _rsvg_node_init (&text->super, RSVG_NODE_TYPE_TSPAN);
-     text->super.set_atts = _rsvg_node_tspan_set_atts;
-     text->x.factor = text->y.factor = 'n';
-     text->dx = text->dy = _rsvg_css_parse_length ("0");
-@@ -374,7 +378,7 @@ rsvg_new_tref (void)
- {
-     RsvgNodeTref *text;
-     text = g_new (RsvgNodeTref, 1);
--    _rsvg_node_init (&text->super);
-+    _rsvg_node_init (&text->super, RSVG_NODE_TYPE_TREF);
-     text->super.set_atts = _rsvg_node_tref_set_atts;
-     text->link = NULL;
-     return &text->super;
--- 
-1.7.0.5
-
diff --git a/meta/recipes-gnome/librsvg/librsvg/gtk-option.patch b/meta/recipes-gnome/librsvg/librsvg/gtk-option.patch
new file mode 100644
index 0000000..9185041
--- /dev/null
+++ b/meta/recipes-gnome/librsvg/librsvg/gtk-option.patch
@@ -0,0 +1,59 @@
+From 18917f7fd3160afe06019f4b6234aeb78a3fdb4e Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 19 Nov 2013 16:00:29 +0000
+Subject: [PATCH] configure: add option to enable/disable use of GTK+
+
+Distro packagers like predictability and automatically detected optional
+dependencies are not predicable.  Add a --with-gtk3 option (default to "auto")
+for forcibly controlling whether GTK+ will be used or not.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+https://bugzilla.gnome.org/show_bug.cgi?id=712693
+---
+ configure.in |   17 +++++++++++------
+ 1 file changed, 11 insertions(+), 6 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index f7a89dc..1498f72 100644
+--- a/configure.in
++++ b/configure.in
+@@ -119,17 +119,22 @@ AC_CHECK_FUNCS(strtok_r)
+ # GTK
+ # ===========================================================================
+ 
+-PKG_CHECK_MODULES([GTK3],[gtk+-3.0 >= $GTK3_REQUIRED],[have_gtk_3=yes],[have_gtk_3=no])
+-
+ GTK3_BINARY_VERSION=
+ 
+-if test "$have_gtk_3" = "yes"; then
+-    GTK3_BINARY_VERSION="`$PKG_CONFIG --variable=gtk_binary_version gtk+-3.0`"
++AC_MSG_CHECKING([whether to use GTK+ 3])
++AC_ARG_WITH([gtk3],
++  [AS_HELP_STRING([--without-gtk3],[Don't build GTK+3 tools (default=auto)])],
++  [],[PKG_CHECK_EXISTS([gtk+-3.0 >= $GTK3_REQUIRED],[with_gtk3=yes],[with_gtk3=no])])
++AC_MSG_RESULT([$with_gtk3])
++
++if test "$with_gtk3" = "yes"; then
++  PKG_CHECK_MODULES(GTK3, [gtk+-3.0 >= $GTK3_REQUIRED])
++  GTK3_BINARY_VERSION="`$PKG_CONFIG --variable=gtk_binary_version gtk+-3.0`"
+ fi
+ 
+ AC_SUBST([GTK3_BINARY_VERSION])
+ 
+-AM_CONDITIONAL([HAVE_GTK_3],[test "$have_gtk_3" = "yes"])
++AM_CONDITIONAL([HAVE_GTK_3],[test "$with_gtk3" = "yes"])
+ 
+ dnl ===========================================================================
+ dnl GDK-Pixbuf SVG loader
+@@ -305,6 +310,6 @@ librsvg-$VERSION
+ 	Build introspectable bindings:  ${found_introspection}
+ 	Build Vala bindings:            ${enable_vala}
+ 	Build GdkPixbuf loader:         ${enable_pixbuf_loader}
+-        GTK 3.0:                        ${have_gtk_3}
++        GTK 3.0:                        ${with_gtk3}
+ 	Build miscellaenous tools:      ${build_misc_tools}
+ "
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-gnome/librsvg/librsvg/local-m4.patch b/meta/recipes-gnome/librsvg/librsvg/local-m4.patch
new file mode 100644
index 0000000..e523076
--- /dev/null
+++ b/meta/recipes-gnome/librsvg/librsvg/local-m4.patch
@@ -0,0 +1,32 @@
+This patch is required to make autoreconf use the local macros (so that it can
+autoreconf without vala being installed).
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 6c3b8eee243204678574e162b7d480f6f83b71e6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Germ=C3=A1n=20Poo-Caama=C3=B1o?= <gpoo@gnome.org>
+Date: Tue, 29 Oct 2013 13:05:39 -0700
+Subject: [PATCH] build: Use local macros to detect vala
+
+Fixes build when vala < 0.19 is present.
+---
+ Makefile.am |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index d95f008..e881100 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -3,7 +3,7 @@ SUBDIRS = . gdk-pixbuf-loader tests tools doc
+ NULL =
+ BUILT_SOURCES =
+ 
+-ACLOCAL_AMFLAGS = ${ACLOCAL_FLAGS}
++ACLOCAL_AMFLAGS = ${ACLOCAL_FLAGS} -I m4
+ 
+ lib_LTLIBRARIES = librsvg-@RSVG_API_MAJOR_VERSION@.la
+ 
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-gnome/librsvg/librsvg/vapigen.m4 b/meta/recipes-gnome/librsvg/librsvg/vapigen.m4
new file mode 100644
index 0000000..f2df12f
--- /dev/null
+++ b/meta/recipes-gnome/librsvg/librsvg/vapigen.m4
@@ -0,0 +1,96 @@
+dnl vapigen.m4
+dnl
+dnl Copyright 2012 Evan Nemerson
+dnl
+dnl This library is free software; you can redistribute it and/or
+dnl modify it under the terms of the GNU Lesser General Public
+dnl License as published by the Free Software Foundation; either
+dnl version 2.1 of the License, or (at your option) any later version.
+dnl
+dnl This library is distributed in the hope that it will be useful,
+dnl but WITHOUT ANY WARRANTY; without even the implied warranty of
+dnl MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+dnl Lesser General Public License for more details.
+dnl
+dnl You should have received a copy of the GNU Lesser General Public
+dnl License along with this library; if not, write to the Free Software
+dnl Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
+
+# VAPIGEN_CHECK([VERSION], [API_VERSION], [FOUND-INTROSPECTION], [DEFAULT])
+# --------------------------------------
+# Check vapigen existence and version
+#
+# See http://live.gnome.org/Vala/UpstreamGuide for detailed documentation
+AC_DEFUN([VAPIGEN_CHECK],
+[
+  AC_BEFORE([GOBJECT_INTROSPECTION_CHECK],[$0])
+  AC_BEFORE([GOBJECT_INTROSPECTION_REQUIRE],[$0])
+
+  AC_ARG_ENABLE([vala],
+    [AS_HELP_STRING([--enable-vala[=@<:@no/auto/yes@:>@]],[build Vala bindings @<:@default=]ifelse($4,,auto,$4)[@:>@])],,[
+      AS_IF([test "x$4" = "x"], [
+          enable_vala=auto
+        ], [
+          enable_vala=$4
+        ])
+    ])
+
+  AS_CASE([$enable_vala], [no], [enable_vala=no],
+      [yes], [
+        AS_IF([test "x$3" != "xyes" -a "x$found_introspection" != "xyes"], [
+            AC_MSG_ERROR([Vala bindings require GObject Introspection])
+          ])
+      ], [auto], [
+        AS_IF([test "x$3" != "xyes" -a "x$found_introspection" != "xyes"], [
+            enable_vala=no
+          ])
+      ], [
+        AC_MSG_ERROR([Invalid argument passed to --enable-vala, should be one of @<:@no/auto/yes@:>@])
+      ])
+
+  AS_IF([test "x$2" = "x"], [
+      vapigen_pkg_name=vapigen
+    ], [
+      vapigen_pkg_name=vapigen-$2
+    ])
+  AS_IF([test "x$1" = "x"], [
+      vapigen_pkg="$vapigen_pkg_name"
+    ], [
+      vapigen_pkg="$vapigen_pkg_name >= $1"
+    ])
+
+  PKG_PROG_PKG_CONFIG
+
+  PKG_CHECK_EXISTS([$vapigen_pkg], [
+      AS_IF([test "$enable_vala" = "auto"], [
+          enable_vala=yes
+        ])
+    ], [
+      AS_CASE([$enable_vala], [yes], [
+          AC_MSG_ERROR([$vapigen_pkg not found])
+        ], [auto], [
+          enable_vala=no
+        ])
+    ])
+
+  AC_MSG_CHECKING([for vala])
+
+  AS_CASE([$enable_vala],
+    [yes], [
+      VAPIGEN=`$PKG_CONFIG --variable=vapigen vapigen`
+      VAPIGEN_MAKEFILE=`$PKG_CONFIG --variable=datadir vapigen`/vala/Makefile.vapigen
+      AS_IF([test "x$2" = "x"], [
+          VAPIGEN_VAPIDIR=`$PKG_CONFIG --variable=vapidir vapigen`
+        ], [
+          VAPIGEN_VAPIDIR=`$PKG_CONFIG --variable=vapidir_versioned vapigen`
+        ])
+    ])
+
+  AC_MSG_RESULT([$enable_vala])
+
+  AC_SUBST([VAPIGEN])
+  AC_SUBST([VAPIGEN_VAPIDIR])
+  AC_SUBST([VAPIGEN_MAKEFILE])
+
+  AM_CONDITIONAL(ENABLE_VAPIGEN, test "x$enable_vala" = "xyes")
+])
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
deleted file mode 100644
index 4818422..0000000
--- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
+++ /dev/null
@@ -1,58 +0,0 @@
-DESCRIPTION = "Library for rendering SVG files"
-HOMEPAGE = "http://ftp.gnome.org/pub/GNOME/sources/librsvg/"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-
-LICENSE = "LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://rsvg.h;beginline=3;endline=24;md5=20b4113c4909bbf0d67e006778302bc6"
-
-SECTION = "x11/utils"
-DEPENDS = "cairo glib-2.0 gdk-pixbuf fontconfig freetype libxml2 pango"
-DEPENDS += "gdk-pixbuf-native"
-BBCLASSEXTEND = "native"
-
-PR = "r12"
-
-inherit autotools pkgconfig gnomebase gtk-doc pixbufcache
-
-SRC_URI += "file://doc_Makefile.patch \
-            file://librsvg-CVE-2011-3146.patch \
-           "
-
-SRC_URI[archive.md5sum] = "4b00d0fee130c936644892c152f42db7"
-SRC_URI[archive.sha256sum] = "91b98051f352fab8a6257688d6b2fd665b4648ed66144861f2f853ccf876d334"
-
-EXTRA_OECONF = "--without-svgz"
-
-PACKAGECONFIG ??= "croco gdkpixbuf"
-
-# Support embedded CSS stylesheets (recommended upstream)
-PACKAGECONFIG[croco] = "--with-croco,--without-croco,libcroco"
-# gdk-pixbuf loader
-PACKAGECONFIG[gdkpixbuf] = "--enable-pixbuf-loader,--disable-pixbuf-loader"
-# GTK+ 2 theme engine
-PACKAGECONFIG[gtk] = "--enable-gtk-theme,--disable-gtk-theme,gtk+"
-
-PACKAGES =+ "librsvg-gtk librsvg-gtk-dbg librsvg-gtk-dev rsvg"
-FILES_${PN} = "${libdir}/*.so.*"
-FILES_${PN}-staticdev += "${libdir}/gdk-pixbuf-2.0/*.a ${libdir}/gdk-pixbuf-2.0/*/*/*.a \
-                          ${libdir}/gtk-2.0/*.a ${libdir}/gtk-2.0/*/*/*.a"
-FILES_rsvg = "${bindir}/rsvg \
-	      ${bindir}/rsvg-view \
-	      ${bindir}/rsvg-convert \
-	      ${datadir}/pixmaps/svg-viewer.svg \
-	      ${datadir}/themes"
-FILES_librsvg-gtk = "${libdir}/gtk-2.0/*/*/*.so ${libdir}/gdk-pixbuf-2.0/*/*/*.so"
-FILES_librsvg-gtk-dev += "${libdir}/gtk-2.0/*.la \
-			  ${libdir}/gtk-2.0/*/*/*.la \
-			  ${libdir}/gdk-pixbuf-2.0/*.la \
-			  ${libdir}/gdk-pixbuf-2.0/*/*/*.la"
-FILES_librsvg-gtk-dbg += "${libdir}/gdk-pixbuf-2.0/.debug \
-                          ${libdir}/gdk-pixbuf-2.0/*/*/.debug \
-                          ${libdir}/gtk-2.0/.debug \
-                          ${libdir}/gtk-2.0/*/*/.debug"
-
-PIXBUF_PACKAGES = "librsvg-gtk"
-PARALLEL_MAKE = ""
-
-PIXBUFCACHE_SYSROOT_DEPS_append_class-native = " harfbuzz-native:do_populate_sysroot_setscene pango-native:do_populate_sysroot_setscene icu-native:do_populate_sysroot_setscene"
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.0.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.0.bb
new file mode 100644
index 0000000..143d1ef
--- /dev/null
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.0.bb
@@ -0,0 +1,56 @@
+DESCRIPTION = "Library for rendering SVG files"
+HOMEPAGE = "http://ftp.gnome.org/pub/GNOME/sources/librsvg/"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://rsvg.h;beginline=3;endline=24;md5=20b4113c4909bbf0d67e006778302bc6"
+
+SECTION = "x11/utils"
+DEPENDS = "gdk-pixbuf-native cairo gdk-pixbuf glib-2.0 libcroco libxml2 pango"
+BBCLASSEXTEND = "native"
+
+inherit autotools pkgconfig gnomebase gtk-doc pixbufcache
+
+GNOME_COMPRESS_TYPE = "xz"
+
+SRC_URI += "file://gtk-option.patch \
+            file://local-m4.patch \
+            file://vapigen.m4"
+
+SRC_URI[archive.md5sum] = "e16a84e9a86a18e5ca6ba95c512db6c6"
+SRC_URI[archive.sha256sum] = "8f7db31df235813dbd035888035cf862d682e7cc5706c4e7ec05750d3f64a2f9"
+
+EXTRA_OECONF = "--disable-introspection --disable-vala"
+
+PACKAGECONFIG ??= "gdkpixbuf"
+# The gdk-pixbuf loader
+PACKAGECONFIG[gdkpixbuf] = "--enable-pixbuf-loader,--disable-pixbuf-loader"
+# GTK+ test application (rsvg-view)
+PACKAGECONFIG[gtk] = "--with-gtk3,--without-gtk3,gtk+3"
+
+# 2.40.1 should ship the tarball with local m4 macros, but until then drop a
+# vapigen in there so we don't need to build vala to configure.
+do_configure_prepend() {
+	if test ! -e ${S}/m4/vapigen.m4; then
+		mkdir --parents ${S}/m4
+		mv ${WORKDIR}/vapigen.m4 ${S}/m4/
+	fi
+}
+
+do_install_append() {
+	# Loadable modules don't need .a or .la on Linux
+	rm -f ${D}${libdir}/gdk-pixbuf-2.0/*/loaders/*.a ${D}${libdir}/gdk-pixbuf-2.0/*/loaders/*.la
+}
+
+PACKAGES =+ "librsvg-gtk rsvg"
+FILES_${PN} = "${libdir}/*.so.*"
+FILES_${PN}-dbg += "${libdir}/gdk-pixbuf-2.0/*/loaders/.debug"
+FILES_rsvg = "${bindir}/rsvg* \
+	      ${datadir}/pixmaps/svg-viewer.svg \
+	      ${datadir}/themes"
+FILES_librsvg-gtk = "${libdir}/gdk-pixbuf-2.0/*/*/*.so"
+
+PIXBUF_PACKAGES = "librsvg-gtk"
+
+PIXBUFCACHE_SYSROOT_DEPS_append_class-native = " harfbuzz-native:do_populate_sysroot_setscene pango-native:do_populate_sysroot_setscene icu-native:do_populate_sysroot_setscene"
-- 
1.7.10.4


