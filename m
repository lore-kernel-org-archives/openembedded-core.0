Received: from mail-wi0-f180.google.com ([209.85.212.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UT9is-0000Nq-SN
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2013 13:43:24 +0200
Received: by mail-wi0-f180.google.com with SMTP id h11so645423wiv.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2013 04:25:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=3XDq2Tx8K1tm8WnhAv8mNj+sI7mzJeov5eBU7GAHLTg=;
	b=TNeS0HuzhChVirQnd5yzXdVRGCqGtwkUR3RzKca5l1GiGtrkba8Hm/T9gcE6E/Wre/
	ra9l65wVQ2FKSiQ/QXKQKIndKxnCWpHd/pU1K+W6G0zTGUQ67jgEbHP/DUNDSBwAa6Co
	wp+hDSWc0vjuoKlrAbbt+2AgplDLYFLVedxa4cGhp9N9viYHUZ1W6tSg96bhylQBL6qs
	trPiJw/hHBeKs9lu4wiMyuQaa/WJAppxBJZerJ+UGwwxVOfiMh4MhCwtC6Gq/5TKGWQP
	lW1CW2unQBcX2I2OqQAua/Lnte4bhHSqFXjY0eWsYNhGDMa+MWa7Wr0NEvgT8Q5bp5Uj
	IBEA==
X-Received: by 10.194.92.176 with SMTP id cn16mr6822865wjb.51.1366370748237;
	Fri, 19 Apr 2013 04:25:48 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id s2sm2996349wib.4.2013.04.19.04.25.46
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 19 Apr 2013 04:25:47 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Apr 2013 12:22:57 +0100
Message-Id: <1366370577-16280-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQkzx4frGZz5dCBE4fz5OX28FwKRJkmU78vu9Lwlcs58daFFXpyudF2QRDJ5lvpSOtN7CEQz
Subject: [PATCH] gconf: silence some spurious errors
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Apr 2013 11:43:35 -0000

The postinstalls were producing errors like this:

  (gconftool-2.real:10095): GConf-WARNING **: Client failed to connect to the D-BUS daemon:
  Using X11 for dbus-daemon autolaunch was disabled at compile time, set your DBUS_SESSION_BUS_ADDRESS instead

These are harmless but distracting, so take a patch from upstream to silence
them.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gnome/gconf/unable-connect-dbus.patch          |   95 ++++++++++++++++++++
 meta/recipes-gnome/gnome/gconf_3.2.6.bb            |    1 +
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-gnome/gnome/gconf/unable-connect-dbus.patch

diff --git a/meta/recipes-gnome/gnome/gconf/unable-connect-dbus.patch b/meta/recipes-gnome/gnome/gconf/unable-connect-dbus.patch
new file mode 100644
index 0000000..f758a4b
--- /dev/null
+++ b/meta/recipes-gnome/gnome/gconf/unable-connect-dbus.patch
@@ -0,0 +1,95 @@
+Fixes errors such as this in the rootfs generation:
+
+(gconftool-2.real:10095): GConf-WARNING **: Client failed to connect to the D-BUS daemon:
+Using X11 for dbus-daemon autolaunch was disabled at compile time, set your DBUS_SESSION_BUS_ADDRESS instead
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From b0895e1998ebc83ab030ec0f17c0685439f5b404 Mon Sep 17 00:00:00 2001
+From: Ray Strode <rstrode@redhat.com>
+Date: Mon, 15 Apr 2013 09:57:34 -0400
+Subject: [PATCH] dbus: Don't spew to console when unable to connect to dbus
+ daemon
+
+Instead pass the error up for the caller to decide what to do.
+
+This prevent untrappable warning messages from showing up at the
+console if gconftool --makefile-install-rule is called.
+---
+ gconf/gconf-dbus.c |   24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/gconf/gconf-dbus.c b/gconf/gconf-dbus.c
+index 5610fcf..048e3ea 100644
+--- a/gconf/gconf-dbus.c
++++ b/gconf/gconf-dbus.c
+@@ -105,7 +105,7 @@ static GHashTable     *engines_by_db = NULL;
+ static GHashTable     *engines_by_address = NULL;
+ static gboolean        dbus_disconnected = FALSE;
+ 
+-static gboolean     ensure_dbus_connection      (void);
++static gboolean     ensure_dbus_connection      (GError **error);
+ static gboolean     ensure_service              (gboolean          start_if_not_found,
+ 						 GError          **err);
+ static gboolean     ensure_database             (GConfEngine      *conf,
+@@ -383,7 +383,7 @@ gconf_engine_detach (GConfEngine *conf)
+ }
+ 
+ static gboolean
+-ensure_dbus_connection (void)
++ensure_dbus_connection (GError **err)
+ {
+   DBusError error;
+ 
+@@ -392,7 +392,9 @@ ensure_dbus_connection (void)
+ 
+   if (dbus_disconnected)
+     {
+-      g_warning ("The connection to DBus was broken. Can't reinitialize it.");
++      g_set_error (err, GCONF_ERROR,
++                   GCONF_ERROR_NO_SERVER,
++                   "The connection to DBus was broken. Can't reinitialize it.");
+       return FALSE;
+     }
+ 
+@@ -402,7 +404,10 @@ ensure_dbus_connection (void)
+   
+   if (!global_conn) 
+     {
+-      g_warning ("Client failed to connect to the D-BUS daemon:\n%s", error.message);
++      g_set_error (err, GCONF_ERROR,
++                   GCONF_ERROR_NO_SERVER,
++                   "Client failed to connect to the D-BUS daemon:\n%s",
++                   error.message);
+       
+       dbus_error_free (&error);
+       return FALSE;
+@@ -431,13 +436,8 @@ ensure_service (gboolean  start_if_not_found,
+ 
+   if (global_conn == NULL)
+     {
+-      if (!ensure_dbus_connection ())
+-	{
+-	  g_set_error (err, GCONF_ERROR,
+-		       GCONF_ERROR_NO_SERVER,
+-		       _("No D-BUS daemon running\n"));
+-	  return FALSE;
+-	}
++      if (!ensure_dbus_connection (err))
++        return FALSE;
+ 
+       g_assert (global_conn != NULL);
+     }
+@@ -2512,7 +2512,7 @@ gconf_ping_daemon (void)
+ {
+   if (global_conn == NULL)
+   {
+-    if (!ensure_dbus_connection ())
++    if (!ensure_dbus_connection (NULL))
+     {
+       return FALSE;
+     }
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
index a245fa2..a1843d5 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -12,6 +12,7 @@ inherit gnomebase gtk-doc
 
 SRC_URI = "${GNOME_MIRROR}/GConf/${@gnome_verdir("${PV}")}/GConf-${PV}.tar.xz;name=archive \
            file://remove_plus_from_invalid_characters_list.patch \
+           file://unable-connect-dbus.patch \
 "
 
 SRC_URI[archive.md5sum] = "2b16996d0e4b112856ee5c59130e822c"
-- 
1.7.10.4



