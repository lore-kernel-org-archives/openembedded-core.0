Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43813CD8CAD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 22:06:43 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7407.1781042799957303616
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 15:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MvFWKVPI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso50443015e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 15:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781042798; x=1781647598; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nwTyEagLno/Uxo+drymjzPuvXxQ0AaT0tYoTgpA81yo=;
        b=MvFWKVPIGIRYUfcvFDbmKP9HCqRSofEc3N2MXpnPfbezhcTq6497yXdUN55e3X3pt6
         ySX7jT7/d5s1jOHu94ggUuMxmfXIe4/afIiAMUk4bvfGtOXi/sIl7U4og8ch9DeS2V7J
         bicz+pXVE4bEsouB7maBpp0BlSGxNImJoziaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781042798; x=1781647598;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nwTyEagLno/Uxo+drymjzPuvXxQ0AaT0tYoTgpA81yo=;
        b=VlAVZfh5HdfbcR/54eAukd+v6dl9MDVzjgOOZi8l22+Rvok9YD7Bljku0CevwbJ3WC
         nrl6iYY2IihsBux4DBRnUWQg4x9WZp1F9Bbv8vwsht01t+VxXgC730BdFeyoJ/WuQg9Q
         WK/+fB3pHiiXr6vtj6z0FTJ6wNiZ+gt/rvq4kE0G1PGoM6qbpqbiWaQcsORo3lYeA/7X
         UT01goGJ1z2Wu1EYoG4XnXP+vtub3oMyczhJaB/4T2JT2+OFcH/VcXYgKzUl3qyaH6hw
         TgWq8Q3cGbALKv32a7hxB0atuBrZjbpIeyrmhk63DcG6TdyjjSbqjtlIvJITO92zrRVR
         nrYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ut5FtSBbFGMnxnZC730yIEvmVN4nE+B3XawtWntHo46MYZuRIzkO0fFOVFMkHO172RVJmTadU53b8ppNIKTeQSQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw7sWC+y1fm9RvDkLwiaIMCAbVsxQ731tyGakzjstXNjwrd/B3x
	Q6d/F9bn0GeIrxSWaMYPBVkm+F3TQ5AGS2Ioeqw0PYppWUjZc3CRNqgfdgoNQdMfDL0=
X-Gm-Gg: Acq92OGM4gonb0RiqxOoJMPCxYbunuB/agjWlKLPixX17/0JDNUamfWw/Ac6+8ZRZoo
	dZPQ+vjv87MJJRisRo77WFIUZWhaZX6wLDPwqwT5ZbDZWRwdIb7/lFvbq0KM63AwCHoPPt6TOVf
	e4dNoJHdHHnHoaB7s1aoMSZfkJQ+lkPScO/+KOBO/I90zJybmNQ4vKIi3zhDaoRziIyUEcSDhnE
	sj2tkw77sI0qXj3pdfuweqe9FsPXFqQDOUQCOBf9hl8YcbdLAcQ8MnjG4C6Ll1FQV7Xn4jhWLVn
	tQDx4/gjiJ1M3iKVvRtgAezmgOvgBpqEkgtBd68QUWIjSJN2tGrhl+V/eWAX9YfX9UMX3gW5Ts5
	Bd9twpaRYF6jDqWt2zm4q29jxr6ytlahy54/FfpMeW1CMm8K9UovmAJEjS4XC265jyfOQ+C1V7O
	R/TjgjjnoQf4b4pgrIemzaoWk07BI2gkbM3ttmYzKMh2AJi6ad+bRNPCprqRgvZilzR/0VLNrC6
	Uxmaf1FsfNNd9zNIhPQap7mnkU=
X-Received: by 2002:a05:600c:4691:b0:490:b8c0:d471 with SMTP id 5b1f17b1804b1-490d722a310mr57609185e9.23.1781042798315;
        Tue, 09 Jun 2026 15:06:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:af64:92fa:d514:2768? ([2001:8b0:aba:5f3c:af64:92fa:d514:2768])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cbfe4sm525224975e9.7.2026.06.09.15.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:06:37 -0700 (PDT)
Message-ID: <2e0c4d0cfdb5137593f33a3cd5eca006e13ed796.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH] create-spdx-image-3.0: create image sbom
 recursively
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.marko@siemens.com, openembedded-core@lists.openembedded.org
Cc: jpewhacker@gmail.com
Date: Tue, 09 Jun 2026 23:06:37 +0100
In-Reply-To: <20260609114814.197318-1-peter.marko@siemens.com>
References: <20260609114814.197318-1-peter.marko@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 22:06:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238302

On Tue, 2026-06-09 at 13:48 +0200, Peter Marko via lists.openembedded.org w=
rote:
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Including image in another image is being done by depending on
> do_image_complete. This however does not include SPDX SBOM.
> We should not need second bitbake execution to create it.
>=20
> Recursively add do_create_image_sbom_spdx to do_build to resolve it.
>=20
> Use-case are e.g. fitimage or multiconfig containers.
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
> =C2=A0meta/classes-recipe/create-spdx-image-3.0.bbclass | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/cla=
sses-recipe/create-spdx-image-3.0.bbclass
> index 15a91e90e2..4d6a6424fe 100644
> --- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
> +++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
> @@ -78,6 +78,7 @@ do_create_image_sbom_spdx[stamp-extra-info] =3D "${MACH=
INE_ARCH}"
> =C2=A0do_create_image_sbom_spdx[cleandirs] =3D "${SPDXIMAGEDEPLOYDIR}"
> =C2=A0do_create_image_sbom_spdx[recrdeptask] +=3D "do_create_recipe_spdx =
do_create_spdx do_create_package_spdx"
> =C2=A0do_create_image_sbom_spdx[file-checksums] +=3D "${SPDX3_DEP_FILES}"
> +do_build[recrdeptask] +=3D "do_create_image_sbom_spdx"
> =C2=A0
> =C2=A0python do_create_image_sbom_spdx_setscene() {
> =C2=A0=C2=A0=C2=A0=C2=A0 sstate_setscene(d)

recrdeptask is a really large hammer to apply and putting that on
do_build will trigger all kinds of things which wouldn't otherwise
trigger. I think the dependency needs to be much more focused than
that...

(the dependencies it adds and the complexity of the task graph will
increase parse time as well as triggering executions we don't need)

Cheers,

Richard

