Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5E92376FED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 17:24:26 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so11923467pac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 10:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=BpSkTznh81H74w5vMq41ItL2B9FErukiURjMUimfwXE=;
	b=shP3vXPkAlcfuZJg3rFYf9vNdfXfHNHyxuQRtB+kTKnLvh2dUf+fhQsSWp8wNpNdQC
	m04co8BSfqghfxa0ke/GwiwNtt05DVaqK4Utue+tfeyIugpt9JuHeTpEmzxtf6GrkZK/
	8HLdOsRxECkFpO+FPshbDMigBKPHZ0m/afCcn07fxWt1I6lJsA4wItZKuLWqV7e/CG7s
	HpHNyBo9s9yuwofdlNhIkIaATpgCT3LUFj+/E/Qd7wQKubssHaRcU49dQWFKitsri2wd
	NzpjrpvyxB4dehcXDzqdrQTvRrIm2OApC4YUzb8FI0CFJ+6DWgL7pYbLNtOUFvme43Ht
	Tofg==
X-Received: by 10.68.139.194 with SMTP id ra2mr34850766pbb.6.1443547467123;
	Tue, 29 Sep 2015 10:24:27 -0700 (PDT)
Received: from [192.168.0.4] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85]) by smtp.gmail.com with ESMTPSA id
	we9sm26795506pab.3.2015.09.29.10.24.26
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 29 Sep 2015 10:24:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <764c3c1649362c7376ac70baecb6da1c9ddb6a6e.1443517391.git.mariano.lopez@linux.intel.com>
Date: Tue, 29 Sep 2015 10:24:25 -0700
Message-Id: <9A33E145-4BD6-4AD3-A3AD-ED1DBDE8E17A@gmail.com>
References: <cover.1443517391.git.mariano.lopez@linux.intel.com>
	<764c3c1649362c7376ac70baecb6da1c9ddb6a6e.1443517391.git.mariano.lopez@linux.intel.com>
To: mariano.lopez@linux.intel.com
X-Mailer: Apple Mail (2.3094)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] testimage: Added IO commands to dumps
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
X-List-Received-Date: Tue, 29 Sep 2015 17:24:27 -0000
X-Groupsio-MsgNum: 71755
Content-Type: multipart/signed;
	boundary="Apple-Mail=_42FAF47B-2E0B-4ABD-A1F6-8D3538B57C84";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_42FAF47B-2E0B-4ABD-A1F6-8D3538B57C84
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Sep 29, 2015, at 2:05 AM, mariano.lopez@linux.intel.com wrote:
>=20
> From: Mariano Lopez <mariano.lopez@linux.intel.com>
>=20
> This change just add two more commands to
> the host dumps to get more information
> related to the IO.
>=20
> [YOCTO #8412]
>=20
> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
> ---
> meta/classes/testimage.bbclass | 2 ++
> meta/lib/oeqa/utils/dump.py    | 2 ++
> 2 files changed, 4 insertions(+)
>=20
> diff --git a/meta/classes/testimage.bbclass =
b/meta/classes/testimage.bbclass
> index 2efab29..1f21c9e 100644
> --- a/meta/classes/testimage.bbclass
> +++ b/meta/classes/testimage.bbclass
> @@ -80,11 +80,13 @@ testimage_dump_target () {
>=20
> testimage_dump_host () {
>     top -bn1
> +    iostat -x -z -N -d -p ALL 20 2

Somewhere it needs to documented that build system now needs to have =
sysstat package installed.

>     ps -ef
>     free
>     df
>     memstat
>     dmesg
> +    ip -s link


and iproute2


>     netstat -an
> }
>=20
> diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
> index 3f31e20..63a591d 100644
> --- a/meta/lib/oeqa/utils/dump.py
> +++ b/meta/lib/oeqa/utils/dump.py
> @@ -20,11 +20,13 @@ class BaseDumper(object):
>         # to set some defaults.
>         self.parent_dir =3D parent_dir or "/tmp/oe-saved-tests"
>         dft_cmds =3D """  top -bn1
> +                        iostat -x -z -N -d -p ALL 20 2
>                         ps -ef
>                         free
>                         df
>                         memstat
>                         dmesg
> +                        ip -s link
>                         netstat -an"""
>         if not cmds:
>             cmds =3D dft_cmds
> --
> 1.8.4.5
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_42FAF47B-2E0B-4ABD-A1F6-8D3538B57C84
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYKyUkACgkQuwUzVZGdMxRakQCcDB4U6ntEGc5A+5DlBsw0MHff
yfQAnjaL633mFXJbBOEnHfDBTROb2tKQ
=OoFL
-----END PGP SIGNATURE-----

--Apple-Mail=_42FAF47B-2E0B-4ABD-A1F6-8D3538B57C84--
