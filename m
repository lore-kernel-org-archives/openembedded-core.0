Return-Path: <o.mandel@menlosystems.com>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id E86C565E1A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Oct 2014 16:43:44 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3jC4J100bHz3hjXT;
	Tue,  7 Oct 2014 18:43:44 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3jC4J04CChzvh21;
	Tue,  7 Oct 2014 18:43:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id nHS5R9Sn5zx8; Tue,  7 Oct 2014 18:43:42 +0200 (CEST)
X-Auth-Info: PJu0q7jbEn72WEx/4aSF+6f8UMsaZJtSOY9zes7rLvnM1cuGu5AhpKDQS/8dH2cA
Received: from [10.0.0.72] (host-212-18-10-182.customer.m-online.net
	[212.18.10.182])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue,  7 Oct 2014 18:43:42 +0200 (CEST)
Message-ID: <54341836.2070604@menlosystems.com>
Date: Tue, 07 Oct 2014 18:43:34 +0200
From: Olaf Mandel <o.mandel@menlosystems.com>
Organization: Menlo Systems
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <5433FB82.5010106@menlosystems.com>
In-Reply-To: <5433FB82.5010106@menlosystems.com>
X-Enigmail-Version: 1.6
X-Forwarded-Message-Id: <5433FB82.5010106@menlosystems.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] Images: handle rowstride != width*bytes_per_pixel
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
X-List-Received-Date: Tue, 07 Oct 2014 16:43:46 -0000
X-Groupsio-MsgNum: 58403
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="hWMwGOS2CaegTgWJ7jawIoSPiH8Kf57Kd"

--hWMwGOS2CaegTgWJ7jawIoSPiH8Kf57Kd
Content-Type: multipart/mixed;
 boundary="------------010202020705000700080602"

--------------010202020705000700080602
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



--------------010202020705000700080602
Content-Type: text/plain; charset=windows-1252;
 name="0001-Images-handle-rowstride-width-bytes_per_pixel.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename*0="0001-Images-handle-rowstride-width-bytes_per_pixel.patch"

From 0793aa7daf4b594fae1b412ab16a7d42d8c8560b Mon Sep 17 00:00:00 2001
From: Olaf Mandel <o.mandel@menlosystems.com>
Date: Tue, 7 Oct 2014 15:12:08 +0200
Subject: [PATCH 1/2] Images: handle rowstride !=3D width*bytes_per_pixel

Up till now, image data with a rowstride larger than the value
expected from width and bytes_per_pixel caused a trapezoid
distortion of the displayed image.

Signed-off-by: Olaf Mandel <o.mandel@menlosystems.com>
---
 ChangeLog    |    7 +++++++
 psplash-fb.c |   13 +++++++------
 psplash-fb.h |    1 +
 psplash.c    |    2 ++
 4 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/ChangeLog b/ChangeLog
index 8cf2156..f4fd0ec 100644
--- a/ChangeLog
+++ b/ChangeLog
@@ -1,3 +1,10 @@
+2014-10-07  Olaf Mandel <o.mandel@menlosystems.com>
+
+	* psplash-fb.c:
+	* psplash-fb.h:
+	* psplash.c:
+	Images: handle rowstride !=3D width*bytes_per_pixel
+
 2009-05-28  Richard Purdie <rpurdie@linux.intel.com>
=20
 	* psplash-fb.c:
diff --git a/psplash-fb.c b/psplash-fb.c
index 71740cd..bd9cd9d 100644
--- a/psplash-fb.c
+++ b/psplash-fb.c
@@ -370,13 +370,14 @@ psplash_fb_draw_image (PSplashFB    *fb,
 		       int          img_width,
 		       int          img_height,
 		       int          img_bytes_per_pixel,
+		       int          img_rowstride,
 		       uint8       *rle_data)
 {
   uint8       *p =3D rle_data;
   int          dx =3D 0, dy =3D 0,  total_len;
   unsigned int len;
=20
-  total_len =3D img_width * img_height * img_bytes_per_pixel;
+  total_len =3D img_rowstride * img_height;
=20
   /* FIXME: Optimise, check for over runs ... */
   while ((p - rle_data) < total_len)
@@ -391,11 +392,11 @@ psplash_fb_draw_image (PSplashFB    *fb,
=20
 	  do
 	    {
-	      if (img_bytes_per_pixel < 4 || *(p+3))
+	      if ((img_bytes_per_pixel < 4 || *(p+3)) && dx < img_width)
 	        psplash_fb_plot_pixel (fb, x+dx, y+dy, *(p), *(p+1), *(p+2));
-	      if (++dx >=3D img_width) { dx=3D0; dy++; }
+	      if (++dx * img_bytes_per_pixel >=3D img_rowstride) { dx=3D0; dy++; =
}
 	    }
-	  while (--len && (p - rle_data) < total_len);
+	  while (--len);
=20
 	  p +=3D img_bytes_per_pixel;
 	}
@@ -405,9 +406,9 @@ psplash_fb_draw_image (PSplashFB    *fb,
=20
 	  do
 	    {
-	      if (img_bytes_per_pixel < 4 || *(p+3))
+	      if ((img_bytes_per_pixel < 4 || *(p+3)) && dx < img_width)
 	        psplash_fb_plot_pixel (fb, x+dx, y+dy, *(p), *(p+1), *(p+2));
-	      if (++dx >=3D img_width) { dx=3D0; dy++; }
+	      if (++dx * img_bytes_per_pixel >=3D img_rowstride) { dx=3D0; dy++; =
}
 	      p +=3D img_bytes_per_pixel;
 	    }
 	  while (--len && (p - rle_data) < total_len);
diff --git a/psplash-fb.h b/psplash-fb.h
index ef5b39e..42592ed 100644
--- a/psplash-fb.h
+++ b/psplash-fb.h
@@ -82,6 +82,7 @@ psplash_fb_draw_image (PSplashFB    *fb,
 		       int          img_width,=20
 		       int          img_height,
 		       int          img_bytes_pre_pixel,
+		       int          img_rowstride,
 		       uint8       *rle_data);
=20
 void
diff --git a/psplash.c b/psplash.c
index 09cf0d0..543f67e 100644
--- a/psplash.c
+++ b/psplash.c
@@ -274,6 +274,7 @@ main (int argc, char** argv)
 			 POKY_IMG_WIDTH,
 			 POKY_IMG_HEIGHT,
 			 POKY_IMG_BYTES_PER_PIXEL,
+			 POKY_IMG_ROWSTRIDE,
 			 POKY_IMG_RLE_PIXEL_DATA);
=20
   /* Draw progress bar border */
@@ -283,6 +284,7 @@ main (int argc, char** argv)
 			 BAR_IMG_WIDTH,
 			 BAR_IMG_HEIGHT,
 			 BAR_IMG_BYTES_PER_PIXEL,
+			 BAR_IMG_ROWSTRIDE,
 			 BAR_IMG_RLE_PIXEL_DATA);
=20
   psplash_draw_progress (fb, 0);
--=20
1.7.10.4



--------------010202020705000700080602--

--hWMwGOS2CaegTgWJ7jawIoSPiH8Kf57Kd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (MingW32)

iQEcBAEBAgAGBQJUNBg+AAoJEFS9nbRiUh3/akwIAIOwHfu4MlIZtjzI58Fz4PnL
Fm9psC2pJ7ZKQn24Uh+0jMynN0uSriGWZ5kGV6RBnJciyfl101x/Cpm79ukpKopG
Hf5bfYUzk1uJUdOXW9OvZqY2VjcTqivc0t7BSZk2VbACW9zfrjrQIgddkGmhgiev
ywAcEs+e/c6nN8hqOiPcqttudQdRvf1Rjk9xhL5Pd9idJ+3UTGMv8/XikIUuekqY
+UK3C+V4qZ1qIX0lzj3UBxl9oXayxVBCCyCnaxrn5AGQ8vuTNHZa9Kh1V6vbnXQ4
LvY638cPyy/aH4+B6n4JlgXtG0HFVb6BaVfawwI5qm22DSflmPDzzcJZb2wuC8k=
=SDat
-----END PGP SIGNATURE-----

--hWMwGOS2CaegTgWJ7jawIoSPiH8Kf57Kd--
