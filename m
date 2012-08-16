Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T24ty-0008KI-DL
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 20:34:38 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Aug 2012 11:22:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,780,1336374000"; d="scan'208";a="209470982"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by fmsmga002.fm.intel.com with ESMTP; 16 Aug 2012 11:22:28 -0700
Message-ID: <502D3A64.6000904@linux.intel.com>
Date: Thu, 16 Aug 2012 11:22:28 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1344258422-32173-1-git-send-email-radu.moisan@intel.com>
In-Reply-To: <1344258422-32173-1-git-send-email-radu.moisan@intel.com>
Subject: Re: [PATCH] pango: upgrade to upstream stable 1.30.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Aug 2012 18:34:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/06/2012 06:07 AM, Radu Moisan wrote:
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>   .../pango/pango-1.28.4/noconst.patch               |  408 --------------------
>   .../multilib-fix-clean.patch                       |    0
>   .../{pango-1.28.4 => pango-1.30.0}/no-tests.patch  |   14 +-
>   .../pango/{pango_1.28.4.bb => pango_1.30.0.bb}     |    9 +-
>   4 files changed, 10 insertions(+), 421 deletions(-)
>   delete mode 100644 meta/recipes-graphics/pango/pango-1.28.4/noconst.patch
>   rename meta/recipes-graphics/pango/{pango-1.28.4 => pango-1.30.0}/multilib-fix-clean.patch (100%)
>   rename meta/recipes-graphics/pango/{pango-1.28.4 => pango-1.30.0}/no-tests.patch (33%)
>   rename meta/recipes-graphics/pango/{pango_1.28.4.bb => pango_1.30.0.bb} (49%)
>

Merged into OE-Core

Thanks
	Sau!

> diff --git a/meta/recipes-graphics/pango/pango-1.28.4/noconst.patch b/meta/recipes-graphics/pango/pango-1.28.4/noconst.patch
> deleted file mode 100644
> index d4832a5..0000000
> --- a/meta/recipes-graphics/pango/pango-1.28.4/noconst.patch
> +++ /dev/null
> @@ -1,408 +0,0 @@
> -G_CONST_RETURN is deprecated in glib 2.30 so remove to to avoid
> -build failures.
> -
> -RP 2011/10/12
> -
> -Upstream-Status: Pending
> -
> -Index: pango-1.28.4/pango/fonts.c
> -===================================================================
> ---- pango-1.28.4.orig/pango/fonts.c	2011-10-12 01:32:09.372046342 +0100
> -+++ pango-1.28.4/pango/fonts.c	2011-10-12 01:32:34.512036630 +0100
> -@@ -165,7 +165,7 @@
> -  *               %NULL if not previously set.  This has the same life-time
> -  *               as the font description itself and should not be freed.
> -  **/
> --G_CONST_RETURN char *
> -+const char *
> - pango_font_description_get_family (const PangoFontDescription *desc)
> - {
> -   g_return_val_if_fail (desc != NULL, NULL);
> -@@ -1927,7 +1927,7 @@
> -  * Return value: the name of the family. This string is owned
> -  *   by the family object and must not be modified or freed.
> -  **/
> --G_CONST_RETURN char *
> -+const char *
> - pango_font_family_get_name (PangoFontFamily  *family)
> - {
> -   g_return_val_if_fail (PANGO_IS_FONT_FAMILY (family), NULL);
> -@@ -2060,7 +2060,7 @@
> -  * Return value: the face name for the face. This string is
> -  *   owned by the face object and must not be modified or freed.
> -  **/
> --G_CONST_RETURN char *
> -+const char *
> - pango_font_face_get_face_name (PangoFontFace *face)
> - {
> -   g_return_val_if_fail (PANGO_IS_FONT_FACE (face), NULL);
> -Index: pango-1.28.4/pango/pango-attributes.c
> -===================================================================
> ---- pango-1.28.4.orig/pango/pango-attributes.c	2011-10-12 01:32:09.552046155 +0100
> -+++ pango-1.28.4/pango/pango-attributes.c	2011-10-12 01:32:34.522037975 +0100
> -@@ -97,7 +97,7 @@
> -  *
> -  * Since: 1.22
> -  **/
> --G_CONST_RETURN char *
> -+const char *
> - pango_attr_type_get_name (PangoAttrType type)
> - {
> -   const char *result = NULL;
> -Index: pango-1.28.4/pango/pango-attributes.h
> -===================================================================
> ---- pango-1.28.4.orig/pango/pango-attributes.h	2011-10-12 01:32:12.712046218 +0100
> -+++ pango-1.28.4/pango/pango-attributes.h	2011-10-12 01:32:36.342045777 +0100
> -@@ -180,7 +180,7 @@
> - };
> -
> - PangoAttrType         pango_attr_type_register (const gchar        *name);
> --G_CONST_RETURN char * pango_attr_type_get_name (PangoAttrType       type) G_GNUC_CONST;
> -+const char * pango_attr_type_get_name (PangoAttrType       type) G_GNUC_CONST;
> -
> - void             pango_attribute_init        (PangoAttribute       *attr,
> - 					      const PangoAttrClass *klass);
> -Index: pango-1.28.4/pango/pango-context.c
> -===================================================================
> ---- pango-1.28.4.orig/pango/pango-context.c	2011-10-12 01:32:09.782046152 +0100
> -+++ pango-1.28.4/pango/pango-context.c	2011-10-12 01:32:34.532039187 +0100
> -@@ -188,7 +188,7 @@
> -  *
> -  * Since: 1.6
> -  **/
> --G_CONST_RETURN PangoMatrix *
> -+const PangoMatrix *
> - pango_context_get_matrix (PangoContext *context)
> - {
> -   g_return_val_if_fail (PANGO_IS_CONTEXT (context), NULL);
> -Index: pango-1.28.4/pango/pango-context.h
> -===================================================================
> ---- pango-1.28.4.orig/pango/pango-context.h	2011-10-12 01:32:12.892046153 +0100
> -+++ pango-1.28.4/pango/pango-context.h	2011-10-12 01:32:36.352046105 +0100
> -@@ -86,7 +86,7 @@
> -
> - void                        pango_context_set_matrix (PangoContext      *context,
> - 						      const PangoMatrix *matrix);
> --G_CONST_RETURN PangoMatrix *pango_context_get_matrix (PangoContext      *context);
> -+const PangoMatrix *pango_context_get_matrix (PangoContext      *context);
> -
> - /* Break a string of Unicode characters into segments with
> -  * consistent shaping/language engine and bidrectional level.
> -Index: pango-1.28.4/pango/pango-font.h
> -===================================================================
> ---- pango-1.28.4.orig/pango/pango-font.h	2011-10-12 01:32:13.072046150 +0100
> -+++ pango-1.28.4/pango/pango-font.h	2011-10-12 01:32:36.362046243 +0100
> -@@ -117,7 +117,7 @@
> - 							       const char           *family);
> - void                 pango_font_description_set_family_static (PangoFontDescription *desc,
> - 							       const char           *family);
> --G_CONST_RETURN char *pango_font_description_get_family        (const PangoFontDescription *desc) G_GNUC_PURE;
> -+const char *pango_font_description_get_family        (const PangoFontDescription *desc) G_GNUC_PURE;
> - void                 pango_font_description_set_style         (PangoFontDescription *desc,
> - 							       PangoStyle            style);
> - PangoStyle           pango_font_description_get_style         (const PangoFontDescription *desc) G_GNUC_PURE;
> -@@ -212,7 +212,7 @@
> - void                 pango_font_family_list_faces (PangoFontFamily  *family,
> - 						   PangoFontFace  ***faces,
> - 						   int              *n_faces);
> --G_CONST_RETURN char *pango_font_family_get_name   (PangoFontFamily  *family) G_GNUC_PURE;
> -+const char *pango_font_family_get_name   (PangoFontFamily  *family) G_GNUC_PURE;
> - gboolean   pango_font_family_is_monospace         (PangoFontFamily  *family) G_GNUC_PURE;
> -
> - #ifdef PANGO_ENABLE_BACKEND
> -@@ -261,7 +261,7 @@
> - GType      pango_font_face_get_type       (void) G_GNUC_CONST;
> -
> - PangoFontDescription *pango_font_face_describe       (PangoFontFace  *face);
> --G_CONST_RETURN char  *pango_font_face_get_face_name  (PangoFontFace  *face) G_GNUC_PURE;
> -+const char  *pango_font_face_get_face_name  (PangoFontFace  *face) G_GNUC_PURE;
> - void                  pango_font_face_list_sizes     (PangoFontFace  *face,
> - 						      int           **sizes,
> - 						      int            *n_sizes);
> -Index: pango-1.28.4/pango/pango-fontmap.c
> -===================================================================
> ---- pango-1.28.4.orig/pango/pango-fontmap.c	2011-10-12 01:32:09.912046152 +0100
> -+++ pango-1.28.4/pango/pango-fontmap.c	2011-10-12 01:32:34.542040267 +0100
> -@@ -290,7 +290,7 @@
> -  *
> -  * Since: 1.4
> -  **/
> --G_CONST_RETURN char *
> -+const char *
> - pango_font_map_get_shape_engine_type (PangoFontMap *fontmap)
> - {
> -   g_return_val_if_fail (PANGO_IS_FONT_MAP (fontmap), NULL);
> -Index: pango-1.28.4/pango/pango-language.c
> -===================================================================
> ---- pango-1.28.4.orig/pango/pango-language.c	2011-10-12 01:32:10.052046151 +0100
> -+++ pango-1.28.4/pango/pango-language.c	2011-10-12 01:32:34.542040267 +0100
> -@@ -319,7 +319,7 @@
> -  * Returns: a string representing the language tag.  This is owned by
> -  *          Pango and should not be freed.
> -  */
> --G_CONST_RETURN char *
> -+const char *
> - (pango_language_to_string) (PangoLanguage *language)
> - {
> -   return pango_language_to_string (language);
> -@@ -531,7 +531,7 @@
> -  * Return value: the sample string. This value is owned by Pango
> -  *   and should not be freed.
> -  **/
> --G_CONST_RETURN char *
> -+const char *
> - pango_language_get_sample_string (PangoLanguage *language)
> - {
> -   const LangInfo *lang_info;
> -@@ -592,7 +592,7 @@
> -
> -  * Since: 1.22
> -  **/
> --G_CONST_RETURN PangoScript *
> -+const PangoScript *
> - pango_language_get_scripts (PangoLanguage *language,
> - 			    int           *num_scripts)
> - {
> -Index: pango-1.28.4/pango/pango-language.h
> -===================================================================
> ---- pango-1.28.4.orig/pango/pango-language.h	2011-10-12 01:32:13.262046150 +0100
> -+++ pango-1.28.4/pango/pango-language.h	2011-10-12 01:32:36.362046243 +0100
> -@@ -34,11 +34,11 @@
> - GType          pango_language_get_type    (void) G_GNUC_CONST;
> - PangoLanguage *pango_language_from_string (const char *language);
> -
> --G_CONST_RETURN char *pango_language_to_string   (PangoLanguage *language) G_GNUC_CONST;
> -+const char *pango_language_to_string   (PangoLanguage *language) G_GNUC_CONST;
> - /* For back compat.  Will have to keep indefinitely. */
> - #define pango_language_to_string(language) ((const char *)language)
> -
> --G_CONST_RETURN char *pango_language_get_sample_string (PangoLanguage *language) G_GNUC_CONST;
> -+const char *pango_language_get_sample_string (PangoLanguage *language) G_GNUC_CONST;
> - PangoLanguage *pango_language_get_default (void) G_GNUC_CONST;
> -
> - gboolean      pango_language_matches  (PangoLanguage *language,
> -@@ -48,7 +48,7 @@
> -
> - gboolean		    pango_language_includes_script (PangoLanguage *language,
> - 							    PangoScript    script) G_GNUC_PURE;
> --G_CONST_RETURN PangoScript *pango_language_get_scripts	   (PangoLanguage *language,
> -+const PangoScript *pango_language_get_scripts	   (PangoLanguage *language,
> - 							    int           *num_scripts);
> -
> - G_END_DECLS
> -Index: pango-1.28.4/pango/pango-layout.c
> -===================================================================
> ---- pango-1.28.4.orig/pango/pango-layout.c	2011-10-12 01:32:10.072046151 +0100
> -+++ pango-1.28.4/pango/pango-layout.c	2011-10-12 01:32:34.552041215 +0100
> -@@ -677,7 +677,7 @@
> -  *
> -  * Since: 1.8
> -  **/
> --G_CONST_RETURN PangoFontDescription *
> -+const PangoFontDescription *
> - pango_layout_get_font_description (PangoLayout *layout)
> - {
> -   g_return_val_if_fail (PANGO_IS_LAYOUT (layout), NULL);
> -@@ -1087,7 +1087,7 @@
> -  *
> -  * Return value: the text in the @layout.
> -  **/
> --G_CONST_RETURN char*
> -+const char*
> - pango_layout_get_text (PangoLayout *layout)
> - {
> -   g_return_val_if_fail (PANGO_IS_LAYOUT (layout), NULL);
> -Index: pango-1.28.4/pango/pango-layout.h
> -===================================================================
> ---- pango-1.28.4.orig/pango/pango-layout.h	2011-10-12 01:32:13.302046150 +0100
> -+++ pango-1.28.4/pango/pango-layout.h	2011-10-12 01:32:36.362046243 +0100
> -@@ -116,7 +116,7 @@
> - void           pango_layout_set_font_description (PangoLayout                *layout,
> - 						  const PangoFontDescription *desc);
> -
> --G_CONST_RETURN PangoFontDescription *pango_layout_get_font_description (PangoLayout *layout);
> -+const PangoFontDescription *pango_layout_get_font_description (PangoLayout *layout);
> -
> - void           pango_layout_set_width            (PangoLayout                *layout,
> - 						  int                         width);
> -Index: pango-1.28.4/pango/pango-ot-ruleset.c
> -===================================================================
> ---- pango-1.28.4.orig/pango/pango-ot-ruleset.c	2011-10-12 01:32:10.152046150 +0100
> -+++ pango-1.28.4/pango/pango-ot-ruleset.c	2011-10-12 01:32:34.552041215 +0100
> -@@ -107,7 +107,7 @@
> -  *
> -  * Since: 1.18
> -  **/
> --G_CONST_RETURN PangoOTRuleset *
> -+const PangoOTRuleset *
> - pango_ot_ruleset_get_for_description (PangoOTInfo                     *info,
> - 				      const PangoOTRulesetDescription *desc)
> - {
> -Index: pango-1.28.4/pango/pango-renderer.c
> -===================================================================
> ---- pango-1.28.4.orig/pango/pango-renderer.c	2011-10-12 01:32:10.192046151 +0100
> -+++ pango-1.28.4/pango/pango-renderer.c	2011-10-12 01:32:34.562041682 +0100
> -@@ -1352,7 +1352,7 @@
> -  *
> -  * Since: 1.8
> -  **/
> --G_CONST_RETURN PangoMatrix *
> -+const PangoMatrix *
> - pango_renderer_get_matrix (PangoRenderer *renderer)
> - {
> -   g_return_val_if_fail (PANGO_IS_RENDERER (renderer), NULL);
> -Index: pango-1.28.4/pango/pango-renderer.h
> -===================================================================
> ---- pango-1.28.4.orig/pango/pango-renderer.h	2011-10-12 01:32:13.402046150 +0100
> -+++ pango-1.28.4/pango/pango-renderer.h	2011-10-12 01:32:36.362046243 +0100
> -@@ -249,7 +249,7 @@
> -
> - void                        pango_renderer_set_matrix (PangoRenderer     *renderer,
> - 						       const PangoMatrix *matrix);
> --G_CONST_RETURN PangoMatrix *pango_renderer_get_matrix (PangoRenderer     *renderer);
> -+const PangoMatrix *pango_renderer_get_matrix (PangoRenderer     *renderer);
> -
> - PangoLayout     *pango_renderer_get_layout      (PangoRenderer     *renderer);
> - PangoLayoutLine *pango_renderer_get_layout_line (PangoRenderer     *renderer);
> -Index: pango-1.28.4/pango/pango-script.c
> -===================================================================
> ---- pango-1.28.4.orig/pango/pango-script.c	2011-10-12 01:32:10.212046151 +0100
> -+++ pango-1.28.4/pango/pango-script.c	2011-10-12 01:32:34.562041682 +0100
> -@@ -165,8 +165,8 @@
> -  **/
> - void
> - pango_script_iter_get_range (PangoScriptIter      *iter,
> --			     G_CONST_RETURN char **start,
> --			     G_CONST_RETURN char **end,
> -+			     const char **start,
> -+			     const char **end,
> - 			     PangoScript          *script)
> - {
> -   if (start)
> -Index: pango-1.28.4/pango/pango-script.h
> -===================================================================
> ---- pango-1.28.4.orig/pango/pango-script.h	2011-10-12 01:32:13.422046150 +0100
> -+++ pango-1.28.4/pango/pango-script.h	2011-10-12 01:32:36.362046243 +0100
> -@@ -129,8 +129,8 @@
> - PangoScriptIter *pango_script_iter_new       (const char          *text,
> - 					      int                  length);
> - void             pango_script_iter_get_range (PangoScriptIter      *iter,
> --					      G_CONST_RETURN char **start,
> --					      G_CONST_RETURN char **end,
> -+					      const char **start,
> -+					      const char **end,
> - 					      PangoScript          *script);
> - gboolean         pango_script_iter_next      (PangoScriptIter      *iter);
> - void             pango_script_iter_free      (PangoScriptIter      *iter);
> -Index: pango-1.28.4/pango/pango-utils.c
> -===================================================================
> ---- pango-1.28.4.orig/pango/pango-utils.c	2011-10-12 01:32:10.242046149 +0100
> -+++ pango-1.28.4/pango/pango-utils.c	2011-10-12 01:32:34.562041682 +0100
> -@@ -689,7 +689,7 @@
> -  * Return value: the Pango sysconf directory. The returned string should
> -  * not be freed.
> -  */
> --G_CONST_RETURN char *
> -+const char *
> - pango_get_sysconf_subdirectory (void)
> - {
> - #ifdef G_OS_WIN32
> -@@ -718,7 +718,7 @@
> -  * Return value: the Pango lib directory. The returned string should
> -  * not be freed.
> -  */
> --G_CONST_RETURN char *
> -+const char *
> - pango_get_lib_subdirectory (void)
> - {
> - #ifdef G_OS_WIN32
> -Index: pango-1.28.4/pango/pango-utils.h
> -===================================================================
> ---- pango-1.28.4.orig/pango/pango-utils.h	2011-10-12 01:32:13.512046149 +0100
> -+++ pango-1.28.4/pango/pango-utils.h	2011-10-12 01:32:36.362046243 +0100
> -@@ -82,13 +82,13 @@
> -  * stored in the registry). The returned string should not be
> -  * g_free'd.
> -  */
> --G_CONST_RETURN char *   pango_get_sysconf_subdirectory (void) G_GNUC_PURE;
> -+const char *   pango_get_sysconf_subdirectory (void) G_GNUC_PURE;
> -
> - /* Ditto for LIBDIR/pango. On Win32, use the same Pango
> -  * installation directory. This returned string should not be
> -  * g_free'd either.
> -  */
> --G_CONST_RETURN char *   pango_get_lib_subdirectory (void) G_GNUC_PURE;
> -+const char *   pango_get_lib_subdirectory (void) G_GNUC_PURE;
> -
> - #endif /* PANGO_ENABLE_BACKEND */
> -
> -@@ -131,10 +131,10 @@
> - int pango_version (void) G_GNUC_CONST;
> -
> - /* Return run-time Pango version as an string */
> --G_CONST_RETURN char * pango_version_string (void) G_GNUC_CONST;
> -+const char * pango_version_string (void) G_GNUC_CONST;
> -
> - /* Check that run-time Pango is as new as required */
> --G_CONST_RETURN char * pango_version_check (int required_major,
> -+const char * pango_version_check (int required_major,
> - 					   int required_minor,
> - 					   int required_micro) G_GNUC_CONST;
> -
> -Index: pango-1.28.4/pango/pangocairo-context.c
> -===================================================================
> ---- pango-1.28.4.orig/pango/pangocairo-context.c	2011-10-12 01:32:09.622046154 +0100
> -+++ pango-1.28.4/pango/pangocairo-context.c	2011-10-12 01:32:34.522037975 +0100
> -@@ -260,7 +260,7 @@
> -  *
> -  * Since: 1.10
> -  **/
> --G_CONST_RETURN cairo_font_options_t *
> -+const cairo_font_options_t *
> - pango_cairo_context_get_font_options (PangoContext *context)
> - {
> -   PangoCairoContextInfo *info;
> -@@ -286,7 +286,7 @@
> -  * Return value: the combined set of font options. This value is owned
> -  * by the context and must not be modified or freed.
> -  **/
> --G_CONST_RETURN cairo_font_options_t *
> -+const cairo_font_options_t *
> - _pango_cairo_context_get_merged_font_options (PangoContext *context)
> - {
> -   PangoCairoContextInfo *info = get_context_info (context, TRUE);
> -Index: pango-1.28.4/pango/pangoft2.c
> -===================================================================
> ---- pango-1.28.4.orig/pango/pangoft2.c	2011-10-12 01:32:09.942046152 +0100
> -+++ pango-1.28.4/pango/pangoft2.c	2011-10-12 01:32:34.542040267 +0100
> -@@ -520,7 +520,7 @@
> -   return ((ft_error_description *) pkey)->code - ((ft_error_description *) pbase)->code;
> - }
> -
> --G_CONST_RETURN char *
> -+const char *
> - _pango_ft2_ft_strerror (FT_Error error)
> - {
> - #undef __FTERRORS_H__
> -Index: pango-1.28.4/pango/pangox-fontmap.c
> -===================================================================
> ---- pango-1.28.4.orig/pango/pangox-fontmap.c	2011-10-12 01:32:10.352046151 +0100
> -+++ pango-1.28.4/pango/pangox-fontmap.c	2011-10-12 01:32:34.572042704 +0100
> -@@ -1441,7 +1441,7 @@
> - }
> -
> -
> --G_CONST_RETURN char *
> -+const char *
> - pango_x_fontmap_name_from_atom (PangoFontMap *fontmap,
> - 				Atom          atom)
> - {
> -@@ -1645,7 +1645,7 @@
> -     }
> - }
> -
> --static G_CONST_RETURN char *
> -+static const char *
> - pango_x_family_get_name (PangoFontFamily  *family)
> - {
> -   PangoXFamily *xfamily = PANGO_X_FAMILY (family);
> diff --git a/meta/recipes-graphics/pango/pango-1.28.4/multilib-fix-clean.patch b/meta/recipes-graphics/pango/pango-1.30.0/multilib-fix-clean.patch
> similarity index 100%
> rename from meta/recipes-graphics/pango/pango-1.28.4/multilib-fix-clean.patch
> rename to meta/recipes-graphics/pango/pango-1.30.0/multilib-fix-clean.patch
> diff --git a/meta/recipes-graphics/pango/pango-1.28.4/no-tests.patch b/meta/recipes-graphics/pango/pango-1.30.0/no-tests.patch
> similarity index 33%
> rename from meta/recipes-graphics/pango/pango-1.28.4/no-tests.patch
> rename to meta/recipes-graphics/pango/pango-1.30.0/no-tests.patch
> index 6d9e74b..5a6e4c1 100644
> --- a/meta/recipes-graphics/pango/pango-1.28.4/no-tests.patch
> +++ b/meta/recipes-graphics/pango/pango-1.30.0/no-tests.patch
> @@ -1,16 +1,12 @@
> -Upstream-Status: Inappropriate [ disable tests make sense in embedded, but not appropriate for upstream]
> -
> -Signed-off-by: Yu Ke <ke.yu@intel.com>
> -
> -Index: pango-1.22.2/Makefile.am
> +Index: pango-1.30.0/Makefile.am
>   ===================================================================
> ---- pango-1.22.2.orig/Makefile.am
> -+++ pango-1.22.2/Makefile.am
> +--- pango-1.30.0.orig/Makefile.am	2011-08-16 04:11:08.000000000 +0300
> ++++ pango-1.30.0/Makefile.am	2012-08-06 12:48:27.000000000 +0300
>   @@ -1,6 +1,6 @@
>    ## Process this file with automake to create Makefile.in.
>
> --SUBDIRS= pango modules pango-view examples docs tools tests
> -+SUBDIRS= pango modules pango-view examples docs tools
> +-SUBDIRS= pango modules pango-view examples docs tools tests build
> ++SUBDIRS= pango modules pango-view examples docs tools build
>
>    EXTRA_DIST = 			\
>    	autogen.sh		\
> diff --git a/meta/recipes-graphics/pango/pango_1.28.4.bb b/meta/recipes-graphics/pango/pango_1.30.0.bb
> similarity index 49%
> rename from meta/recipes-graphics/pango/pango_1.28.4.bb
> rename to meta/recipes-graphics/pango/pango_1.30.0.bb
> index 4869592..25101f2 100644
> --- a/meta/recipes-graphics/pango/pango_1.28.4.bb
> +++ b/meta/recipes-graphics/pango/pango_1.30.0.bb
> @@ -2,13 +2,14 @@ require pango.inc
>
>   LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
>
> -PR = "r9"
> +PR = "r0"
> +
> +GNOME_COMPRESS_TYPE="xz"
>
>   SRC_URI += "file://no-tests.patch \
> -            file://noconst.patch \
>               file://multilib-fix-clean.patch"
>
> -SRC_URI[archive.md5sum] = "3f3989700f04e9117d30544a9078b3a0"
> -SRC_URI[archive.sha256sum] = "7eb035bcc10dd01569a214d5e2bc3437de95d9ac1cfa9f50035a687c45f05a9f"
> +SRC_URI[archive.md5sum] = "2a70627ffd9f43c52c04cc0b05fe359f"
> +SRC_URI[archive.sha256sum] = "7c6d2ab024affaed0e942f9279b818235f9c6a36d9fc50688f48d387f4102dff"
>
>   #PARALLEL_MAKE = ""
>


