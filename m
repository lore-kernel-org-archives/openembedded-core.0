Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF453C4345F
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 21:27:36 +0000 (UTC)
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
 by mx.groups.io with SMTP id smtpd.web10.8924.1714598856124047118
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 14:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm2 header.b=YAFvfxqf;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=budRcWKb;
 spf=pass (domain: stwcx.xyz, ip: 103.168.172.149, mailfrom: patrick@stwcx.xyz)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfout.nyi.internal (Postfix) with ESMTP id 4CC1E13800AE;
	Wed,  1 May 2024 17:27:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Wed, 01 May 2024 17:27:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1714598853; x=1714685253; bh=uyRc6kRk7e
	KRnFXQVi5ya/zeJXoBFm3I1Nequ2E3Qic=; b=YAFvfxqfrF4mmdyC0HD12nxVKV
	etLPjfRV0Fck98Wva2s9IezxUt68qA7gU5hz+VdcKPRHu3LlZ91A/dTakj5fXFVt
	Wfi71ZUxF90VznzKRgzaGu/X4xU/RL331eMf4GRStOqJoH74WvBHOfq2TctFoB71
	zWjZwXJKLJU9dNLzq91LXggqO3qiiQivZ/O97fTAAaRFE70AKpMOGJyx3p2eR3K4
	GarceaztwAq8Bb6vWGKRAxX05gD4jPpB0x5O6ij8v5QegU8KKs4WGQLNuZ95EI+8
	RyyU0vaAVJNP7j5cvU5TRmYGq9B44cOyszGogQqpKvIGlV8Lt8EH6ZiD5fpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714598853; x=1714685253; bh=uyRc6kRk7eKRnFXQVi5ya/zeJXoB
	Fm3I1Nequ2E3Qic=; b=budRcWKbcdY1OTZU248ZbGSUG4ZpWDEhsjdBJ9jh1S1V
	NINBMngF0DTkJK38J19laAZoAIlnZNaWBQs2kxAVcfxiTdUvrpiBo6bVWMsXxgDG
	iWnBqTxW6neeAtZs9syZH1kRkatvAoEmUE5CBwTC8J4LlDRscrNrfapXvhBpTob3
	Q+EMtL700Sl7Deuw96hFts3fDdgGSY3/ATAzgAJYYEsfXjAJGR4MwZ+Cbyw87/oc
	ADExh0SyUcKDEo314vwbJk5w18dbHS4auqQYwfahCABE99cnTRE+EkZtViyFGwGp
	okYtByFPPRi2Ycv8gv3gDDuyLCVjMmgrkgmX2HLoXQ==
X-ME-Sender: <xms:xLMyZlVptx364nOsS2FpmFn4VhYJyv4uwzNJh_eOhxMUQNfu1LLegA>
    <xme:xLMyZllTDIiEWuwgv2-31ih70k8-s46J_iVtBHmUw8NojGyM2-sbyWdIfseiKbZvS
    cNOuqx5sq-Xkuc2G3Y>
X-ME-Received: <xmr:xLMyZhbLjfsQaqDF9bJnL8LjTOZP-asc_p1tId5jA-KGQ4HQ6ATUjmJOvGJmqSWPl67gnafHrgosvNu4g7eKKUA1t4kgZXruyvA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdduiedgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtdorredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeetveeugfevteettdefvedufeeh
    heetfeekuefgudfgtdefvddufeevveethffhffenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:xLMyZoWoABGTd2ezKqGm3FSkVSH5D3UCJYnD0KyIlwhNcUHRR8fM6w>
    <xmx:xLMyZvkCj8G0XDcGo5T8_ZgTWIOurhXbpFl0bbeMh4IKoeW5-NjSTg>
    <xmx:xLMyZleWAhOlWL4yFqF6bV4B8B7NR6_L_O3o4HJDC9Z7mDE8hnmt9w>
    <xmx:xLMyZpG-_ec46P3vqOm17WCN2_JSJFHZ31SyxY5QFotsKrYic74-YA>
    <xmx:xbMyZqvCu7j5dvZmUCJzZiVf5pejbaC5flmUocc1FMPk2FMBXVW4svrF>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 May 2024 17:27:31 -0400 (EDT)
Date: Wed, 1 May 2024 16:27:30 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Lean Sheng Tan <sheng.tan@9elements.com>
Cc: Ross Burton <Ross.Burton@arm.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	"Hansen, Alexander" <alexander.hansen@9elements.com>,
	John Chung <John.Chung@arm.com>
Subject: Re: [OE-core] btrfs-tools-native build python error
Message-ID: <ZjKzwmSpKmznOedr@heinlein.vulture-banana.ts.net>
References: <CAMWxwJ0znPDyQAKAwv8PL9GwyCCEpW9+2SDmXsygNyK26_xF-A@mail.gmail.com>
 <CAMWxwJ1aad-ggrC+Bug=RGx1yQcFADOSWiZMDZv8S2AnJ7ntnw@mail.gmail.com>
 <5684983E-FC35-4766-BA02-4D5BCBCB6796@arm.com>
 <17C993B983870D20.19690@lists.openembedded.org>
 <CAMWxwJ3ok_d17XnVEgSm3H3qeKK+7U3AQ4OuwNFXTo-jWjtHoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lRy9G4Wr1R1UfiTE"
Content-Disposition: inline
In-Reply-To: <CAMWxwJ3ok_d17XnVEgSm3H3qeKK+7U3AQ4OuwNFXTo-jWjtHoQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 21:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198887


--lRy9G4Wr1R1UfiTE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2024 at 07:40:15PM +0200, Lean Sheng Tan wrote:
> >> > The error found when manually run bitbake btrfs-tools-native is as
> >> follows:
> >> >  checking for a Python interpreter with version >=3D 3.4... python3
> >> >  checking for python3...
> >> /home/apwillia/local/builds/lf-build-yosemite4/tmp/hosttools/python3
> >> >  checking for python3 version... 3.11
> >> >  checking for python3 platform... linux
> >> >  checking for GNU default python3 prefix... ${prefix}
> >> >  checking for GNU default python3 exec_prefix... ${exec_prefix}
> >> >  checking for python3 script directory (pythondir)...
> >> ${libdir}/python3.11/site-packages
> >> >  checking for python3 extension module directory (pyexecdir)...
> >> ${libdir}/python3.11/site-packages
> >> >  checking for python-3.11... no
> >> >  configure: error: Package requirements (python-3.11) were not met:
> >> >
> >> >  No package 'python-3.11' found
> >> >
> >> > To bypass this, we have to manually remove in OpenBMC with this twea=
k:
> >> > PACKAGECONFIG:remove:pn-btrfs-tools-native =3D "python"

I dug into this a bit more by starting from first principles.  Building
with an unchanged poky with the crops/poky docker container works.  Just
like you would expect, `PYTHON` gets set to `python3-native/python3`:

```
# $PYTHON [3 operations]
#   set /rundir/meta/conf/bitbake.conf:574
#     "${@sys.executable}"
#   set /rundir/meta/classes-recipe/python3native.bbclass:9
#     "${STAGING_BINDIR_NATIVE}/python3-native/python3"
```

So, I did the same thing in our OpenBMC tree:

```
# $PYTHON
#   set /home/apwillia/private/dev/openbmc/openbmc/meta/conf/bitbake.conf:5=
74
#     "${@sys.executable}"
PYTHON=3D"/usr/lib/python-exec/python3.11/python3"
```

Somehow, `python3native.bbclass` is never inherited (also checked the
`INCLUDE HISTORY`).

The `btrfs-tools_6.8.bb` uses the new-ish `inherit_defer`, so I did some
more change there to debug:

```
- inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python', 'setuptools=
3-base', '', d)}
+ inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python', 'setuptools=
3-base', 'this_doesnt_exist' + d.getVar('PACKAGECONFIG').replace(' ', '/'),=
 d)}
```

This resulted in:
```
ERROR: ParseError at /home/apwillia/private/dev/openbmc/openbmc/meta/recipe=
s-devtools/btrfs-tools/btrfs-tools_6.8.bb:46: Could not inherit file classe=
s/this_doesnt_exist/////programs/////convert//////////crypto-builtin//.bbcl=
ass
```

So... not only are we not getting the `setuptools3-base` side of the
`inherit_defer`, but `PACKAGECONFIG` doesn't even contain `python`.
Which is not true because:

```
# pre-expansion value:
#   "     programs     convert     python     crypto-builtin "
PACKAGECONFIG=3D"     programs     convert     python     crypto-builtin "
```

What is going on here?  Well, this:

```
meta-phosphor/conf/distro/include/phosphor-pkg-tweaks.inc
6:# Disable python from btrfs-tools
7:PACKAGECONFIG:remove:pn-btrfs-tools =3D "python"
```

We explicitly remove `python` from the _target_ btrfs-tools
`PACKAGECONFIG`, because we don't want it on-device (since that pulls
python itself as a side-effect).  If I remove this _target_ setting
everything works fine for the native package:

```
# $PYTHON [3 operations]
#   set /home/apwillia/private/dev/openbmc/openbmc/meta/conf/bitbake.conf:5=
74
#     "${@sys.executable}"
#   set /home/apwillia/private/dev/openbmc/openbmc/meta/classes-recipe/pyth=
on3native.bbclass:9
#     "${STAGING_BINDIR_NATIVE}/python3-native/python3"
#   exported ast.py:52 [eval]
#     [export] "1"
# pre-expansion value:
#   "${STAGING_BINDIR_NATIVE}/python3-native/python3"
export PYTHON=3D"/home/apwillia/local/builds/lf-build-yosemite4/tmp/work/x8=
6_64-linux/btrfs-tools-native/6.8/recipe-sysroot-native/usr/bin/python3-nat=
ive/python3"
```

It seems to me like `inherit_defer` is broken.  Why is the _target_
variable being used for a _native_ recipe?

--=20
Patrick Williams

--lRy9G4Wr1R1UfiTE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmYys8AACgkQqwNHzC0A
wRk14w/+KkU5nbThmtf7MnoKG3Qtm+NhVrr2kfZ37tiNwY4AdCBjP18dBNLTrz4W
5+ESt0V098fngA/UVNjxL0OyGzuBdbVPEOcmyBTJ34t2v5Z55h0fjmbGJBGWJgv3
ZPCW6sN0B89lEjPld3FsJt89hrFzvjqahnbpxfQVTyYVPOih7XGcfU4Y6UuV6SR/
lnnW6B15+YueWtAv2XMxFmhElHfXjbKWMY73YGSRk5z79rwpsaD74I/GJU1voTza
/OX3LgCLMp++BmS6hrUmCYbZfdcTkUBciKq3469xWhb2S8F3GynA5fzZFrmyS889
XF1Genp+40GPfYpfVyLq5Kj0a5h8Q5T6pIDmr9VCw45XUubZzNdliqdrvJbCSWqe
OSy0fCKWolt8AOK0srNmxrwbwzY20xVv3fF2SmRc/t/YSqTlVnEhuLMSWtjZ/vwa
qm+MKt4eK0KoQaj0oRthyheQqXVuLSfegLKXr8JLtRH/FeNenH4XLDdqewwTR1Es
y2l1UDyUVLf1LoYkVsukfe6tRcsgF4sYkcTtm1CKzXq9jwlOJF5fvjYxS7Xg7zx9
EmCiYtmCYtvPolH++ezvQssHzBrFfnJKhME5GEpzl2z62J5Y4tpA1GVyfdYU0M0m
SEeHInboEJpJr17FBIbNHQKfAJDSzQKxyuwcSEZzMcYQnCP9qP4=
=0F7n
-----END PGP SIGNATURE-----

--lRy9G4Wr1R1UfiTE--

