Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F8B9CD8CA4
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 09:44:08 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75688.1780998238293663658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 02:43:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KxvYyLKw;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: saisneha196@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bef47b1ac01so796083966b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 02:43:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780998237; cv=none;
        d=google.com; s=arc-20240605;
        b=O8qzP0i/nWf5RgKF85bCLNm/CMQQtKYcttI6svrn0dgZfxdQA5IWk7BYln8xkCHbOm
         +On2/CbGj0PeVvzCmZEmMErGXu2zUxCQzJG8Rn2LAvWe+ppNdtUUx3v7zyu7FqM/lfQQ
         TO3NEHc/nFcwcJtNSgAsqqgzBFbfnGbrzbUtkeMO11enRH9ilMzJf4KSCDxFtI/ZlZrB
         cFPTvmu3w3ZBmFVxFsvNRSF+Q/S+P5zRUT/bwR6wODrWNq2YRVvKM5foPrimNGeD0C2w
         zcQyI6Y/MhP2+LySm9vftCFwbtzPV5xQgmeWG43pYyFnh4M6iJgQiWI/FxbFumZpKxEU
         xNqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ALu/CC3YR4jCWtcljTVybSHCarBM/Mt+mJfNFsL2oQM=;
        fh=4AMuIdUKnb+s9o37ZkiHzlYAXmrEihyLTc1tHDOfGtg=;
        b=MausKm/rwd27TMk4pXV2Y0Hu1lGwDPHkzKRPAhQ+vXoUSXJpvAFzMWkIihifrsfjE+
         NkLJvluNMfVSDV8LE9gGeMYVSlzrbEqm45nE77Mm300qZer9lcm7NDLUN8vRiXi/IqiB
         fAdMBBRwPu5x+XLwL3Kg5V2OgkIxBcXmh/Ek7EkzGkpteV+lGrZS2KSC4aSyPA9QQFNd
         B4juKHheEwnAPla/dcQ+jjXjl/+BxXuqGoheWdi3BYCnqTEGOIQidWe2fJ0iyj9t43LH
         TKiaYidaRQq3K/Fm/19mG+1OspLZ/vMXOHUnDC2+pUFvjYj8z7Qib4Wi/R07MfqTH7ll
         K/hQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780998237; x=1781603037; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ALu/CC3YR4jCWtcljTVybSHCarBM/Mt+mJfNFsL2oQM=;
        b=KxvYyLKwoiGVpx++1UJSLEOXPSkouw38n7NITK8wW0N5E6s6/C2HJzkzeqgQ0s9CU5
         1l6w5yGdLlFRQeO/TwLZ8fBlHWmEVSw5JZvl8RhmsmLHh6O5GIjPQeZ9QPx0u8dPSbRN
         TGj60ljYtV7pKxThXxHnM+jnyJW12CpDeGm/OajtXrMht8c32i9nm7ASm+UkyV1q/+oE
         ooZqfpf/HOI2JDEY2Bq5H8ui7fp7DwiQLfQSK78CBtfasQ5766+a4E0xpmEvXhyawPfB
         UDG1E5ra1Xao2RAKlpdceNoTvV++o97pkMTye9xyPXahmlEpQLJaFQJ/wKOo11rDBmPn
         CZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998237; x=1781603037;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALu/CC3YR4jCWtcljTVybSHCarBM/Mt+mJfNFsL2oQM=;
        b=pXB2PK4FgsRUJfDaJHJ3l15YOhtF1JnSTh1Qvbithj5befLhloHXVNRNh1fEQSFVj6
         9vShKUCiBo/taieiR4S+wB6Yme/XR0bs1mITkM8vHADVYSVU27Ak4AkLZdxUiAmIfHCN
         pXS3b9o0klN0qFNYtQ2TOWnrB0OdLbSBYXUPozvxNsVjgUbtS3YJ3/73M5r7mfnUrFDt
         y4Ooicu+FdAh5o3+t9mFy1VC0+A3dxEuvYaF///SQ8QoiycloTmpQ11Jz9QCEdkFoPni
         p0ES4U26rIZFos5pblPtgKTX8QC3ARxrJPfeax6sZbga3p7DCzE5gqwgfcTDNEbcrQnh
         r9iA==
X-Forwarded-Encrypted: i=1; AFNElJ91WsLK2pUHgxCDx82v3e/X0d8H1tnj8mxGcmwrTptoPRvCBV3TmdvG2p2E/LzQ4gq2T6WeysO4BhOWVFcDMB5cIg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy6m+Xy8ndOZq9P6/XRIFM/LcutA8HHeOAOavsqsghfpKIfhXPw
	y5KDWTAmtYGHBuR5yK2Sc0SksZ4pIJv6NH9l8FZVvgSNOt1hAzMj/XEXjEu2CLDFDzvsOMLMuWp
	kbQy5ne0EIAyJl1RaI5B9gJUiXDENWHE=
X-Gm-Gg: Acq92OEmtG8X+//iXjEeODNf/PCADYqN18uyxA0jg59hVwgt+7w+6L82CXmrb9e89Fq
	aLBiGH8u7hxK24B6Sz0tsp31md2Jk+WnIpyv1CRSjMeScevBXBizgP7uh5rNgZWl4FhTZq21bEP
	LxSpqvYsRbg+oAO8Cu25PLb3SNvTnD54MZM5gbIBzuACXcZ4KYs8UwqQxrPc6xydAMnfoAWyn2k
	YrN08J55pvUDC6fKCpAXh3NJ4jQc/2Nc4gdZcOAIG3DHdnpAUq7vCvnOZb0n8tw+pYCE9lH9z6e
	9ThUnFowh2IVvQDeZd6BBVIoKETiCN/PtKQD7QuSB2M3qu8TKA==
X-Received: by 2002:a17:907:ca1:b0:bf4:6aca:6ff1 with SMTP id
 a640c23a62f3a-bf46aca72d8mr490679366b.49.1780998236232; Tue, 09 Jun 2026
 02:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260602062940.3107241-1-saisneha196@gmail.com>
 <20260602062940.3107241-4-saisneha196@gmail.com> <DIYF5VYJ6KMJ.3EBC3FMJXOLPL@smile.fr>
 <18B61AC5A22983D6.29982@lists.openembedded.org> <CANcU11dYfjDYfDq152H-Yanv3gJ__b=dUewq+sKL=hHKrisQvw@mail.gmail.com>
 <80ef3660a609e1f080a6ec80872674cbcadb87c0.camel@linuxfoundation.org>
In-Reply-To: <80ef3660a609e1f080a6ec80872674cbcadb87c0.camel@linuxfoundation.org>
From: Sai Sneha <saisneha196@gmail.com>
Date: Tue, 9 Jun 2026 15:13:30 +0530
X-Gm-Features: AVVi8CfppHGObXmzByhsNv7CL0Wf6rwFmtWqNq-9keL8uXIJxCdnTZGZgUFx_rw
Message-ID: <CANcU11fqh7bRUo=h9C3woRYnpmwnbUjBkGwpbhs1QV4rhnm4Cw@mail.gmail.com>
Subject: Re: [OE-core] insane.bbclass: add missing-srcrev QA check for SCM URIs
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yoann Congal <yoann.congal@smile.fr>, openembedded-core@lists.openembedded.org, 
	corentin.guillevic@smile.fr, martin@geanix.com, paul@pbarker.dev, 
	mathieu.dubois-briand@bootlin.com
Content-Type: multipart/alternative; boundary="000000000000375f990653cef7e8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 09:44:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238284

--000000000000375f990653cef7e8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

That makes much more sense, thank you. Setting
BB_FETCH_REQUIRE_DETERMINISM as a per-layer flag in OE-core and
having BitBake enforce it is a cleaner approach than catching
FetchError in setup_revisions().

could you please point me to where in BitBake the network access would
be triggered so I know the right place to check this flag? I
believe it would be in latest_revision() or srcrev_internal_helper(),
but I want to confirm before implementing.

Best regards,
Sai Sneha


On Tue, 9 Jun 2026 at 2:58=E2=80=AFPM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2026-06-09 at 14:49 +0530, Sai Sneha via lists.openembedded.org
> wrote:
>
> Following up on the suggestions to fix this in the BitBake
> fetchers using supports_srcrev(), I have tried implementing that
> approach locally. Here is what I did and how it works.
>
> The fix has two parts:
>
> Part 1 =E2=80=94 BitBake fix (prevent parse crash):
> The crash happens in setup_revisions() when srcrev_internal_helper()
> raises a FetchError for missing SRCREV. This propagates up through
> expandWithRefs() as an ExpansionError which halts parsing for all
> recipes. The fix catches FetchError in setup_revisions() and sets
> a missing_srcrev flag on the FetchData object:
>
> def setup_revisions(self, d):
> try:
> self.revision =3D srcrev_internal_helper(self, d, self.name)
> except FetchError:
> self.revision =3D None
> self.missing_srcrev =3D True
>
> git.py and hg.py also needed a guard to prevent calling
> latest_revision() when missing_srcrev is set, since that would
> trigger a live network fetch under BB_NO_NETWORK=3D1.
>
>
> That is going to break some of our other protections for invalid SRCREV
> setups and swallow other errors.
>
> How about instead we set a flag in OE-Core on a per layer basis:
>
> BB_FETCH_REQUIRE_DETERMINISM:layer-core =3D "1"
>
> and this simply changes the fetcher behaviour to error if it would touch
> the network?
>
> Cheers,
>
> Richard
>

--000000000000375f990653cef7e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div style=3D"font-size:inherit" dir=3D"auto">Hi Richard,<br style=3D"=
font-size:inherit"><br style=3D"font-size:inherit">That makes much more sen=
se, thank you. Setting <br style=3D"font-size:inherit">BB_FETCH_REQUIRE_DET=
ERMINISM as a per-layer flag in OE-core and <br style=3D"font-size:inherit"=
>having BitBake enforce it is a cleaner approach than catching <br style=3D=
"font-size:inherit">FetchError in setup_revisions().<br style=3D"font-size:=
inherit"><br style=3D"font-size:inherit">could you please point me to where=
 in BitBake the network access would <br style=3D"font-size:inherit">be tri=
ggered so I know the right place to check this flag? I <br style=3D"font-si=
ze:inherit">believe it would be in latest_revision() or srcrev_internal_hel=
per(), <br style=3D"font-size:inherit">but I want to confirm before impleme=
nting.<br style=3D"font-size:inherit"><br style=3D"font-size:inherit">Best =
regards,<br style=3D"font-size:inherit">Sai Sneha<br style=3D"font-size:inh=
erit"></div><br></div><div><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 9 Jun 2026 at 2:58=E2=80=
=AFPM, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.=
org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div><div>On Tue, 2026-06-09 at 14:4=
9 +0530, Sai Sneha via <a href=3D"http://lists.openembedded.org" target=3D"=
_blank">lists.openembedded.org</a> wrote:</div><blockquote type=3D"cite" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:2px solid rgb(114,159,207);padd=
ing-left:1ex"><div><div style=3D"font-size:inherit" dir=3D"auto">Following =
up on the=C2=A0suggestions to fix this in the BitBake <br style=3D"font-siz=
e:inherit">fetchers using supports_srcrev(), I have tried implementing that=
 <br style=3D"font-size:inherit">approach locally. Here is what I did and h=
ow it works.<br style=3D"font-size:inherit"><br style=3D"font-size:inherit"=
>The fix has two parts:<br style=3D"font-size:inherit"><br style=3D"font-si=
ze:inherit">Part 1 =E2=80=94 BitBake fix (prevent parse crash):<br style=3D=
"font-size:inherit">The crash happens in setup_revisions() when srcrev_inte=
rnal_helper() <br style=3D"font-size:inherit">raises a FetchError for missi=
ng SRCREV. This propagates up through <br style=3D"font-size:inherit">expan=
dWithRefs() as an ExpansionError which halts parsing for all <br style=3D"f=
ont-size:inherit">recipes. The fix catches FetchError in setup_revisions() =
and sets <br style=3D"font-size:inherit">a missing_srcrev flag on the Fetch=
Data object:<br style=3D"font-size:inherit"><br style=3D"font-size:inherit"=
>  def setup_revisions(self, d):<br style=3D"font-size:inherit">      try:<=
br style=3D"font-size:inherit">          self.revision =3D srcrev_internal_=
helper(self, d, <a href=3D"http://self.name" target=3D"_blank">self.name</a=
>)<br style=3D"font-size:inherit">      except FetchError:<br style=3D"font=
-size:inherit">          self.revision =3D None<br style=3D"font-size:inher=
it">          self.missing_srcrev =3D True<br style=3D"font-size:inherit"><=
br style=3D"font-size:inherit">git.py and hg.py also needed a guard to prev=
ent calling <br style=3D"font-size:inherit">latest_revision() when missing_=
srcrev is set, since that would <br style=3D"font-size:inherit">trigger a l=
ive network fetch under BB_NO_NETWORK=3D1.</div></div></blockquote><div><br=
></div><div>That is going to break some of our other protections for invali=
d SRCREV setups and swallow other errors.</div><div><br></div><div>How abou=
t instead we set a flag in OE-Core on a per layer basis:</div><div><br></di=
v><div>BB_FETCH_REQUIRE_DETERMINISM:layer-core =3D &quot;1&quot;</div><div>=
<br></div><div>and this simply changes the fetcher behaviour to error if it=
 would touch the network?</div><div><br></div><div>Cheers,</div><div><br></=
div><div>Richard</div><div><span></span></div></div>
</blockquote></div></div>

--000000000000375f990653cef7e8--

