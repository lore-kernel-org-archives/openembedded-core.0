Return-Path: <s.mueller-klieser@phytec.de>
Received: from root.phytec.de (mail.tricorecenter.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 01E7A76806
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 13:35:22 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id BBC94A00420
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 15:27:58 +0200 (CEST)
Received: from lws-mklieser.phytec.de ([172.16.10.21])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP5 HF413)
	with ESMTP id 2016080415275736-19331 ;
	Thu, 4 Aug 2016 15:27:57 +0200 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 4 Aug 2016 15:27:53 +0200
Message-Id: <1470317274-27771-7-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1470317274-27771-1-git-send-email-s.mueller-klieser@phytec.de>
References: <1470317274-27771-1-git-send-email-s.mueller-klieser@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP5
	HF413|March 21, 2016) at 04.08.2016 15:27:57,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP5 HF413|March 21,
	2016) at 04.08.2016 15:27:57
X-TNEFEvaluated: 1
Subject: [PATCH 6/7] matchbox-desktop: remove dangling patch
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
 ...thing-on-delete-event-when-not-STANDALONE.patch | 60 ------------------=
----
 1 file changed, 60 deletions(-)
 delete mode 100644 meta/recipes-sato/matchbox-desktop/files/0001-Do-nothin=
g-on-delete-event-when-not-STANDALONE.patch

diff --git a/meta/recipes-sato/matchbox-desktop/files/0001-Do-nothing-on-de=
lete-event-when-not-STANDALONE.patch b/meta/recipes-sato/matchbox-desktop/f=
iles/0001-Do-nothing-on-delete-event-when-not-STANDALONE.patch
deleted file mode 100644
index 46397dc..0000000
--- a/meta/recipes-sato/matchbox-desktop/files/0001-Do-nothing-on-delete-ev=
ent-when-not-STANDALONE.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 5fe37ef38500f858a22ecdf9bf69bf06e213bf68 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Tue, 22 Mar 2016 12:41:35 +0200
-Subject: [PATCH] Do nothing on delete-event when not STANDALONE
-
-This prevents an opportunistic alt-F4 from closing the desktop.
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-
-Upstream-Status: Backport
----
- src/desktop.c | 12 +++++++++++-
- 1 file changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/src/desktop.c b/src/desktop.c
-index d4fc2fb..94b4ddf 100644
---- a/src/desktop.c
-+++ b/src/desktop.c
-@@ -122,6 +122,15 @@ load=5Fitems (TakuMenu *menu)
-=20
- }
-=20
-+#ifndef STANDALONE
-+static gboolean
-+delete=5Fevent=5Fcb (GtkWidget *widget, GdkEvent *event, gpointer user=5F=
data)
-+{
-+  /* prevent default handler from destroying the window */
-+  return TRUE;
-+}
-+#endif
-+
- static void
- workarea=5Fchanged (int x, int y, int w, int h)
- {
-@@ -144,11 +153,11 @@ create=5Fdesktop (void)
-   gtk=5Ficon=5Fsize=5Fregister ("taku-icon", 64, 64);
-=20
-   window =3D gtk=5Fwindow=5Fnew (GTK=5FWINDOW=5FTOPLEVEL);
--  g=5Fsignal=5Fconnect (window, "delete-event", G=5FCALLBACK (gtk=5Fmain=
=5Fquit), NULL);
-   gtk=5Fwidget=5Fset=5Fname (window, "TakuWindow");
-   gtk=5Fwindow=5Fset=5Ftitle (GTK=5FWINDOW (window), =5F("Desktop"));
-=20
- #ifndef STANDALONE
-+  g=5Fsignal=5Fconnect (window, "delete-event", G=5FCALLBACK (delete=5Fev=
ent=5Fcb), NULL);
-   gtk=5Fwindow=5Fset=5Ftype=5Fhint (GTK=5FWINDOW (window), GDK=5FWINDOW=
=5FTYPE=5FHINT=5FDESKTOP);
-   gtk=5Fwindow=5Fset=5Fskip=5Ftaskbar=5Fhint (GTK=5FWINDOW (window), TRUE=
);
-=20
-@@ -156,6 +165,7 @@ create=5Fdesktop (void)
-   screen=5Fw =3D gdk=5Fscreen=5Fget=5Fwidth (screen);
-   screen=5Fh =3D gdk=5Fscreen=5Fget=5Fheight (screen);
- #else
-+  g=5Fsignal=5Fconnect (window, "delete-event", G=5FCALLBACK (gtk=5Fmain=
=5Fquit), NULL);
-   screen=5Fw =3D 640;
-   screen=5Fh =3D 480;
- #endif
---=20
-2.7.0
-
--=20
1.9.1


