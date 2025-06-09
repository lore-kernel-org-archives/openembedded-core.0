Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B64C5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 08:56:44 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.55124.1749459398636929119
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 01:56:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HYyRTdXV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a5123c1533so2215342f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 01:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749459397; x=1750064197; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVSvIFBA2B5zdlMF/f8SK4i1hgrzob9yMiQCaPlOvn4=;
        b=HYyRTdXV2vHjhCM0BQRfbjQqWLVQkpbcCRCboT7kIwKM8OvKiI9XEddwl0kFiTuMio
         xUhajH3HmsbOWkOAG/LtEXt1IbPfb7d45VDxEuoye9pX/49z5BAYb21AVOiluYPWSNkn
         39nf0qT/1NFmA/UbabHpWMGozFMQqJk2fP98s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749459397; x=1750064197;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YVSvIFBA2B5zdlMF/f8SK4i1hgrzob9yMiQCaPlOvn4=;
        b=cQGbEqJgBH2G9ATykIMiLp2nr1Pg/F1Hsk85zfkTddvsr1EXEXw5WwetFfX93cQXeE
         S24GjW1XisZGv7uVJ0OqZ8jP6Y/YCqvDFYzYfE6jVp1fzc3ibp+Z462HxJ7Bh9RxLwJA
         gWfmn0pOMkuzGEWH6ARPaA+VOE+vzqyE+pZtrdTTujn5LKh9uh74rYByKp9X/ONU8dh0
         sZnB4O7seXDS2xpp5z3yEsez2vBaz8poRHyKJpRb6yY3aeKzbujUlqIGmXLwsxeOQSGV
         Q7iGh/k20QKtfzd8bOPoMXeeq8R+PiALveZupoWMBiku0LTUoz2qPlmU8icnVyaI9TEs
         uXWA==
X-Forwarded-Encrypted: i=1; AJvYcCWeO9BoBLvvxAMX4xnb0vAMbQPhAV9u4cM8GEgktJHUweRdYbM/cpdqvOl3T8HYHxHjzi0EYCrqTOyffvgYWBejYA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyaZnDUZ/NCUmQlGzOo0xY7rZB7nyT12670T1Dlloo6gd1NXqll
	r98gWIxCj4Eb+l/FwvTx5tj+d3EyV0rO3jr7Zb1qJa4gQG3/kHSpNTRvF7jweEI/l4U=
X-Gm-Gg: ASbGnctkzYfI1XtbZM/6Ulr3FuL0mqlUva5nentKMdAJFN5cTzvIUOQsOhnWorctj6y
	CzLqJZq79CnxNLvrLrz9W9LtUTdp+BUUIN7hTHIRggkmu9sGNzyjK8StycO8ea+slSMxtWDptiz
	utOCIJwPbVWwylXU9UDVUW4/9JiWOLAV4Zq6Pili+M4f79OawEmDU+mDgfZ4PGJ/YsfuQdHLIWZ
	gagftZI+M+K4LiQw9vt7+u4ht8FaNrNkioLAnGW8obM3Wr/9E2NIkGVj/0UeJjTETa658AJTpAh
	zTg7zSIfHpAn9DGwvfcMMeg+CR445Eg4Q+3284xwpAg8r7vMpDn/OusnPEmMgbe89oNcQA4tvnK
	L1zNbB9mA7hm1axPfN6sdhQtXb0UT8ZY7JcjpTISXT0FklsEqhmm6RfoZztMN2A==
X-Google-Smtp-Source: AGHT+IFTfg36PFwmesJMG8eVoBou5sV7BgGWXpMcmf4l+DIv8Git5+dXU6mpUlmyFT3Zl1pD0+k38Q==
X-Received: by 2002:a05:6000:2890:b0:3a4:ef0d:e614 with SMTP id ffacd0b85a97d-3a531cc3656mr10276446f8f.33.1749459396974;
        Mon, 09 Jun 2025 01:56:36 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fa9f:168d:c475:ba8f? ([2001:8b0:aba:5f3c:fa9f:168d:c475:ba8f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532436555sm9145587f8f.61.2025.06.09.01.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 01:56:36 -0700 (PDT)
Message-ID: <4a6b4ad7eb5c9d128f5f3ebd9dfa76c35948793b.camel@linuxfoundation.org>
Subject: Re: [PATCH v7] package: export debugsources in PKGDESTWORK as json
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Daniel Turull <daniel.turull@ericsson.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 09 Jun 2025 09:56:35 +0100
In-Reply-To: <PR3PR07MB666654683A8A92C0628B36728A6BA@PR3PR07MB6666.eurprd07.prod.outlook.com>
References: <20250605120306.3692449-1-daniel.turull@ericsson.com>
	 <PR3PR07MB666654683A8A92C0628B36728A6BA@PR3PR07MB6666.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 08:56:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218245

On Mon, 2025-06-09 at 08:17 +0000, Daniel Turull wrote:
>=20
>=20
> > -----Original Message-----
> > From: Daniel Turull <daniel.turull@ericsson.com>
> > Sent: Thursday, 5 June 2025 14:03
> > To: openembedded-core@lists.openembedded.org
> > Cc: Daniel Turull <daniel.turull@ericsson.com>; Richard Purdie
> > <richard.purdie@linuxfoundation.org>
> > Subject: [PATCH v7] package: export debugsources in PKGDESTWORK as json
> >=20
> > From: Daniel Turull <daniel.turull@ericsson.com>
> >=20
> > The source information used during packaging can be use from other task=
s to
> > have more detailed information on the files used during the compilation=
 and
> > improve SPDX accuracy.
> >=20
> > Source files used during compilation are store as compressed zstd json =
in
> > pkgdata/debugsources/$PN-debugsources.json.zstd
> > Format:
> > { binary1: [src1, src2, ...], binary2: [src1, src2, ...] }
> >=20
> > I checked the sstate size, and it slightly increase using core-image-fu=
ll-cmdline:
> > Before: 2454884 B
> > After: 2456860 B (+1976 B or 0,08%)
> >=20
> > CC: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> > ---
> > =C2=A0meta/conf/bitbake.conf |=C2=A0 2 ++
> > =C2=A0meta/lib/oe/package.py | 46
> > ++++++++++++++++++++++++++++++++++++++++++
> > =C2=A02 files changed, 48 insertions(+)
> >=20
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf index
> > 13d55923b7..8c0c71d76d 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -991,5 +991,7 @@ oe.sstatesig.find_sstate_manifest[vardepsexclude] =
=3D
> > "BBEXTENDCURR BBEXTENDVARIAN
> > oe.utils.get_multilib_datastore[vardepsexclude] =3D
> > "DEFAULTTUNE_MULTILIB_ORIGINAL OVERRIDES"
> > =C2=A0oe.path.format_display[vardepsexclude] =3D "TOPDIR"
> > =C2=A0oe.utils.get_bb_number_threads[vardepsexclude] =3D
> > "BB_NUMBER_THREADS"
> > +oe.package.save_debugsources_info[vardepsexclude] =3D
> > "BB_NUMBER_THREADS"
> > +oe.package.read_debugsources_file[vardepsexclude] =3D
> > "BB_NUMBER_THREADS"
> > =C2=A0oe.packagedata.emit_pkgdata[vardepsexclude] =3D "BB_NUMBER_THREAD=
S"
> > =C2=A0oe.packagedata.read_subpkgdata_extended[vardepsexclude] =3D
> > "BB_NUMBER_THREADS"
> > diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py index
> > 0bcc04ea54..c5acb7d205 100644
> > --- a/meta/lib/oe/package.py
> > +++ b/meta/lib/oe/package.py
> > @@ -1049,6 +1049,49 @@ def copydebugsources(debugsrcdir, sources, d):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if os.path.exists(p) and not os.listdir(p):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 os.rmdir(p)
> >=20
> > +def save_debugsources_info(debugsrcdir, sources_raw, d):
> > +=C2=A0=C2=A0=C2=A0 import json
> > +=C2=A0=C2=A0=C2=A0 import bb.compress.zstd
> > +=C2=A0=C2=A0=C2=A0 if debugsrcdir and sources_raw:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 debugsources_file =3D d.exp=
and("${PKGDESTWORK}/debugsources/${PN}-
> > debugsources.json.zstd")
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 debugsources_dir =3D os.pat=
h.dirname(debugsources_file)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not os.path.isdir(debugs=
ources_dir):
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.=
utils.mkdirhier(debugsources_dir)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.utils.remove(debugsource=
s_file)
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 workdir =3D d.getVar("WORKD=
IR")
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sdir =3D d.getVar("S")
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pn =3D d.getVar('PN')
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pv =3D d.getVar('PV')
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sources_dict =3D {}
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for file, src_files in sour=
ces_raw:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fil=
e_clean =3D file.replace(f"{workdir}/package/","")
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sou=
rces_clean =3D [
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 src.replace(f"/usr/src/debug/{pn}/", "")
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .replace(f"{sdir}/", "")
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .replace(f"/usr/src/kernel/", "")
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .replace(f"/usr/src/{pn}/", "")
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .replace(f"{pn}-{pv}/", "")
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .replace(f"{pv}/", "")
>=20
> When looking at Joshua's comments, I relalized that I missed to remove "g=
it". I'll send a new version.

I'm a bit apprehensive about this "magic" set of replacements. In
general, sdir (S) is going to represent what you're after. B (the build
directory) will also show up here and can probably be mapped the same
way as S for the purposes of what you're doing. Files in B will almost
always be generated.

/usr/src/xxx should also be possible to be read from a variable rather
than hardcoded. I can understand why the kernel ends up special but I'm
not sure why there would be two other usr/src options.

I'm therefore left wondering why the other pieces come from and if we
can remove more of the magic values here.

Cheers,

Richard

