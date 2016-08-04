Return-Path: <s.mueller-klieser@phytec.de>
Received: from root.phytec.de (mail.phytec.co.uk [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id F273E6FF78
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 13:35:22 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id CB5A1A00427
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 15:27:58 +0200 (CEST)
Received: from lws-mklieser.phytec.de ([172.16.10.21])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP5 HF413)
	with ESMTP id 2016080415275739-19332 ;
	Thu, 4 Aug 2016 15:27:57 +0200 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 4 Aug 2016 15:27:54 +0200
Message-Id: <1470317274-27771-8-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1470317274-27771-1-git-send-email-s.mueller-klieser@phytec.de>
References: <1470317274-27771-1-git-send-email-s.mueller-klieser@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP5
	HF413|March 21, 2016) at 04.08.2016 15:27:57,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP5 HF413|March 21,
	2016) at 04.08.2016 15:27:57
X-TNEFEvaluated: 1
Subject: [PATCH 7/7] matchbox-panel-2: remove dangling patch
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
X-List-Received-Date: Thu, 04 Aug 2016 13:35:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
 ...top-Make-sure-active-state-is-initialized.patch | 50 ------------------=
----
 1 file changed, 50 deletions(-)
 delete mode 100644 meta/recipes-sato/matchbox-panel-2/files/0001-showdeskt=
op-Make-sure-active-state-is-initialized.patch

diff --git a/meta/recipes-sato/matchbox-panel-2/files/0001-showdesktop-Make=
-sure-active-state-is-initialized.patch b/meta/recipes-sato/matchbox-panel-=
2/files/0001-showdesktop-Make-sure-active-state-is-initialized.patch
deleted file mode 100644
index 3bab6d2..0000000
--- a/meta/recipes-sato/matchbox-panel-2/files/0001-showdesktop-Make-sure-a=
ctive-state-is-initialized.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From a0b5fca04da208990f3c40e65dbb045da4cdb35e Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Sun, 20 Mar 2016 13:24:37 +0200
-Subject: [PATCH] showdesktop: Make sure active state is initialized
-
-There are cases (in qemu at least) where set=5Factive()
-is never called on startup. Make sure we initialize the active
-state so the icon gets loaded and the applet is not confused
-about the current state.
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-
-Upstream-Status: Backport
----
- applets/showdesktop/showdesktop.c | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/applets/showdesktop/showdesktop.c b/applets/showdesktop/showd=
esktop.c
-index 61dd5c2..33c13e1 100644
---- a/applets/showdesktop/showdesktop.c
-+++ b/applets/showdesktop/showdesktop.c
-@@ -181,6 +181,12 @@ button=5Fclicked=5Fcb (GtkButton         *button,
- 	            &xev);
- }
-=20
-+static void
-+realize=5Fcb (GtkWidget *button, ShowDesktopApplet *applet)
-+{
-+        sync=5Fapplet (applet);
-+}
-+
- G=5FMODULE=5FEXPORT GtkWidget *
- mb=5Fpanel=5Fapplet=5Fcreate (const char    *id,
-                         GtkOrientation orientation)
-@@ -216,6 +222,10 @@ mb=5Fpanel=5Fapplet=5Fcreate (const char    *id,
-                           "clicked",
-                           G=5FCALLBACK (button=5Fclicked=5Fcb),
-                           applet);
-+        g=5Fsignal=5Fconnect (button,
-+                          "realize",
-+                          G=5FCALLBACK (realize=5Fcb),
-+                          applet);
-=20
-         g=5Fobject=5Fweak=5Fref (G=5FOBJECT (button),
-                            (GWeakNotify) show=5Fdesktop=5Fapplet=5Ffree,
---=20
-2.7.0
-
--=20
1.9.1


