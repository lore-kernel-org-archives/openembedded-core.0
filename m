Received: from mail-ea0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1USSzY-0006gV-BF
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 16:05:51 +0200
Received: by mail-ea0-f178.google.com with SMTP id o10so762524eaj.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 06:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=QnGVFof29ojYuEujAnEZy1WVAMxM1cL5ZADLTz4MO/A=;
	b=J3IdJdzMfQDfc1mXzTbanBUZaCLeOOAWCf6YEsWzgGKb9tgoNMqP7jZppPp2EMG1Dj
	XWuFu0FYRzR5s1Yeq2XL7LeJWLQiJ7CntzKbwPGens7cJ2vItjDtlJlKcWYoa3P8TA3T
	NkhB0QKNI9aG+7bNb/Wtp5lSVoXxswT40e7p5m3wgUOxOOxsBSSx3frhyBuxKuUnFIm6
	oUhnykur3spCwc6X7pxLMUpX+StAsrx223tBv2oy6Mt+bU2LIyrJ9Odv8Opfdf1GJ3X9
	SKowRZUQyn2yOtLIXbmTyuotzqFZ+T53qXwXbZdInaNSvD/9zagUSIv5Un1sR+29ajoE
	NftQ==
X-Received: by 10.15.34.199 with SMTP id e47mr18445069eev.35.1366206492340;
	Wed, 17 Apr 2013 06:48:12 -0700 (PDT)
Received: from ?IPv6:2001:610:612::21c1:ed39:9a9e:8f89?
	([2001:610:612:0:21c1:ed39:9a9e:8f89])
	by mx.google.com with ESMTPS id i53sm9188432eeu.5.2013.04.17.06.48.10
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 17 Apr 2013 06:48:11 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1366205668-19096-1-git-send-email-ross.burton@intel.com>
Date: Wed, 17 Apr 2013 15:48:12 +0200
Message-Id: <3AD2AB56-AC3B-4DFD-B9CE-96DB76244A8B@dominion.thruhere.net>
References: <1366205668-19096-1-git-send-email-ross.burton@intel.com>
To: Ross Burton <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQns+ub+wzyySp/Jo+MXK6w/dkQ4HoVa5PiYmRwvor7dJ5pRUOHncrHW9pqfc6F6TqIjV+AE
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] png: fix over-zealous warnings about transforms
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
X-List-Received-Date: Wed, 17 Apr 2013 14:06:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Op 17 apr. 2013, om 15:34 heeft Ross Burton <ross.burton@intel.com> het =
volgende geschreven:

> libpng 1.6.0/1.6.1 emits warnings about function ordering when there =
isn't a
> problem, which causes Cairo to fail loading images.  Take the patch =
from
> upstream to fix this.

Any chance of 1.6.1 getting into the release to get the NEON filter =
fixes?

regards,

Koen

>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
> .../libpng/libpng/transform.patch                  |   46 =
++++++++++++++++++++
> meta/recipes-multimedia/libpng/libpng_1.6.0.bb     |    2 +-
> 2 files changed, 47 insertions(+), 1 deletion(-)
> create mode 100644 =
meta/recipes-multimedia/libpng/libpng/transform.patch
>=20
> diff --git a/meta/recipes-multimedia/libpng/libpng/transform.patch =
b/meta/recipes-multimedia/libpng/libpng/transform.patch
> new file mode 100644
> index 0000000..369a2c0
> --- /dev/null
> +++ b/meta/recipes-multimedia/libpng/libpng/transform.patch
> @@ -0,0 +1,46 @@
> +Corrected the test on user transform changes on read. It was in the =
png_set of
> +the transform function, but that doesn't matter unless the transform =
function
> +changes the rowbuf size, and that is only valid if transform_info is =
called.
> +
> +Upstream-Status: Backport (will be in 1.6.2)
> +                 - b44cd59ad9747069b90c6ff0f76558157a61e26a
> +                 - a8715cabd11354da9650dff7c0770686a217b550
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +
> +diff --git a/pngrtran.c b/pngrtran.c
> +index 626f3b0..4485e40 100644
> +--- a/pngrtran.c
> ++++ b/pngrtran.c
> +@@ -1056,9 +1056,6 @@ png_set_read_user_transform_fn(png_structrp =
png_ptr, png_user_transform_ptr
> + {
> +    png_debug(1, "in png_set_read_user_transform_fn");
> +=20
> +-   if (!png_rtran_ok(png_ptr, 0))
> +-      return;
> +-
> + #ifdef PNG_READ_USER_TRANSFORM_SUPPORTED
> +    png_ptr->transformations |=3D PNG_USER_TRANSFORM;
> +    png_ptr->read_user_transform_fn =3D read_user_transform_fn;
> +diff --git a/pngtrans.c b/pngtrans.c
> +index b532172..f822324 100644
> +--- a/pngtrans.c
> ++++ b/pngtrans.c
> +@@ -782,6 +782,17 @@ png_set_user_transform_info(png_structrp =
png_ptr, png_voidp
> +=20
> +    if (png_ptr =3D=3D NULL)
> +       return;
> ++
> ++#ifdef PNG_READ_USER_TRANSFORM_SUPPORTED
> ++   if ((png_ptr->mode & PNG_IS_READ_STRUCT) !=3D 0 &&
> ++      (png_ptr->flags & PNG_FLAG_ROW_INIT) !=3D 0)
> ++   {
> ++      png_app_error(png_ptr,
> ++            "info change after png_start_read_image or =
png_read_update_info");
> ++      return;
> ++   }
> ++#endif
> ++
> +    png_ptr->user_transform_ptr =3D user_transform_ptr;
> +    png_ptr->user_transform_depth =3D (png_byte)user_transform_depth;
> +    png_ptr->user_transform_channels =3D =
(png_byte)user_transform_channels;
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.0.bb =
b/meta/recipes-multimedia/libpng/libpng_1.6.0.bb
> index 951e34a..2353e8d 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.6.0.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.0.bb
> @@ -10,7 +10,7 @@ PR =3D "r0"
> LIBV =3D "16"
>=20
> SRC_URI =3D =
"${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}.tar=
.xz \
> -          "
> +           file://transform.patch"
>=20
> SRC_URI[md5sum] =3D "3ee623b9a4d33bda7310a5124080b14d"
> SRC_URI[sha256sum] =3D =
"5e13c31321083b03956b5ff298bacffab7a7ad35c34c122acef314593944b97b"
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



