Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A11E4C25B76
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 17:27:48 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.22126.1717608459004754042
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jun 2024 10:27:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E4aa+0mA;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-24cbb884377so23203fac.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 10:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717608458; x=1718213258; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=It99+AYznLpGLVp5juQc/HX6WqzmVFvIWLESIaQVgs4=;
        b=E4aa+0mArlCc3gVYLmpPkl3CDqg0Ls5U3TsyjwtrRG/aIuP/ZRDOVG/dt21Y2/dbey
         XY9BrjbgKgZxtHBlI40kgSQDUUWTPkCETMbN0z434l/b3GwagA8Zo+hK/18UySu5KZma
         OCuhuZd53Yn0684Q5v/dMmQQnpsB1vsni335DCykBEuzca+7YvAw6zJ+zoT1q2Mjzf5E
         0jBb/rLoSgonXy9yRk++2tj4oRynp+SBqAuUegs8+fKiQoBw3CV3E7evt3jUlfJQ6P3n
         R67ZTqlWZp1smsKkzegfpqCdLwdAJ/d6MjuKz8GGxSeRkmXawfApO2ASlveVgSFe2YdM
         +yWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717608458; x=1718213258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=It99+AYznLpGLVp5juQc/HX6WqzmVFvIWLESIaQVgs4=;
        b=MepuAGKHXsJUqNOoMFS2WDiQED7yttE2P4CYXPskpWsEi72yPq/bNkYcUNepTl8QpH
         AKC4sGQsRybe19yMopwF/DYONtjin8zKhYuu+hRWuzguu0gQrzUOsnR/LQq+aoog44h8
         3bWNpoI452fpz8hoL0QG5DGXPvlwLyE8STMwLcc/NHqFy8PhvFtHod6rLLd1mobPfPgL
         SHNk3/5QLdAigVppLVM07qqJg7pAA4S6YMESD+R/gnpwntD7zgianPz6rn1ntMeA3Nc/
         VVbjmgmfsVgWUQJ0qz5Wl4QiCMj6QJwxUwFl/r015QEw4jSRX/n8RfkbOOFpiLYQ/pkc
         bjQA==
X-Gm-Message-State: AOJu0YyvRQj4D1jDSSA/t3C3phCudY7KxQfEh+TeoCy+PQyBXXXuFY7F
	9gi2jWac4NdnfZnOpIIyhpuL4aZ67hyw/Zouk/8cG9uFePnyJI/yHL+/iHbpMaQjocDv6/SM0XV
	agRb1h8ZA9RiDXe07NLGUXGGYHbJ/Xd6h
X-Google-Smtp-Source: AGHT+IE4jTg9uHeZMoO2tuzv7tjINuha9JOfrQGMJ0g74E8B81BYDuRU2UUPAGDhrGsZuymHd8j5FHSYqEhq6wAlcJ8=
X-Received: by 2002:a05:6870:64a2:b0:250:68e5:9b65 with SMTP id
 586e51a60fabf-25122084291mr3464287fac.48.1717608457914; Wed, 05 Jun 2024
 10:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240605072629.115812-1-jonas.gorski@bisdn.de>
In-Reply-To: <20240605072629.115812-1-jonas.gorski@bisdn.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Jun 2024 10:27:11 -0700
Message-ID: <CAMKF1spF33TbaHgh0g=oXz5d-a_mxn6zaXO+zL=6bTBEXGXJUg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linuxloader: add -armhf on arm only for
 TARGET_FPU 'hard'
To: jonas.gorski@bisdn.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 17:27:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200377

On Wed, Jun 5, 2024 at 2:52=E2=80=AFAM Jonas Gorski via lists.openembedded.=
org
<jonas.gorski=3Dbisdn.de@lists.openembedded.org> wrote:
>
> There are two types of soft FPU options for arm, soft and softfp, and if
> using the latter the wrong dynamic loader will be used.
>
> E.g. go will link against ld-linux-armhf.so.3, but libc6 will only ship
> a ld-linux.so.3, so go programs will fail to start.
>
> Fix this by instead checking for TARGET_FPU being 'hard' and then
> applying the suffix.
>
> Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
> ---
>
> I stumbled upon this on kirkstone after the Go linker changes were
> backported to 4.0.19. Suddenly docker wasn't working anymore, being
> linked against a non-existing ld-linux.
>
> This is only tested on kirkstone since we are still on kirkstone and
> going to master (or garthgap) is non-trivial (though planned).
>
>  meta/classes-recipe/linuxloader.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/linuxloader.bbclass b/meta/classes-recip=
e/linuxloader.bbclass
> index 2ea1b62254c9..a2e8f9837bd4 100644
> --- a/meta/classes-recipe/linuxloader.bbclass
> +++ b/meta/classes-recipe/linuxloader.bbclass
> @@ -57,7 +57,7 @@ def get_glibc_loader(d):
>      elif re.search("i.86", targetarch):
>          dynamic_loader =3D "${base_libdir}/ld-linux.so.2"
>      elif targetarch =3D=3D "arm":
> -        dynamic_loader =3D "${base_libdir}/ld-linux${@['-armhf', ''][d.g=
etVar('TARGET_FPU') =3D=3D 'soft']}.so.3"
> +        dynamic_loader =3D "${base_libdir}/ld-linux${@['', '-armhf'][d.g=
etVar('TARGET_FPU') =3D=3D 'hard']}.so.3"

looks fine.


>      elif targetarch.startswith("aarch64"):
>          dynamic_loader =3D "${base_libdir}/ld-linux-aarch64${ARMPKGSFX_E=
NDIAN_64}.so.1"
>      elif targetarch.startswith("riscv64"):
> --
> 2.45.1
>
>
> --
> BISDN GmbH
> K=C3=B6rnerstra=C3=9Fe 7-10
> 10785 Berlin
> Germany
>
>
> Phone:
> +49-30-6108-1-6100
>
>
> Managing Directors:
> Dr.-Ing. Hagen Woesner, Andreas
> K=C3=B6psel
>
>
> Commercial register:
> Amtsgericht Berlin-Charlottenburg HRB 141569
> B
> VAT ID No: DE283257294
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200359): https://lists.openembedded.org/g/openembedde=
d-core/message/200359
> Mute This Topic: https://lists.openembedded.org/mt/106500218/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

