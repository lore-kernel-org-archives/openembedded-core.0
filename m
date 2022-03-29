Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32598C433F5
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 06:13:48 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.3493.1648534426927349538
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 23:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 22T6DjlY018383
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 23:13:45 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 28 Mar 2022 23:13:45 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 28 Mar 2022 23:13:45 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH] epiphany: fix CVEs
Date: Tue, 29 Mar 2022 14:13:44 +0800
Message-ID: <20220329061344.1643781-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.wrs.com id
 22T6DjlY018383
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Mar 2022 06:13:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163734

From: Mingli Yu <mingli.yu@windriver.com>

Backport patch [1] to fix below CVEs:
 - CVE-2021-45085
 - CVE-2021-45086
 - CVE-2021-45087
 - CVE-2021-45088

[1] https://sources.debian.org/data/main/e/epiphany-browser/3.38.2-1+deb1=
1u2/debian/patches/encode-untrusted-data.patch

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../recipes-gnome/epiphany/epiphany_3.38.2.bb |   1 +
 .../files/encode-untrusted-data.patch         | 707 ++++++++++++++++++
 2 files changed, 708 insertions(+)
 create mode 100644 meta/recipes-gnome/epiphany/files/encode-untrusted-da=
ta.patch

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb b/meta/recipe=
s-gnome/epiphany/epiphany_3.38.2.bb
index 04f340f133..72d116da69 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir=
("${PV}")}/${GNOMEBN}-${PV}
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
            file://migrator.patch \
            file://distributor.patch \
+           file://encode-untrusted-data.patch \
            "
 SRC_URI[archive.sha256sum] =3D "8b05f2bcc1e80ecf4a10f6f01b3285087eb4cbdf=
5741dffb8c0355715ef5116d"
=20
diff --git a/meta/recipes-gnome/epiphany/files/encode-untrusted-data.patc=
h b/meta/recipes-gnome/epiphany/files/encode-untrusted-data.patch
new file mode 100644
index 0000000000..4805ee4e6b
--- /dev/null
+++ b/meta/recipes-gnome/epiphany/files/encode-untrusted-data.patch
@@ -0,0 +1,707 @@
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Subject: Properly encode untrusted data when injecting into trusted page=
s
+
+CVE: CVE-2021-45085 CVE-2021-45086 CVE-2021-45087 CVE-2021-45088
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/epiphany/-/com=
pare/c27a8180e12e6ec92292dcf53b9243815ad9aa2e...abac58c5191b7d653fbefa8d4=
4e5c2bd4d002825?from_project_id=3D1906]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+Index: epiphany-browser/embed/ephy-about-handler.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- epiphany-browser.orig/embed/ephy-about-handler.c
++++ epiphany-browser/embed/ephy-about-handler.c
+@@ -27,6 +27,7 @@
+ #include "ephy-file-helpers.h"
+ #include "ephy-flatpak-utils.h"
+ #include "ephy-history-service.h"
++#include "ephy-output-encoding.h"
+ #include "ephy-prefs.h"
+ #include "ephy-settings.h"
+ #include "ephy-smaps.h"
+@@ -263,16 +264,34 @@ handle_applications_finished_cb (EphyAbo
+=20
+     for (p =3D applications; p; p =3D p->next) {
+       EphyWebApplication *app =3D (EphyWebApplication *)p->data;
+-
++      g_autofree char *html_encoded_id =3D NULL;
++      g_autofree char *encoded_icon_url =3D NULL;
++      g_autofree char *encoded_name =3D NULL;
++      g_autofree char *encoded_url =3D NULL;
++      g_autofree char *js_encoded_id =3D NULL;
++      g_autofree char *encoded_install_date =3D NULL;
++
++      /* Most of these fields are untrusted. The web app suggests its o=
wn title,
++       * which gets used in the app ID and icon URL. The main URL could=
 contain
++       * anything. Install date is the only trusted field here in that =
it's
++       * constructed by Epiphany, but it's a freeform string and we're =
encoding
++       * everything else here anyway, so might as well encode this too.
++       */
++      html_encoded_id =3D ephy_encode_for_html_attribute (app->id);
++      encoded_icon_url =3D ephy_encode_for_html_attribute (app->icon_ur=
l);
++      encoded_name =3D ephy_encode_for_html_entity (app->name);
++      encoded_url =3D ephy_encode_for_html_entity (app->url);
++      js_encoded_id =3D ephy_encode_for_javascript (app->id);
++      encoded_install_date =3D ephy_encode_for_html_entity (app->instal=
l_date);
+       g_string_append_printf (data_str,
+                               "<tbody><tr id =3D\"%s\">"
+                               "<td class=3D\"icon\"><img width=3D64 hei=
ght=3D64 src=3D\"file://%s\"></img></td>"
+                               "<td class=3D\"data\"><div class=3D\"appn=
ame\">%s</div><div class=3D\"appurl\">%s</div></td>"
+                               "<td class=3D\"input\"><input type=3D\"bu=
tton\" value=3D\"%s\" onclick=3D\"deleteWebApp('%s');\"></td>"
+                               "<td class=3D\"date\">%s <br /> %s</td></=
tr></tbody>",
+-                              app->id, app->icon_url, app->name, app->u=
rl, _("Delete"), app->id,
++                              html_encoded_id, encoded_icon_url, encode=
d_name, encoded_url, _("Delete"), js_encoded_id,
+                               /* Note for translators: this refers to t=
he installation date. */
+-                              _("Installed on:"), app->install_date);
++                              _("Installed on:"), encoded_install_date)=
;
+     }
+=20
+     g_string_append (data_str, "</table></div></body></html>");
+@@ -407,7 +426,9 @@ history_service_query_urls_cb (EphyHisto
+     EphyHistoryURL *url =3D (EphyHistoryURL *)l->data;
+     const char *snapshot;
+     g_autofree char *thumbnail_style =3D NULL;
+-    g_autofree char *markup =3D NULL;
++    g_autofree char *entity_encoded_title =3D NULL;
++    g_autofree char *attribute_encoded_title =3D NULL;
++    g_autofree char *encoded_url =3D NULL;
+=20
+     snapshot =3D ephy_snapshot_service_lookup_cached_snapshot_path (sna=
pshot_service, url->url);
+     if (snapshot)
+@@ -415,15 +436,19 @@ history_service_query_urls_cb (EphyHisto
+     else
+       ephy_embed_shell_schedule_thumbnail_update (shell, url);
+=20
+-    markup =3D g_markup_escape_text (url->title, -1);
++    /* Title and URL are controlled by web content and could be malicio=
us. */
++    entity_encoded_title =3D ephy_encode_for_html_entity (url->title);
++    attribute_encoded_title =3D ephy_encode_for_html_attribute (url->ti=
tle);
++    encoded_url =3D ephy_encode_for_html_attribute (url->url);
+     g_string_append_printf (data_str,
+                             "<a class=3D\"overview-item\" title=3D\"%s\=
" href=3D\"%s\">"
+                             "  <div class=3D\"overview-close-button\" t=
itle=3D\"%s\"></div>"
+                             "  <span class=3D\"overview-thumbnail\"%s><=
/span>"
+                             "  <span class=3D\"overview-title\">%s</spa=
n>"
+                             "</a>",
+-                            markup, url->url, _("Remove from overview")=
,
+-                            thumbnail_style ? thumbnail_style : "", url=
->title);
++                            attribute_encoded_title, encoded_url, _("Re=
move from overview"),
++                            thumbnail_style ? thumbnail_style : "",
++                            entity_encoded_title);
+   }
+=20
+   data_str =3D g_string_append (data_str,
+Index: epiphany-browser/embed/ephy-pdf-handler.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- epiphany-browser.orig/embed/ephy-pdf-handler.c
++++ epiphany-browser/embed/ephy-pdf-handler.c
+@@ -23,6 +23,7 @@
+=20
+ #include "ephy-embed-container.h"
+ #include "ephy-embed-shell.h"
++#include "ephy-output-encoding.h"
+ #include "ephy-web-view.h"
+=20
+ #include <gio/gio.h>
+@@ -124,8 +125,9 @@ pdf_file_loaded (GObject      *source,
+   GBytes *html_file;
+   g_autoptr (GError) error =3D NULL;
+   g_autoptr (GString) html =3D NULL;
+-  g_autofree gchar *b64 =3D NULL;
+   g_autofree char *file_data =3D NULL;
++  g_autofree char *encoded_file_data =3D NULL;
++  g_autofree char *encoded_filename =3D NULL;
+   gsize len =3D 0;
+=20
+   if (!g_file_load_contents_finish (G_FILE (source), res, &file_data, &=
len, NULL, &error)) {
+@@ -134,13 +136,13 @@ pdf_file_loaded (GObject      *source,
+     return;
+   }
+=20
+-  html_file =3D g_resources_lookup_data ("/org/gnome/epiphany/pdfjs/web=
/viewer.html", 0, NULL);
+-
+-  b64 =3D g_base64_encode ((const guchar *)file_data, len);
+   g_file_delete_async (G_FILE (source), G_PRIORITY_DEFAULT, NULL, pdf_f=
ile_deleted, NULL);
+=20
+-  html =3D g_string_new ("");
+-  g_string_printf (html, g_bytes_get_data (html_file, NULL), b64, self-=
>file_name ? self->file_name : "");
++  html =3D g_string_new (NULL);
++  html_file =3D g_resources_lookup_data ("/org/gnome/epiphany/pdfjs/web=
/viewer.html", 0, NULL);
++  encoded_file_data =3D g_base64_encode ((const guchar *)file_data, len=
);
++  encoded_filename =3D self->file_name ? ephy_encode_for_html_attribute=
 (self->file_name) : g_strdup ("");
++  g_string_printf (html, g_bytes_get_data (html_file, NULL), encoded_fi=
le_data, encoded_filename);
+=20
+   finish_uri_scheme_request (self, g_strdup (html->str), NULL);
+ }
+Index: epiphany-browser/embed/ephy-reader-handler.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- epiphany-browser.orig/embed/ephy-reader-handler.c
++++ epiphany-browser/embed/ephy-reader-handler.c
+@@ -24,6 +24,7 @@
+ #include "ephy-embed-container.h"
+ #include "ephy-embed-shell.h"
+ #include "ephy-lib-type-builtins.h"
++#include "ephy-output-encoding.h"
+ #include "ephy-settings.h"
+ #include "ephy-web-view.h"
+=20
+@@ -156,7 +157,9 @@ readability_js_finish_cb (GObject      *
+   g_autoptr (WebKitJavascriptResult) js_result =3D NULL;
+   g_autoptr (GError) error =3D NULL;
+   g_autofree gchar *byline =3D NULL;
++  g_autofree gchar *encoded_byline =3D NULL;
+   g_autofree gchar *content =3D NULL;
++  g_autofree gchar *encoded_title =3D NULL;
+   g_autoptr (GString) html =3D NULL;
+   g_autoptr (GBytes) style_css =3D NULL;
+   const gchar *title;
+@@ -173,10 +176,14 @@ readability_js_finish_cb (GObject      *
+=20
+   byline =3D readability_get_property_string (js_result, "byline");
+   content =3D readability_get_property_string (js_result, "content");
++  title =3D webkit_web_view_get_title (web_view);
++
++  encoded_byline =3D byline ? ephy_encode_for_html_entity (byline) : g_=
strdup ("");
++  encoded_title =3D ephy_encode_for_html_entity (title);
+=20
+-  html =3D g_string_new ("");
++  html =3D g_string_new (NULL);
+   style_css =3D g_resources_lookup_data ("/org/gnome/epiphany/readabili=
ty/reader.css", G_RESOURCE_LOOKUP_FLAGS_NONE, NULL);
+-  title =3D webkit_web_view_get_title (web_view);
++
+   font_style =3D enum_nick (EPHY_TYPE_PREFS_READER_FONT_STYLE,
+                           g_settings_get_enum (EPHY_SETTINGS_READER,
+                                                EPHY_PREFS_READER_FONT_S=
TYLE));
+@@ -186,7 +193,8 @@ readability_js_finish_cb (GObject      *
+=20
+   g_string_append_printf (html, "<style>%s</style>"
+                           "<title>%s</title>"
+-                          "<meta http-equiv=3D\"Content-Type\" content=3D=
\"text/html;\" charset=3D\"UTF-8\">" \
++                          "<meta http-equiv=3D'Content-Type' content=3D=
'text/html;' charset=3D'UTF-8'>" \
++                          "<meta http-equiv=3D'Content-Security-Policy'=
 content=3D\"script-src 'none'\">" \
+                           "<body class=3D'%s %s'>"
+                           "<article>"
+                           "<h2>"
+@@ -197,13 +205,27 @@ readability_js_finish_cb (GObject      *
+                           "</i>"
+                           "<hr>",
+                           (gchar *)g_bytes_get_data (style_css, NULL),
+-                          title,
++                          encoded_title,
+                           font_style,
+                           color_scheme,
+-                          title,
+-                          byline !=3D NULL ? byline : "");
++                          encoded_title,
++                          encoded_byline);
++
++  /* We cannot encode the page content because it contains HTML tags in=
serted by
++   * Readability.js. Upstream recommends that we use an XSS sanitizer l=
ike
++   * DOMPurify plus Content-Security-Policy, but I'm not keen on adding=
 more
++   * bundled JS dependencies, and we have an advantage over Firefox in =
that we
++   * don't need scripts to work at this point. So instead the above CSP
++   * completely blocks all scripts, which should hopefully obviate the =
need for
++   * a DOM purifier.
++   *
++   * Note the encoding for page title and byline is still required, as =
they're
++   * not supposed to contain markup, and Readability.js unescapes them =
before
++   * returning them to us.
++   */
+   g_string_append (html, content);
+   g_string_append (html, "</article>");
++  g_string_append (html, "</body>");
+=20
+   finish_uri_scheme_request (request, g_strdup (html->str), NULL);
+ }
+Index: epiphany-browser/embed/ephy-view-source-handler.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- epiphany-browser.orig/embed/ephy-view-source-handler.c
++++ epiphany-browser/embed/ephy-view-source-handler.c
+@@ -23,6 +23,7 @@
+=20
+ #include "ephy-embed-container.h"
+ #include "ephy-embed-shell.h"
++#include "ephy-output-encoding.h"
+ #include "ephy-web-view.h"
+=20
+ #include <gio/gio.h>
+@@ -109,7 +110,9 @@ web_resource_data_cb (WebKitWebResource
+                       EphyViewSourceRequest *request)
+ {
+   g_autofree guchar *data =3D NULL;
+-  g_autofree char *escaped_str =3D NULL;
++  g_autofree char *data_str =3D NULL;
++  g_autofree char *encoded_str =3D NULL;
++  g_autofree char *encoded_uri =3D NULL;
+   g_autoptr (GError) error =3D NULL;
+   g_autofree char *html =3D NULL;
+   gsize length;
+@@ -120,8 +123,13 @@ web_resource_data_cb (WebKitWebResource
+     return;
+   }
+=20
+-  /* Warning: data is not a string, so we pass length here because it's=
 not NUL-terminated. */
+-  escaped_str =3D g_markup_escape_text ((const char *)data, length);
++  /* Convert data to a string */
++  data_str =3D g_malloc (length + 1);
++  memcpy (data_str, data, length);
++  data_str[length] =3D '\0';
++
++  encoded_str =3D ephy_encode_for_html_entity (data_str);
++  encoded_uri =3D ephy_encode_for_html_entity (webkit_web_resource_get_=
uri (resource));
+=20
+   html =3D g_strdup_printf ("<head>"
+                           "  <link rel=3D'stylesheet' href=3D'ephy-reso=
urce:///org/gnome/epiphany/highlightjs/nnfx.css' media=3D'(prefers-color-=
scheme: no-preference), (prefers-color-scheme: light)'>"
+@@ -136,8 +144,8 @@ web_resource_data_cb (WebKitWebResource
+                           "          hljs.initLineNumbersOnLoad();</scr=
ipt>"
+                           "  <pre><code class=3D'html'>%s</code></pre>"
+                           "</body>",
+-                          webkit_web_resource_get_uri (resource),
+-                          escaped_str);
++                          encoded_uri,
++                          encoded_str);
+=20
+   finish_uri_scheme_request (request, g_steal_pointer (&html), NULL);
+ }
+Index: epiphany-browser/embed/ephy-web-view.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- epiphany-browser.orig/embed/ephy-web-view.c
++++ epiphany-browser/embed/ephy-web-view.c
+@@ -38,6 +38,7 @@
+ #include "ephy-gsb-utils.h"
+ #include "ephy-history-service.h"
+ #include "ephy-lib-type-builtins.h"
++#include "ephy-output-encoding.h"
+ #include "ephy-permissions-manager.h"
+ #include "ephy-prefs.h"
+ #include "ephy-reader-handler.h"
+@@ -1772,9 +1773,11 @@ format_network_error_page (const char  *
+                            const char **icon_name,
+                            const char **style)
+ {
+-  char *formatted_origin;
+-  char *formatted_reason;
+-  char *first_paragraph;
++  g_autofree char *encoded_uri =3D NULL;
++  g_autofree char *encoded_origin =3D NULL;
++  g_autofree char *formatted_origin =3D NULL;
++  g_autofree char *formatted_reason =3D NULL;
++  g_autofree char *first_paragraph =3D NULL;
+   const char *second_paragraph;
+=20
+   /* Page title when a site cannot be loaded due to a network error. */
+@@ -1783,7 +1786,8 @@ format_network_error_page (const char  *
+   /* Message title when a site cannot be loaded due to a network error.=
 */
+   *message_title =3D g_strdup (_("Unable to display this website"));
+=20
+-  formatted_origin =3D g_strdup_printf ("<strong>%s</strong>", origin);
++  encoded_origin =3D ephy_encode_for_html_entity (origin);
++  formatted_origin =3D g_strdup_printf ("<strong>%s</strong>", encoded_=
origin);
+   /* Error details when a site cannot be loaded due to a network error.=
 */
+   first_paragraph =3D g_strdup_printf (_("The site at %s seems to be "
+                                        "unavailable."),
+@@ -1805,16 +1809,13 @@ format_network_error_page (const char  *
+=20
+   /* The button on the network error page. DO NOT ADD MNEMONICS HERE. *=
/
+   *button_label =3D g_strdup (_("Reload"));
+-  *button_action =3D g_strdup_printf ("window.location =3D '%s';", uri)=
;
++  encoded_uri =3D ephy_encode_for_javascript (uri);
++  *button_action =3D g_strdup_printf ("window.location =3D '%s';", enco=
ded_uri);
+   /* Mnemonic for the Reload button on browser error pages. */
+   *button_accesskey =3D C_("reload-access-key", "R");
+=20
+   *icon_name =3D "network-error-symbolic.svg";
+   *style =3D "default";
+-
+-  g_free (formatted_origin);
+-  g_free (formatted_reason);
+-  g_free (first_paragraph);
+ }
+=20
+ static void
+@@ -1828,10 +1829,12 @@ format_crash_error_page (const char  *ur
+                          const char **icon_name,
+                          const char **style)
+ {
+-  char *formatted_uri;
+-  char *formatted_distributor;
+-  char *first_paragraph;
+-  char *second_paragraph;
++  g_autofree char *html_encoded_uri =3D NULL;
++  g_autofree char *js_encoded_uri =3D NULL;
++  g_autofree char *formatted_uri =3D NULL;
++  g_autofree char *formatted_distributor =3D NULL;
++  g_autofree char *first_paragraph =3D NULL;
++  g_autofree char *second_paragraph =3D NULL;
+=20
+   /* Page title when a site cannot be loaded due to a page crash error.=
 */
+   *page_title =3D g_strdup_printf (_("Problem Loading Page"));
+@@ -1839,7 +1842,8 @@ format_crash_error_page (const char  *ur
+   /* Message title when a site cannot be loaded due to a page crash err=
or. */
+   *message_title =3D g_strdup (_("Oops! There may be a problem"));
+=20
+-  formatted_uri =3D g_strdup_printf ("<strong>%s</strong>", uri);
++  html_encoded_uri =3D ephy_encode_for_html_entity (uri);
++  formatted_uri =3D g_strdup_printf ("<strong>%s</strong>", html_encode=
d_uri);
+   /* Error details when a site cannot be loaded due to a page crash err=
or. */
+   first_paragraph =3D g_strdup_printf (_("The page %s may have caused W=
eb to "
+                                        "close unexpectedly."),
+@@ -1858,17 +1862,13 @@ format_crash_error_page (const char  *ur
+=20
+   /* The button on the page crash error page. DO NOT ADD MNEMONICS HERE=
. */
+   *button_label =3D g_strdup (_("Reload"));
+-  *button_action =3D g_strdup_printf ("window.location =3D '%s';", uri)=
;
++  js_encoded_uri =3D ephy_encode_for_javascript (uri);
++  *button_action =3D g_strdup_printf ("window.location =3D '%s';", js_e=
ncoded_uri);
+   /* Mnemonic for the Reload button on browser error pages. */
+   *button_accesskey =3D C_("reload-access-key", "R");
+=20
+   *icon_name =3D "computer-fail-symbolic.svg";
+   *style =3D "default";
+-
+-  g_free (formatted_uri);
+-  g_free (formatted_distributor);
+-  g_free (first_paragraph);
+-  g_free (second_paragraph);
+ }
+=20
+ static void
+@@ -1882,6 +1882,7 @@ format_process_crash_error_page (const c
+                                  const char **icon_name,
+                                  const char **style)
+ {
++  g_autofree char *encoded_uri =3D NULL;
+   const char *first_paragraph;
+=20
+   /* Page title when a site cannot be loaded due to a process crash err=
or. */
+@@ -1897,7 +1898,8 @@ format_process_crash_error_page (const c
+=20
+   /* The button on the process crash error page. DO NOT ADD MNEMONICS H=
ERE. */
+   *button_label =3D g_strdup (_("Reload"));
+-  *button_action =3D g_strdup_printf ("window.location =3D '%s';", uri)=
;
++  encoded_uri =3D ephy_encode_for_javascript (uri);
++  *button_action =3D g_strdup_printf ("window.location =3D '%s';", enco=
ded_uri);
+   /* Mnemonic for the Reload button on browser error pages. */
+   *button_accesskey =3D C_("reload-access-key", "R");
+=20
+@@ -1921,8 +1923,9 @@ format_tls_error_page (EphyWebView  *vie
+                        const char  **icon_name,
+                        const char  **style)
+ {
+-  char *formatted_origin;
+-  char *first_paragraph;
++  g_autofree char *encoded_origin =3D NULL;
++  g_autofree char *formatted_origin =3D NULL;
++  g_autofree char *first_paragraph =3D NULL;
+=20
+   /* Page title when a site is not loaded due to an invalid TLS certifi=
cate. */
+   *page_title =3D g_strdup_printf (_("Security Violation"));
+@@ -1930,7 +1933,8 @@ format_tls_error_page (EphyWebView  *vie
+   /* Message title when a site is not loaded due to an invalid TLS cert=
ificate. */
+   *message_title =3D g_strdup (_("This Connection is Not Secure"));
+=20
+-  formatted_origin =3D g_strdup_printf ("<strong>%s</strong>", origin);
++  encoded_origin =3D ephy_encode_for_html_entity (origin);
++  formatted_origin =3D g_strdup_printf ("<strong>%s</strong>", encoded_=
origin);
+   /* Error details when a site is not loaded due to an invalid TLS cert=
ificate. */
+   first_paragraph =3D g_strdup_printf (_("This does not look like the r=
eal %s. "
+                                        "Attackers might be trying to st=
eal or "
+@@ -1956,9 +1960,6 @@ format_tls_error_page (EphyWebView  *vie
+=20
+   *icon_name =3D "channel-insecure-symbolic.svg";
+   *style =3D "danger";
+-
+-  g_free (formatted_origin);
+-  g_free (first_paragraph);
+ }
+=20
+ static void
+@@ -1978,8 +1979,9 @@ format_unsafe_browsing_error_page (EphyW
+                                    const char  **icon_name,
+                                    const char  **style)
+ {
+-  char *formatted_origin;
+-  char *first_paragraph;
++  g_autofree char *encoded_origin =3D NULL;
++  g_autofree char *formatted_origin =3D NULL;
++  g_autofree char *first_paragraph =3D NULL;
+=20
+   /* Page title when a site is flagged by Google Safe Browsing verifica=
tion. */
+   *page_title =3D g_strdup_printf (_("Security Warning"));
+@@ -1987,7 +1989,8 @@ format_unsafe_browsing_error_page (EphyW
+   /* Message title on the unsafe browsing error page. */
+   *message_title =3D g_strdup (_("Unsafe website detected!"));
+=20
+-  formatted_origin =3D g_strdup_printf ("<strong>%s</strong>", origin);
++  encoded_origin =3D ephy_encode_for_html_entity (origin);
++  formatted_origin =3D g_strdup_printf ("<strong>%s</strong>", encoded_=
origin);
+   /* Error details on the unsafe browsing error page.
+    * https://developers.google.com/safe-browsing/v4/usage-limits#UserWa=
rnings
+    */
+@@ -2045,9 +2048,6 @@ format_unsafe_browsing_error_page (EphyW
+=20
+   *icon_name =3D "security-high-symbolic.svg";
+   *style =3D "danger";
+-
+-  g_free (formatted_origin);
+-  g_free (first_paragraph);
+ }
+=20
+ static void
+@@ -2061,7 +2061,8 @@ format_no_such_file_error_page (EphyWebV
+                                 const char  **icon_name,
+                                 const char  **style)
+ {
+-  g_autofree gchar *formatted_origin =3D NULL;
++  g_autofree gchar *encoded_address =3D NULL;
++  g_autofree gchar *formatted_address =3D NULL;
+   g_autofree gchar *first_paragraph =3D NULL;
+   g_autofree gchar *second_paragraph =3D NULL;
+=20
+@@ -2071,10 +2072,11 @@ format_no_such_file_error_page (EphyWebV
+   /* Message title on the no such file error page. */
+   *message_title =3D g_strdup (_("File not found"));
+=20
+-  formatted_origin =3D g_strdup_printf ("<strong>%s</strong>", view->ad=
dress);
++  encoded_address =3D ephy_encode_for_html_entity (view->address);
++  formatted_address =3D g_strdup_printf ("<strong>%s</strong>", encoded=
_address);
+=20
+   first_paragraph =3D g_strdup_printf (_("%s could not be found."),
+-                                     formatted_origin);
++                                     formatted_address);
+   second_paragraph =3D g_strdup_printf (_("Please check the file name f=
or "
+                                         "capitalization or other typing=
 errors. Also check if "
+                                         "it has been moved, renamed, or=
 deleted."));
+@@ -2109,19 +2111,19 @@ ephy_web_view_load_error_page (EphyWebVi
+                                GError               *error,
+                                gpointer              user_data)
+ {
+-  GBytes *html_file;
+-  GString *html =3D g_string_new ("");
+-  char *origin =3D NULL;
+-  char *lang =3D NULL;
+-  char *page_title =3D NULL;
+-  char *msg_title =3D NULL;
+-  char *msg_body =3D NULL;
+-  char *msg_details =3D NULL;
+-  char *button_label =3D NULL;
+-  char *hidden_button_label =3D NULL;
+-  char *button_action =3D NULL;
+-  char *hidden_button_action =3D NULL;
+-  char *style_sheet =3D NULL;
++  g_autoptr (GBytes) html_file =3D NULL;
++  g_autoptr (GString) html =3D g_string_new (NULL);
++  g_autofree char *origin =3D NULL;
++  g_autofree char *lang =3D NULL;
++  g_autofree char *page_title =3D NULL;
++  g_autofree char *msg_title =3D NULL;
++  g_autofree char *msg_body =3D NULL;
++  g_autofree char *msg_details =3D NULL;
++  g_autofree char *button_label =3D NULL;
++  g_autofree char *hidden_button_label =3D NULL;
++  g_autofree char *button_action =3D NULL;
++  g_autofree char *hidden_button_action =3D NULL;
++  g_autofree char *style_sheet =3D NULL;
+   const char *button_accesskey =3D NULL;
+   const char *hidden_button_accesskey =3D NULL;
+   const char *icon_name =3D NULL;
+@@ -2261,23 +2263,9 @@ ephy_web_view_load_error_page (EphyWebVi
+                    button_accesskey, button_label);
+ #pragma GCC diagnostic pop
+=20
+-  g_bytes_unref (html_file);
+-  g_free (origin);
+-  g_free (lang);
+-  g_free (page_title);
+-  g_free (msg_title);
+-  g_free (msg_body);
+-  g_free (msg_details);
+-  g_free (button_label);
+-  g_free (button_action);
+-  g_free (hidden_button_label);
+-  g_free (hidden_button_action);
+-  g_free (style_sheet);
+-
+   /* Make our history backend ignore the next page load, since it will =
be an error page. */
+   ephy_web_view_freeze_history (view);
+   webkit_web_view_load_alternate_html (WEBKIT_WEB_VIEW (view), html->st=
r, uri, 0);
+-  g_string_free (html, TRUE);
+ }
+=20
+ static gboolean
+Index: epiphany-browser/lib/ephy-output-encoding.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- /dev/null
++++ epiphany-browser/lib/ephy-output-encoding.c
+@@ -0,0 +1,117 @@
++/* -*- Mode: C; tab-width: 2; indent-tabs-mode: nil; c-basic-offset: 2 =
-*- */
++/*
++ *  Copyright =C2=A9 Red Hat Inc.
++ *
++ *  This file is part of Epiphany.
++ *
++ *  Epiphany is free software: you can redistribute it and/or modify
++ *  it under the terms of the GNU General Public License as published b=
y
++ *  the Free Software Foundation, either version 3 of the License, or
++ *  (at your option) any later version.
++ *
++ *  Epiphany is distributed in the hope that it will be useful,
++ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
++ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ *  GNU General Public License for more details.
++ *
++ *  You should have received a copy of the GNU General Public License
++ *  along with Epiphany.  If not, see <http://www.gnu.org/licenses/>.
++ */
++
++#include "config.h"
++#include "ephy-output-encoding.h"
++
++#include <glib.h>
++
++#if !GLIB_CHECK_VERSION(2, 68, 0)
++static guint
++g_string_replace (GString     *string,
++                  const gchar *find,
++                  const gchar *replace,
++                  guint        limit)
++{
++  gsize f_len, r_len, pos;
++  gchar *cur, *next;
++  guint n =3D 0;
++
++  g_return_val_if_fail (string !=3D NULL, 0);
++  g_return_val_if_fail (find !=3D NULL, 0);
++  g_return_val_if_fail (replace !=3D NULL, 0);
++
++  f_len =3D strlen (find);
++  r_len =3D strlen (replace);
++  cur =3D string->str;
++
++  while ((next =3D strstr (cur, find)) !=3D NULL)
++    {
++      pos =3D next - string->str;
++      g_string_erase (string, pos, f_len);
++      g_string_insert (string, pos, replace);
++      cur =3D string->str + pos + r_len;
++      n++;
++      /* Only match the empty string once at any given position, to
++       * avoid infinite loops */
++      if (f_len =3D=3D 0)
++        {
++          if (cur[0] =3D=3D '\0')
++            break;
++          else
++            cur++;
++        }
++      if (n =3D=3D limit)
++        break;
++    }
++
++  return n;
++}
++#endif
++
++char *
++ephy_encode_for_html_entity (const char *input)
++{
++  GString *str =3D g_string_new (input);
++
++  g_string_replace (str, "&", "&amp;", 0);
++  g_string_replace (str, "<", "&lt;", 0);
++  g_string_replace (str, ">", "&gt;", 0);
++  g_string_replace (str, "\"", "&quot;", 0);
++  g_string_replace (str, "'", "&#x27;", 0);
++  g_string_replace (str, "/", "&#x2F;", 0);
++
++  return g_string_free (str, FALSE);
++}
++
++static char *
++encode_all_except_alnum (const char *input,
++                         const char *format)
++{
++  GString *str;
++  const char *c =3D input;
++
++  if (!g_utf8_validate (input, -1, NULL))
++    return g_strdup ("");
++
++  str =3D g_string_new (NULL);
++  do {
++    gunichar u =3D g_utf8_get_char (c);
++    if (g_unichar_isalnum (u))
++      g_string_append_unichar (str, u);
++    else
++      g_string_append_printf (str, format, u);
++    c =3D g_utf8_next_char (c);
++  } while (*c);
++
++  return g_string_free (str, FALSE);
++}
++
++char *
++ephy_encode_for_html_attribute (const char *input)
++{
++  return encode_all_except_alnum (input, "&#x%02x;");
++}
++
++char *
++ephy_encode_for_javascript (const char *input)
++{
++  return encode_all_except_alnum (input, "\\u%04u;");
++}
+Index: epiphany-browser/lib/ephy-output-encoding.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- /dev/null
++++ epiphany-browser/lib/ephy-output-encoding.h
+@@ -0,0 +1,38 @@
++/* -*- Mode: C; tab-width: 2; indent-tabs-mode: nil; c-basic-offset: 2 =
-*- */
++/*
++ *  Copyright =C2=A9 2021 Red Hat Inc.
++ *
++ *  This file is part of Epiphany.
++ *
++ *  Epiphany is free software: you can redistribute it and/or modify
++ *  it under the terms of the GNU General Public License as published b=
y
++ *  the Free Software Foundation, either version 3 of the License, or
++ *  (at your option) any later version.
++ *
++ *  Epiphany is distributed in the hope that it will be useful,
++ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
++ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ *  GNU General Public License for more details.
++ *
++ *  You should have received a copy of the GNU General Public License
++ *  along with Epiphany.  If not, see <http://www.gnu.org/licenses/>.
++ */
++
++#pragma once
++
++#include <glib.h>
++
++G_BEGIN_DECLS
++
++/* These functions implement the OWASP XSS prevention output encoding r=
ules:
++ * https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Scripting_=
Prevention_Cheat_Sheet.html#output-encoding-rules-summary
++ *
++ * You must *carefully* read that document to safely inject untrusted d=
ata into
++ * web content. Here be dragons.
++ */
++
++char *ephy_encode_for_html_entity    (const char *input);
++char *ephy_encode_for_html_attribute (const char *input);
++char *ephy_encode_for_javascript     (const char *input);
++
++G_END_DECLS
+Index: epiphany-browser/lib/meson.build
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- epiphany-browser.orig/lib/meson.build
++++ epiphany-browser/lib/meson.build
+@@ -21,6 +21,7 @@ libephymisc_sources =3D [
+   'ephy-langs.c',
+   'ephy-notification.c',
+   'ephy-notification-container.c',
++  'ephy-output-encoding.c',
+   'ephy-permissions-manager.c',
+   'ephy-profile-utils.c',
+   'ephy-search-engine-manager.c',
--=20
2.25.1


