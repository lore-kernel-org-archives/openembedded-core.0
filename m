Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 34DD762252
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 22:26:38 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w62so11226460wes.15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 15:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ARYEMKcXTpfdIbT2I20+7BGxw7ZMEov/8uvV8q9cRBI=;
	b=zwIc8GQp4aZnLRlvhjk5/eUxUgwAfezs427TZyXJYTgjUovmiymDaZBrX6ZMu0IgYJ
	RrDJD9sEwE1GkFu7sClDYujh7Tasq2mC0GU6AISYjSgu0p+cbOYgi/m8LBhgEjNjbJ/D
	2ECWkSDDRdQbJovNdp6VxveD9ZLSvybUfK8E4qa6td/FxlmJMZxFMoPlLt/S1Lp8d3fb
	izTfOJ6FsJ2yeNUAUL4mjM4kvumMnDK5BxkwQbNPWB7eZf4vqta5QwE/7SBrHcXhrkU3
	NzmhlvP86ygPBYXh2GyU0wz6gIfdPj1bWWxMYRUFkBnphUoC3pAgcLVwM+raVMXsG/20
	Vb/A==
X-Received: by 10.194.59.244 with SMTP id c20mr7756099wjr.59.1408746400084;
	Fri, 22 Aug 2014 15:26:40 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ck5sm48527215wjb.24.2014.08.22.15.26.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Aug 2014 15:26:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 23 Aug 2014 00:26:42 +0200
To: Peter Seebach <peter.seebach@windriver.com>
Message-ID: <20140822222642.GG20524@jama>
References: <cover.1408649791.git.peter.seebach@windriver.com>
	<53F77370.2060603@balister.org> <20140822133349.76751634@e6410-2>
	<20140822193910.GD20524@jama> <20140822154954.04d4fc02@e6410-2>
	<20140822214626.GF20524@jama> <20140822170626.13280b11@e6410-2>
MIME-Version: 1.0
In-Reply-To: <20140822170626.13280b11@e6410-2>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] Change default for cortexa* to armv7at-neon.
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
X-List-Received-Date: Fri, 22 Aug 2014 22:26:47 -0000
X-Groupsio-MsgNum: 56865
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="D6IIOQQv2Iwyp54J"
Content-Disposition: inline

--D6IIOQQv2Iwyp54J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2014 at 05:06:26PM -0500, Peter Seebach wrote:
> On Fri, 22 Aug 2014 23:46:26 +0200
> Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > changing
> > default DEFAULTTUNE (and TUNE_PKGARCH with that) to have thumb while
> > still building with -marm doesn't make much sense to me and is only
> > confusing.
>=20
> I think the distinction is that if you use armv7at-neon, you *can* build
> specific packages with thumb. Mostly, I guess, I don't think it makes sen=
se
> to use a tuning that specifically states that it can't run thumb code for
> processors which can. Although... May not be an important distinction, re=
ally,
> as you note.

> I don't think it makes sense to use a tuning that specifically states
> that it can't run thumb code

The problem is that "t" in DEFAULTUNE always adds "t2" to TUNE_PKGARCH
no matter if you've built the package with -marm or -mthumb. So as long
as ARM_INSTRUCTION_SET is "arm" by default, we should use the same
default for DEFAULTTUNE - I wouldn't mind changing ARM_INSTRUCTION_SET
at least more people will be hit by those ICEs I've reported earlier
(with patch forcing ARM_INSTRUCTION_SET to "arm" for gdb and icu
"gdb: force arm mode" http://patchwork.openembedded.org/patch/75703/
"icu: force arm mode" http://patchwork.openembedded.org/patch/75817/

It would be interesting to try
http://patchwork.openembedded.org/patch/70985/
with latest master to see if it can work correctly now, then I wouldn't
be so opposed to "enabling" thumb in DEFAULTTUNE (even without
ARM_INSTRUCTION_SET change)

> > Every distro can use something more "optimized" DEFAULTTUNEs for each
> > MACHINE they use, I do it for SHR:
> > https://github.com/shr-distribution/meta-smartphone/blob/shr/meta-shr-d=
istro/conf/distro/include/defaulttunes.inc
>=20
> Huh, that's an interesting point. I'll wave this at people and see what t=
hey
> think of it.
>=20
> -s
> --=20
> Listen, get this.  Nobody with a good compiler needs to be justified.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--D6IIOQQv2Iwyp54J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlP3w6IACgkQN1Ujt2V2gBxrZQCgmj5AfWhLGkzDYqXTrqQT6tJE
LFAAnivHcP4SxYrthBFgCyqvjsKlZQpW
=unnM
-----END PGP SIGNATURE-----

--D6IIOQQv2Iwyp54J--
