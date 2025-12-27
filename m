Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C612E92714
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 15:09:39 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8909.1766848171843441355
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Dec 2025 07:09:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j9Q/Nw4p;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34ab8e0df53so7691200a91.3
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 07:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766848171; x=1767452971; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3sQ4rotqGGeUJJG+L02F0Ucyd0jBaFiB/G1tA4PsvCM=;
        b=j9Q/Nw4pZ5kgZ2Cei0na+8g0an/9fbuiOWTH83UAShW7jCj4d3d3d91gVGBkB2Ikvs
         4X4xJhLRxDix2ghuWyq3X0mDYHWXYQhr0Ve7MDC8UK/Ye9NIbyWgxuPhnzbcOysM16Q8
         QH/efuKkGy1Gtdz+0uSFFwOTXFl3ZxdsQjWzf9j0kZYjMkpyS9dXWHY5kapM/FvmPQEa
         2/y4jC6thUZpgqZLLDywQygadLAmcdg0mMTg4FVPphNpLGZ9Er/sgVd5r2zuERYT7Mg4
         nFufMxDMvk/+duqZO54RYgrj3SVwo5GNOFPOQ+5wwEgUgW/2TbYjSJcgGVtojzis8xuz
         MmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766848171; x=1767452971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3sQ4rotqGGeUJJG+L02F0Ucyd0jBaFiB/G1tA4PsvCM=;
        b=hztbPtKAGjATKhQnB8x3u4VuobDhuGZfARW8QXLFaMakQtvppqSv1hGzWgwxGuvoY2
         76d23d1bJAGEzQbMmUuYqpWWtdkdjOgC9dsUYWm5F/kbXyynsW4qsa9XEsufIM+OLO6F
         Lid7c9u7h1VONPO7oLGQI8dHIEJxi2ZOo1i2MI6yVFDiNzQkGz90S+3qbH6UkfRbu0cV
         DN/gJhXyDJm8b9TREc6Kt1cu4qVrCLkylgVa+5IBdmJsHYGzxG8b1pQQY0/gaU/jBHez
         vPlK7aoxcav0PKk/Qr6gBWQ4WXQ6PFVY4rLiTxCXPlF04hp8s1GdW9RIPfqXJey0Yx/e
         whFA==
X-Gm-Message-State: AOJu0YyAy9R8VWkJKImumck51jwsIvQj0iYVfhqzXG3hFtP/GqZjz2bn
	mYAyDBTg1he9gwos/rH+2KUbB7AtNiwtjex1xGKyoNB9BnwxvHvzdPI8rzejqLKuEPmUojYZj25
	bcRaJaNIjz90D0GqhiSldr6h1hOfc9PI=
X-Gm-Gg: AY/fxX4oGq5NVefi14+MI321dOQDy2Gh/ELRKVOyUxLm/cUOKhv54gf7YTfLSZbR18O
	lZsWmlknpM3OYKsClrsojewfipr89Wlxv5dPh81Fm3wBGflM0yvEGSsfv9ITKrajyb3fv3SEIXD
	ePt3E6L9kiHqn5t52iZG8/CO/Pl9+cGsTLDKv8ypIScdImzh6qjv8OcHZ+6RrsGYBq3sQvaPp3r
	0buw1Z3Yb+q4Acdf3m03SUGe+pY1kKMDJ/eGgPSb4ZzcSbyoUJURw0fCEc+yq3CvgOuTg==
X-Google-Smtp-Source: AGHT+IGLAyJXsOlWiLE3y+ny35+QuXkLlSvJpP0wri25bnS6A7rzu4CY+kPzd/n2c8RYNLrks4DmfBkVSt506Eskag4=
X-Received: by 2002:a17:90b:3c4a:b0:34c:f92a:ad05 with SMTP id
 98e67ed59e1d1-34e92143c8bmr24025782a91.11.1766848171187; Sat, 27 Dec 2025
 07:09:31 -0800 (PST)
MIME-Version: 1.0
References: <20251227113251.773795-1-Harish.Sadineni@windriver.com> <20251227113251.773795-11-Harish.Sadineni@windriver.com>
In-Reply-To: <20251227113251.773795-11-Harish.Sadineni@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 27 Dec 2025 10:09:19 -0500
X-Gm-Features: AQt7F2q5HeSyo8a0-dFKLMCIBzjKzxmPeXTaeWPaFP1oG3zdovOk3yF2bFuNMKg
Message-ID: <CADkTA4MO1Xxi_p+w6jV5ZCiVCG+QrK9o2KHucBK5TZruf1BjWQ@mail.gmail.com>
Subject: Re: [PATCH 10/16] kernel-devsrc: copying rust-kernel source to $kerneldir/build
To: Harish.Sadineni@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Sundeep.Kokkonda@windriver.com, yoann.congal@smile.fr, 
	elmehdi.younes@smile.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 15:09:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228575

On Sat, Dec 27, 2025 at 7:33=E2=80=AFAM <Harish.Sadineni@windriver.com> wro=
te:
>
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> In sdk while running: 'make prepare' in kernel-source directory after ena=
bling rust config,
> it will throw errors since only makefile is present in rust kernel source=
s.

Can you show exactly how much of the infrastructure is needed for
make prepare to succeed ? We've gone through a lot of effort over
the years to not copy whole directories, many which have plenty
of source code just like the rust directories do.

If we can just copy the Makefiles and Kbuild files + a few elements
that are needed for regeneration, that is ideal.

Bruce

>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-ke=
rnel/linux/kernel-devsrc.bb
> index 23a9093ede..1505a1d70c 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -139,6 +139,10 @@ do_install() {
>          cd ${S}
>
>          cp -a scripts $kerneldir/build
> +
> +        if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true'=
, 'false', d)}; then
> +            cp -a rust ${kerneldir}/build
> +        fi
>
>          # for v6.1+ (otherwise we are missing multiple default targets)
>          cp -a --parents Kbuild $kerneldir/build 2>/dev/null || :
> --
> 2.49.0
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

