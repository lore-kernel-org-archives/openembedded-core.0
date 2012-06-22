Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Si4rJ-0004I4-KZ
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 16:29:13 +0200
Received: by eaal1 with SMTP id l1so607694eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2012 07:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=LrkDArfzpopcv/58fdJXTEvYFuKrluciYHUWL8S55P8=;
	b=kQqToIPeuIa+xApdAKjQMDfx71GT8YEv5bXGUrChYPSxjNvVLk8/Fzhn3kiXweafuh
	Z4LM7PLtQZIRzaMdLU8I0iMDxFUgIN144jBs9tpukU4iAb5Ons/thRkA5cB2Vy5KkY1D
	jEst+gwvripvU2gj3wGfOWT7/uUCOQBMWpgtl/YRUICmFXJqO5Z/PHGs5V1QGtvk9UZO
	UflkBBcQSzwZyCGZ6+J9O3xlkoCX2bdFgJ4LAGEG5xP3dWj+Is246+zjidBJLgn7a62y
	piQkm9gX3+MMRnZ5wbflc8zWkn4FGGgtIj1Dhj7wge2CAJNAmEZYV3sYWWvd8dAgVlWg
	N1Gg==
Received: by 10.14.37.206 with SMTP id y54mr493821eea.218.1340374706309; Fri,
	22 Jun 2012 07:18:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.71 with HTTP; Fri, 22 Jun 2012 07:17:56 -0700 (PDT)
In-Reply-To: <1340372395.394.35.camel@ted>
References: <1340372395.394.35.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Jun 2012 07:17:56 -0700
Message-ID: <CAMKF1srBxRO+cnCW6LZ+VN2xpXz8nQKdaPLQBWt_Pkpcy-62Hg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] layer.conf/bblayers.conf.sample: Fix empth BBPATH entry warnings
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Jun 2012 14:29:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2012 at 6:39 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Many people are seeing issues from the empty path warnings from BBPATH.
> The empty path entry corresponding to the current working directory is a
> problem since if cwd changes, so does BBPATH and build reproducibility.
>
> Simply removing the empty element causes problems since the build
> directory then isn't listed in BBPATH which means local.conf isn't found
> and this gives an extremely confusing error message about bbappends
> being unsatisfied.
>
> The build directory in bitbake terms is TOPDIR. The correct way to fix
> things is to add in TOPDIR into bblayers.conf itself. This means the
> layers can happily append/prepend to BBPATH at will as its no longer
> empty hence neatly solving all the various problems. Since the file has
> changed, the version is also changed.


thanks this is fine


>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> ---
> =C2=A0meta/conf/bblayers.conf.sample | =C2=A0 =C2=A04 +++-
> =C2=A0meta/conf/layer.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
=C2=A01 -
> =C2=A02 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/bblayers.conf.sample b/meta/conf/bblayers.conf.sam=
ple
> index 222b03a..e621866 100644
> --- a/meta/conf/bblayers.conf.sample
> +++ b/meta/conf/bblayers.conf.sample
> @@ -1,8 +1,10 @@
> =C2=A0# LAYER_CONF_VERSION is increased each time build/conf/bblayers.con=
f
> =C2=A0# changes incompatibly
> -LCONF_VERSION =3D "4"
> +LCONF_VERSION =3D "5"
>
> +BBPATH =3D "${TOPDIR}"
> =C2=A0BBFILES ?=3D ""
> +
> =C2=A0BBLAYERS ?=3D " \
> =C2=A0 ##COREBASE##/meta \
> =C2=A0 "
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index 43e4295..090c8e2 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -1,4 +1,3 @@
> -BBPATH ?=3D ""
> =C2=A0# We have a conf and classes directory, add to BBPATH
> =C2=A0BBPATH .=3D ":${LAYERDIR}"
> =C2=A0# We have a packages directory, add to BBFILES
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


