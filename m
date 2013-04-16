Received: from mail-ve0-f176.google.com ([209.85.128.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1US2cT-00078p-Om
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 11:56:10 +0200
Received: by mail-ve0-f176.google.com with SMTP id cz11so224695veb.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 02:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=yffGMFPDUSeEy8d/m6vaLPeECHPuo3T1ASU335G41ws=;
	b=m4WwYx70NM7W8e55zIQAYvGf2sn2Oj6hB7yoAIROusFbcPhw7k16GUNi9ZyV0Rd9NP
	Bqoygvp/g7RMuHz37ocVSFchEQVsLTl2pX62oGOrjHekQcBS5fX3nRMWCFEm3AZ9TLp7
	ZwB2sM3BtliOkzOrL+yk4mNyHXkeT63ySgiBwepyRin7Z19EvH4XGBWOAld5Fv9Cr5l/
	QIP2Z5O5sDHlTM4qWomdd2G4aH1y58KFehTUN5heOpynV6ZxAt+iyWgeoewtxTDnj5VM
	mWTHBSga89x4Upo4zpVf2Llm1048eEIVFN9BchkEEyLSWZBbDJEZjrF6Vu5gFoWSYte/
	JtEw==
MIME-Version: 1.0
X-Received: by 10.52.34.168 with SMTP id a8mr776392vdj.75.1366105119504; Tue,
	16 Apr 2013 02:38:39 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Tue, 16 Apr 2013 02:38:39 -0700 (PDT)
In-Reply-To: <5B2FD9C3-A643-474B-BC8A-DB24FCCBAA1A@dominion.thruhere.net>
References: <5B2FD9C3-A643-474B-BC8A-DB24FCCBAA1A@dominion.thruhere.net>
Date: Tue, 16 Apr 2013 11:38:39 +0200
Message-ID: <CALbNGRSaN3_rkYW7zcd68XWuRqU0iMQ5C3oy9KdgKX_mwmE2-A@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: "openembedded-core@lists.openembedded.org layer"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Libpng 1.6.x is broken, switch back to 1.5.x before release?
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
X-List-Received-Date: Tue, 16 Apr 2013 09:56:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2013 at 11:06 AM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
> Hi,
>
> I've been looking into the libpng problems people have been reporting (e.=
g. #4060) and tried to upgrade 1.16.1 to fix those. Long story short, 1.16.=
1 doesn't fix them. I'm currently using weston as a testbed and was able to=
 narrow the problems with weston down to:
>
>         cairo_surface_t *surface =3D cairo_image_surface_create_from_png(=
icon);
>
> with ends up as:
>
>         ERROR loading icon from file '/usr/share/icons/gnome/24x24/apps/u=
tilities-terminal.png', error: 'out of memory'
>
> Reverting the 1.6.0 update and rebuilding cairo against 1.5.x makes it wo=
rk, no errors in the log and I get window decorations instead of white squa=
res. I'll see if I can get libpng-1.7.0beta07.tar.gz to build today, but I =
can't spend much time on that.
>
> All in all I'd recommend adding back the 1.5.x recipe and D_P -1'ing the =
1.6.x recipe. Thanks to shlib renaming the resulting libpng packages are pa=
rallel installable and PRSERV takes care of bumping affected recipes/packag=
es. Switching to 1.5.x "just works" if you have this patch:
>
> diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphic=
s/pango/pango.inc
> index f622903..c1beb9e 100644
> --- a/meta/recipes-graphics/pango/pango.inc
> +++ b/meta/recipes-graphics/pango/pango.inc
> @@ -10,7 +10,7 @@ SECTION =3D "libs"
>  LICENSE =3D "LGPLv2.0+"
>
>  X11DEPENDS =3D "virtual/libx11 libxft"
> -DEPENDS =3D "glib-2.0 fontconfig freetype zlib virtual/libiconv cairo el=
futils harfbuzz"
> +DEPENDS =3D "glib-2.0 fontconfig freetype zlib virtual/libiconv cairo el=
futils harfbuzz libpng"
>
> regards,
>
> Koen
I would like to bisect this - test case are the network-manager-applet
icons for WLAN. If libpng-1.7.0beta07 fixes let me know.

Andreas


