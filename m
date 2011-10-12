Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RDz7B-0001GA-DJ for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 15:44:57 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9CDjqQ5005822 for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 14:45:52 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lkZFAs7cY-T3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 14:45:52 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9CDjjPa005795
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 14:45:47 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Oct 2011 14:39:03 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318426752.23801.163.camel@ted>
Mime-Version: 1.0
Subject: [PATCH] libunique: Update to work with glib-2.0
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
X-List-Received-Date: Wed, 12 Oct 2011 13:44:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-gnome/libunique/libunique/noconst.patch b/meta/recipes-gnome/libunique/libunique/noconst.patch
new file mode 100644
index 0000000..2cc0347
--- a/dev/null
+++ b/meta/recipes-gnome/libunique/libunique/noconst.patch
@@ -0,0 +1,130 @@
+G_CONST_RETURN is deprecated in glib 2.30 so remove to to avoid
+build failures.
+
+RP 2011/10/12
+
+Upstream-Status: Pending
+
+Index: libunique-1.1.6/unique/uniqueapp.c
+===================================================================
+--- libunique-1.1.6.orig/unique/uniqueapp.c	2011-10-12 01:21:25.842046488 +0100
++++ libunique-1.1.6/unique/uniqueapp.c	2011-10-12 01:21:55.062046796 +0100
+@@ -781,7 +781,7 @@
+ }
+ 
+ 
+-G_CONST_RETURN gchar *
++const gchar *
+ unique_command_to_string (UniqueApp *app,
+                           gint       command)
+ {
+@@ -863,7 +863,7 @@
+   return retval;
+ }
+ 
+-G_CONST_RETURN gchar *
++const gchar *
+ unique_response_to_string (UniqueResponse response)
+ {
+   GEnumClass *enum_class;
+Index: libunique-1.1.6/unique/uniquebackend.c
+===================================================================
+--- libunique-1.1.6.orig/unique/uniquebackend.c	2011-10-12 01:21:25.742046323 +0100
++++ libunique-1.1.6/unique/uniquebackend.c	2011-10-12 01:21:55.062046796 +0100
+@@ -111,7 +111,7 @@
+  *
+  * Return value: FIXME
+  */
+-G_CONST_RETURN gchar *
++const gchar *
+ unique_backend_get_name (UniqueBackend *backend)
+ {
+   g_return_val_if_fail (UNIQUE_IS_BACKEND (backend), NULL);
+@@ -154,7 +154,7 @@
+  *
+  * Return value: FIXME
+  */
+-G_CONST_RETURN gchar *
++const gchar *
+ unique_backend_get_startup_id (UniqueBackend *backend)
+ {
+   g_return_val_if_fail (UNIQUE_IS_BACKEND (backend), NULL);
+Index: libunique-1.1.6/unique/uniquebackend.h
+===================================================================
+--- libunique-1.1.6.orig/unique/uniquebackend.h	2011-10-12 01:21:25.992046521 +0100
++++ libunique-1.1.6/unique/uniquebackend.h	2011-10-12 01:21:56.512047875 +0100
+@@ -94,10 +94,10 @@
+ 
+ UniqueBackend *       unique_backend_create         (void);
+ 
+-G_CONST_RETURN gchar *unique_backend_get_name       (UniqueBackend     *backend);
++const gchar *unique_backend_get_name       (UniqueBackend     *backend);
+ void                  unique_backend_set_name       (UniqueBackend     *backend,
+                                                      const gchar       *name);
+-G_CONST_RETURN gchar *unique_backend_get_startup_id (UniqueBackend     *backend);
++const gchar *unique_backend_get_startup_id (UniqueBackend     *backend);
+ void                  unique_backend_set_startup_id (UniqueBackend     *backend,
+                                                      const gchar       *startup_id);
+ GdkScreen *           unique_backend_get_screen     (UniqueBackend     *backend);
+Index: libunique-1.1.6/unique/uniqueinternals.h
+===================================================================
+--- libunique-1.1.6.orig/unique/uniqueinternals.h	2011-10-12 01:21:25.892046532 +0100
++++ libunique-1.1.6/unique/uniqueinternals.h	2011-10-12 01:21:56.512047875 +0100
+@@ -44,11 +44,11 @@
+  * and then back into an id
+  */
+ UniqueResponse        unique_response_from_string  (const gchar    *response);
+-G_CONST_RETURN gchar *unique_response_to_string    (UniqueResponse  response);
++const gchar *unique_response_to_string    (UniqueResponse  response);
+ 
+ gint                  unique_command_from_string   (UniqueApp      *app,
+                                                     const gchar    *command);
+-G_CONST_RETURN gchar *unique_command_to_string     (UniqueApp      *app,
++const gchar *unique_command_to_string     (UniqueApp      *app,
+                                                     gint            command);
+ 
+ G_END_DECLS
+Index: libunique-1.1.6/unique/uniquemessage.c
+===================================================================
+--- libunique-1.1.6.orig/unique/uniquemessage.c	2011-10-12 01:21:25.942046524 +0100
++++ libunique-1.1.6/unique/uniquemessage.c	2011-10-12 01:21:55.072046595 +0100
+@@ -185,7 +185,7 @@
+  *
+  * Since: 1.0.2
+  */
+-G_CONST_RETURN guchar *
++const guchar *
+ unique_message_data_get (UniqueMessageData *message_data,
+                          gsize             *length)
+ {
+@@ -525,7 +525,7 @@
+  *   owned by the #UniqueMessageData structure and should not be
+  *   modified or freed
+  */
+-G_CONST_RETURN gchar *
++const gchar *
+ unique_message_data_get_startup_id (UniqueMessageData *message_data)
+ {
+   g_return_val_if_fail (message_data != NULL, NULL);
+Index: libunique-1.1.6/unique/uniquemessage.h
+===================================================================
+--- libunique-1.1.6.orig/unique/uniquemessage.h	2011-10-12 01:21:25.792046596 +0100
++++ libunique-1.1.6/unique/uniquemessage.h	2011-10-12 01:21:56.512047875 +0100
+@@ -48,7 +48,7 @@
+ void                   unique_message_data_set            (UniqueMessageData *message_data,
+                                                            const guchar      *data,
+                                                            gsize              length);
+-G_CONST_RETURN guchar *unique_message_data_get            (UniqueMessageData *message_data,
++const guchar *unique_message_data_get            (UniqueMessageData *message_data,
+                                                            gsize             *length);
+ 
+ gboolean               unique_message_data_set_text       (UniqueMessageData *message_data,
+@@ -63,7 +63,7 @@
+ gchar *                unique_message_data_get_filename   (UniqueMessageData *message_data);
+ 
+ GdkScreen *            unique_message_data_get_screen     (UniqueMessageData *message_data);
+-G_CONST_RETURN gchar * unique_message_data_get_startup_id (UniqueMessageData *message_data);
++const gchar * unique_message_data_get_startup_id (UniqueMessageData *message_data);
+ guint                  unique_message_data_get_workspace  (UniqueMessageData *message_data);
+ 
+ G_END_DECLS
diff --git a/meta/recipes-gnome/libunique/libunique_1.1.6.bb b/meta/recipes-gnome/libunique/libunique_1.1.6.bb
index 4f3cdb6..9435e97 100644
--- a/meta/recipes-gnome/libunique/libunique_1.1.6.bb
+++ b/meta/recipes-gnome/libunique/libunique_1.1.6.bb
@@ -3,12 +3,13 @@ HOMEPAGE = "http://live.gnome.org/LibUnique"
 BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=libunique"
 
 SRC_URI = "${GNOME_MIRROR}/libunique/1.1/libunique-${PV}.tar.bz2 \
-	file://fix_for_compile_with_gcc-4.6.0.patch"
+	file://fix_for_compile_with_gcc-4.6.0.patch \
+	file://noconst.patch"
 
 SRC_URI[md5sum] = "7955769ef31f1bc4f83446dbb3625e6d"
 SRC_URI[sha256sum] = "e5c8041cef8e33c55732f06a292381cb345db946cf792a4ae18aa5c66cdd4fbb"
 
-PR = "r3"
+PR = "r4"
 
 DEPENDS = "glib-2.0 gtk+ dbus"
 




