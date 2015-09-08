Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 65BE976104
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 07:04:01 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so114030604pad.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 00:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=SQvLI6iAYhhimm8NvHapGE8SK1/9vh/POF2FvI/UHPk=;
	b=sYbYZYqB8RTcyLYjMav0arNyCGotit1YZEl6ZCRS7tvCIDtelmXqJ3nE1wTqaqYgFb
	cA6poH8ywCKJGgITvS9TUM0p83tDxqn+5RDKdWDh9TAofSz8saOY6qphjzhzVDq1pdTS
	noWenUidJ06w8L7AdqhCSCUDr2OmQE4TvYvBUefIx2pIhs+XUbo0O8jXMlzSrustzMhn
	im3rfh4r0+6hPGI/kLV0SmLRhrRGTtmawmJ1cxwwldW0ZaUjzup/gdkuLLznshpUQMm2
	sCEYI04pgeBTr2J4IILfM1D/lULnAN0H6jMGSOspwsJRKwX/Rv8YqaeMZcr2+4opa6dw
	+ewA==
X-Received: by 10.68.233.5 with SMTP id ts5mr55136635pbc.58.1441695842058;
	Tue, 08 Sep 2015 00:04:02 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:6859:6c5c:aa2f:b40a?
	([2601:646:8601:4580:6859:6c5c:aa2f:b40a])
	by smtp.gmail.com with ESMTPSA id r16sm2100034pdn.2.2015.09.08.00.04.00
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Sep 2015 00:04:01 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1441662490.1680.82.camel@pbcl.net>
Date: Tue, 8 Sep 2015 00:03:55 -0700
Message-Id: <434A343A-193D-4D65-BDE0-FC1BD2D79F28@gmail.com>
References: <d16024c043abcd21b162f7f93a5bdf29d91c8317.1441552859.git.raj.khem@gmail.com>
	<a234814e2ad213dc69b90a3450d79b778c0e4c7c.1441552859.git.raj.khem@gmail.com>
	<1441654609.1680.79.camel@pbcl.net>
	<EC219B31-F312-41D6-81C9-D13213CB2759@gmail.com>
	<1441662490.1680.82.camel@pbcl.net>
To: Phil Blundell <pb@pbcl.net>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] rootfs: Do not uninstall update-rc.d
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
X-List-Received-Date: Tue, 08 Sep 2015 07:04:02 -0000
X-Groupsio-MsgNum: 70778
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1079446E-59CD-4334-A2DF-53C5963F337B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_1079446E-59CD-4334-A2DF-53C5963F337B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Sep 7, 2015, at 2:48 PM, Phil Blundell <pb@pbcl.net> wrote:
>=20
> On Mon, 2015-09-07 at 14:15 -0700, Khem Raj wrote:
>>> On Sep 7, 2015, at 12:36 PM, Phil Blundell <pb@pbcl.net> wrote:
>>>=20
>>> On Sun, 2015-09-06 at 15:25 +0000, Khem Raj wrote:
>>>> update-rc.d is now needed by systemd to interact with sysv
>>>> scripts, so if we have a mixed system, then we can not uninstall
>>>> update-rc.d as it is going to break systemd functionality
>>>=20
>>> The description above implies that you will only uninstall =
update-rc.d
>>> if systemd is present, but that doesn't seem to be what the patch =
does.
>>=20
>> I meant to not say its only for systemd. but that systemd now needs =
it.
>> so update-rc.d is no longer forcefully removed from image depchain.
>=20
> Well, right.  But wouldn't it be better only to leave it in there if
> it's actually necessary, i.e. if you have systemd and you also have =
sysv
> scripts and the rootfs isn't read-only?  As it stands, your patch will
> cause update-rc.d to be left around for people who aren't using =
systemd,
> which seems like a retrograde step.
>=20

makes sense. I can improvise on it and check for all constraints in a =
follow up.

> p.
>=20
>=20


--Apple-Mail=_1079446E-59CD-4334-A2DF-53C5963F337B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXuiF8ACgkQuwUzVZGdMxRrngCeNegKEWuT2kjxEW8OIkFkOWh+
r+8AnAukpC7dcr4dzvYRsj3+G6SYQ55q
=LwJV
-----END PGP SIGNATURE-----

--Apple-Mail=_1079446E-59CD-4334-A2DF-53C5963F337B--
