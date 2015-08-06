Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id CB1A3734DA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 15:05:51 +0000 (UTC)
Received: by pdrh1 with SMTP id h1so15458619pdr.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Aug 2015 08:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=kyV1GWHbTRCKHzKLgmCw3/yOoTS645Zmvl7J9xubJCM=;
	b=Sr7Wx6eVcTck6CVwbeFSecnpRq1UPhlale0uUiIFvq1AzK1tF7tSzkGqaqP5DGYQch
	IVz17cNoLo4KMVu5FM0kKavVNuG2noYhIAVUem9nGzyft8Xtw3fkZ5UzZWn6/SyWPxhy
	EaJLFjktaZW2i6d1NBNk05vJuD/r4IdBoD5GitCrkHsifYAg6IT+WA6wqKnufUzdTZyo
	UlK2F0wJFcyoYhMzL3cB7DWyLKOf6JuPdX5x81UmuZOPGV8W8lPNRk1gsL5faWRHgGl+
	IO+++Msd8NhSaZYfxG7iBksymCZJ8oDG8qpgZNNNiA6oVulzDsD9CEnzFxOPoSEyFAFU
	HQeg==
X-Received: by 10.70.30.161 with SMTP id t1mr4310261pdh.138.1438873551288;
	Thu, 06 Aug 2015 08:05:51 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:e860:4e8d:f547:a4e?
	([2601:646:8601:4580:e860:4e8d:f547:a4e])
	by smtp.gmail.com with ESMTPSA id
	hl6sm6892875pdb.28.2015.08.06.08.05.50
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 06 Aug 2015 08:05:50 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <3388285.Ji3DKKVymS@peggleto-mobl.ger.corp.intel.com>
Date: Thu, 6 Aug 2015 08:05:40 -0700
Message-Id: <4ABFBF94-9F87-48E7-8C32-9401658709CE@gmail.com>
References: <1438765311-13423-1-git-send-email-ed.bartosh@linux.intel.com>
	<CAMKF1sra8sykgB4q5+qQd4hL2fPOxfuND7W-WivqS_YxYPfvWw@mail.gmail.com>
	<3388285.Ji3DKKVymS@peggleto-mobl.ger.corp.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] create-pull-request: cd to relative directory
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
X-List-Received-Date: Thu, 06 Aug 2015 15:05:51 -0000
X-Groupsio-MsgNum: 69050
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5D292D98-027A-45E6-88DB-8B8592025F48";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_5D292D98-027A-45E6-88DB-8B8592025F48
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 6, 2015, at 1:38 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:
>=20
> On Wednesday 05 August 2015 20:33:48 Khem Raj wrote:
>> On Wed, Aug 5, 2015 at 2:01 AM, Ed Bartosh =
<ed.bartosh@linux.intel.com>
> wrote:
>>> create-pull-request -d path creates empty patches if directory
>>> is specified as a path, i.e. ./bitbake or ./bitbake/ or full path.
>>> It behaves expected way only if script is run with -d bitbake, i.e.
>>> relative dir name doesn't contain '\'.
>>>=20
>>> Fixed this unwanted behaviour by changing directory and running
>>> git format-patch in it with --relative, without specifying
>>> relative path as a parameter.
>>>=20
>>> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
>>> ---
>>>=20
>>> scripts/create-pull-request | 5 ++++-
>>> 1 file changed, 4 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/scripts/create-pull-request =
b/scripts/create-pull-request
>>> index 216edfd..7eac618 100755
>>> --- a/scripts/create-pull-request
>>> +++ b/scripts/create-pull-request
>>> @@ -177,12 +177,15 @@ mkdir $ODIR
>>>=20
>>> if [ -n "$RELDIR" ]; then
>>>=20
>>>        ODIR=3D$(realpath $ODIR)
>>>=20
>>> -       extraopts=3D"--relative=3D$RELDIR"
>>> +       pushd $RELDIR
>>=20
>> can we avoid using pushd so it works with non bash shells too ?
>=20
> Should be possible, but it's worth mentioning that this script already =
starts
> with #!/bin/bash.

Does it have to be ?

>=20
> Cheers,
> Paul
>=20
> --
>=20
> Paul Eggleton
> Intel Open Source Technology Centre


--Apple-Mail=_5D292D98-027A-45E6-88DB-8B8592025F48
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXDd8wACgkQuwUzVZGdMxRHgQCfUKBhbiWPiIz7UkQrd3DVudXq
dUQAn0fWxxE4bByxMKQXdTi4YTKR4Dau
=HYFR
-----END PGP SIGNATURE-----

--Apple-Mail=_5D292D98-027A-45E6-88DB-8B8592025F48--
