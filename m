Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5113F6B232;
	Thu, 12 Jun 2014 18:20:42 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id y10so1618653wgg.8
	for <multiple recipients>; Thu, 12 Jun 2014 11:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Xd+qBISU6lEL3jZxrlDVT6RLr5ZjcIxEzsi/SkkMjDE=;
	b=kGIvehMrbzqeUQi01c7TJG1oWFOb/WpBJzP+kcdkS+cS2DoksU5e6DC1TpB2JONdNu
	lWmlLGZE6n/3j+a+CEnlzBLEVbqsMSBAab8g/0c0+gZjroBJnL2WRrf7QN38O8PAlzj4
	3vw3mYniTpYJOGJwKMdC/C9gprP6uFkbc5SiwvH6qNwnu7jEuS0/3OZaXhawryjSYXLS
	Gck/DWfkvmFdbxC9i5nzuhNpNRozYgJwoAUtPA9JUAx4VkzZSQh0lDLU6TS6ar0bXoA7
	aVseBj2GzdZZXbRm7IQ2SJk9BfE/VcQtev67N7epLnPRS4TYyQ5Ri6Txor/m/J2Nk+YR
	6M8A==
X-Received: by 10.194.157.68 with SMTP id wk4mr63919168wjb.42.1402597241654;
	Thu, 12 Jun 2014 11:20:41 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id m2sm6267831eeg.6.2014.06.12.11.20.39
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Jun 2014 11:20:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 12 Jun 2014 20:21:01 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140612182101.GF2428@jama>
References: <20140612174147.GE2428@jama>
MIME-Version: 1.0
In-Reply-To: <20140612174147.GE2428@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: State of bitbake world, test-dependencies 2014-06-12
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
X-List-Received-Date: Thu, 12 Jun 2014 18:20:45 -0000
X-Groupsio-MsgNum: 54064
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6v9BRtpmy+umdQlo"
Content-Disposition: inline

--6v9BRtpmy+umdQlo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2014 at 07:41:47PM +0200, Martin Jansa wrote:
> This time it was "incremental" and it's not really complete because
> there is still a lot of failing recipes in "world" (see my other "State"
> e-mails).
>=20
> Complete logs:
> http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20140611_=
213746.log/

Philip asked me to write blog post about interpreting this report, here
is short version.

1) failed recipes, e.g.
> abiword:ERROR: Task 333 (meta-openembedded/meta-gnome/recipes-gnome/libgs=
f/libgsf_1.14.26.bb, do_compile) failed with exit code '1'

Means that abiword cannot be built in "minimal" build (starting with
empty sysroot), usually it's caused by missing dependency, but in cases
like this it's actually abiword's dependency libgsf which fails to build
and prevents to test abiword dependencies.

2) Found differences, e.g.
> xserver-xorg/xserver-xorg/latest lost dependency on  libunwind libxshmfen=
ce nettle
> xserver-xorg/xserver-xorg-xvfb/latest lost dependency on  libunwind nettle

it's in format
<recipe-name>/<package-name>/latest lost dependency on <list-of-autodetecte=
d-dependencies>

Basically it means that when test-dependencies.sh was building it in
"maximal" build (world already built in sysroot) xserver-xorg had
runtime dependency on libunwind, libxshmfence, nettle and these
dependencies didn't exist in "minimal" build - so it's not deterministic.

3) Found errors, e.g.
> ERROR: test-dependencies/1402573458/3_min/packages/*/gstreamer1.0-plugins=
-bad/gstreamer1.0-plugins-bad-neonhttpsrc/latest doesn't exist

Recipes which are using do_split_packages to split some parts to
separate packages sometimes create less packages when some dependencies
are missing, in this case if you build gstreamer1.0-plugins-bad with
neon in sysroot it will create gstreamer1.0-plugins-bad-neonhttpsrc
package, otherwise not - so it's not deterministic.

4) Failed world packages, e.g.
This isn't something specifically tested by test-dependencies, but e.g.
when
"openembedded-core/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb,=
 do_configure"
task is failing in "bitbake world" it means that we won't be able to
detect other recipes which are autodetecting gst-ffmpeg presence (just
because "maximal" build cannot include gst-ffmpeg libraries).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6v9BRtpmy+umdQlo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOZ740ACgkQN1Ujt2V2gBw7ZgCggoLK9hRCtkasxV2h6/Q7KCsM
tkUAnjpsXnAPA8LomqqmV9iBwtxZXjK9
=W8aR
-----END PGP SIGNATURE-----

--6v9BRtpmy+umdQlo--
