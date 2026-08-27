Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41CB3C61DC6
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 13:12:35 +0000 (UTC)
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36085.1787836351748647432
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 06:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=hgke8MSF;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=cNOHirTl;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id C4CB6EC0212;
	Thu, 27 Aug 2026 09:12:30 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 27 Aug 2026 09:12:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787836350;
	 x=1787922750; bh=e78bNbRZWAHO7+9mqevzQvW310aPSi38COcaR1igRWI=; b=
	hgke8MSF03FjyHZmnMab/JcjahrYr+gQWEc1Shl9qHAkGQ/t42keRfmLNm57PgAD
	m8oYRnX8wqn/YpZq+RaVsnujAx3TPpiciji0muihjjWZK7fQ+XePBZNIWH5nZ1Ww
	1ZwieGhg8R10qksjn2jIr+t6rQ0dIiziRzhogtaqOzt35d3jLyOGGVf1ey4iOgrb
	hZOn73u6FYbrBHGfm6yFTn1gqmRiE5mKkaD5CV+sPcjKhXrFoCIrXeIl4fJz8nOJ
	BcXti8r8u2n8rU9MGUhVBVsO57XCp3QFm2e9F+s/Aom5fS/zWfaovxZVLsirtTvk
	rWw+Sto5E9BmPNpeCsin1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787836350; x=
	1787922750; bh=e78bNbRZWAHO7+9mqevzQvW310aPSi38COcaR1igRWI=; b=c
	NOHirTluNqe6QMNx9KuPqqQQMMFdjhF4x3uK1NCFetQB8fy4eXAzhAIBj+duVFeR
	tAmkrSEjB3bTUsMSkF91iEg7Qeglv2AOfNWqZZIJ+Xnl8CuV8CZ++Q/aq+Yjow/8
	WXNNb7bga0Ugnjj3fnT3xgGGluEtUwMxewL6kSUUW8gjkTR1NDErJugKwSQhl9dL
	POIWlQDvpE6bTdoQAwTQYkvrC8RNmfcNTULAP76MqJ8SZj/QgX3gXMRyd2DQmCVm
	Xor2wWobZ2qe+Mhv3pRrQnkVPIHQjkhvP+7N761PxRHWt2CopJU0kClohM01+7be
	QcYJeRxndb+SEGRdnEQjQ==
X-ME-Sender: <xms:vjeQagoTSzHN9gOnWIdiY1p0eKN8lA-hKmb4iMNbxKyoYNJ0Ow4W2g>
    <xme:vjeQauEOHFu5IC3gd0iFETmhuh-gVTR030Oa4doqHnmhong2AEf8QozkKLoZ8vuzh
    cgHlpXYxDfgqq0CFsCQ_uGxereTGpXzqWpgIEImq1bsMTdcMu00fAyS>
X-ME-Received: <xmr:vjeQaimEOgq-1eqbm0NmcfoW6ulzgOWTlG50-cKPce2o_w4p7U-ot8KqbvreruDr8aZqV_DjKOvhDt1idZFctVCjL1m7u75QcN1P6IU>
X-ME-Proxy-Cause: dmFkZTEv/renouhA9/x2TIKhSnUcjTvqcW4VFzz2zgeQo13KS7e2/fs9p4NLIt4WZsKKoF
    Z1A02GEoIsZTODa7ptMW2u7W68VSgWLAK9LMA2dO+87YibgRz/jEZ19/8NWsB6HhOPY12T
    R/SG7v9ilyrX44eTlV02ePBhjyXUyh/0LjNliksjhLKlA/m2B+a2KFcTOhjLRifCsdHsRD
    QFUwRMECbfK7iNed2C9YxbhZKkxVnprWXzW60fvsnvJn0naLY5DtPOhdkPmt5NERU4IrPq
    qZVNKHEiFgSbuX6+1Ap/avynqV1S1J2XECjXhOQ7XKmDMrpVr7FNitL4nZIb859n2nkyXp
    3AETQw5pgToHHs3mebSYV19lJwHeJ8cuqeWsC1lXEdUqHG3BECvOsGFBqc2FLrrSjblEkK
    HqqGv7zuAq+mX0L62bUTatGvzHSyONZOfjEl72xKENXkvlmNA7I2nYalfC4ebl4fslGuX0
    ICymJIfd3OEEpgbuMdeNJA2KtXS4+B4XiG8w0BUAB4ZP91ijFRG6X3LSeIVgfb8YtB1wrZ
    SnTBd8C1mVKPMO4eB/W+Oy1AQhx9OF8tu5UqL92OX3XC5uiCbaA1iWgld+2gw4RlPt+x+m
    2hRJSJjgB9CHL52pVZvM0Q++eHRviP6kBWqM38ba+sZp0Rnh3KNmwG8XzOnw
X-ME-Proxy: <xmx:vjeQahmfPTrqqlRII9aRfNK52By0VDn2u42SKQ4DTV9rE66KiE1yrg>
    <xmx:vjeQajuvmuwaLs8BMZMNmpCp-6jOvShKRb0ySxzHF9bNMt6gMx6rZQ>
    <xmx:vjeQakkfQXZlWyymPh3cGCr6MF4rvAN4pwc1GPbx09zFzYCfoUCkdQ>
    <xmx:vjeQauvx9G6HEg1iS6Lt8AtLVJJ32VGhy5gei37BKyTa3HS0jkycfw>
    <xmx:vjeQageZaN8URwg1fNdfJdOYffelgiRTMslw2B_jnhwWggY1_bN4jY_d>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Aug 2026 09:12:29 -0400 (EDT)
Message-ID: <6fc3dd417116cb61641a293fd9a4256774e708b4.camel@pbarker.dev>
Subject: Re: [PATCH] classes/archiver: fix tarball content in "original" mode
From: Paul Barker <paul@pbarker.dev>
To: =?ISO-8859-1?Q?Jo=E3o?= Marcos Costa <joaomarcos.costa@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com
Date: Thu, 27 Aug 2026 14:12:29 +0100
In-Reply-To: <20260818133641.1269741-1-joaomarcos.costa@bootlin.com>
References: <20260818133641.1269741-1-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 13:12:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244488

On Tue, 2026-08-18 at 15:36 +0200, Jo=C3=A3o Marcos Costa wrote:
> When ARCHIVER_MODE[src] is set to "original", a tarball is generated with
> the unpacked sources of a given recipe. Prior to it, a tmpdir
> (i.e. from tempfile.mkdtemp()) is created and the sources are unpacked in=
side:
>=20
> (...)/vim/9.2.0340/archiver-work/tmp8pu2nsck
> `-- vim-9.2.0340
>     |-- READMEdir
>     |-- ci
>     |-- lang
>=20
> This tmpdir, however, ends up being shipped in the deployed tarball:
>=20
> $ tar -tf vim-9.2.0340-r0.tar.xz
> (...)
> tmp8pu2nsck/vim-9.2.0340/ci/config.mk.clang-12.sed
> tmp8pu2nsck/vim-9.2.0340/LICENSE
> tmp8pu2nsck/vim-9.2.0340/.git-blame-ignore-revs
> (...)
>=20
> This can be avoided by using "-C" option from tar's command, with which w=
e
> can point to the tmpdir and to the content inside separately:
>=20
> tar --exclude=3Dtemp --exclude=3Dpatches --exclude=3D'.pc' \
> -C (...)/vim/9.1.1683/archiver-work/tmpv0m93p52 -cf - . | \
> xz --memlimit=3D50% --threads=3D64 > \
> (...)/vim/9.1.1683/archiver-sources/(...)/vim-9.1.1683-r0/vim-9.1.1683-r0=
.tar.xz
>=20
> and in the result:
>=20
> ./
> ./vim-9.1.1683/
> ./vim-9.1.1683/SECURITY.md
> ./vim-9.1.1683/.codecov.yml
> (...)
>=20
> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>

Reading this leaves me wondering why we're creating a tmpdir under
${ARCHIVER_WORKDIR}, why not just unpack the source directly under the
archiver workdir?

If the tmpdir is needed, I think the issue is that we're passing the
tmpdir path to create_tarball() in do_ar_original() instead of the full
path to the extracted sources. I think fixing the call site in
do_ar_original() would be cleaner if we can do that.

Best regards,

--=20
Paul Barker


