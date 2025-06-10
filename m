Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30991C61DB2
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 22:08:30 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.236.1749593304971587252
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 15:08:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SVhPwPN/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a51d552de4so3242914f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 15:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749593303; x=1750198103; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hGMxKrRLTMl0VkL262/W31MsgAYF98/HADulP1Ofwyg=;
        b=SVhPwPN/CAJk6ZPY8GugS81YuD/RHiu7QCaT7v6kjbdV7UaqQsl4EZJNALcgSoLtKT
         +vu0ev3z4xiWlX2h1UtvmcthJDHV7N+LT8dBdoMgD6F+2Qg5UB0Q48ZlGNP+BX+ITEtU
         4Beovp32LdctHehaKVmyoKiJn8cOORnQ0oCJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749593303; x=1750198103;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hGMxKrRLTMl0VkL262/W31MsgAYF98/HADulP1Ofwyg=;
        b=bAJFzCQLErl12hD0I4sP6eIOkxFn22Al8l4iPZmn0Xw9oIzCWUMMIhd87YvRu0BByn
         Xq1sxogXu6OQWviUNcPCLte/W0nGO4vdCO5R9psarwlAH6hok5zyXkjDFfwjqwlukRDS
         lQB91ae1b4J+rdIrJGrogIvWHOjVt5LFpiE5kuHY3VzngZ38JsJ5+UPVuyTnrezqDe5/
         S/OiAc562Zl5FarF9GCCc84p+GteBtOtpZ+RcQjgh3C6xrO+jl87imK+zGZdBc0GFkI0
         kUBqP3wjS9tw4x0SREU6ucZh3wQe5h117q1h4d5R/8onQKtd7nXBaCSVWehweMSBHMST
         nXsw==
X-Forwarded-Encrypted: i=1; AJvYcCXf0mJUc0otyN5dlECaH87REw5coNTDa3KcvJTPDeZV6SBTlqLhQ80/NpN3HSDg55ky4bGcY/DynYPsZHvYttkCfQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzlBtySImF5bktJBier7cTEimIa+2ndrABYcvGdRpYVvRFhwZIK
	IDraBBSRTXbVvAIg5EfBu8yA1nniWA57lkRkfVbcvS72Ly3hVwE1Gz9HtQk3BbWmyHzs2vnBZxI
	++j77frM=
X-Gm-Gg: ASbGncuR1zAA83b4escApvob3Shl/hV6YTU25cgFyQvibTQbKjv6+PxhA8G1sObTy3k
	F3I+xwpbsWnUeR33cW6Dp8owdrfXyXMWkzP3dTBpd8UiVMSfWSHD3TWr6LZNc69QBWY+Vso7UxI
	Jpeh9JlWCI+Yam055z8T06AMrCrBQkZdWwZnNkNmgsfTUm5ZwkUtA4eZUMu9gOeXYR76yvYihXm
	LRHFoIDxmZ0UsiUQCYThK7gTRP0GKGVaZTHffcQlla0HpuptWJJjKKSnoRZPUgz3Mq60S/aR5dr
	Y0cza2YOmb+99ZAdtBX5KsqKKT6JjtlHm3Uod/x+6pWuwNSeQUOL905IrJVYO++IUNJBDiqqnRd
	1IjDPz0Y7sryKDTkQy/0RX+SLDU1dXSWUqH2z/Z3kX+eN6u3lkNA=
X-Google-Smtp-Source: AGHT+IHCes8BANbVmRBCjash/nk9u/USBrHFRYB7ZFfC5dOoCpUtD/qyFQMuv2GnCw4Pqlb/MhMiug==
X-Received: by 2002:a5d:5271:0:b0:3a4:f90c:31e3 with SMTP id ffacd0b85a97d-3a558acbd57mr361919f8f.31.1749593303247;
        Tue, 10 Jun 2025 15:08:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a404:24a5:298c:75da? ([2001:8b0:aba:5f3c:a404:24a5:298c:75da])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532461798sm13109896f8f.87.2025.06.10.15.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 15:08:22 -0700 (PDT)
Message-ID: <d9eedf9bba828511961d3bdc65e630884d438387.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] toaster.bbclass: fix toaster error caused by
 tabs in BBLAYERS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: osose.itua@savoirfairelinux.com, openembedded-core@lists.openembedded.org
Cc: Anakin Childerhose <anakin.childerhose@savoirfairelinux.com>
Date: Tue, 10 Jun 2025 23:08:21 +0100
In-Reply-To: <20250610214206.3584227-1-osose.itua@savoirfairelinux.com>
References: <20250610214206.3584227-1-osose.itua@savoirfairelinux.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 22:08:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218440

On Tue, 2025-06-10 at 17:42 -0400, Osose Itua via lists.openembedded.org wr=
ote:
> Users may unknowingly put tabs in BBLAYERS instead of spaces, and this is
> interpreted as a literal "\t" at the start of the filepath which causes
> _get_layer_dict() function to fail at finding the filepath.
>=20
> Replace any tabs found with an empty string to resolve this.
>=20
> Min steps to reproduce:
> - Clone the poky repo:
> =C2=A0=C2=A0=C2=A0 git clone git://git.yoctoproject.org/poky
> =C2=A0=C2=A0=C2=A0 cd poky
> =C2=A0=C2=A0=C2=A0 source oe-init-build-env
> - Insert tabs in the BBLAYERS variable in bblayers.conf
> =C2=A0 - Note: tab needs to be in the recipe that is being built for the =
error to be observed
> =C2=A0 - Ex: `	/home/<user>/src/poky/meta-skeleton \`
> - Start toaster
> =C2=A0 source toaster start
> =C2=A0 bitbake hello
>=20
> Error message:
> FileNotFoundError: [Errno 2] No such file or directory: '\t/home/<user>/s=
rc/poky/meta-skeleton=E2=80=99
>=20
> Fix by removing tabs and replacing them with empty strings.
>=20
> Suggested-by: Anakin Childerhose <anakin.childerhose@savoirfairelinux.com=
>
> Signed-off-by: Osose Itua <osose.itua@savoirfairelinux.com>
> ---
> =C2=A0meta/classes/toaster.bbclass | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
> index 03c4f3a930..fab22fd0b9 100644
> --- a/meta/classes/toaster.bbclass
> +++ b/meta/classes/toaster.bbclass
> @@ -80,7 +80,7 @@ python toaster_layerinfo_dumpdata() {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return layer_info
> =C2=A0
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 bblayers =3D e.data.getVar("BBLAYERS")
> +=C2=A0=C2=A0=C2=A0 bblayers =3D e.data.getVar("BBLAYERS").replace("\t", =
"")
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 llayerinfo =3D {}
> =C2=A0

I suspect you should replace with " " just in case they've used it as a
delimiter. Looking at the class, why is the code using split(" ")
instead of split() which would probably handle this more nicely?

Cheers,

Richard

