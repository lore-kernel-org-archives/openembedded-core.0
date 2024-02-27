Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF40C54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 17:36:27 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.417.1709055381972426122
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 09:36:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R25qD9Gf;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1dc98892850so25435905ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 09:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709055381; x=1709660181; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KpI/TlZP2gk15m9wmLkWoyOse7501Be/67Oxt+T0Yf0=;
        b=R25qD9GfjPMj+Vx/pePw6zx/g/rouZSWPttFb6c8XTLbSBpkSL8TodO6iA6VmgJj7z
         BAKgZBReD4722aj7OQ7+TAkIDZzH/WfqoiSEbc1f5I53QJUimuyIRPqEy3Q+XfY59Jzo
         l0wRjnEOdJVh6ZqQ5WazP+0/xI7d1+RVgVX9+0VBk2X9xApqCtPfSHGctxU12DCTmgZq
         D0Nf7z2TYzEPhaxyVRv43oJp2xhjwQIXjyw/x7h6IU67WwGhQh+xkTwc6cz8legKuo1r
         Iz7zsMbAtoNI4H4jBYZ//k3M+itPplEksDy2Ouaxq0SuWKsAXjlB4j3inLDA8fTO3plu
         TurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709055381; x=1709660181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KpI/TlZP2gk15m9wmLkWoyOse7501Be/67Oxt+T0Yf0=;
        b=mZyYeN8EbJHtFL/GH/FWcET6IOTxihYVOcVTCjUmq8QmMa1U/9ITxqbZgU5Hba2FZW
         KFM8kldAzkDonz07fOhjn5S+GxKZAJvfxVL2HjdLC9q+X+GTagcR1YChMA6EHwKkwNh/
         +xlikulf89ij3zglS9SYNVVKvsfAryOczpuhWOpAgAAfu1TvLjX+1vGH0NZ2u3VJACJc
         Y5fZUhJSSm3Ld+BL2+UiJ5hp70Tlk43Djnr7BRmUi3gYTVEuU4RfmmbrTacjZFmH/82M
         KeHJPumLDcqklSHD1pLIOU8UTorUsCU6xhCZxkSvhQwki9sn4LdFJ1wJfrL15Va9aZ12
         fKjg==
X-Gm-Message-State: AOJu0YzayZBdAzovnSNsBmFIVtyG3JBdRl/JhcOFHOlXR5H5TbB7Gpqd
	m0eSr9ZiIzmErFiDAih5SiLHsEbU0tDvh75iGCOAKeVCEkpsSx/q2Hb5gSNpn4xTP7jhlBvlzwQ
	hA8XZviUpj7P1QTIM5WW4GTsRvWg=
X-Google-Smtp-Source: AGHT+IHWRr3hGMMv333Y4XU9hYqqJ8FPY1/kdAT5wgicZQQKqDIAlz8TcaskXdKR3aoMAP/UtQglmEtFrfeKBxSx8GU=
X-Received: by 2002:a17:902:9a48:b0:1dc:71b6:5727 with SMTP id
 x8-20020a1709029a4800b001dc71b65727mr9552444plv.50.1709055381295; Tue, 27 Feb
 2024 09:36:21 -0800 (PST)
MIME-Version: 1.0
References: <20240227170902.3718203-1-ejo@pengutronix.de> <20240227170902.3718203-2-ejo@pengutronix.de>
In-Reply-To: <20240227170902.3718203-2-ejo@pengutronix.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 27 Feb 2024 12:36:09 -0500
Message-ID: <CADkTA4PY4HXpcu4K7YkuqLSuLor=tKfTz04fEORKBRycgE12Fw@mail.gmail.com>
Subject: Re: [PATCH 2/3] kernel-yocto.bblass: run kernel_version_sanity_check
 after do_patch
To: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 17:36:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196282

On Tue, Feb 27, 2024 at 12:09=E2=80=AFPM Enrico J=C3=B6rns <ejo@pengutronix=
.de> wrote:
>
> The kernel patches may modify the kernel version, thus wait for do_patch
> before running the version check.

While that may be true for kernel's in general, I sincerely hope that no on=
e is
patching in a new kernel version to linux-yocto.

I don't have any great concerns with the patch, I just don't think it
is necessary :)

Bruce

>
> Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> ---
>  meta/classes-recipe/kernel-yocto.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-reci=
pe/kernel-yocto.bbclass
> index 108b7e6752..854e4681d5 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -729,6 +729,6 @@ python () {
>  }
>
>  # extra tasks
> -addtask kernel_version_sanity_check after do_kernel_metadata do_kernel_c=
heckout before do_compile
> +addtask kernel_version_sanity_check after do_patch before do_compile
>  addtask validate_branches before do_patch after do_kernel_checkout
>  addtask kernel_configcheck after do_configure before do_compile
> --
> 2.39.2
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

