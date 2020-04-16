Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.10819.1587055433713323392
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2020 09:43:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=XRzmj1S7;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=2873; q=dns/txt; s=axis-central1;
  t=1587055434; x=1618591434;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=O+vhZHmOILMMRLPyNT8m7X7rUmmZwPUK6/3AfBhbIEs=;
  b=XRzmj1S7K4mILg7R+YuaXUUXpG/eXyyECW2YNxZums3q4W/oC5MxbzLK
   IYFKIVCh1maD2xYH8mqXxPybbjGP7RTk1ur4pZCIXaMzI3OTjjpuNOWj9
   vkjMY6nBNk6eZvEOclLevK1E6Tzb7ExW2rjMAWfoibGUPbumwFuqQfVUX
   /46BQVDmLiB1R18CTV2sAPiV0XzDlX1gDjRLmgz60wCiBMSTUD8sLc8TB
   UU5YFoLwvjpUFYDB9UCiiSYwL9rDZHEl1hV2/J+0DhhMvGg9spI9MiuLm
   QJqPdUkXsb98NgmGy66xlh7yARC8++a8eG9rTz0Fckajd7YfsLi4MLOGI
   Q==;
IronPort-SDR: O+0joTaG+Ph5x0hT1POyypYlBC6hdnrvkYHE3Ra6OOa44Ml3/4WRVbOThrSYnFvDzvnExJARc9
 1ZeOzByIBA8HLSXPebUEQBAqUzhtxK+4IHubkO/8zwB6Lbp55e9ltJ0jGhBvxWURRqbxBasJ6y
 JO9YA8u2p0h8OvASbTy1e06Sc8cJgd8Op4EYz+xsZ0orvByaW2Cxa7sXp4DesBECpiGGtsHMhZ
 yg9iTn+zQn63wocjnY0t5kMgJpYv29D4RjBC3sSz8p/xE+iB/YBKFkkFuv70IMmsY9oz3/YONU
 jBU=
X-IronPort-AV: E=Sophos;i="5.72,391,1580770800"; 
   d="scan'208";a="7501691"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Mark Hatle <mark.hatle@kernel.crashing.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/3] package.bbclass: Support stripping and debug	copy of static libraries
Thread-Topic: [OE-core] [PATCH 3/3] package.bbclass: Support stripping and
 debug	copy of static libraries
Thread-Index: AQHV3fQV2llVmRsdpkuYSrmgCV5Tlah8X4Gg
Date: Thu, 16 Apr 2020 16:43:49 +0000
Message-ID: <55f56ac9a2b1467d935647d4ba757b04@XBOX03.axis.com>
References: <20200207202008.132026-1-mark.hatle@kernel.crashing.org>
 <20200207202008.132026-4-mark.hatle@kernel.crashing.org>
In-Reply-To: <20200207202008.132026-4-mark.hatle@kernel.crashing.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Mark Hatle
> Sent: den 7 februari 2020 21:20
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 3/3] package.bbclass: Support stripping and
> debug copy of static libraries
>=20
> By default, we won't copy and strip static libraries.  However, this
> functionality can be useful in some cases where people are doing
> development on the target, and don't generally want the larger debug
> capable static libraries.  To enable the new functionality set:
>=20
>     PACKAGE_DEBUG_STATIC_SPLIT =3D '1'
>=20
> Add a new function splitstaticdebuginfo.  Thus function will copy the
> unmodified static library into the specific debug directory location.
> By keeping an unmodified version, it is possible for a user trying
> to debug something to use -L /usr/lib/.debug-static and their existing
> build commands to switch from stripped to full debug versions.
>=20
> The PACKAGE_DEBUG_SPLIT_STYLE will select between two different
> approaches, /usr/lib/debug-static or <path>/.debug-static.
>=20
> Additionally you can now choose to strip static libraries to conserve
> space.  If either 'PACKAGE_DEBUG_STATIC_SPLIT' or 'PACKAGE_STRIP_STATIC'
> is set to 1, the static library will be stripped.  (This is not on by
> default, as it could make diagnosing static library usage difficult in
> some cases.)
>=20
> Add to insane.bbclass a skip to the staticdev warning for the specific
> -dbg package versions.
>=20
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
>  meta/classes/insane.bbclass  |  2 +-
>  meta/classes/package.bbclass | 67 ++++++++++++++++++++++++++++++++++--
>  meta/conf/bitbake.conf       |  2 +-
>  3 files changed, 66 insertions(+), 5 deletions(-)

[cut]

> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 7080d63287..1efc396ac6 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass

[cut]

> @@ -1051,8 +1106,11 @@ python split_and_strip_files () {
>          results =3D oe.utils.multiprocess_launch(splitdebuginfo, list(el=
ffiles), d, extraargs=3D(dvar, debugdir, debuglibdir, debugappend, debugsrc=
dir, d))
>=20
>          if debugsrcdir and not targetos.startswith("mingw"):
> -            for file in staticlibs:
> -                results.append( (file, source_info(file, d, fatal=3DFals=
e)) )
> +            if (d.getVar('PACKAGE_DEBUG_STATIC_SPLIT') =3D=3D '1'):
> +                results =3D oe.utils.multiprocess_launch(splitstaticdebu=
ginfo, staticlibs, d, extraargs=3D(dvar, debugstaticdir, debugstaticlibdir,=
 debugstaticappend, debugsrcdir, d))
> +            else:
> +                for file in staticlibs:
> +                    results.append( (file,source_info(file, d)) )

Why was fatal=3DFalse dropped from the call to source_info()?

//Peter

