Received: from mail-ee0-f48.google.com ([74.125.83.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1USSxo-0006Tv-16
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 16:03:56 +0200
Received: by mail-ee0-f48.google.com with SMTP id b15so742757eek.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 06:46:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=5z+O6kQ61vfgPUJRoI5R1dROD5Brnf9LikgKE2kw4Dg=;
	b=YgGVRrZzCxSeYIu3AFuwATbGIQT4DSPSeN/NRrFqhlBDW7SZbccDVUIreD3n1UKW+w
	RaYY/d2nrAIm1LVnAtZryMgwWUX2X0RlPC4mwOP2GcZenAV3Nss2oejdnZtsnMT2z+Z5
	5VtfdP7Unq2x5xRe0eLHujqg69KZ0t//uwdHz3Ttv23YVx1pvfh7GkTCEHMQghLRG9pB
	Rg68+LpTSfpHBA/qPycyVEuqhtNvsxvrls7s6pdAPepAkU/e+lzPmr6KQe5zro/3F57i
	ToiVMfYUrUWnTpn8JYzR9QNevG/coKXCtNSN1RtDURHSwNzvnKIOw4sQD49im9uISORd
	Gruw==
X-Received: by 10.15.32.142 with SMTP id a14mr18580218eev.22.1366206383784;
	Wed, 17 Apr 2013 06:46:23 -0700 (PDT)
Received: from ?IPv6:2001:610:612::21c1:ed39:9a9e:8f89?
	([2001:610:612:0:21c1:ed39:9a9e:8f89])
	by mx.google.com with ESMTPS id bk42sm9191213eeb.3.2013.04.17.06.46.21
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 17 Apr 2013 06:46:22 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1366205668-19096-2-git-send-email-ross.burton@intel.com>
Date: Wed, 17 Apr 2013 15:46:23 +0200
Message-Id: <D3C4D5BE-79FE-4F92-B9C8-3B6710142DD5@dominion.thruhere.net>
References: <1366205668-19096-1-git-send-email-ross.burton@intel.com>
	<1366205668-19096-2-git-send-email-ross.burton@intel.com>
To: Ross Burton <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQlJ9WeH0/l4KRaTwpjCbmYbNJUq5kgQMgule34ac59hpNr9cyjfM0dI26WN8uTWjcsbjzDg
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] cairo: drop transform patch, it's been rejected upstream
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
X-List-Received-Date: Wed, 17 Apr 2013 14:04:01 -0000
X-List-Received-Date: Wed, 17 Apr 2013 14:04:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Op 17 apr. 2013, om 15:34 heeft Ross Burton <ross.burton@intel.com> het =
volgende geschreven:

> This fix was rejected by upstream, the correct fix is actually to fix =
libpng.

That fix is supposed to be in libpng HEAD and appear in 1.6.2:

"The git head of libpng16 (and libpng17) has a fix that should allow =
user
transforms (but not png_set_user_transform_info) to be called after
png_read_update_info." - John Bowler

regards,

Koen


>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
> meta/recipes-graphics/cairo/cairo/png.patch |   77 =
++-------------------------
> 1 file changed, 3 insertions(+), 74 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/cairo/cairo/png.patch =
b/meta/recipes-graphics/cairo/cairo/png.patch
> index 15ce80a..bf00332 100644
> --- a/meta/recipes-graphics/cairo/cairo/png.patch
> +++ b/meta/recipes-graphics/cairo/cairo/png.patch
> @@ -1,81 +1,10 @@
> -libpng 1.6 is stricter in various ways, which trips up Cairo's PNG =
loader.
> +libpng 1.6 is stricter in various ways, which can trip up the PNG =
loader as it
> +considers all warnings fatal.
>=20
> -Upstream-Status: Submitted (first)/Backport (second)
> +Upstream-Status: Backport
> Signed-off-by: Ross Burton <ross.burton@intel.com>
>=20
>=20
> -=46rom 1535e4eeda7e0792fe5e7e5ab377c5253ee89ce7 Mon Sep 17 00:00:00 =
2001
> -From: Ingmar Runge <ingmar@irsoft.de>
> -Date: Tue, 16 Apr 2013 10:48:59 +0100
> -Subject: [PATCH 1/2] png: fix transform ordering
> -
> -libpng 1.6 is stricter with the function ordering, emitting the =
warning "invalid
> -before the PNG header has been read" when calling =
png_set_read_user_transform_fn
> -whilst loading a PNG.
> -
> -So, re-order the functions to the order that libpng is happy with.
> -
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> ----
> - src/cairo-png.c |   21 +++++++++++++++++++--
> - 1 file changed, 19 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/cairo-png.c b/src/cairo-png.c
> -index e74a4a8..3aec86a 100644
> ---- a/src/cairo-png.c
> -+++ b/src/cairo-png.c
> -@@ -497,6 +497,20 @@ convert_bytes_to_data (png_structp png, =
png_row_infop row_info, png_bytep data)
> -     }
> - }
> -=20
> -+/* branches into premultiply_data or convert_bytes_to_data depending =
on color type */
> -+static void read_user_transform_func (png_structp png, png_row_infop =
row_info, png_bytep data)
> -+{
> -+    switch ((cairo_format_t) png_get_user_transform_ptr (png)) {
> -+        case CAIRO_FORMAT_ARGB32:
> -+            premultiply_data (png, row_info, data);
> -+            break;
> -+
> -+        case CAIRO_FORMAT_RGB24:
> -+            convert_bytes_to_data (png, row_info, data);
> -+            break;
> -+    }
> -+}
> -+
> - static cairo_status_t
> - stdio_read_func (void *closure, unsigned char *data, unsigned int =
size)
> - {
> -@@ -623,6 +637,9 @@ read_png (struct png_read_closure_t *png_closure)
> -=20
> -     png_set_filler (png, 0xff, PNG_FILLER_AFTER);
> -=20
> -+    /* this must be stored before calling png_read_update_info */
> -+    png_set_read_user_transform_fn (png, read_user_transform_func);
> -+
> -     /* recheck header after setting EXPAND options */
> -     png_read_update_info (png, info);
> -     png_get_IHDR (png, info,
> -@@ -643,15 +660,15 @@ read_png (struct png_read_closure_t =
*png_closure)
> -=20
> - 	case PNG_COLOR_TYPE_RGB_ALPHA:
> - 	    format =3D CAIRO_FORMAT_ARGB32;
> --	    png_set_read_user_transform_fn (png, premultiply_data);
> - 	    break;
> -=20
> - 	case PNG_COLOR_TYPE_RGB:
> - 	    format =3D CAIRO_FORMAT_RGB24;
> --	    png_set_read_user_transform_fn (png, convert_bytes_to_data);
> - 	    break;
> -     }
> -=20
> -+    png_set_user_transform_info (png, (void*) format, 0, 0);
> -+
> -     stride =3D cairo_format_stride_for_width (format, png_width);
> -     if (stride < 0) {
> - 	surface =3D _cairo_surface_create_in_error (_cairo_error =
(CAIRO_STATUS_INVALID_STRIDE));
> ---=20
> -1.7.10.4
> -
> =46rom 2dd2c826a5b367d32cf2d48ed69754795990c5db Mon Sep 17 00:00:00 =
2001
> From: Chris Wilson <chris@chris-wilson.co.uk>
> Date: Tue, 16 Apr 2013 10:58:56 +0100
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



