Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D4BEC38147
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 13:39:34 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.15273.1674049163687212334
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 05:39:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P/YQ7Goe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id z5so32907154wrt.6
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 05:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3cGc2/zEy/UNVBe3KEXyZlnWnurhdxzMV2ceKcjJEN8=;
        b=P/YQ7GoeM+yE9NNV00bog7yWfEs1Hmz2LHwEyUrQAKlaopHpM8ipVJ5HcNK7RVV+kc
         K1IOAhLIMLAZLqmA2KATQi8cBv7mlViLhjPyFHvpJm8OR86uuyuYL8/vJB+Zplnr/28N
         UBmjWNzyj9sA1BWQRnWkRPizQWDt2gct5iVv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3cGc2/zEy/UNVBe3KEXyZlnWnurhdxzMV2ceKcjJEN8=;
        b=Bli9ufp/b+APhO/4afKSLxGJAplbexTCb8p6/aJxonMHSz2M9EAECyuZMfgOtmbFuM
         cA17kPtrFRhFKK+asY7cdEHGzswaI1PEhb6TunpLOJhOZ0hJRwVVtIEM6Tf3YheOAFgS
         Lwrs/MPnPVgM6r0fp18/r9WPmUoMX5/NzuRbt2KXI1rWwq98/z9iK8KufQW9+qexPkFQ
         5W0FzpMcN9JubItjf/4k6g8dLiSw2g985tFiHezYDba6YL75W5AjQ3nxumhAIRwMzp0A
         Lazeh+yUd8N0PwMUpvHWFf6hJij0Q3mDbuTt1/wWT/bA7HA4xAa6maHAESuMcaKSrMin
         Lymw==
X-Gm-Message-State: AFqh2kpI1+6IsQx+8FOns7T8KJfKOpPRZ+JpZ8hDWQZzm+ljExTAlfz/
	tRKqz3fNlzkrmDxflNTaKdD8DiuRIGzdCc1P
X-Google-Smtp-Source: AMrXdXsAkQTyN4tYlsvCdp/gBLfRzZbjSy8bPEReJTQIYpfilhwTOC9jfVFb2UaSUu+6VmWnO3V+eA==
X-Received: by 2002:a5d:4e51:0:b0:2bd:f5df:2696 with SMTP id r17-20020a5d4e51000000b002bdf5df2696mr5725062wrt.67.1674049162194;
        Wed, 18 Jan 2023 05:39:22 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:54cb:642:5dda:e3f7? ([2001:8b0:aba:5f3c:54cb:642:5dda:e3f7])
        by smtp.gmail.com with ESMTPSA id o7-20020a5d62c7000000b002bbeda3809csm25451316wrv.11.2023.01.18.05.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 05:39:21 -0800 (PST)
Message-ID: <6be59d113a7221ab1cf4b4c4999750fbc95a6519.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] rm_work: adjust dependency to make
 do_rm_work_all depend on do_rm_work
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Wed, 18 Jan 2023 13:39:21 +0000
In-Reply-To: <CANPvuR=3JzJuKkE0rLh2nBy18ud6+tbi4hmW_Zdo5gBTabANtA@mail.gmail.com>
References: <20221205045856.68662-1-Qi.Chen@windriver.com>
	 <1739E878132F7D7E.25137@lists.openembedded.org>
	 <CANPvuR=3JzJuKkE0rLh2nBy18ud6+tbi4hmW_Zdo5gBTabANtA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 13:39:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176095

On Wed, 2023-01-18 at 13:10 +0000, Jose Quaresma wrote:
> Hi Chen,
>=20
> Jose Quaresma via lists.openembedded.org
> <quaresma.jose=3Dgmail.com@lists.openembedded.org> escreveu no dia
> sexta, 13/01/2023 =C3=A0(s) 15:39:
> > Hi=C2=A0Chen,
> >=20
> > Just for your information,
> > This patch introduces a regression=C2=A0that breaks the do_create_spdx
> > tasks when building with multiconfig machines.
> >=20
> > I am investigating it more deeply and will come back with my
> > findings.
> >=20
>=20
>=20
> I don't=C2=A0understand the reason for this regression but I am thinking
> of sending a revert for this patch.
>=20
> Here are the steps=C2=A0to reproduce:
>=20
> git clone https://git.yoctoproject.org/git/poky
> cd poky
> git clone https://git.yoctoproject.org/git/meta-arm=20
> git clone https://git.yoctoproject.org/git/meta-ti=20
> source oe-init-build-env
> bitbake-layers add-layer ../meta-arm/meta-arm-toolchain
> bitbake-layers add-layer ../meta-arm/meta-arm
> bitbake-layers add-layer ../meta-ti/meta-ti-bsp
> bitbake-layers add-layer ../meta-ti/meta-ti-extras
> echo 'INHERIT +=3D "rm_work"' >>conf/local.conf
> echo 'INHERIT +=3D "create-spdx"' >>conf/local.conf
>=20
> MACHINE=3Dam64xx-evm bitbake core-image-minimal
> MACHINE=3Dam62xx-evm bitbake core-image-minimal
>=20
> At least these two machines are broken.
>=20

Do you have a pointer to the actual errors that result?

I'm not sure I would take a revert as I did carefully check this patch
and I think it does fix a number of problems.

Cheers,

Richard


