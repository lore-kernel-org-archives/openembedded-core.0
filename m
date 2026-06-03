Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 361A5CD6E57
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 16:19:11 +0000 (UTC)
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24397.1780503547658028069
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2026 09:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=XvbLFNIM;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=RbjoXCRk;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id C82791D000BC;
	Wed,  3 Jun 2026 12:19:06 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 03 Jun 2026 12:19:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1780503546; x=1780589946; bh=7Uf5ANBIS+
	we1C9CJMdwr8BjH4pLTPtIjkvicExwzyA=; b=XvbLFNIMNgV+F9+jVVWE50wXDw
	sddBSuTxFxSBw7U6kfCT4lS9/vhVZ96QvU6xnrXZm1puZEY3R0uqAjyGwJtpQ5YT
	D2iQkXihp2BUw3VVbm995TeH6dt+fn4Cq2LrqXOxDgVWkWEwP71S/Ke65ARPM3uY
	5iZWLyaj2I+e7FbizLh+XvFaOOM8LYtD/U+MRJTs6Wkvf/QJprTaLYosjaV+cV0A
	egSyEQpbFN2sFV2wxICqiuQzFn/r+OmVmkqSwMX8O1YWsD0XXdZxQzVIOhTdJgss
	Mvv3Piwc5+QVYmmgSeHnV1XH+VmRLxHzRqMEL422PdEks8+j3Pu7yI0FfxEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1780503546; x=1780589946; bh=7Uf5ANBIS+we1C9CJMdwr8BjH4pLTPtIjkv
	icExwzyA=; b=RbjoXCRk2WKiZDpnh/TVQI99Pfp32QW2BDF2bflNLIJnLFv78wi
	NMPT3pBB8sqRoNxiT2s7KIwYnyImo4epniIRh+TqbqYJAP23jt+pjo50IGD4h8Ga
	s2c+p7BnVC0S++T77jvF82FFVU0yOC61OFnxq/B2i1CA6/PgCRG3ZPf1hBKn+/w9
	6JiacLxX9zsHNjLNZtANBTxwIDBxHzoK6lKjGjHvXl8e7RU/RTEoOOJW1jBU1HUH
	Oocf3URmwG92BXc9sZhnIgSp3+fmHKCrpYZrXUNJ7Cp/qcaT0qpYId/++IME20BZ
	BKJPEVocJRUi6VmPwicbh5CA4VAkPj31jlQ==
X-ME-Sender: <xms:-lMgarRG_3EgNQCPTC_7pSFmuFci4Tp8EO0PvwstNADgvFVWvRGR5w>
    <xme:-lMgakPK-NqSfvd76jFzzRPTuOCze0nUPFZPjvqWG7dRTxCdNUweA3q-gc4yFS-fN
    sApqECElXAzmaxIVsdbGrm3j8OHELN8NYWJIpb5LyyKzE8Jz0ukVO8>
X-ME-Received: <xmr:-lMgauNY6IUKx1QCK_8YdRXIuaHcL9KtrkEeXkNeb6Dr5oNxG4gL5_G_njqXGxaTDDhwlmIqsiXRLcY2TuDZT45iBxfipio-qvvjqyuLX_sbutjHLTm8Ui4ih5LY54mn>
X-ME-Proxy-Cause: dmFkZTFc1Kz2Uc+jK37SP9I7i8GPfM3tRLTEFokokVjSqwLCpqW49mww4t8mSANb0krg3e
    NnrjVlDzDNsMLKP+hILAN+o0b0zEToh5uoAJo+944FzJeRx1qAIr8nUX5GWPDUuQV/xuMl
    EIJh/mZ4+RRrU5FtcuFbaSTiWrV0KdcFFgdYXOrcsVZ9vhWA2/zGN4LdZJyrSyHOwR6hsl
    l0rJvuM0H+od6ZHJf0Mg2bNKbwMsyV1zULikNQTKUJrWdE2o7hwEPylekBsYgnA7Sm6aZQ
    9+QKeylbG8nApjG3+jvKiN9I8DshVRpkvX4FQhUut9gkam7+DCjUs5Esq00vTVo3mSaYs7
    LBXuOuoFBtaCfHfWEFS1fLofpSIacsseHdhJt6qnG6v7fQgu5V3yWV3VcMjejBJImMMG2W
    eedKrtOl9Ycqda6V4iFC+b/ZnMMqMoMN3lujSTu2WpkhhUJvZVsETUNojkKe0/Lkglmihr
    2l8HGoHL8LACpV6KtetaEFLTuFEsc3wqzvyMr8EBFD/1E2pdAo8tSVNhmj6As+/N+I8Mw0
    atwfuSgR2rwS9fA22/EL1P9/RIzjVbmW8uD8fW9qyo/tK9MkyqLPK7Oz3ZbFTDYy8mg66A
    YU7vToVKetAK62s+JJ7y2TKDcZqo4j9fL1rn6fy1IksEm3lS97TVw0x2b6tw
X-ME-Proxy: <xmx:-lMgaktO2HdmdMebso0tqmf4LKlDSdje8HhMm4Cvp8zVtlynpd39gQ>
    <xmx:-lMgaoUz9v5sbtE_cH7P3I9St0akbboARG67VLjySW6rkwtQmZQkHw>
    <xmx:-lMgasvuSqDDz81frHtQuUvRvc7PO0domuBHN_JX-KHB_N1HFvY8jg>
    <xmx:-lMgakUYaS3rNl2tf71uB_De5Mdo0zDoIgvMWNAHwcsWGeLhWfNL0A>
    <xmx:-lMgam_9Tu56JX5xsD8NklvXcLcL9-l7tHPU6ufDW_8mWwFYgpOQjy08>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jun 2026 12:19:05 -0400 (EDT)
Message-ID: <0de79c158ed28c52741b9511b8da50a251572518.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH] vim-tiny: bugfix lack of defaults.vim
From: Paul Barker <paul@pbarker.dev>
To: zhengrq.fnst@fujitsu.com, Richard Purdie
	 <richard.purdie@linuxfoundation.org>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 03 Jun 2026 17:19:03 +0100
In-Reply-To: <OSZPR01MB786878B9AD82C7976F6C55278B122@OSZPR01MB7868.jpnprd01.prod.outlook.com>
References: <20260528020658.789-1-zhengrq.fnst@fujitsu.com>
	 <2c47dc98209c6874d1e2c9726a5d24881b059d6e.camel@linuxfoundation.org>
	 <18B4D2C3BE17A296.111707@lists.openembedded.org>
	 <OSZPR01MB7868A7D33A0E67FBB3E1043B8B122@OSZPR01MB7868.jpnprd01.prod.outlook.com>
	 <18B52F9167DFD20C.197704@lists.openembedded.org>
	 <OSZPR01MB786878B9AD82C7976F6C55278B122@OSZPR01MB7868.jpnprd01.prod.outlook.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-tktbUL7aeKM8DEaBUDX5"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 16:19:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238101


--=-tktbUL7aeKM8DEaBUDX5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-06-02 at 07:02 +0000, zhengruoqin via
lists.openembedded.org wrote:
> Hi Richard
>=20
> In this mail, I would like to summarize the solutions of Ubuntu and Fedor=
a for this issue.
>=20
> Fedora : Put defaults.vim file in RDepends vim-data.
> https://src.fedoraproject.org/fork/vondruch/rpms/vim/blob/f40/f/vim.spec

That link is to a fork, and to an old version for Fedora 40.
https://src.fedoraproject.org/rpms/vim/blob/rawhide/f/vim.spec is a
better link.

That aside, Fedora doesn't have a vim-tiny package, so what they do is
irrelevant.

>=20
> Ubuntu: Make a patch to skip "source_defaults" error.
> https://archive.ubuntu.com/ubuntu/pool/main/v/vim/vim_8.2.3995-1ubuntu2.3=
0.debian.tar.xz
> Patch file: patches/debian/Support-sourcing-a-vimrc.tiny-when-Vim-is-invo=
ked-as-vi.patch
> Modify file: vim-8.2.3995/src/main.c
>=20
> The  "parmp->vi_mode" is TRUE, so the "emsg(e_failed_to_source_defaults);=
" will be skipped.
>=20
> 3197 #ifdef USR_EXRC_FILE2
> 3198                 && do_source((char_u *)USR_EXRC_FILE2, FALSE,
> 3199                                                        DOSO_NONE, NU=
LL) =3D=3D FAIL
> 3200 #endif
> 3201 #if defined(SYS_TINYRC_FILE) && defined(TINY_VIMRC)
> 3202                 && !parmp->vi_mode
> 3203 #endif
> 3204                 && !has_dash_c_arg)
> 3205             {
> 3206                 // When no .vimrc file was found: source defaults.vi=
m.
> 3207                 if (do_source((char_u *)VIM_DEFAULTS_FILE, FALSE, DO=
SO_NONE,
> 3208                                                                  NUL=
L) =3D=3D FAIL)
> 3209                     emsg(e_failed_to_source_defaults);
> 3210             }
> 3211         }
>=20
>=20
> I think the Fedora's solution slightly simpler and easier to maintain, wh=
ile Ubuntu's solution may require further maintaining for this special patc=
h.
>=20
> What do you think about it?

If we offer vim-tiny, it should actually be tiny. Building vim-tiny
should also not depend on building the full vim recipe.

We can't ship defaults.vim in multiple packages, and should not be
installing configuration files into user home directories. So the best
solution probably is to copy over this patch from Debian/Ubuntu.

Thanks,

--=20
Paul Barker


--=-tktbUL7aeKM8DEaBUDX5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaiBT9xEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bv7vAQC7i/hxH8FSgzplUPWXMhaaLl+d6QVOPe4o
EOwbHsoKmwD+MqnDx+aER1VHTFJczShR/9+wPeOmD8SW1DJmFwNxSA4=
=donZ
-----END PGP SIGNATURE-----

--=-tktbUL7aeKM8DEaBUDX5--

