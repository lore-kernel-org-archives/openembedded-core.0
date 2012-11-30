Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TeG0j-0004Ks-Ui
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 03:07:30 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so8370229eei.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 17:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=5VV0aeFMHAsaD3JyZ3Pz3ZiKwnyQpWX9w4eu7G5q4To=;
	b=n2qk2AUkJhV1mgmhFJHV6OOfxrs8OWuFU0zhtk4/kfKq8Nc/AouNswmFFaImLWaLb5
	a/7tn2UUoIgo9orkT4gWkvmISMhFMj3prMgpw+qBmyZArf7xVFtsuBqiZIaN0eGFgRR+
	UmTkSw0IySZsMaIU481Yp5dzqxapNr2u3/5S6FsakZHJN9rYeYMqAeCWH65ZsKCQ5Aza
	F6HNPlZA5SwzAqenfxda1vysB0tIK01nVvCWDcaodTzKLktUYW/GPQ0CRmmtlHSi5b9T
	BlkzbSQAMwiZz/2CPK6A0g9Q4xlfcUV3UgjhgUGvClmWQdfBP36Vj7gs/dROvmyyfXW9
	wvDA==
Received: by 10.14.203.132 with SMTP id f4mr88893581eeo.11.1354240389367;
	Thu, 29 Nov 2012 17:53:09 -0800 (PST)
Received: from localhost.localdomain (p5B0A28F6.dip.t-dialin.net.
	[91.10.40.246])
	by mx.google.com with ESMTPS id e1sm7397344eem.3.2012.11.29.17.53.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Nov 2012 17:53:08 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2012 02:52:56 +0100
Message-Id: <1354240376-3009-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [V2] gtk+: do not prelight GtkButton in touchscreen mode
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
X-List-Received-Date: Fri, 30 Nov 2012 02:09:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...utton-do-not-prelight-in-touchscreen-mode.patch |   48 ++++++++++++++++++++
 meta/recipes-gnome/gtk+/gtk+_2.24.13.bb            |    3 +-
 2 files changed, 50 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+-2.24.13/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch

diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.13/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.13/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch
new file mode 100644
index 0000000..19245a8
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+-2.24.13/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch
@@ -0,0 +1,48 @@
+From d1f7a894674dfdd6769f1bbae31eb1a69e451a5c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Fri, 16 Nov 2012 22:07:28 +0100
+Subject: [PATCH] GtkButton: do not prelight in touchscreen mode
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Code was copied from GtkToggleButton.
+
+Upstream-Status: pending [1]
+
+https://bugzilla.gnome.org/show_bug.cgi?id=689138
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ gtk/gtkbutton.c |    8 ++++++--
+ 1 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/gtk/gtkbutton.c b/gtk/gtkbutton.c
+index f472007..1beb1b6 100644
+--- a/gtk/gtkbutton.c
++++ b/gtk/gtkbutton.c
+@@ -2079,15 +2079,19 @@ _gtk_button_set_depressed (GtkButton *button,
+ static void
+ gtk_button_update_state (GtkButton *button)
+ {
+-  gboolean depressed;
++  gboolean depressed, touchscreen;
+   GtkStateType new_state;
+ 
++  g_object_get (gtk_widget_get_settings (GTK_WIDGET (button)),
++                "gtk-touchscreen-mode", &touchscreen,
++                NULL);
++
+   if (button->activate_timeout)
+     depressed = button->depress_on_activate;
+   else
+     depressed = button->in_button && button->button_down;
+ 
+-  if (button->in_button && (!button->button_down || !depressed))
++  if (!touchscreen && button->in_button && (!button->button_down || !depressed))
+     new_state = GTK_STATE_PRELIGHT;
+   else
+     new_state = depressed ? GTK_STATE_ACTIVE : GTK_STATE_NORMAL;
+-- 
+1.7.6.5
+
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.13.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.13.bb
index b358b7f..bc88284 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.13.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.13.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.xz \
            file://toggle-font.diff;striplevel=0 \
            file://0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch \
            file://doc-fixes.patch \
+           file://0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch \
 	  "
 
 # TO MERGE
@@ -27,7 +28,7 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.xz \
 #        file://combo-arrow-size.patch;striplevel=0
 #            file://configurefix.patch
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "e949406751df51e1e40e85628005a069"
 SRC_URI[sha256sum] = "35e1a01e46b02970b02ee9f299390d0aa57c1215ad2667bcd584b72f4ea6513d"
-- 
1.7.4.4



