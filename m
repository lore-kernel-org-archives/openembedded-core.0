Received: from mail-ee0-f52.google.com ([74.125.83.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1US4ku-0005LD-7s
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 14:13:05 +0200
Received: by mail-ee0-f52.google.com with SMTP id b57so53815eek.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 04:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=rRsogtNVkPlnLGOLw9TTcx0Ov6OCy1j+LbAb0wochnw=;
	b=U37iF9eB6qS4+VPEgeGEH6ZDJpVjGILYWERwGobeeTO+8ZRMEOLBGcBnS6z2iJooFi
	D+uIN5UOAlYyEORywJkatze2aS1VQ50F8iI/QUA0nB83mSNOGJ9l/MopwM1znFEhwSGW
	UH05dPqc8Xgy4Ehh28Q7lB+vcyTyoICoWvsMhGXYI30csQpa+D4jIuFOy893TsaUApOr
	9U8x2g+Od1EWMtHK8+C/lzM9ngdBH40Hv1HnnOtMuiHftxD1rKTI6yXDU0JoXDLP7urB
	7H/Aamd9yi2Duud42th27U0kZMOT6xf5cPdAgxX1ZVVN/OR6F9MSlW4n/GUvSW/VkrCn
	Apdg==
X-Received: by 10.15.102.3 with SMTP id bq3mr5571330eeb.42.1366113328885;
	Tue, 16 Apr 2013 04:55:28 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id i53sm2472897eeu.5.2013.04.16.04.55.26
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 04:55:27 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1366111789-24156-1-git-send-email-ross.burton@intel.com>
Date: Tue, 16 Apr 2013 13:55:29 +0200
Message-Id: <760EB53F-6A7D-4020-AE87-914F3E9E9368@dominion.thruhere.net>
References: <1366111789-24156-1-git-send-email-ross.burton@intel.com>
To: Ross Burton <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQluy8euWumiA+K/DnDBrYfZ5C6G7/d2bBvnXChbBUZU2HSjsxBoZjucYO79+mkN5ebtWrvi
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cairo: fix builds with libpng 1.6
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
X-List-Received-Date: Tue, 16 Apr 2013 12:14:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 apr. 2013, om 13:29 heeft Ross Burton <ross.burton@intel.com> het =
volgende geschreven:

> libpng 1.6 emits more warnings than before, and is also stricter with =
function
> ordering.  Fix the function ordering when reading PNGs, and stop =
treating all
> warnings as errors.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>

This fixes the weston/cairo issue for me :)

Tested-by: Koen Kooi <koen@dominion.thruhere.net>

> ---
> meta/recipes-graphics/cairo/cairo/png.patch  |  123 =
++++++++++++++++++++++++++
> meta/recipes-graphics/cairo/cairo_1.12.14.bb |    3 +-
> 2 files changed, 125 insertions(+), 1 deletion(-)
> create mode 100644 meta/recipes-graphics/cairo/cairo/png.patch
>=20
> diff --git a/meta/recipes-graphics/cairo/cairo/png.patch =
b/meta/recipes-graphics/cairo/cairo/png.patch
> new file mode 100644
> index 0000000..15ce80a
> --- /dev/null
> +++ b/meta/recipes-graphics/cairo/cairo/png.patch
> @@ -0,0 +1,123 @@
> +libpng 1.6 is stricter in various ways, which trips up Cairo's PNG =
loader.
> +
> +Upstream-Status: Submitted (first)/Backport (second)
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +
> +=46rom 1535e4eeda7e0792fe5e7e5ab377c5253ee89ce7 Mon Sep 17 00:00:00 =
2001
> +From: Ingmar Runge <ingmar@irsoft.de>
> +Date: Tue, 16 Apr 2013 10:48:59 +0100
> +Subject: [PATCH 1/2] png: fix transform ordering
> +
> +libpng 1.6 is stricter with the function ordering, emitting the =
warning "invalid
> +before the PNG header has been read" when calling =
png_set_read_user_transform_fn
> +whilst loading a PNG.
> +
> +So, re-order the functions to the order that libpng is happy with.
> +
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +---
> + src/cairo-png.c |   21 +++++++++++++++++++--
> + 1 file changed, 19 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/cairo-png.c b/src/cairo-png.c
> +index e74a4a8..3aec86a 100644
> +--- a/src/cairo-png.c
> ++++ b/src/cairo-png.c
> +@@ -497,6 +497,20 @@ convert_bytes_to_data (png_structp png, =
png_row_infop row_info, png_bytep data)
> +     }
> + }
> +=20
> ++/* branches into premultiply_data or convert_bytes_to_data depending =
on color type */
> ++static void read_user_transform_func (png_structp png, png_row_infop =
row_info, png_bytep data)
> ++{
> ++    switch ((cairo_format_t) png_get_user_transform_ptr (png)) {
> ++        case CAIRO_FORMAT_ARGB32:
> ++            premultiply_data (png, row_info, data);
> ++            break;
> ++
> ++        case CAIRO_FORMAT_RGB24:
> ++            convert_bytes_to_data (png, row_info, data);
> ++            break;
> ++    }
> ++}
> ++
> + static cairo_status_t
> + stdio_read_func (void *closure, unsigned char *data, unsigned int =
size)
> + {
> +@@ -623,6 +637,9 @@ read_png (struct png_read_closure_t *png_closure)
> +=20
> +     png_set_filler (png, 0xff, PNG_FILLER_AFTER);
> +=20
> ++    /* this must be stored before calling png_read_update_info */
> ++    png_set_read_user_transform_fn (png, read_user_transform_func);
> ++
> +     /* recheck header after setting EXPAND options */
> +     png_read_update_info (png, info);
> +     png_get_IHDR (png, info,
> +@@ -643,15 +660,15 @@ read_png (struct png_read_closure_t =
*png_closure)
> +=20
> + 	case PNG_COLOR_TYPE_RGB_ALPHA:
> + 	    format =3D CAIRO_FORMAT_ARGB32;
> +-	    png_set_read_user_transform_fn (png, premultiply_data);
> + 	    break;
> +=20
> + 	case PNG_COLOR_TYPE_RGB:
> + 	    format =3D CAIRO_FORMAT_RGB24;
> +-	    png_set_read_user_transform_fn (png, convert_bytes_to_data);
> + 	    break;
> +     }
> +=20
> ++    png_set_user_transform_info (png, (void*) format, 0, 0);
> ++
> +     stride =3D cairo_format_stride_for_width (format, png_width);
> +     if (stride < 0) {
> + 	surface =3D _cairo_surface_create_in_error (_cairo_error =
(CAIRO_STATUS_INVALID_STRIDE));
> +--=20
> +1.7.10.4
> +
> +=46rom 2dd2c826a5b367d32cf2d48ed69754795990c5db Mon Sep 17 00:00:00 =
2001
> +From: Chris Wilson <chris@chris-wilson.co.uk>
> +Date: Tue, 16 Apr 2013 10:58:56 +0100
> +Subject: [PATCH] png: Avoid marking the surface as in error after a =
png
> + warning
> +
> +It turns out that libpng will continue to load an image after =
throwing a
> +warning, and that libpng16 now throws warnings for images that =
libpng15
> +and earlier loaded without error. As we were happily loading those
> +images into cairo surfaces before, we are therefore being overzealous
> +in throwing an error now - so just squelch the warning.
> +
> +Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> +---
> + src/cairo-png.c |   14 +++++++-------
> + 1 file changed, 7 insertions(+), 7 deletions(-)
> +
> +diff --git a/src/cairo-png.c b/src/cairo-png.c
> +index e74a4a8..068617d 100644
> +--- a/src/cairo-png.c
> ++++ b/src/cairo-png.c
> +@@ -149,13 +149,13 @@ static void
> + png_simple_warning_callback (png_structp png,
> + 	                     png_const_charp error_msg)
> + {
> +-    cairo_status_t *error =3D png_get_error_ptr (png);
> +-
> +-    /* default to the most likely error */
> +-    if (*error =3D=3D CAIRO_STATUS_SUCCESS)
> +-	*error =3D _cairo_error (CAIRO_STATUS_NO_MEMORY);
> +-
> +-    /* png does not expect to abort and will try to tidy up after a =
warning */
> ++    /* png does not expect to abort and will try to tidy up and =
continue
> ++     * loading the image after a warning. So we also want to return =
the
> ++     * (incorrect?) surface.
> ++     *
> ++     * We use our own warning callback to squelch any attempts by =
libpng
> ++     * to write to stderr as we may not be in control of that =
output.
> ++     */
> + }
> +=20
> +=20
> +--=20
> +1.7.10.4
> +
> diff --git a/meta/recipes-graphics/cairo/cairo_1.12.14.bb =
b/meta/recipes-graphics/cairo/cairo_1.12.14.bb
> index 16f9d7b..40aa169 100644
> --- a/meta/recipes-graphics/cairo/cairo_1.12.14.bb
> +++ b/meta/recipes-graphics/cairo/cairo_1.12.14.bb
> @@ -4,7 +4,8 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3De73e999e0c72b5ac9012424fa157ad77"
>=20
> PR =3D "r0"
>=20
> -SRC_URI =3D "http://cairographics.org/releases/cairo-${PV}.tar.xz"
> +SRC_URI =3D "http://cairographics.org/releases/cairo-${PV}.tar.xz \
> +           file://png.patch"
>=20
> SRC_URI[md5sum] =3D "27b634113d0f52152d60ae8e2ec7daa7"
> SRC_URI[sha256sum] =3D =
"96d0d1e3f9b74d2ca3469ff187c5e5f25649b1ad35cf06f4f3a83847dff4ac13"
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



