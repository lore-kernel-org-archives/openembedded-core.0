Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F3ACD98C5
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 21:59:48 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32334.1781128779895088634
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 14:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ft+beZhf;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7ddd3d67084so79183717b3.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 14:59:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781128779; cv=none;
        d=google.com; s=arc-20240605;
        b=QYT9ULC5g4SDe5FvPTjIByUY96TTBrRw/icvGG2b+ThMFp3UwayQHjO8S7lZKUyW38
         SzJgIdMzU3UhfpZkwwz1xyUV//6dEqiixEYCwPksq3cd6RoEvQ3GyQJ85Caa5GWA5RUD
         OL0iyME+UY0wNG/+iEocV15W3z4MFAkbeijBIvSp0qwKkecgDXvPox6zO0tKTmnqCAXV
         W0f0SDH8pBGHGTVQhO0IgS3+qS/fvJpT1pFIhwme0wko97hqqwRy813CMBJnkog3to3y
         gbATp1PV+dqXk+3iPzkpEnujwxf8+5WPF/NZMCX8kszqUGfuqx8MhsY+fdCem5ULFYXi
         lFPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UcppaFk3eXW/aNI9zW5Tu2Z8rgB9ZRCQwCTYNTV6lWk=;
        fh=/J2/p8Vb9D4Kd8UzXOu+r8FySvVNJtK7kCaQlnvOHnU=;
        b=UwSeFbpVvhTXMB18Z9L4SuXQrFNO9Wv4c0UIisFM1jLp7wXaVlmDqeqeIgVqma4EI9
         RGUd5im/SlxwYvLSs5mCl4vmM9n0VMSOvjsHWef2AVLT6F5zroxKtxTxl4M5AG8qfmpO
         y+92cT67GosOssGcEN02bFVwxJr/KFz8zk0TdfJe8Dj36snw91IwNnwYDJ4J7w/y/xBo
         7Tx2eHA9RAVDVSNVb/6RmDLM5PgHGx3pM8keFEP8Jw49598rhtZhrMxRpUTeXM/ZvlpU
         HPa/Kyj+fdlKU4L2+yguet+Qqgk4gfQHcmNr4tOIqJjTYTOboTA50bYfsrRoAHrkWSyO
         WREQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781128779; x=1781733579; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcppaFk3eXW/aNI9zW5Tu2Z8rgB9ZRCQwCTYNTV6lWk=;
        b=Ft+beZhflTTCvKYEs8O+lFapMkksrdw+30pOHmcu5tE9F5jWTUQbTO6zD0Oytzd1O4
         DVz+GnbLz4cjxM31HP9F0f53AzZqf+yEpxagfGs0lyjwbzZIPhwX5sAqiFrMNRz6kbR6
         K1Hs6pfSGdqPvRMvKHzZ4xldc32bF8mpwTq805rq5Tb8XGl6XZtxGhc3i0OqxeiAq6rZ
         6wT+fL5QIDWizD5lpjrVM16FkMdZ7JiEYktW97Ejh5dQRLTN7YKXGxYfN6Q0Kq42rKGo
         7U9KMn361L2GzdOALVypip9d3Ge8pJ7p0x9mbnhAEHHJuF8Js1DTnWc9hxlpJFLPfmSu
         n14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781128779; x=1781733579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UcppaFk3eXW/aNI9zW5Tu2Z8rgB9ZRCQwCTYNTV6lWk=;
        b=K2fRGxJJH0lsm0yCQA8CYeRLtCGAOtZebeoXLxdHhiPcsuQi0UZgPCvesMInFo/9Zt
         fpnrEW6lZN09V8pNr0f8ezvdiDkdi5QDrHaFA+PjJ8FCiWVJSXddVBujuXAKFOAc90bz
         6kHM1sfTJE+5l1ZEG3f82Sv5/CmHT47xHcTj/dCe2pyer0z8TdE1o2XMFjN+LSlrFeyV
         Cum+I5bUeyrm4HuHkZuC46BgNhZ8eBSLlGx4KrelNPF4IItZhEEqomjuwtLT6uP0oUDW
         rLHHcp31X1mbNqUR6O+g8200o5vTYgvMe3vxizsopSeA2omBOjLgHszOKd3wja/usbxD
         Ul0w==
X-Forwarded-Encrypted: i=1; AFNElJ8mt3Yn/590tYIFQRJW/CIMjDvz5irzUc/C0/o6yUUekmd7E7hoBISp2sHlJoLx7PZVMspj76Y/+20REujz6NZYmA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz0Zm9ZJAQe/HCciN4c6ZJHWyhn5nGtqm5lQNFTEQrjTdaNl2Y6
	7GcwKLNqdOPv7fHcf9HhB+/LoXoIwH9M/kyS+20WQvcHNOAQflzB6b5vvitO1KHWUpEot6wQKd1
	9n4et1aHnKXrQvIAHt7wIv7fNbYptkoA=
X-Gm-Gg: Acq92OEf47gcIHJe3yJhiZgpyhZRrygP6jqvEPq+8OxtlOdWpgZH2qzrnIOTvXYF2Ft
	OgwDsaqvBuUpta4l2HikC7f48J0Zq3q2zW0ll9RtPIVyqBM/uXmwY7qJ0vUWqzNPFATLLmxsEmk
	ttjq+I/vqu18zoM+QLHui0tWrDCvoMHkyWoGnZ8/BWTuElRc1/ByI+ZUJDbC78CKtPZsZN9ZAdO
	fIfUw7eWHqMBTvl66XbCm1IeOoZFMdvbb8mx+KycITjRXiE39+JdvsnlvCGlNgP/RxW7Hc/4JjU
	GO162ICxsSwYdIzpDy7JqQnP5A/Qm/e93A7RqTAENw==
X-Received: by 2002:a05:690c:6e02:b0:7e4:bc8:7ad6 with SMTP id
 00721157ae682-7f65795eb28mr1230277b3.30.1781128779033; Wed, 10 Jun 2026
 14:59:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260610141128.6606-1-leoreis.costa@gmail.com> <20260610142658.10318-1-leoreis.costa@gmail.com>
In-Reply-To: <20260610142658.10318-1-leoreis.costa@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 10 Jun 2026 15:59:26 -0600
X-Gm-Features: AVVi8Cd-upQ5bQmSVaxono6ZLnWUAqYo0niK8IFUAOmUsyEG0RHbYmolVYiIOrE
Message-ID: <CAJdd5GZK9YB2CQssL0XZfApZFKtqd7vj5hDx8QgdOELWPBXGKw@mail.gmail.com>
Subject: Re: [PATCH] [OE-core] [RFC] spdx: Add ability to change the deploy
 SBoM name
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: leonardo.costa@toradex.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 21:59:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238395

On Wed, Jun 10, 2026 at 8:27=E2=80=AFAM Leonardo Costa <leoreis.costa@gmail=
.com> wrote:
>
> From: Leonardo Costa <leonardo.costa@toradex.com>
>
> Allow "deploy" tasks that have set SPDX_DEPLOY_TASKS to choose a custom
> name for their deploy SBoM.

LGTM. I will pull this onto my local branch since it depends on my
changes; would you be OK if I squashed it into my change that adds the
task, or would you prefer it be a separate commit?

>
> Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> ---
>  meta/classes/create-spdx-3.0.bbclass | 4 ++++
>  meta/lib/oe/spdx30_tasks.py          | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
> index f915f5cfd5..1444816530 100644
> --- a/meta/classes/create-spdx-3.0.bbclass
> +++ b/meta/classes/create-spdx-3.0.bbclass
> @@ -178,6 +178,10 @@ SPDX_DEPLOY_TASKS[doc] =3D "A space separated list o=
f sstate tasks that produce \
>      'after do_create_spdx'.\
>      "
>
> +SPDX_DEPLOY_SBOM_NAME ?=3D "${PN}-deploy-sbom"
> +SPDX_DEPLOY_SBOM_NAME[doc] =3D "The name of the output deploy SBoM when =
using \
> +    create_deploy_sbom"
> +
>  SPDX_DEPLOY_ARTIFACTS =3D "AUTO"
>  SPDX_DEPLOY_ARITFACTS[doc] =3D "A space separated list of deployed artif=
acts, \
>      relative to SPDX_DEPLOY_ARTIFACTS_DIR that should be included in the=
 SBoM. \
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index b69f79eae9..d56cbe543e 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -1885,7 +1885,7 @@ def create_deploy_spdx(d, spdxdeploydir, artifactsd=
ir, artifacts):
>
>  def create_deploy_sbom(d, deploydir, deploy_tasks):
>      pn =3D d.getVar("PN")
> -    sbom_name =3D f"{pn}-deploy-sbom"
> +    sbom_name =3D d.getVar("SPDX_DEPLOY_SBOM_NAME")
>
>      objsets =3D []
>      for t in deploy_tasks:

