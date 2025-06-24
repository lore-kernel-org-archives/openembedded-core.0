Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46092C77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 06:54:46 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.2723.1750748076279070865
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jun 2025 23:54:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Yh/eMDK2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1C7B4432F;
	Tue, 24 Jun 2025 06:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750748074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=969m4FSudbljZZgSylgTO5IwhFnIdXU0jA6uFW4PKZQ=;
	b=Yh/eMDK2QSJpM7hzTEjzYI7IO5RqOFozq9TYo7ip90rmJ+QfM/OvjBGW5yC1gS9z46012h
	kPH349wVQ1kgn5cvbpegXVZIjpHhNFonD8shU4uO9YdbHMsdJZUrdB5c7TWpPyq5O4xJ9i
	iDIad+/IHT5wwDysKrVCD48o0S6i+EZQeOOrRKLbmbam65RgYhferpfHgBhy791pKkVVOx
	15HZcHNtvhE+k+lxl0iPnTu+rXIIR/gicqj0A2johPtDUgFF607ofAFnh/jpzAKE5PaKB9
	kTSARiN0kJcsE40te22UFzuoXQFa7OuNU9Z5Ve6PxOclb8rZyKtZMpq7oDGDzA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jun 2025 08:54:32 +0200
Message-Id: <DAUKE93SMD74.1LTP35J1VY8CP@bootlin.com>
To: "Jimmy Ho" <jimmy.ho@sifive.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nfsrootfs: disable warning message if bootargs root
 parameter have not been defined
Cc: "Alexander Kanavin" <alex.kanavin@gmail.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20250624001421.16384-1-jimmy.ho@sifive.com>
In-Reply-To: <20250624001421.16384-1-jimmy.ho@sifive.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduledvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffvufevhfhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehtdeuhfdugfegfeejueekieettdekveffudetueffledtvdeftdejhedugfelfeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepjhhimhhmhidrhhhosehsihhfihhvvgdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhop
 hgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopegrlhgvgidrkhgrnhgrvhhinhesghhmrghilhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 06:54:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219229

Hi,

On Tue Jun 24, 2025 at 2:14 AM CEST, Jimmy Ho wrote:
> we have case that don't define root in bootargs,
> if [ ${bootparam_root} !=3D "/dev/nfs" ] will output warning "/init.d/85-=
nfsrootfs: line 4: [: !=3D: unary operator expected"
> let variable expension result become string to solve this problem
>
> Signed-off-by: Jimmy Ho <jimmy.ho@sifive.com>
> Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

Please don't include Reviewed-by if the person has not explicitely given th=
eir
Reviewed-by in response to the previous version of the patch.

> ---
>  meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootf=
s b/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs
> index e67ee4c25d..30555aef55 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs
> @@ -1,7 +1,7 @@
>  #!/bin/sh
> =20
>  nfsrootfs_enabled() {
> -	if [ ${bootparam_root} !=3D "/dev/nfs" ] || [ -z ${bootparam_nfsroot} ]=
; then
> +	if [ "${bootparam_root}" !=3D "/dev/nfs" ] || [ -z ${bootparam_nfsroot}=
 ]; then
>  		return 1
>  	fi
>  	return 0

Please make sure to include vX (version number) in the patch subject when
sending a new version of the patch.

See https://docs.yoctoproject.org/contributor-guide/submit-changes.html.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


