Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id A1C096CC84
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 06:21:33 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id fa1so2208317pad.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Oct 2013 23:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=UQeZb+UFryMdVh9GnvHHgdevUZAVHmP2m+vllQ79O7U=;
	b=HOHCfJoOh/d4tXt+4Zf4erYzPt9f3ZkbBT8vQUtOeWFgAqJqKqkUeXU/Jj9PO/QFd0
	dTrgHtDrFOSab9EEH9bKd8JRI0cw4sZZJYbEBpchOmI0vWPYI1WqArwiP1H3Bqx+/0bu
	wxqUbei4vljiOC/18uWjf2lRfDROh2YR3iVbrwZsE6pksMtaNDLIC/sB5G5C9swq7d4w
	KwTG0IyF0YM2ZIYBBdlKUV+C8hfK80npyG3mq1s1RU1VA4qwRb30/zgmAc5mTEj4Pi9D
	onOwxglHwLwG+y2DglfHRoERAVG5pB0qz5mfdDWqVn5dAkqpwwvIds030uIu05EPaOb5
	GHcQ==
X-Received: by 10.68.33.34 with SMTP id o2mr11981462pbi.128.1381386095554;
	Wed, 09 Oct 2013 23:21:35 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	f2sm50782551pbg.44.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 09 Oct 2013 23:21:34 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1381356715.29912.48.camel@ted>
Date: Wed, 9 Oct 2013 23:21:33 -0700
Message-Id: <107440C3-C225-4B49-BC32-665F817A1C46@gmail.com>
References: <1381356715.29912.48.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1510)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: gcc: Fix strange C++ repo issues
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
X-List-Received-Date: Thu, 10 Oct 2013 06:21:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Looks good to me. We need to run GCC testsuites on it and also propose =
it upstream.

Acked-by: Khem Raj <raj.khem@gmail.com>

On Oct 9, 2013, at 3:11 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:

> See the patch header for a better description of the c++ -frepo
> issue this patch fixes.
>=20
> [YOCTO #5133]
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc =
b/meta/recipes-devtools/gcc/gcc-4.8.inc
> index 4af98f8..8d50bf7 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.8.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
> @@ -76,6 +76,7 @@ SRC_URI =3D =
"${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
> 	   file://0044-gengtypes.patch \
> 	   file://0045-gcc-4.8-PR57717-PowerPC-E500v2.patch \
> 	   file://0046-libatomic-deptracking.patch \
> +	   file://0047-repomembug.patch \
> 	  "
> SRC_URI[md5sum] =3D "3b2386c114cd74185aa3754b58a79304"
> SRC_URI[sha256sum] =3D =
"545b44be3ad9f2c4e90e6880f5c9d4f0a8f0e5f67e1ffb0d45da9fa01bb05813"
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0047-repomembug.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0047-repomembug.patch
> new file mode 100644
> index 0000000..ea253f4
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.8/0047-repomembug.patch
> @@ -0,0 +1,46 @@
> +When compiling a project using -frepo, .rpo files are written =
alongside
> +the .o file, the symbols either have O or C against them. During =
final linking,
> +the objects can be recompiled with some of the entries tweaked/chosen =
by the=20
> +tlink.c code (visible with TLINK_VERBOSE=3D3).
> +
> +My tests showed that init_repo (cp/repo.c) was correcting calling=20
> +IDENTIFIER_REPO_CHOSEN against the right identifers.
> +
> +By the time finish_repo() or emit_repo_p() were called, the pointer =
returned
> +by get_identifier() for the symbol marked during init_repo had =
changed and
> +the chosen bit was no longer set. This lead to linking bugs like:
> +
> +collect: relinking
> +collect2: error: '_ZNK6sudoku5ClearINS_8SequenceEEclERS1_' was =
assigned to 'board.rpo', but was not defined during recompilation, or =
vice versa
> +
> +The problem is that the garbage collection is getting called before
> +finish_repo() is called and ggc_protect_identifiers is set to false=20=

> +so the identifiers are not preserved. They are recreated but the=20
> +chosen bits get wiped out.
> +
> +The fix is to change ggc_protect_identifiers *after* the finish_repo=20=

> +calls are made.
> +
> +Reproduction is tricky since you need to trigger the garbage =
collector at
> +just the right moment.
> +
> +RP 2013/10/9
> +
> +Index: gcc-4.8.1/gcc/toplev.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.8.1.orig/gcc/toplev.c	2013-03-28 08:29:51.000000000 =
+0000
> ++++ gcc-4.8.1/gcc/toplev.c	2013-10-09 20:27:17.089228023 +0000
> +@@ -551,11 +551,11 @@
> +   if (flag_syntax_only || flag_wpa)
> +     return;
> +=20
> +-  ggc_protect_identifiers =3D false;
> +-
> +   /* This must also call finalize_compilation_unit.  */
> +   lang_hooks.decls.final_write_globals ();
> +=20
> ++  ggc_protect_identifiers =3D false;
> ++
> +   if (seen_error ())
> +     return;
> +=20
>=20


