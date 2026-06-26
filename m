Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D3C9CD4F26
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 08:34:48 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31085.1782462887318268065
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 01:34:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=14N86I6m;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4629051c9d1so322679f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 01:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782462885; x=1783067685; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/V1pALw7OSBzBTGS1zQbEy1Fbo+cw4l4QVD6bsAT44c=;
        b=14N86I6mkcEY3fyR0CkvRi5qyipan8UlIzNwhi1L30PzZPWmTFEVv+n8DemlLnMD7O
         dg8PG90Amw9NNZBhgP/y+cqq2Ao3ym3L/RRhN5gDlkhzjLC/sODprKAMS6rA2xLhRoz9
         oFRDAFteZfD2Q5AEH3VNPRMCBlm2giAwCA7uI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782462885; x=1783067685;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/V1pALw7OSBzBTGS1zQbEy1Fbo+cw4l4QVD6bsAT44c=;
        b=bvEAMmX96PBnHPz/bnauWgTiYDwCUqwwU9efzxDoTxt5jF/TKMdebi39soyrDzuJO6
         ouAulRcxzSNUGw2FX/QQtxG4wd6ARZQxOGcMBHGd5ocL3m2AzUI45I8tG0Jek9l2Ynjs
         W8/xaZasrSiJhLbFh+IBAUeTcSiT4c1DvyMKkVUiOFAYyIjQ8I9ImnKjpzYBOQ3G286f
         IlA3jOSHtWsMXSDwYES9dhoj6JjL62OqaFcoD55GE3lXinjiN+HYKPDMmJctsPib6S9R
         kvtqBvr9aYzbbwnZVd0f7kBD6u8N7woWqaLFmS2dJAyf96UwDg3mTW3r1KSH2KRJOMrx
         rJNg==
X-Forwarded-Encrypted: i=1; AHgh+RrNTDaJi2h1I+aWssceTQ7QUcUnTImTw0cGkXPl8p+Qf4GBvBJH8l8pXjWPC+OmjOvC2qtx/H3zyxtkHgg2vdLZmQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxpY5Gt3DFUWcALJ3YQurZGtE4e0PqZr1oUJ7EA32OFDxbFVNnH
	dIhQPcEmigj6hHZf+y/k9eIRmc91kf0mwtXocXvH2T8fbaeE7PyxGqEYf0QfECIjaGc=
X-Gm-Gg: AfdE7cnfcAObjnkG3Kl0QOpakcoj3UmoFTLZxrWTvukkVYbkb8j/eQVj1HUMxzoQugU
	Etb5LPkq2jfHoEASrg0SauZOZcZkx3/FsxC7ZqcqiW+0fRrVr9staNLR/zeLQcoQABb1JoMRFhR
	BAsD56BHgf1TBSeACwqUDF/GbX3dWSF63nHAxXq2EsUeNSPOqfz8pfahTqB8187MgLNRygTru4q
	Gh/7TlpauRWEgopm+008rm2GVtnFj/Wxz+K1d7E4wrlwVHwQIP6zHli5en5MZa8TKvEpp8TQyfK
	TZveVG5ZiBkBeEx//4Q/k8zAVXe+ebBkKu5ouNdMDK0DE4otkPu/kkC+KVmOY51FVqJ6xn3T0v4
	E2w1wSkawJJSnK+VQ7ZMvtR4Mq7lX/oPMJ6HkNDbwly8siUiyTiDPfk8TnaFIr9MKF98vBjEK7G
	uN6zwRzEen8pDSyFOYWZPGNW9vvp1Lfyel3HBsrjlT7iJv2uqiPEIxbO3gx5/fBkbqLLTqPjxjU
	6xoyg==
X-Received: by 2002:a05:6000:2893:b0:460:1a36:deac with SMTP id ffacd0b85a97d-46dc0d0e9famr9448128f8f.24.1782462885409;
        Fri, 26 Jun 2026 01:34:45 -0700 (PDT)
Received: from localhost (2a01cb001331aa00dc663d106f146c8c.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:dc66:3d10:6f14:6c8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f8d6f10absm708100f8f.5.2026.06.26.01.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 01:34:45 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Jun 2026 10:34:44 +0200
Message-Id: <DJIUCWVZ14A4.2PD6X0FXERH9Q@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hfranco@baylibre.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] sbom-cve-check-recipe: add
 SBOM_CVE_CHECK_RECIPE_AUTO
X-Mailer: aerc 0.20.0
References: <20260625182435.979787-1-hfranco@baylibre.com>
In-Reply-To: <20260625182435.979787-1-hfranco@baylibre.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 08:34:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239615

On Thu Jun 25, 2026 at 8:23 PM CEST, Hiago De Franco via lists.openembedded=
.org wrote:
> "do_sbom_cve_check_recipe" is only added "after do_create_recipe_sbom"
> and is never wired before "do_build", so it does not run as part of a
> normal build. Users who build packages directly or run "bitbake world"
> without producing an image get no CVE analysis.
>
> Add SBOM_CVE_CHECK_RECIPE_AUTO variable that, when enabled, hooks
> do_sbom_cve_check_recipe into do_build for every recipe. This lets
> "bitbake world" run recipe-scoped CVE analysis across the whole package
> feed without first building an image.
>
> The task is only wired for recipes that actually produce a recipe SBOM.
> Recipes inheriting "nospdx" delete "do_create_recipe_sbom" and are
> skipped, to avoid scanning a non-existent SBOM.
>
> Signed-off-by: Hiago De Franco <hfranco@baylibre.com>

Hello,

Isn't what is meta-world-recipe-sbom for?

To do a world CVE check we do:
bitbake meta-world-recipe-sbom -R conf/distro/include/cve-extra-exclusions.=
inc -c sbom_cve_check_recipe

See:
* https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/met=
a/meta-world-recipe-sbom.bb
* https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-cv=
echeck

Regards,

> ---
> Hello,
>
> I tested this with Poky Wrynose, running "bitbake world" from an empty
> build (from scratch). It worked as do_sbom_cve_check_recipe ran for
> every recipe.
>
> This patch is dependent on the patch I sent earlier,
> https://lore.kernel.org/all/20260619183406.239931-1-hfranco@baylibre.com/=
.
>
> Thanks,
> Hiago.
> ---
>  meta/classes/sbom-cve-check-common.bbclass | 5 +++++
>  meta/classes/sbom-cve-check-recipe.bbclass | 7 +++++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/meta/classes/sbom-cve-check-common.bbclass b/meta/classes/sb=
om-cve-check-common.bbclass
> index 32c29a0ec2..236bce8545 100644
> --- a/meta/classes/sbom-cve-check-common.bbclass
> +++ b/meta/classes/sbom-cve-check-common.bbclass
> @@ -52,6 +52,11 @@ SBOM_CVE_CHECK_SHOW_WARNINGS ?=3D "1"
>  SBOM_CVE_CHECK_SHOW_WARNINGS[doc] =3D "Show warning messages when unpatc=
hed CVEs are found. \
>  Requires the SBOM_CVE_CHECK_EXPORT_CVECHECK report type to be enabled"
> =20
> +SBOM_CVE_CHECK_RECIPE_AUTO ?=3D "0"
> +SBOM_CVE_CHECK_RECIPE_AUTO[doc] =3D "If '1', run do_sbom_cve_check_recip=
e as part of \
> +    the normal build (do_build) for every recipe. This also includes run=
ning CVE \
> +    check for all recipes with 'bitbake world'. Default is '0' (disabled=
)."
> +
>  def show_warnings_from_file(cvecheck_export_file):
>      import json
> =20
> diff --git a/meta/classes/sbom-cve-check-recipe.bbclass b/meta/classes/sb=
om-cve-check-recipe.bbclass
> index c80b8ac83f..084fcf4946 100644
> --- a/meta/classes/sbom-cve-check-recipe.bbclass
> +++ b/meta/classes/sbom-cve-check-recipe.bbclass
> @@ -22,6 +22,13 @@ python do_sbom_cve_check_recipe() {
>  }
> =20
>  addtask do_sbom_cve_check_recipe after do_create_recipe_sbom
> +python() {
> +    if oe.types.boolean(d.getVar("SBOM_CVE_CHECK_RECIPE_AUTO") or "0"):
> +        # Recipes that inherit nospdx.bbclass delete do_create_recipe_sb=
om, so
> +        # skip them to avoid running the check against a missing SBOM.
> +        if d.getVarFlag("do_create_recipe_sbom", "task", False):
> +            bb.build.addtask("do_sbom_cve_check_recipe", "do_build", Non=
e, d)
> +}
> =20
>  SSTATETASKS +=3D "do_sbom_cve_check_recipe"
>  do_sbom_cve_check_recipe[cleandirs] =3D "${SBOM_CVE_CHECK_DEPLOYDIR}"


--=20
Yoann Congal
Smile ECS


