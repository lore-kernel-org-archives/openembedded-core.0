Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F3CDC48BF8
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 15:02:58 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.14846.1708614169993926243
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 07:02:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L4etg36L;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40fd72f7125so14133795e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 07:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1708614168; x=1709218968; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kqQuueL6EZ8iHnEfizD7cwZ36Qqk3/gL3GyDpAKXp/I=;
        b=L4etg36Lr3GMuzHrVi3PeKdeogwh0tiQAKmDvv77ivNC2Zb9BpNXQC0n/45YDnGWGM
         Dnl8XmniBCLTiNvEAiXjRD9o+PTxSR+cQiXj2AVh7Hf+QT/IOwddJCX6gBgyV+nG45pR
         umzso8mw8fJ+1yE3+Y8dMxbfyf+8sUfBX4/bQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708614168; x=1709218968;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kqQuueL6EZ8iHnEfizD7cwZ36Qqk3/gL3GyDpAKXp/I=;
        b=EiTifror6RvG0DEU8RLiab/J3zmDT3RzEmJKrrooM7VBusi8CGr1Ma2labcl6+n+eQ
         2WYW54tuV7dx7N2YstE9melStgdIXwBvqRebQu89vwlS4Tjg3TdRPnPstJdbYIOE3+Hc
         VIR5DKHnUhalIunszIENUzW1qLGiH66pqQ/O6m0lQTIDxmg/XdB2WAB9leFim2u676Sl
         Fj+73q/AyiZ06NCs/KhWyK0JMaPZRL3lAU4gAfdYoCjQum4rIBSOgnCbzchnSPXHd9wf
         qGaVnKJjp3x+bVePCW7zwxmOTRMfngRamQz2H+8CMk1psIRP9JU4TB1rLR5vtTKJkwi8
         x2+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXSTMA8KF+bHXlWKjmOMUHJyoSdukHx7X19N38qhOuKPrGkGa5EeyiJn9uSXRtaDG/F+asCntatpVRTbTqu6gmpcUND6sgh0U/B/NEl/AAn7psRt0+8vOtI
X-Gm-Message-State: AOJu0YwVoaIW83bFATdDQIRsxT7wZaFfqeOnw0BgVUSG+fZVEaOCVQuC
	+9m4gjsG0Q911o1B4HDDXdRm4M3/gxDS2dHvSTDck4c+p63ny2EVw41/ojqWKwk=
X-Google-Smtp-Source: AGHT+IF0/TZgl8oHlTO97bS+lsJKCwyuGNQEhxoa2EcU2Qkmc2AaFrm7Nzh2daCgKnRPFUJ9S0HH6g==
X-Received: by 2002:a05:600c:3148:b0:412:7585:bea7 with SMTP id h8-20020a05600c314800b004127585bea7mr3476949wmo.5.1708614168429;
        Thu, 22 Feb 2024 07:02:48 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8f5d:31cd:fc70:366c? ([2001:8b0:aba:5f3c:8f5d:31cd:fc70:366c])
        by smtp.gmail.com with ESMTPSA id 26-20020a05600c025a00b0041273fc463csm6276756wmj.17.2024.02.22.07.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 07:02:48 -0800 (PST)
Message-ID: <3d551ef80a4bbb3ec8c5ef1c26e8e6e16cf1dd98.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] useradd.bbclass: Fix order of
 postinst-useradd-*
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Eil=EDs?= 'pidge' =?ISO-8859-1?Q?N=ED_Fhlannag=E1in?=
	 <pidge@baylibre.com>, openembedded-core@lists.openembedded.org
Cc: Piotr =?UTF-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>
Date: Thu, 22 Feb 2024 15:02:47 +0000
In-Reply-To: <5eb199fe11d71f598726b75808b3330cd3efd2e5.1708613381.git.pidge@baylibre.com>
References: <cover.1708613381.git.pidge@baylibre.com>
	 <5eb199fe11d71f598726b75808b3330cd3efd2e5.1708613381.git.pidge@baylibre.com>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 15:02:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196034

On Thu, 2024-02-22 at 14:53 +0000, Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=
=A1in wrote:
> From: Piotr =C5=81obacz <p.lobacz@welotec.com>
>=20
> postinst-useradd-* haven't been running in order of dependency.
>=20
> This patch is reworked from Piotr =C5=81obacz's patch and fixes:
>=20
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15084
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13904
>=20
> It ensures that groups, users and groupmems are all run in the correct or=
der.

I think this needs a little bit more explanation in the commit message.
What is the issue, why do we need to solve it like this etc.

>=20
> Signed-off-by: Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@baylibr=
e.com>
> ---
> =C2=A0meta/classes-global/staging.bbclass |=C2=A0 7 +--
> =C2=A0meta/classes/useradd.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 72 ++++++++++++++++++-----------
> =C2=A02 files changed, 49 insertions(+), 30 deletions(-)
>=20
> diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/st=
aging.bbclass
> index ab3e1d71b5..6c21510377 100644
> --- a/meta/classes-global/staging.bbclass
> +++ b/meta/classes-global/staging.bbclass
> @@ -245,8 +245,9 @@ def staging_populate_sysroot_dir(targetsysroot, nativ=
esysroot, native, d):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 co=
ntinue
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 staging_processfixme(fixme, targetdir, targetsys=
root, nativesysroot, d)
> -=C2=A0=C2=A0=C2=A0 for p in postinsts:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.note("Running postinst {},=
 output:\n{}".format(p, subprocess.check_output(p, shell=3DTrue, stderr=3Ds=
ubprocess.STDOUT)))


> +=C2=A0=C2=A0=C2=A0 bb.warn(sorted(postinsts))

Come on, please! :)


> +=C2=A0=C2=A0=C2=A0 for p in sorted(postinsts):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.warn("Running postinst {},=
 output:\n{}".format(p, subprocess.check_output(p, shell=3DTrue, stderr=3Ds=
ubprocess.STDOUT)))
> =C2=A0
> =C2=A0#
> =C2=A0# Manifests here are complicated. The main sysroot area has the unp=
acked sstate
> @@ -629,7 +630,7 @@ python extend_recipe_sysroot() {
> =C2=A0=C2=A0=C2=A0=C2=A0 for f in fixme:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 staging_processfixme(fix=
me[f], f, recipesysroot, recipesysrootnative, d)
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 for p in postinsts:
> +=C2=A0=C2=A0=C2=A0 for p in sorted(postinsts):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.note("Running postins=
t {}, output:\n{}".format(p, subprocess.check_output(p, shell=3DTrue, stder=
r=3Dsubprocess.STDOUT)))
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 for dep in manifests:
> diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
> index a58f8287c9..924eeadf9c 100644
> --- a/meta/classes/useradd.bbclass
> +++ b/meta/classes/useradd.bbclass
> @@ -103,6 +103,18 @@ fi
> =C2=A0}
> =C2=A0
> =C2=A0useradd_sysroot () {
> +	user_group_groupmems_add_sysroot user
> +}
> +
> +groupadd_sysroot () {
> +	user_group_groupmems_add_sysroot group
> +}
> +
> +groupmemsadd_sysroot () {
> +	user_group_groupmems_add_sysroot groupmems
> +}
> +
> +user_group_groupmems_add_sysroot () {
> =C2=A0	# Pseudo may (do_prepare_recipe_sysroot) or may not (do_populate_s=
ysroot_setscene) be running=20
> =C2=A0	# at this point so we're explicit about the environment so pseudo =
can load if=20
> =C2=A0	# not already present.
> @@ -130,10 +142,19 @@ useradd_sysroot () {
> =C2=A0		exit 0
> =C2=A0	fi
> =C2=A0
> -	# Add groups and users defined for all recipe packages
> -	GROUPADD_PARAM=3D"${@get_all_cmd_params(d, 'groupadd')}"
> -	USERADD_PARAM=3D"${@get_all_cmd_params(d, 'useradd')}"
> -	GROUPMEMS_PARAM=3D"${@get_all_cmd_params(d, 'groupmems')}"
> +=C2=A0	# Add groups and users defined for all recipe packages
> +	if test "x$1" =3D "xgroup"; then
> +		GROUPADD_PARAM=3D"${@get_all_cmd_params(d, 'groupadd')}"
> +	fi
> +	if test "x$1" =3D "xuser"; then
> +		USERADD_PARAM=3D"${@get_all_cmd_params(d, 'useradd')}"
> +	fi
> +	if test "x$1" =3D "xgroupmems"; then
> +		GROUPMEMS_PARAM=3D"${@get_all_cmd_params(d, 'groupmems')}"
> +	fi
> +	if test "x$1" =3D "x"; then
> +		bbwarn "missing type of passwd db action"
> +=C2=A0=C2=A0=C2=A0 fi	=09

whitespace...



Cheers,

Richard

