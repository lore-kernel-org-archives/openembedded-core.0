Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28395C43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 14:19:28 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.174394.1783433963489235121
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 07:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wZ7b62oh;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47de0093c42so2318689f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 07:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783433962; x=1784038762; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=poCx4roC29JtKC4oQhQB/o843wKuCgZkz2SNeCuVssw=;
        b=wZ7b62ohsDjSvNKY7PCAkiT9a6PcXuNJxummzMwII2+m3wPYCLoElCLTR5WbISCKsk
         EDOxpujrDpt6QlYymH59RcapH59vIEOsvWgkigHkVdJJxyFRb0Dq6vSaNGAb3BIixIbM
         FgQ283iz2O/hZ2JV6koBCLl1XYiFnnV++dKv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783433962; x=1784038762;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=poCx4roC29JtKC4oQhQB/o843wKuCgZkz2SNeCuVssw=;
        b=UeP25cx/ihjiFnUncIEc/y425TBA97uFwKoE1kq5mZXz8Kcwd0K8kw7JnzjgENr0yP
         IpOHarkFmdYBwqUMZiB7qOJT/9Haj/n3JByNui8xU/QC7aZ1VnkSLz0GJcmP5u9T0yjy
         rk1Ozs8CMO2k5+xA+afLbuXCnDlXMoVfWNBe3xmTiYADgpT3bq7viYnIgSOsZNJTqAUL
         kloTnrB8REFkdHjWpsajeRfyOsmvCjFGUGNKMR+RJdTJf8AHpN3XjmOIM5QbpwuHesEm
         T9Wvt9+vfeSZYzfbfAVDEv0oFQ0VAwS7XZUFqgT+4xXWpA8oDc1P/F4dkme5pAALn8yT
         xroA==
X-Forwarded-Encrypted: i=1; AHgh+RqyECjRUD3g6x8RgCEVHcbR/oNAXPJmnugVD8M+ieN/IeO8ynSECKsN5izBuKI6pLRw+UWGN5rj3nGX4r6v7evxJQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx6rO/5BVT9son33JPgqB0EkIsf0MWzr5jhBzVb/isdjpfSjeVx
	gR5NbJSz7xnAijFSmznXCnFEwCRsgRtd353pEpqW6rqiNR8yiyocgDk49VHfda9mM+RHV8kxaAx
	OF2TTNQg=
X-Gm-Gg: AfdE7cmzZnYZRv/w5YQvkZqkR/3Y3OHHe+M408dZ2OCB5oeNY+UNdaQIZ03bXHMQAVo
	zjB0z3ADXb6DhKnbxMAB1qosrXVtrDNBHgHloM6RLbMVYu1Nmylzc+oOlBnSGK2ZiFQ1KMn3T94
	oPpXnAZRh4kYr9D3skyu30IN0Pbxhwm4xmocCvzC7C25OK7rC8OU7b6YU1cNksYyonOuVs2HbBG
	u+mHOWkuaCO0LsdCnZ6rb5jp7hEiuHz24ZJ3m+XRovdApCb9a/QN62i2zEgGefLxN6wVRyHjf84
	o4bqJqpoOlBBmn3duUcSVigDeJbqoHnmh8yLdSOaJQygHyma/9WueSdWlyL0U44zxFyjD2uopMG
	DU26t50Ec/2/pWb1OV+mKH9VxMuLYlMikvXUoGUwbtadv4QDS1HYxEx9fbZaRSkBjkvx0KxWZWc
	0h8np2IY36VRyi2L+GmzkHwCE7BY55UOtqiy2nq8K6W8Iegpw355Zm8Mu5A8jz3KEBgKaQpRvm
X-Received: by 2002:adf:e005:0:20b0:441:1e8e:d8fd with SMTP id ffacd0b85a97d-47de66be4f2mr4250198f8f.29.1783433959948;
        Tue, 07 Jul 2026 07:19:19 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d905sm34664145f8f.2.2026.07.07.07.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 07:19:19 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Jul 2026 16:19:19 +0200
Message-Id: <DJSEKQDGSPHQ.2M0JQNBI2DWOP@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH] create-spdx-image-3.0: correct
 SSTATE_SKIP_CREATION key for do_create_image_sbom_spdx
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <reatmon@ti.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260707135830.4070072-1-reatmon@ti.com>
In-Reply-To: <20260707135830.4070072-1-reatmon@ti.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 14:19:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240390

On Tue Jul 7, 2026 at 3:58 PM CEST, Ryan Eatmon via lists.openembedded.org =
wrote:
> From: "Eric Meyers via lists.openembedded.org" <eric.meyers15310=3Dgmail.=
com@lists.openembedded.org>

Hello,

FYI, I've cherry-picked that into my review branch to avoid this mangled
"From:" line.

Thanks!

>
> The override was "task-create-image-sbom" but BitBake derives it as
> "task-create-image-sbom-spdx" (do_ stripped, underscores to hyphens), so
> the skip was never applied. The task then cached an ${IMAGE_NAME}-stamped
> SBOM in sstate, letting a stale spdx.json be restored via setscene. A
> later do_sbom_cve_check would compute the current IMAGE_NAME and fail wit=
h
> "No such file or directory" on the missing timestamped SBOM. Correct the
> key so the image SBOM is always regenerated, never restored from sstate.
>
> Signed-off-by: Eric Meyers <eric.meyers@arthrex.com>
> Cc: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes-recipe/create-spdx-image-3.0.bbclass | 2 +-
>  meta/classes-recipe/nospdx.bbclass                | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/cla=
sses-recipe/create-spdx-image-3.0.bbclass
> index 15a91e90e2..cf79ef5b01 100644
> --- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
> +++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
> @@ -71,7 +71,7 @@ python do_create_image_sbom_spdx() {
>  }
>  addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_create_=
image_spdx before do_build
>  SSTATETASKS +=3D "do_create_image_sbom_spdx"
> -SSTATE_SKIP_CREATION:task-create-image-sbom =3D "1"
> +SSTATE_SKIP_CREATION:task-create-image-sbom-spdx =3D "1"
>  do_create_image_sbom_spdx[sstate-inputdirs] =3D "${SPDXIMAGEDEPLOYDIR}"
>  do_create_image_sbom_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_IMAGE}"
>  do_create_image_sbom_spdx[stamp-extra-info] =3D "${MACHINE_ARCH}"
> diff --git a/meta/classes-recipe/nospdx.bbclass b/meta/classes-recipe/nos=
pdx.bbclass
> index 7c99fcd1ec..aec73ca54c 100644
> --- a/meta/classes-recipe/nospdx.bbclass
> +++ b/meta/classes-recipe/nospdx.bbclass
> @@ -10,4 +10,4 @@ deltask do_create_spdx_runtime
>  deltask do_create_package_spdx
>  deltask do_create_rootfs_spdx
>  deltask do_create_image_spdx
> -deltask do_create_image_sbom
> +deltask do_create_image_sbom_spdx


--=20
Yoann Congal
Smile ECS


