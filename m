Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RDz82-0001Jo-Bt for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 15:45:50 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9CDkj7g005889 for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 14:46:45 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hwmQqr0L7JBG
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 14:46:45 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9CDkdPa005834
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 14:46:41 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Oct 2011 14:39:56 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318426805.23801.164.camel@ted>
Mime-Version: 1.0
Subject: [PATCH] eds: Update to work with glib-2.0
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
X-List-Received-Date: Wed, 12 Oct 2011 13:45:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-sato/eds/eds-dbus/depbuildfix.patch b/meta/recipes-sato/eds/eds-dbus/depbuildfix.patch
new file mode 100644
index 0000000..0785a93
--- a/dev/null
+++ b/meta/recipes-sato/eds/eds-dbus/depbuildfix.patch
@@ -0,0 +1,78 @@
+G_CONST_RETURN is deprecated in glib 2.30 so remove to to avoid
+build failures. Also resolve other deprecation issues.
+
+RP 2011/10/12
+
+Upstream-Status: Pending
+
+Index: git/libedataserver/e-data-server-util.c
+===================================================================
+--- git.orig/libedataserver/e-data-server-util.c	2011-10-12 01:42:40.622045788 +0100
++++ git/libedataserver/e-data-server-util.c	2011-10-12 01:48:16.732045664 +0100
+@@ -165,7 +165,8 @@
+ static gunichar
+ stripped_char (gunichar ch)
+ {
+-        gunichar *decomp, retval;
++        gunichar decomp[4];
++        gunichar retval;
+         GUnicodeType utype;
+         gsize dlen;
+ 
+@@ -175,7 +176,7 @@
+         case G_UNICODE_CONTROL:
+         case G_UNICODE_FORMAT:
+         case G_UNICODE_UNASSIGNED:
+-        case G_UNICODE_COMBINING_MARK:
++        case G_UNICODE_SPACING_MARK:
+                 /* Ignore those */
+                 return 0;
+                break;
+@@ -183,7 +184,7 @@
+                 /* Convert to lowercase, fall through */
+                 ch = g_unichar_tolower (ch);
+         case G_UNICODE_LOWERCASE_LETTER:
+-                if ((decomp = g_unicode_canonical_decomposition (ch, &dlen))) {
++                if ((dlen = g_unichar_fully_decompose (ch, FALSE, decomp, 4))) {
+                         retval = decomp[0];
+                         g_free (decomp);
+                         return retval;
+Index: git/addressbook/libedata-book/e-data-book-factory.c
+===================================================================
+--- git.orig/addressbook/libedata-book/e-data-book-factory.c	2011-10-12 01:52:25.692045500 +0100
++++ git/addressbook/libedata-book/e-data-book-factory.c	2011-10-12 01:53:31.862045707 +0100
+@@ -238,7 +238,7 @@
+ 	return g_strdup_printf (
+ 		"/org/gnome/evolution/dataserver/addressbook/%d/%u",
+ 		getpid (),
+-		g_atomic_int_exchange_and_add (&counter, 1));
++		g_atomic_int_add (&counter, 1));
+ }
+ 
+ static void
+Index: git/addressbook/libedata-book/e-data-book.c
+===================================================================
+--- git.orig/addressbook/libedata-book/e-data-book.c	2011-10-12 01:54:40.752045465 +0100
++++ git/addressbook/libedata-book/e-data-book.c	2011-10-12 01:55:16.012045897 +0100
+@@ -553,7 +553,7 @@
+ 
+ 	return g_strdup_printf ("/org/gnome/evolution/dataserver/addressbook/BookView/%d/%d",
+ 				getpid (),
+-				g_atomic_int_exchange_and_add ((int*)&counter, 1));
++				g_atomic_int_add ((int*)&counter, 1));
+ }
+ 
+ static void
+Index: git/calendar/libedata-cal/e-data-cal-factory.c
+===================================================================
+--- git.orig/calendar/libedata-cal/e-data-cal-factory.c	2011-10-12 01:57:56.612045081 +0100
++++ git/calendar/libedata-cal/e-data-cal-factory.c	2011-10-12 01:57:58.832045211 +0100
+@@ -227,7 +227,7 @@
+ 	return g_strdup_printf (
+ 		"/org/gnome/evolution/dataserver/calendar/%d/%u",
+ 		getpid (),
+-		g_atomic_int_exchange_and_add (&counter, 1));
++		g_atomic_int_add (&counter, 1));
+ }
+ 
+ static void
diff --git a/meta/recipes-sato/eds/eds-dbus_git.bb b/meta/recipes-sato/eds/eds-dbus_git.bb
index 7fa8311..9424353 100644
--- a/meta/recipes-sato/eds/eds-dbus_git.bb
+++ b/meta/recipes-sato/eds/eds-dbus_git.bb
@@ -12,7 +12,7 @@ DEPENDS = "intltool-native glib-2.0 gtk+ gconf dbus db gnome-common virtual/libi
 
 SRCREV = "7337d11aed576e7caaa12b4e881ad8d33668799f"
 PV = "2.30+git${SRCPV}"
-PR = "r1"
+PR = "r3"
 
 SRC_URI = "git://git.gnome.org/evolution-data-server;protocol=git \
            file://oh-contact.patch;striplevel=0 \
@@ -20,6 +20,7 @@ SRC_URI = "git://git.gnome.org/evolution-data-server;protocol=git \
            file://optional_imapx_provider.patch \
            file://new-contact-fix.patch \
            file://old-gdk-api.patch \
+           file://depbuildfix.patch \
            file://iconv-detect.h"
 
 S = "${WORKDIR}/git"




