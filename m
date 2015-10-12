Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8EDAB65D6E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Oct 2015 08:02:40 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so138412638wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Oct 2015 01:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rZ4iaLsRENUSwG4u20JiktO02F6vBtO4vSge2BOudxY=;
	b=xYzQVsyLd1BM595kJe3oafteXuU81qN+LeCU2vapG4PXJo/uXy61PuQGsnX9vYMdh+
	gyOEIovYiA32iDi0cT6EfaqDcTahmlHqhmrq0OnhjS/q8qDmXBaEBAbtDvk4m98tM6tb
	XiuAXJoK1KaO5nH+9mc7pj7mCSSvIQJOFdr4bJWL7DKcq24EA+XIFkHCionklho0NPtc
	jPjYMBEEf5yQZ3+B3KqOCfkjw/PrDkzBOkKSVPzFDQfYQ3iTKxwxGrNeedfvGnyhTJxW
	jqH0rL+nxMA6vAXSt/IEi4jK4LRhGxiTUC1oqEDeC+0RSh7pckmeSrbye3BQFa3vGEhv
	W01A==
X-Received: by 10.194.59.236 with SMTP id c12mr28701779wjr.23.1444636960389;
	Mon, 12 Oct 2015 01:02:40 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id hs5sm9824134wib.6.2015.10.12.01.02.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Oct 2015 01:02:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 12 Oct 2015 10:03:05 +0200
To: Carlos Alberto Lopez Perez <clopez@igalia.com>
Message-ID: <20151012080305.GA2392@jama>
References: <20150514114002.GA2402@jama>
	<1444403489-29494-1-git-send-email-Martin.Jansa@gmail.com>
	<561900D1.5060906@igalia.com>
	<CA+chaQffPJOrTzmZRoxUAJ1LnixtbJHLtJ5wm7eJAWGiZxnpXg@mail.gmail.com>
	<56198707.8@igalia.com>
MIME-Version: 1.0
In-Reply-To: <56198707.8@igalia.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] webkitgtk, gcr, libsecret: force ARM mode
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
X-List-Received-Date: Mon, 12 Oct 2015 08:02:43 -0000
X-Groupsio-MsgNum: 72080
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline

--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2015 at 11:45:43PM +0200, Carlos Alberto Lopez Perez wrote:
> On 10/10/15 17:32, Martin Jansa wrote:
> > Did you enable thumb in that build? It's not enabled by default.
> >=20
> > ARM_INSTRUCTION_SET is for recipes to use arm when distro selects thumb=
 by
> > default.
>=20
> I assumed it was enabled by default if it was listed on the list printed
> on TUNE_FEATURES when starting bitbake. Seems not.
>=20
> I manually enabled it on the recipe of webkitgtk+ by setting
> 'ARM_INSTRUCTION_SET =3D "thumb"' and I was able to reproduce the build
> failure.
>=20
> However, later I tried doing the same for a standard armv7a machine and
> it built fine.
>=20
> qemuarm is arvm6 with thumb1, and any armv7 or newer machine will prefer
> thumb2 instead. The compiler would automatically use thumb2 when
> enabling -mthumb on a armv7 or newer march.
>=20
> So, it built fine with -march=3Darmv7-a -mthumb
>=20
> Given that most people building webkitgtk+ will use armv7 or newer, I
> don't think disabling the possibility of building webkitgtk+ with thumb
> (thumb2) unconditionally is a good idea.
>=20
> I also tested to build gcr and libsecret. Both build also fine with
> -mthumb on armv7.
>=20
>=20
> So, could we set ARM_INSTRUCTION_SET=3Darm only for armv6 or older
> machines in this 3 recipes?

Yes, that would be better, I'm still waiting for answer about other
layers, see:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7717#c6

In the meantime I'm using this to keep my world builds going.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYbaTIACgkQN1Ujt2V2gBwTJgCgt376Z+cSAtJRuguUE74gfuns
HpcAoKa6FfUy2Y8iImLnkVfOvjdFaXf+
=efSo
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
