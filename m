Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.35])
	by mail.openembedded.org (Postfix) with ESMTP id 4D8E0772F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 11:46:29 +0000 (UTC)
Received: from 1cYAPj-0005Bq-TL by out10d.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1cYAPj-0005CG-Tu
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2017 03:46:27 -0800
Received: by emcmailer; Mon, 30 Jan 2017 03:46:27 -0800
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10d.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1cYAPj-0005Bq-TL
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2017 03:46:27 -0800
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.319.2;
	Mon, 30 Jan 2017 12:46:26 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 30 Jan 2017 12:46:22 +0100
Message-ID: <1485776783-44453-1-git-send-email-sona.sarmadi@enea.com>
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
Subject: [PATCH][morty 1/2] libX11: CVE-2016-7942
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
X-List-Received-Date: Mon, 30 Jan 2017 11:46:38 -0000
Content-Type: text/plain

The XGetImage function in X.org libX11 before 1.6.4 might allow remote X
servers to gain privileges via vectors involving image type and geometry,
which triggers out-of-bounds read operations.

References
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-7942
Upstream patch
https://cgit.freedesktop.org/xorg/lib/libX11/commit/?id=8ea762f94f4c942d898fdeb590a1630c83235c17

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 .../xorg-lib/libx11/CVE-2016-7942.patch            | 69 ++++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libx11_1.6.3.bb     |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2016-7942.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11/CVE-2016-7942.patch b/meta/recipes-graphics/xorg-lib/libx11/CVE-2016-7942.patch
new file mode 100644
index 0000000..f5b4d69
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2016-7942.patch
@@ -0,0 +1,69 @@
+From 8ea762f94f4c942d898fdeb590a1630c83235c17 Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Sun, 25 Sep 2016 21:25:25 +0200
+Subject: Validation of server responses in XGetImage()
+
+Check if enough bytes were received for specified image type and
+geometry. Otherwise GetPixel and other functions could trigger an
+out of boundary read later on.
+
+CVE: CVE-2016-7942
+Upstream-Status: Backport
+
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+Reviewed-by: Matthieu Herrb <matthieu@herrb.eu>
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+
+diff --git a/src/GetImage.c b/src/GetImage.c
+index c461abc..ff32d58 100644
+--- a/src/GetImage.c
++++ b/src/GetImage.c
+@@ -59,6 +59,7 @@ XImage *XGetImage (
+ 	char *data;
+ 	unsigned long nbytes;
+ 	XImage *image;
++	int planes;
+ 	LockDisplay(dpy);
+ 	GetReq (GetImage, req);
+ 	/*
+@@ -91,18 +92,28 @@ XImage *XGetImage (
+ 	    return (XImage *) NULL;
+ 	}
+         _XReadPad (dpy, data, nbytes);
+-        if (format == XYPixmap)
+-	   image = XCreateImage(dpy, _XVIDtoVisual(dpy, rep.visual),
+-		  Ones (plane_mask &
+-			(((unsigned long)0xFFFFFFFF) >> (32 - rep.depth))),
+-		  format, 0, data, width, height, dpy->bitmap_pad, 0);
+-	else /* format == ZPixmap */
+-           image = XCreateImage (dpy, _XVIDtoVisual(dpy, rep.visual),
+-		 rep.depth, ZPixmap, 0, data, width, height,
+-		  _XGetScanlinePad(dpy, (int) rep.depth), 0);
++        if (format == XYPixmap) {
++	    image = XCreateImage(dpy, _XVIDtoVisual(dpy, rep.visual),
++		Ones (plane_mask &
++		    (((unsigned long)0xFFFFFFFF) >> (32 - rep.depth))),
++		format, 0, data, width, height, dpy->bitmap_pad, 0);
++	    planes = image->depth;
++	} else { /* format == ZPixmap */
++            image = XCreateImage (dpy, _XVIDtoVisual(dpy, rep.visual),
++		rep.depth, ZPixmap, 0, data, width, height,
++		    _XGetScanlinePad(dpy, (int) rep.depth), 0);
++	    planes = 1;
++	}
+ 
+ 	if (!image)
+ 	    Xfree(data);
++	if (planes < 1 || image->height < 1 || image->bytes_per_line < 1 ||
++	    INT_MAX / image->height <= image->bytes_per_line ||
++	    INT_MAX / planes <= image->height * image->bytes_per_line ||
++	    nbytes < planes * image->height * image->bytes_per_line) {
++	    XDestroyImage(image);
++	    image = NULL;
++	}
+ 	UnlockDisplay(dpy);
+ 	SyncHandle();
+ 	return (image);
+-- 
+cgit v0.10.2
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.3.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.3.bb
index 8e531c7..152ccd9 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.6.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.3.bb
@@ -5,6 +5,7 @@ BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI += "file://disable_tests.patch \
             file://libX11-Add-missing-NULL-check.patch \
+            file://CVE-2016-7942.patch \
            "
 
 SRC_URI[md5sum] = "2e36b73f8a42143142dda8129f02e4e0"
-- 
1.9.1


