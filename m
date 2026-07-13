Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0106C43458
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 12:39:17 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9785.1783946353367048289
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 05:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VFmfvBC3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15b33f7b23so437076966b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 05:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783946351; x=1784551151; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3mX+tuxtkrIg8TPcUhK3uD44jiEQPXexWvPdgzyTfWk=;
        b=VFmfvBC34c5rkqV7vyIdL/mJhrGX9tv4TYVoyYWFkNcBP4Pa/QXFg4ADcmWEuj4m9E
         F71Pf72MOl0P5r3Tcs+Oy0a5C3podp/LNx0JUiCxYDywiZJKjWdql17m9C7U+fAR/eSX
         0eojNtyPzsP0k8oEgHpVLHsKKiq0+4Iyz/R9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783946351; x=1784551151;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3mX+tuxtkrIg8TPcUhK3uD44jiEQPXexWvPdgzyTfWk=;
        b=Ql3yZ90KTgWKEVqMU0xK84ZQMl8nzhDxRjnte8RXhRP7TJh1icrUTMPlVcEGyLbwzh
         d2wXVLkzD9I7g7fTAGydH3zsu4WKS2vtkD0uP/HNqIu4nBj+GBpt8QZMWBKCPgKHaaHN
         5rntpsbEqsKLeVOeHzypXRl0U1SpVazEHnZJJSBDhfHp6PQiH+5VrXB5VNFu407qgJyh
         hgGnJZNldBhxQXuA345n+IANclOC8k3+MOmbu/XCOVUeupyqXrkgZy0dPZihOqBdgE7h
         1CiRVk1Vwv3uQ87G4xjZ4txgW6yYCbvN10wKwhBhO3EaEoBA5jM86lKklduzEVmk2Dv7
         wf7A==
X-Forwarded-Encrypted: i=1; AHgh+RpsbZ4n5PWPKgKUyKla6aeKif6X+FPgBA0aMWElwirDKYjhwuTeW66eY8it+GvhTNZiJFcSlsFHnihWHWZZ1tcVEA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxnMYwaEKNjhRKr/cPlcLdgrh6kEYhG9Tr1N94CIzu0Z+vl6Lo7
	j9lwLKc/V2LzPIWSoxOaO3+ftS3ztGiiqsdDuvD3GzaV48KuglML+r2jTDEbxyIBrmQ=
X-Gm-Gg: AfdE7ckQymyu1xrONQu2TzeXmUzKSVQIYUvgNJDiTS0hSrbLGVDTD/iH68bIXLaa4pR
	b/hYO7Kq5hfwHKoNjZIcwfZioPHPulgybuZuh9kiKdXjjhwPiJ+aIiORutbw1+a4lAeRX9gL06s
	uUf9a7PydVak9rHbdGHo6TmM+0kux+qClR6wyiajod9iAjWp7Y0kMFl4bsGoTxRDIeRZQI8POcz
	iqKQy1hJo/AtoQxsk60JbYcwO2Cei6kfN37vrRdeiBas6eMxyhdsQmaxC49ElG/4MkSu0awhAWz
	NpovQo1US6Qi1jHSrYcJRy9hkiaYpSPtjfxJwaZdzCljbBW6fMc2QdKVOD3FXi4BIYZTodjhsfg
	Skt/PaQTnvc2RwReWucbShzZ5/NC82hL7QNxFsAsq7/z2/pnElVzay8f9KhOxJxFWLUzHScjlKT
	Ajmky4azqGFPHvdfNd4vJJxAAI0BmEh+Q0tXYJDnx+GYSuKyxiH2VM9bej2LeCqqXAxx7sL75Mp
	mFwaw==
X-Received: by 2002:a17:907:7212:b0:c12:6c2e:ad2 with SMTP id a640c23a62f3a-c161f58f14bmr400625166b.57.1783946351414;
        Mon, 13 Jul 2026 05:39:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2d44:2cca:8708:eb73? ([2001:8b0:aba:5f3c:2d44:2cca:8708:eb73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d81bbceesm744908366b.41.2026.07.13.05.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:39:10 -0700 (PDT)
Message-ID: <9de7715adce691b017f0ef289b879210c0d4e688.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] scripts/oe-check-sstate: Handle multiconfig
 task IDs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: luca.fancellu@arm.com, openembedded-core@lists.openembedded.org
Date: Mon, 13 Jul 2026 13:39:09 +0100
In-Reply-To: <20260625133135.2118442-1-luca.fancellu@arm.com>
References: <20260625133135.2118442-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 12:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240838

On Thu, 2026-06-25 at 14:31 +0100, luca fancellu via lists.openembedded.org=
 wrote:
> When oe-check-sstate parses setscene tasks from a bitbake dry run,
> multiconfig task IDs are reported as mc:<mc>:<fn>:<task>.
> split_tid() returns the multiconfig name and unprefixed filename,
> but the matching multiconfig recipe cache can store pkg_fn keys with
> the mc:<mc>: prefix.
>=20
> This makes translate_virtualfns raise a KeyError while the eSDK task
> list is generated for builds that include multiconfig dependencies.
>=20
> Try the multiconfig-prefixed filename when the unprefixed filename is
> not in the selected recipe cache.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> =C2=A0scripts/oe-check-sstate | 7 ++++++-
> =C2=A01 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/scripts/oe-check-sstate b/scripts/oe-check-sstate
> index 0d171c44632f..435ddaa0c687 100755
> --- a/scripts/oe-check-sstate
> +++ b/scripts/oe-check-sstate
> @@ -35,7 +35,12 @@ def translate_virtualfns(tasks):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
(mc, fn, taskname) =3D bb.runqueue.split_tid(task)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if taskname.endswith('_setscene'):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 taskname =3D taskname[:-9]
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 outta=
sks.append('%s:%s' % (recipecaches[mc].pkg_fn[fn], taskname))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 recip=
ecache =3D recipecaches[mc]
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if fn=
 not in recipecache.pkg_fn and mc:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 mcfn =3D 'mc:%s:%s' % (mc, fn)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if mcfn in recipecache.pkg_fn:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fn =3D mcfn
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 outta=
sks.append('%s:%s' % (recipecache.pkg_fn[fn], taskname))
> =C2=A0=C2=A0=C2=A0=C2=A0 finally:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tinfoil.shutdown()
> =C2=A0=C2=A0=C2=A0=C2=A0 return outtasks

There is a function in bb.runqueue, split_tid_mcfn so you can probably do:

(mc, fn, taskname, mcfn) =3D bb.runqueue.split_tid_mcfn(task)

and then use mcfn directly, which should simplicy the code and remove
the need to code in assumptions.

Cheers,

Richard

