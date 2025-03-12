Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C640C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 17:03:16 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.239.1741798987672549657
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 10:03:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=efpjfbGv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so7418875e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 10:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1741798986; x=1742403786; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hp+6okAxhCaQhr9sHUBA0utA0sDP7EIQcU6jamHmR+I=;
        b=efpjfbGvLAIdJ3IrjOlhOAS4fmBNAc/KsN92ijrNfX9AqdecBo4+uWUzdOLycY/TzV
         tknoTcM7Zt40ywIhXEFwYRIN17hJsac6kdI1OvLcH3Z663PwSa43x9bIxAcjtgabNoSn
         fPMKsNXQR8MD8GIA9AOk5EGF/e7BxVbfxkuGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741798986; x=1742403786;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hp+6okAxhCaQhr9sHUBA0utA0sDP7EIQcU6jamHmR+I=;
        b=r/VvnUBuC6TiGCz2YRetbCnhuu8b1s9GmPY9TsRNV7CedhAKjIARLOp9s+lIejNV9U
         V3XLfTeVqDoO+lUyVenF6pr0JKfOEgDsldWK5xWFQCpnu2E8v+Z30s5kV4LMLEteTnFx
         Wyv1nGZovUqmEv8J7461Eh9cPVAwDee3NWBUy2+i7WNOHbjU0ybgV+Vv27/3+i0msu3m
         xG5hgPpOthdbb5UTKY0AsTfo7u5L2ODqc488Ba3Pp0ERzNZ4P58fe/gqYS7vxra4240H
         dgDY0v0SDwxTCQYzc6QttIgd3THJsfXCw3zIz6c+80dthAC++iF+AhvlQfLYPsCkuG0S
         CPHw==
X-Forwarded-Encrypted: i=1; AJvYcCWnEdTAWMd2e3TlkJ2vmSR0de3qakC/hy57jezinpSka//SfSo2740aVh4TVn3EOzPnYj4WoVM0MD9JzKP7OxWcEw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz8hhsF0AFveJkXbPqVovd+U5wbDLDvgFIvJxL9R0dN/hJU853b
	5HB1LosWxU9KoKIqAMY5udQTMh0DPUhKzn6gDhN7tisepwPHheg0YjrsFPU0Lao=
X-Gm-Gg: ASbGnctVJQoV6FJVz78nrY2IlXEVRZMuGfrFjlvTkKJDljjrIf65n39NhQop9XgSKcA
	z0pBwlyw1H2DDhhuYTMNZftnG+dHcasxlbNaRB2ctDI90Qj+hvPHIz0gfi1+w0L85E7PfOYSpuw
	pTn0q+56g6tic0hD6vYQZdBBv77RAYzsmaDzUDqKeE1yW2QrwbSUDh+j1JUjiw0P93b/bNA1kAw
	UdV7kHMhvjpkKXz6ffhMS/QzkfavPwGiYG+ABrOaQvuQM+7LTJKLA63McWm/AzTuJlhYYJ6VJJx
	apXDBrvc+7GohPSVEjxIz1VYIfbd5EwdeUc1oYO6zR5RKm5Mw/SAR/LzOlIzvZyPXoNk45gyoUi
	tJIgSG8CCnI3jtljaB5Xg/0BnSGVrwFjHSg==
X-Google-Smtp-Source: AGHT+IGUBarll0DxKCfwiYpCNORru4sjEjJjrNrddqHKPPJfeNnTq8QHfGGh+yaEgBX19A0iNqwdjQ==
X-Received: by 2002:a7b:c7c6:0:b0:439:5d00:e78f with SMTP id 5b1f17b1804b1-43d161170c2mr3223215e9.11.1741798985820;
        Wed, 12 Mar 2025 10:03:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2e47:5514:f110:6855? ([2001:8b0:aba:5f3c:2e47:5514:f110:6855])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c11e9desm21255887f8f.101.2025.03.12.10.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 10:03:05 -0700 (PDT)
Message-ID: <a3091594eeb572a0ec11a356a6ddaeca0081b602.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH OE-Core 0/4] Upgrade kmod 33 -> 34.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kiernan@gmail.com, openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 12 Mar 2025 17:03:04 +0000
In-Reply-To: <20250312-upgrade-kmod-v1-0-4de94f131b64@gmail.com>
References: <20250312-upgrade-kmod-v1-0-4de94f131b64@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 17:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212659

On Wed, 2025-03-12 at 13:00 +0000, Alex Kiernan via lists.openembedded.org =
wrote:
> Bring scdoc in from meta-wayland to support generation of the manpages. C=
onvert
> to meson from autotools. Clean up usage of kmod in eudev.
>=20
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
> Alex Kiernan (4):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scdoc: Import from meta-wayland
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scdoc: Upgrade 1.11.2 -> 1.11.3
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kmod: Upgrade 33 -> 34.1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eudev: Drop --output=3D... from kmod call =
in init script

Throws lots of warnings, e.g.:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/builds/1175

Cheers,

Richard

