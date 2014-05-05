Return-Path: <paul.betafive@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8D43165F46
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 15:29:35 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id b15so5555446eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 May 2014 08:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=S8utU0jmtHP6FK6qHJOCxMWlOv+cHHaeRVpzwgCQwoo=;
	b=seleDmKOnBGCtAA25ql3zREyacSJHU0uG4tIjNrfFySI4QHqFkSthrUJuiURqc5TWg
	y96dOei02hhukd3nvbnSL1OyWmBcmWIwQSKJ3nzSvIqeI/pCMu3ML5hGO0s8/7YuMy42
	8EB0cBGY4TVJp9+HHcMYv66EWgngRdpCVOfjkd0u15Tvwj/6alyj7lJQ1GOtjcwyuD5f
	WfsoDEproZu+eQO+c1ig5jY8vdAGDuIMKa0vqFRGO8xyXZNVzu9pdUNJYlBNCxpjno7B
	IL0TR8kOqHtcfIHdumcNWXbRVpGvAk90nYe12CBSuCJJya4zxPw9Cx1iDcUN0dGHV7TT
	LEIQ==
X-Received: by 10.14.223.136 with SMTP id v8mr3099074eep.91.1399303776295;
	Mon, 05 May 2014 08:29:36 -0700 (PDT)
Received: from gmail.com (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id u1sm30466002eex.31.2014.05.05.08.29.35
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 May 2014 08:29:35 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
Date: Mon, 5 May 2014 15:29:33 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: Marco <koansoftware@gmail.com>
Message-ID: <20140505152931.GA26865@gmail.com>
References: <53679D4E.6060202@gmail.com>
MIME-Version: 1.0
In-Reply-To: <53679D4E.6060202@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Upgrade to a package with all its dependency without network
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
X-List-Received-Date: Mon, 05 May 2014 15:29:38 -0000
X-Groupsio-MsgNum: 52833
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline

--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 05, 2014 at 04:16:46PM +0200, Marco wrote:
> Hello,
> I need to be able to upgrade to a package with all its dependency chain o=
n a
> target system that does not have access to the network.
>=20
> I'm trying to understand what may be the best and also the simplest
> solution.
> Perhaps there is already this functionality in OE/Yocto?
>=20
> I thought to implement a new opkg feture so that I can to generate the li=
st
> of dependencies of a package and then extract the packages from OE/Yocto
> using a script or an application.

opkg v0.2.x (the latest release series) doesn't really support this behavio=
ur
very well. The caching logic just doesn't work. For example, I have a board
connected at the minute with a feed configured so I tried this:

    opkg install --download-only ncurses-terminfo
    ifdown eth0
    opkg install ncurses-terminfo

You'd hope that would pick up the package files from the cache but it doesn=
't.
So even if you put the files there yourself, you may no have a simple way to
install them.

An interim solution I can see is to put all the packages you want in one
directory then run 'opkg-make-index' from opkg-utils on that directory so t=
hat
it is a complete package feed. Then add that as a source in
/etc/opkg/base-feeds.conf.

The development branch of opkg which will become v0.3.x has much better cac=
he
logic, it just needs finishing off and tidying up. I'm very busy at the min=
ute
but it's getting there. Any help to close the remaining issues so it can be
released would be appreciated!

>=20
> Another possibility would be to extend the operation of bitbake so I pull
> out the package and dependencies putting them in a dedicated directory to=
 be
> moved on the target for the update.
>=20
> For now I'm just analyzing what may be the possibilities and I'd love to
> have any comments or advice from someone more experienced than me on this
> topic.
>=20
> Thanks
> --=20
> Marco Cavallini | KOAN sas | Bergamo - Italia
>  embedded and real-time software engineering
> Phone:+39-035-255.235 - Fax:+39-178-22.39.748
>       http://www.KoanSoftware.com
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJTZ65bAAoJEBwoJlo7UPQDdzgH/RxyvqoJsDTjBE1Ts5XJmRoU
nP6d4pA/CaZkWcwrAxQsLaxC4apUNOvKott3sT+eX/3b+MTlMB7D+nljQNlCHGaZ
Rifx0q80Y1a0EgBftm0oM6dAabxqQvA3RARXE63fn/5FpW5UrU43Yxp4mbtqzWeJ
dTPDxujd5iM0l8s0GPNJwWn5E3YnuUJvKqUYffhRnyw15XfVsIdH8Yv3TOgVg/eX
7at2x0Lm1MRQbZqmdV7QTlTkk5+exGUrzQNqOivvYE/oJ119Jhs4w3hfra2jCqDa
mWapUDvsE2VEWBXKiJ1jTPZbVnF5nIByNJu5ZnS6GRqvKYTPZujvFTFViLAqmXg=
=fnnU
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
