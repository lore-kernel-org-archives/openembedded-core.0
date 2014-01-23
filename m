Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id DAAFD6DC8B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 12:41:23 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id c13so385301eek.31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 04:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WNXVGz3lOZ9MDJPD2maDk/Jjn0n9euhXLQC7Tpp/7p0=;
	b=HLUHLSyzi6ZLjxUl++qxNn1RInT4D5cnjV85En2VlBOOdHozCsNfLb5zEwguSEdIhH
	/g8B3nrTFTlc90YqaAReWezs4thVUyjx87jSnT7Djj3zQLy9jMV95El7IOI++fSzs5us
	bHt0AP7Za26l5VlQz/H0Fm0VzXL+9S4SkOvejakzYlQe9Iw19yoga95iNjTszMItoEWm
	+rHNmsJaPdnBYAr6ikB4sPMlefM8OjyVHb7E3EqZKu921ERHS4WlSy52jU5yt/0DsF9N
	5+JERbMM0ZKzMTQeSv4SBzt+vU4FK4rWo8LXSOMFa6OVb5xgO1Ntc9Ye8vNQF1DEBFUd
	+uww==
X-Received: by 10.14.205.201 with SMTP id j49mr2578730eeo.85.1390480884579;
	Thu, 23 Jan 2014 04:41:24 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	z49sm39191284eeo.10.2014.01.23.04.41.23 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jan 2014 04:41:23 -0800 (PST)
Date: Thu, 23 Jan 2014 13:41:25 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen.kooi@linaro.org>
Message-ID: <20140123124125.GD3704@jama>
References: <1390297632-9966-1-git-send-email-koen.kooi@linaro.org>
	<1390312633.874.84.camel@ted> <52DE7E17.2090301@linaro.org>
	<1390316993.874.85.camel@ted> <52E0E238.9030601@linaro.org>
MIME-Version: 1.0
In-Reply-To: <52E0E238.9030601@linaro.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] package.bbclass: fix strip and split logic
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
X-List-Received-Date: Thu, 23 Jan 2014 12:41:26 -0000
X-Groupsio-MsgNum: 49455
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AjmyJqqohANyBN/e"
Content-Disposition: inline

--AjmyJqqohANyBN/e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2014 at 10:34:48AM +0100, Koen Kooi wrote:
> On 01/21/2014 04:09 PM, Richard Purdie wrote:
> > On Tue, 2014-01-21 at 15:03 +0100, Koen Kooi wrote:
> >> On 01/21/2014 02:57 PM, Richard Purdie wrote:
> >>> On Tue, 2014-01-21 at 10:47 +0100, Koen Kooi wrote:
> >>>> Marks original commit message and variable documentation state that =
stripping and splitting are independent of eachother, but package.bbclass A=
NDs the two INHIBIT flags to see which files can be stripped and/or split.
> >>>>
> >>>> Original behaviour:
> >>>>
> >>>> INHIBIT_PACKAGE_STRIP: no strip, no debug split
> >>>> INHIBIT_PACAKGE_DEBUG_SPLIT: no strip, no debug split
> >>>>
> >>>> Behaviour after this patch:
> >>>>
> >>>> INHIBIT_PACKAGE_STRIP: no strip, no debug split
> >>>> INHIBIT_PACKAGE_DEBUG_SPLIT: strip, no split
> >>>>
> >>>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> >>>> ---
> >>>>    meta/classes/package.bbclass | 3 +--
> >>>>    1 file changed, 1 insertion(+), 2 deletions(-)
> >>>
> >>> FWIW this resulted in a failure on minnow:
> >>>
> >>> http://autobuilder.yoctoproject.org/main/builders/minnow/builds/15/st=
eps/BuildImages/logs/stdio
> >>>
> >>> So we may have some fixing up to do before this change can be merged.=
=2E.
> >>
> >> I have that QA issue as warning not as error. I guess that's why my
> >> builds kept working :)
> >>
> >> Aside from that, what are your thoughts on this patch?
> >
> > I'm ok with it in principle but I'd like to see known build issues fixed
> > before it goes in since red autobuilders cause me enough grief
> > already ;-).
>=20
> I've changed all occurrences of INHIBIT_PACKAGE_DEBUG_SPLIT to have=20
> INHIBIT_PACKAGE_STRIP as well in all the layers angstrom has configured.=
=20
> I've sent patches to:
>=20
> meta-intel
> meta-initramfs
> meta-oe
> meta-fsl-arm
> meta-android
> meta-aurora
> meta-linaro-toolchain
>=20
> Which brings me to my next point:
>=20
> If you list a mailinglist in your README where you want to have patches=
=20
> sent, don't make it automatically reject them. I'm looking at you,=20
> shr-devel!

/me hides behind shr-devel owner, which is nobody knows who.

but I'll check

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AjmyJqqohANyBN/e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLhDfUACgkQN1Ujt2V2gBxDxwCeKEOLzfwEmaSaq1ctT3D4gAZx
giIAn2EYby1RcPmxAkV5T4/U9Fo+OKP+
=MMsE
-----END PGP SIGNATURE-----

--AjmyJqqohANyBN/e--
