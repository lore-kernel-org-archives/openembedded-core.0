Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B2DCD8CAD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 22:25:01 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7700.1781043893762614034
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 15:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IPJvKqAj;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7e8ec43e5f9so80087297b3.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 15:24:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781043893; cv=none;
        d=google.com; s=arc-20240605;
        b=ZlvroH42uthScJ1sYcNMdwboODsatM6fGH9dEYTvO1iIAS03pH6vl3GVXjfE3a227c
         djDykoLH022775rOJa/q8Ajzu3sNJH1Qbm4eKF1+A8k2XkSHXv/5IFcImoSGZJ+KI+7y
         cqjcGuwphvsvMi66DoadGwDdw9/RhBYOH3kOZnNqUxggknvGRdiK3hlTGxJks5hrlmW8
         FZYN99m6zEzY4i7aU+pNCevYnRDXsDg/xL8wZlYyRfoVqFNKXT5fsx1TJDK79r3BEuoC
         zlXvT1QdYjqjwvuPTod3TOKA01mMZnfyNYuA1f/IPY6r7Ykf+R3Per3o2QDF6W9jLOTt
         SL6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EquKONwrfRzg43CNLqjCUlt8uQ+okLx0Kc59lYlnHWQ=;
        fh=bvu0q7pl0n0Ft+urB0HD+vyt6ZoVMOg4TFuH+r0+TfY=;
        b=D2Uz7xvv2SR6Eac/y7y9mAn1ZY+SU2MTRS+C/NxvpxNYEm7siVRQ2+MXfMENxZBa9Z
         Kz5Sjr31Ksi8oDVrT2zektqZr/00eXagdoOW5jy5nuQO972gD8DAMnsn0Io4GdBI2LSd
         cOXDvUqpXTQyfQYbqjkQrq1nWaSx1jhuQXzJvxtm/0+qcRvRZyrV15BF9/Jbu0WlMPzw
         09UsxbMUY8aJEriwtsqRye3aQuogRl0a8DPnRcbabXHkq9WSuqhLeS+ruwLzzvLAS6Ar
         aIndFogBKgxSUUsT3lMH96fiU1aJhMgTD6uWoDHUjCLZooOEO22JaQ/tmb4lYdseZGSu
         e3jg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781043893; x=1781648693; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EquKONwrfRzg43CNLqjCUlt8uQ+okLx0Kc59lYlnHWQ=;
        b=IPJvKqAjelXMHJlsvnRd1cbTPW2JaXOpaewoJfJuEMOpgflJsrZI/bXmmmOoH1BDaQ
         3/wK1XVluLOWdlRiTIsBoeMCCvOUuT17SrBgAZQw5yCnqM0RT3ULkBImqHxLXifyYyhJ
         W4SJoH/bLRv9Z6f/wQMS9XSbkWqK15hN0+DL2bjSEp64HGqA2H4W6wTupnEAmfdJKF66
         UzIufelM5k5YVV19h8VrWSIyhNtgHMP8YOqID04lJoPMqNXZJ0HRAMAPMpHSJMkDAvHm
         t6DDTh3o9NN2C6per/5FiwvyodAZjdgab8T0lr0oTFJXOS54teEAXyLgETW7/IXgHn7G
         Uenw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043893; x=1781648693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EquKONwrfRzg43CNLqjCUlt8uQ+okLx0Kc59lYlnHWQ=;
        b=mkeLk3z7pc5vlc0/qZjNkVYslV71+x7CKUiUcb1dz626upbcHNYqG+9VUXfuTb18m6
         fqc6BcWp2aB8Cod5FlWN5hE7wA5JHxSjiWEb5H6D0cedclPMOKoLk70l0hID42mphLYn
         DSuSY62y5quQi1rOZgCkt8KB/q4N/vRN2gi/qc+IPKU9azXET4dEsvd4wItnq4Djm4NJ
         RM5XERK0TdZOLVyt6Bd/oTsPuETdtMYq/Qk07Ly2b1OiofrLi/qKhhTzT1t00uYnVhw7
         WwOUjj2FWs2/aSCOHR4F4RTtTl/8ZoC0PJRtOGuAaFpiG4ie+lUITsi0Dw5QTRkD4ZcG
         +Jjw==
X-Gm-Message-State: AOJu0Yzg4lpQLFdf8MkodZVoAbKq3TvKaukYmdTsrrHdv59A9GMcfQK0
	cY+D2aBsTxQo7TIRadVBS69CfCCUoiKEGaTBxr1iJhiheecnLTYOB6L1GYJbC+PEIzJ4MuyKqLo
	lbMQyIfrmiO/easUuRZ+yvZzaVMBOmJUxgA==
X-Gm-Gg: Acq92OH0+/eAAmNDPya4H+II/CMMDkgiOlimZ9aSyoG9SWa7oQByjrkcBKccqK+Rj5F
	3+Um79PIUr4RvNIpz0Fmx38WEX7r5cwrKGF1r45s05X/4w42LyAw1WNktKZrpHk1TMDSxXcbLD+
	sGZEiWnPd3bGmXG9B5ONRayVS76ktsCkpwni0VlaVwCvYModBtU2M+Djtxx+JVZtwiardDZ7I7l
	ZZN4kmyFQ7IlShNcUFOOw9wtCY/eUavAGmPSdEtczT27TPZot6rr1gw9ngJykvch4kApIAnXHg4
	q+/Tp3d1rkPB9KjrxayhhM5XTnWmzxM=
X-Received: by 2002:a05:690c:4b81:b0:7d0:1583:4cb7 with SMTP id
 00721157ae682-7ed0b871af5mr212389877b3.15.1781043892774; Tue, 09 Jun 2026
 15:24:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260609114814.197318-1-peter.marko@siemens.com>
In-Reply-To: <20260609114814.197318-1-peter.marko@siemens.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 9 Jun 2026 16:24:41 -0600
X-Gm-Features: AVVi8CeXQe2klNxSqsWzo-iUaVs-ZQyh7dO8Ca8_6TZREGkzteAAxBGINjp3Lr0
Message-ID: <CAJdd5GYi75YE9sqHY4ZO7FjPFApC1tv9zdjQLzryf2jQj9Hxrw@mail.gmail.com>
Subject: Re: [RFC PATCH] create-spdx-image-3.0: create image sbom recursively
To: Peter Marko <peter.marko@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 22:25:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238309

I believe this is unnecessary now with the patch set I just published
that allows SPDX documents to be aggregated across "deploy" tasks
(e.g. do_deploy, do_image_complete).

On Tue, Jun 9, 2026 at 5:48=E2=80=AFAM Peter Marko <peter.marko@siemens.com=
> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> Including image in another image is being done by depending on
> do_image_complete. This however does not include SPDX SBOM.
> We should not need second bitbake execution to create it.
>
> Recursively add do_create_image_sbom_spdx to do_build to resolve it.
>
> Use-case are e.g. fitimage or multiconfig containers.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/classes-recipe/create-spdx-image-3.0.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/cla=
sses-recipe/create-spdx-image-3.0.bbclass
> index 15a91e90e2..4d6a6424fe 100644
> --- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
> +++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
> @@ -78,6 +78,7 @@ do_create_image_sbom_spdx[stamp-extra-info] =3D "${MACH=
INE_ARCH}"
>  do_create_image_sbom_spdx[cleandirs] =3D "${SPDXIMAGEDEPLOYDIR}"
>  do_create_image_sbom_spdx[recrdeptask] +=3D "do_create_recipe_spdx do_cr=
eate_spdx do_create_package_spdx"
>  do_create_image_sbom_spdx[file-checksums] +=3D "${SPDX3_DEP_FILES}"
> +do_build[recrdeptask] +=3D "do_create_image_sbom_spdx"
>
>  python do_create_image_sbom_spdx_setscene() {
>      sstate_setscene(d)

