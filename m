Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8F3786BB41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 14:46:56 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e53so1749405eek.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 07:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MiH43ZCESYsjZzwG/UixK1+chlJJN0SkicSgOjnO+Kg=;
	b=vp+FtQOLE4zEWlq7ISplfYMNjJBBqmxFUMQe0FbHt7JGWdwNuyVonVTu5WBx0UBw0G
	up5btB+MIYJcKNx/kH1vMs+U+sVqeNF61OqHzJ0NPR8LNPwY2N03MLGGu4d69cH3mCgO
	0DbIcco2wuCc4Xt7HYUQSlkJ8gjlBESKACXmJDmZhOex/REldkB+FeSPWvOm7koJZ563
	ZaiKGt/n1G8SIRioZYNpc229ZBGUmjaTB72x5MC3K4M57VVblqGQWf3WK460WcxRDefL
	Z6OBbLkXNErI2QOBw5Q5Qqzep3l5RWaUliBBBdk9qCstk3dHPzrqa9BKT3Up4QZAq0x5
	P6PQ==
X-Received: by 10.15.22.201 with SMTP id f49mr75946631eeu.18.1395845217572;
	Wed, 26 Mar 2014 07:46:57 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	y7sm29176318eev.5.2014.03.26.07.46.53 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Mar 2014 07:46:54 -0700 (PDT)
Date: Wed, 26 Mar 2014 15:46:54 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Message-ID: <20140326144653.GA3709@jama>
References: <1395676843.24890.7.camel@ted> <5330C9A8.904@linaro.org>
	<20140325055028.GA3710@jama> <5332E520.5050005@linaro.org>
MIME-Version: 1.0
In-Reply-To: <5332E520.5050005@linaro.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: yocto <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: --conf Was: Features in Yocto Project 1.7
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
X-List-Received-Date: Wed, 26 Mar 2014 14:47:00 -0000
X-Groupsio-MsgNum: 51651
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline

--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2014 at 10:33:04AM -0400, Trevor Woerner wrote:
> On 03/25/14 01:50, Martin Jansa wrote:
> > Can you show some example of config you need to have wor wayland and
> > cannot have for core-image-minimal?=20
>=20
> Okay, good point. I should have thought harder to come up with a better
> example :-) It's funny, actually, that you're the one pressing me on
> this, I first encountered this issue and started thinking about it while
> trying to reproduce your "State of bitbake world" tests :-)

:) I see, but the point is that I'm not changing those entries based on
what I'm building. It's "customization" which would normally be included
in distro config based on what distro supports, but in this case I'm
using nodistro and want to build test more than what's "supported" in
nodistro.

> Let's say you're a board maintainer; some people want to run gstreamer,
> some people want to try out systemd, some want to run wayland. Each of
> these requires tweaks to a conf/local.conf, no? I'm constantly changing
> my set of IMAGE_INSTALL_append's, fiddling with preferred versions, and
> distro features.

Yes, people often need to tweak local.conf, but my point is that they
shouldn't tweak it based on what they are going to build.

e.g. if I decide to build qtbase with icu enabled, then I should use the
same qtbase in core-image-minimal and wayland-image, otherwise I'll see
a lot of rebuilds and not-so-good sstate reuse (especially if you often
use sstate-cache-management which will remove your 2nd qt* variants
between the builds).

> If I'm just doing a one-off build then sure, adjust conf/local.conf
> manually. But if I'm perpetually rotating between a bunch of tests as
> repositories are modified, it would be easier to just specify which
> configuration I want from the bitbake cmdline.
>=20
> As I mentioned, maybe I'm doing things wrong? Maybe others have separate
> build locations, or maybe others define their own images which
> incorporate these adjustments? But I'd be quite surprised to find I'm
> the only one having to edit conf/local.conf to comment/un-comment blocks
> before every build.
>=20
> As a concrete example, currently I'm flipping between dora and master
> builds. For some reason I can't seem to reuse the same TMPDIR between
> them. So every time I "repo init -b <newbranch>" I then also have to
> edit conf/local.conf before bitbaking.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMy6F0ACgkQN1Ujt2V2gBznOgCfb5OcNIf7exn5Orc9wgDD2xgD
zPYAniKitFHKOdnAYcLnWP9PW82bNKIl
=PGDG
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
