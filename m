Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.34])
	by mail.openembedded.org (Postfix) with ESMTP id B877C71B45
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 07:26:37 +0000 (UTC)
Received: from 1cX0vc-000798-Td by out11b.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1cX0vc-0007BM-VH
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2017 23:26:36 -0800
Received: by emcmailer; Thu, 26 Jan 2017 23:26:36 -0800
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11b.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1cX0vc-000798-Td
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2017 23:26:36 -0800
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.319.2;
	Fri, 27 Jan 2017 08:26:14 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jan 2017 08:26:12 +0100
Message-ID: <1485501972-62727-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: sona.sarmadi@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:AES128-SHA:128
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: [PATCH][morty] libxrender: CVE-2016-7949
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
X-List-Received-Date: Fri, 27 Jan 2017 07:26:42 -0000
Content-Type: text/plain

Insufficient validation of server responses results
in overflow of previously reserved memory

Upstream patch:
https://cgit.freedesktop.org/xorg/lib/libXrender/commit/?id=9362c7ddd1af3b168953d0737877bc52d79c94f4

External References:
https://lists.x.org/archives/xorg-announce/2016-October/002720.html
https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2016-7949

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 .../xorg-lib/libxrender/CVE-2016-7949.patch        | 59 ++++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libxrender_0.9.9.bb |  3 ++
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxrender/CVE-2016-7949.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxrender/CVE-2016-7949.patch b/meta/recipes-graphics/xorg-lib/libxrender/CVE-2016-7949.patch
new file mode 100644
index 0000000..73315b1
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxrender/CVE-2016-7949.patch
@@ -0,0 +1,59 @@
+From 9362c7ddd1af3b168953d0737877bc52d79c94f4 Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Sun, 25 Sep 2016 21:43:09 +0200
+Subject: Validate lengths while parsing server data.
+
+Individual lengths inside received server data can overflow
+the previously reserved memory.
+
+It is therefore important to validate every single length
+field to not overflow the previously agreed sum of all invidual
+length fields.
+
+v2: consume remaining bytes in the reply buffer on error.
+
+CVE: CVE-2016-7949
+Upstream-Status: Backport
+
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+Reviewed-by: Matthieu Herrb@laas.fr
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+
+diff --git a/src/Xrender.c b/src/Xrender.c
+index 3102eb2..71cf3e6 100644
+--- a/src/Xrender.c
++++ b/src/Xrender.c
+@@ -533,12 +533,30 @@ XRenderQueryFormats (Display *dpy)
+ 	screen->fallback = _XRenderFindFormat (xri, xScreen->fallback);
+ 	screen->subpixel = SubPixelUnknown;
+ 	xDepth = (xPictDepth *) (xScreen + 1);
++	if (screen->ndepths > rep.numDepths) {
++	    Xfree (xri);
++	    Xfree (xData);
++	    _XEatDataWords (dpy, rep.length);
++	    UnlockDisplay (dpy);
++	    SyncHandle ();
++	    return 0;
++	}
++	rep.numDepths -= screen->ndepths;
+ 	for (nd = 0; nd < screen->ndepths; nd++)
+ 	{
+ 	    depth->depth = xDepth->depth;
+ 	    depth->nvisuals = xDepth->nPictVisuals;
+ 	    depth->visuals = visual;
+ 	    xVisual = (xPictVisual *) (xDepth + 1);
++	    if (depth->nvisuals > rep.numVisuals) {
++		Xfree (xri);
++		Xfree (xData);
++		_XEatDataWords (dpy, rep.length);
++		UnlockDisplay (dpy);
++		SyncHandle ();
++		return 0;
++	    }
++	    rep.numVisuals -= depth->nvisuals;
+ 	    for (nv = 0; nv < depth->nvisuals; nv++)
+ 	    {
+ 		visual->visual = _XRenderFindVisual (dpy, xVisual->visual);
+-- 
+cgit v0.10.2
+
diff --git a/meta/recipes-graphics/xorg-lib/libxrender_0.9.9.bb b/meta/recipes-graphics/xorg-lib/libxrender_0.9.9.bb
index 44cb2e0..eac3679 100644
--- a/meta/recipes-graphics/xorg-lib/libxrender_0.9.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrender_0.9.9.bb
@@ -19,5 +19,8 @@ XORG_PN = "libXrender"
 
 BBCLASSEXTEND = "native nativesdk"
 
+SRC_URI += "file://CVE-2016-7949.patch \
+        "
+
 SRC_URI[md5sum] = "5db92962b124ca3a8147daae4adbd622"
 SRC_URI[sha256sum] = "fc2fe57980a14092426dffcd1f2d9de0987b9d40adea663bd70d6342c0e9be1a"
-- 
1.9.1


