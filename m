Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93820CD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 07:47:06 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15107.1781077619410281391
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 00:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VWpIusa/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45ef82204c6so3499821f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 00:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781077618; x=1781682418; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mebp3AGHCmm7ejeH04izFwi/eRXiQRRXIr3iUMYySJ8=;
        b=VWpIusa/IFZbWnI3zOL1j7S26R+uUD8uchME0xNFji0PuETW6xiFEM7FpMgT9LwT0L
         0cnFh4ecokMRhJMpqMyziZJ6p431J38M9f3r6IWlmhS1BBNPiWb4pe4J17u1kH/j25GP
         GskLrVnFvwvhiat0S0FPxlNYpp1Zv6PmdS0s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781077618; x=1781682418;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mebp3AGHCmm7ejeH04izFwi/eRXiQRRXIr3iUMYySJ8=;
        b=mAiYJr4aZvUAVrtW4RtQqzHszkBM41C0oANFR6BUJBrgjDMEltIE7AvhbPgzjazw0U
         fZvl3zsEu8qa41a0gQvfuEaalE+b09V2p6y5rFcUENaro6rhsxW5AJ7aaKwVL0z85q1A
         IrU/43jrsatvHtjS90JQcT9JlHdmGnsDxHQA+8YT1sOEBZXeunHi0dH2/OP7wPV6BbnW
         OZPC4/oM3CFuRByWQLDK76qHn4nAN3SHS8BzkA3411dFaxrzlxULf1a5cylbrCAsPxM1
         4R4EpdmSNjea3KfsD4JJTx+RzC8uB1M/IsK7zhRtWkEwIMiIDqfAf+Y7hnFvfA7mFow2
         CRhQ==
X-Forwarded-Encrypted: i=1; AFNElJ+vw/jNN+bVz68FzUqiwBgS9/oAAT8p1MGdW6EpOlfNXISHT+9dVnez5SWG1AvKZZNyI/vtPWAutDKN9bYo/fG0aw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx55X7MivxRzeMaTGav+zhAOklcQDwIDHtYeQqkcUr0TCdpMcqk
	q9TTWn9ZAIOrW/tUGEfFKskBDR2I+QijM0TNQdov6cDEF2FC92KfLT03ffkmROfgOh0=
X-Gm-Gg: Acq92OEEEdo1ag3/pQWHyPKdIWk6f9VGiR4lCUzf0Iqnif+1CyrwHgnWaUENG5gEokg
	xrBc06oMmZMXMCXq58z8ZW6fymc+0yW/pr4hWyWSYV1tQkItvhitF6n8gFzLPYz5sZsIor0Kcto
	GwomeosA92AohN4F1KWJBO7JDke5PrzKcb1sP546/KCPPya7pUO6DdmMZPfV01bPI3JsvIxHcEy
	5uO8rgpeIxPdxdRfdwia+UvK7Ca8pzdEUzpb4nsgnBhLDMff5ogxBRwfE8fmlJ7Y6itvbyhvqOG
	dkWF4TqhA9K+RWAzGC4iQ3XfHhmfQgBNv7yXmK74LU5AcFdT97k/xAv92nU3sSr4Dn+29yznPRv
	e8V0zad/gBsG1pJlgJLob2XNLIo2oMPDa9Ui6+Mg5d37EAWP84ehTt/xcP/dzTO6nSc/ljGcuHR
	C1K6wR+Amh/F+tkDPZuzmmgRym9jXsqf+x4PVtVnl00IrcLUeAcXCSli/5Lg0fepgz7x+rRsO2/
	Wg3TAOutV0UpF02LUHNb1NA
X-Received: by 2002:a05:6000:54f:b0:45e:8547:f21e with SMTP id ffacd0b85a97d-4603063c06amr30086548f8f.36.1781077617637;
        Wed, 10 Jun 2026 00:46:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e996:5a7:2609:813f? ([2001:8b0:aba:5f3c:e996:5a7:2609:813f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351d69sm123868593f8f.29.2026.06.10.00.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 00:46:56 -0700 (PDT)
Message-ID: <3d17864514e57fcf5a5009219b87bfb830157e92.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 4/5] Add SPDX deploy tasks
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: JPEWhacker@gmail.com, openembedded-core@lists.openembedded.org
Date: Wed, 10 Jun 2026 08:46:56 +0100
In-Reply-To: <20260609222331.1293007-5-JPEWhacker@gmail.com>
References: <20260609222331.1293007-1-JPEWhacker@gmail.com>
	 <20260609222331.1293007-5-JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 07:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238318

On Tue, 2026-06-09 at 16:15 -0600, Joshua Watt via lists.openembedded.org w=
rote:
> Adds SPDX deploy tasks to many recipes to record their output when
> consumed in an SBoM
>=20
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
> =C2=A0meta/classes-recipe/barebox.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 ++-
> =C2=A0meta/classes-recipe/devicetree.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 ++-
> =C2=A0meta/classes-recipe/kernel-fit-image.bbclass=C2=A0=C2=A0=C2=A0 | 3 =
++-
> =C2=A0meta/classes-recipe/kernel.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 ++-
> =C2=A0meta/recipes-bsp/grub/grub-efi_2.14.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 ++-
> =C2=A0meta/recipes-bsp/opensbi/opensbi_1.8.1.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 3 ++-
> =C2=A0meta/recipes-bsp/u-boot/u-boot.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 ++-
> =C2=A0meta/recipes-core/systemd/systemd-boot_259.5.bb | 4 ++--
> =C2=A08 files changed, 16 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta/classes-recipe/barebox.bbclass b/meta/classes-recipe/ba=
rebox.bbclass
> index 73615999aa..0be611cf65 100644
> --- a/meta/classes-recipe/barebox.bbclass
> +++ b/meta/classes-recipe/barebox.bbclass
> @@ -157,6 +157,7 @@ barebox_do_deploy () {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 done
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> =C2=A0}
> -addtask deploy after do_compile
> +addtask deploy after do_compile do_create_spdx
> +SPDX_DEPLOY_TASKS +=3D "do_deploy"
> =C2=A0
> =C2=A0EXPORT_FUNCTIONS do_configure do_compile do_install do_deploy
> diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-recipe=
/devicetree.bbclass
> index ce9d008aac..a313507251 100644
> --- a/meta/classes-recipe/devicetree.bbclass
> +++ b/meta/classes-recipe/devicetree.bbclass
> @@ -163,7 +163,8 @@ devicetree_do_deploy() {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -Dm 0644 "${B}/$=
dtb_file" "${DEPLOYDIR}/devicetree/$dtb_file"
> =C2=A0=C2=A0=C2=A0=C2=A0 done
> =C2=A0}
> -addtask deploy before do_build after do_install
> +addtask deploy before do_build after do_install do_create_spdx
> +SPDX_DEPLOY_TASKS +=3D "do_deploy"
> =C2=A0
> =C2=A0EXPORT_FUNCTIONS do_compile do_install do_deploy
> =C2=A0

Adding this "after do_create_spdx" makes spdx mandatory and impossible
to disable which I'm not sure is what you intended?

Cheers,

Richard

