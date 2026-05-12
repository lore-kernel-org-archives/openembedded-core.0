Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4313ACD343F
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 22:24:23 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.715.1778624658583663157
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 15:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XD4IrxVh;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7c58e6eb3edso12621337b3.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 15:24:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778624658; cv=none;
        d=google.com; s=arc-20240605;
        b=P2nG/OMl/2ts9y/thEXyn4ZnuUz0D3K3b5W1wVoT1yisSR1sob/9xalXALVR7x2gRw
         KEruiE+72zb6vkVkL1XHDFgCgbnsDFEyBz0BNYP3tXcaErQwBhsxZTBHjnmmgWZu8Hcy
         v3XtG8pm6Ck0XRVDAdmK+C8gVowPkNz1gFaNxixw+upkXHRJ5CU/9AjsI89NhAKr0jVX
         LUKnsSFq8xxH+VBwizvhkxLM2Oc7JF8p5RyW85sr3pat2iYl3IgEpZ2mZrKm14832kVP
         EyTz/BHxFNQFf0Vs1qPK+Y61kJdGHWzWOzVHZpR9pFop8ceRhoJCutZ3dbhFHH8N+Rx4
         t8cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CZXCJDUrgPP5dBjYYLmoYgprli7f0hThsJToPbsNY2A=;
        fh=/0bD1tHDTlNqNV+s0MufUGqSvGjmuOTE19tshw4lm28=;
        b=fd9nXJ10JL22o8UtfaNdynugWDOGn2/Me2qEeMWFI0h12TiyUaej/LpfAKe8fnJZf8
         vWj3Crs3ulSrM1EM9Wm6Ut0z5Bk84hlqt7mCp6biW0oR15dkZUHcyaRg2sreN4j9QD98
         FWlou3SKSf9ob8dAsUYYOq/itwFS0OTEsmRzLZCTo0GHkj6pynqY5W6LyROSnHF9aa1M
         +mB7sTdIi7sHAl10BLiGXle2m0c43eF6nyqJuagwWHGUvcwNfqlFmVkIA5SlbYJAUjQN
         DDmUZulecC0y4ARU9sZBqcDotg9U/niDDE3l3VMCtnCv4SJ+0AzVb1ylvx+9dBb/GMDH
         0mjQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778624658; x=1779229458; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZXCJDUrgPP5dBjYYLmoYgprli7f0hThsJToPbsNY2A=;
        b=XD4IrxVhDQUY6+731C00qtSR6hQ7/2PTn3U/uWwe2QPBhokU2w4BE8kl5CCyDEV6g5
         TIDO8QrxQRLddGSariaE0sMgqFWdaUgxdqdUSBJFrVbc5RvQlsrKmumo0nTiM37TjX6B
         AiZqE1wOvTKVDwPtRhKUMY2y+FZ5LsbPu1Tq4wbeJAPOh1WjpfV7NqifXnQEPxDb6xm/
         wKRDHgYzOX9ci7eeCGSIUp1mdb0cmy2R7lMkUWsvDOP/Ktp4WOW6oFXDbaXvfwoiMXX7
         qrLfDGT2aK9RjZ42TpozLgzflC4CY73cbG5svwH8GGQPiN/a1W1+fKO8PDovIvjM9qF0
         Rl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778624658; x=1779229458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CZXCJDUrgPP5dBjYYLmoYgprli7f0hThsJToPbsNY2A=;
        b=Z/dMmYkelRsBsqyzk3jGdhiRWMRHLLK0Mxf92enny59WS7KqABxM1W/vwHgyXMvDF6
         n+s1akpBkeI0U+LW3NA37LqMEFpHccQYkrYiicshTuLxY/WnSyw6NNqVhhyELzbPkpuM
         EUB+4gb7KuDMCVD9ee6VkWjkBNA+nj02OxXsx3np3FHEW3tZQnIlceyyyu010MZqW3wB
         vcweioDaySFEwMVCf9c1ijsexk6xxcfLmANlUPqMxLXs7bWtuSjpeZ0qc/BJcmqruc40
         13JDRzRV/SihbPMAWLav33A4LVVpMCrpMA3d7zQ76kz/CwvNczdsCVywA028O/yTbJCB
         1c3Q==
X-Gm-Message-State: AOJu0YyLkIkkyHeoRf17551vHd3NjANMNUWet54djAhIpCh7knw2ciRk
	LyYOUQaH9BSDi6bDwTwI8569UShVF4RydNhHOF33Q6LnUCKwl4G8b01OxLXyrACOJScx61GrFVA
	PiX7G5ZxUEr45pt3GQF9/CXd5RDeVP60jW/Mw
X-Gm-Gg: Acq92OGZBVdS+iiIvIYT5fHvZQD5fsw4x5ruKO/BHUqINldR/6WLJIJMIVutz4mymtr
	bUYbq1EaXTqrBJXshGD4WmW+swjGOKj4AvcuanteyZOLtZkXxulsIXmfLzA4DgiZtO6sEO0RGC6
	UrPg6c/OzxEYEw/vHOpm7MuF90IDqCGklF9LtQLgl+FiEMkNGYHHtU8Gmh6ul/1v2kSIJjprVPW
	kbIaRD4YWFQ/GX/IRn+KEhc2VYWED8SRZvlqG7hgD8eA1QlLSMx74JhFNxuwJmKcrm9oQcw355e
	RGkl7tZruE/0gmAm2C0NMQ==
X-Received: by 2002:a05:690c:4d44:b0:7bd:4792:66ef with SMTP id
 00721157ae682-7c6dc7b21b1mr1160697b3.42.1778624657595; Tue, 12 May 2026
 15:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260512-sbom-zstd-support-v1-0-93273381d548@bootlin.com> <20260512-sbom-zstd-support-v1-1-93273381d548@bootlin.com>
In-Reply-To: <20260512-sbom-zstd-support-v1-1-93273381d548@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 12 May 2026 16:24:06 -0600
X-Gm-Features: AVHnY4IHcC8qIzeo_1cfmHDHcX8iauty14C6BF6PJWn8IE-kVkBsNfCS4We5WEw
Message-ID: <CAJdd5Gb27DgDdvnWpx8AoZiKngdJB_ZSwh6XPBv_TweUmhNZJQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] spdx3: introduce SPDX_SBOM_EXT variable
To: jeremie.dautheribes@bootlin.com
Cc: openembedded-core@lists.openembedded.org, miquel.raynal@bootlin.com, 
	thomas.petazzoni@bootlin.com, benjamin.robin@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 22:24:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236915

On Tue, May 12, 2026 at 11:02=E2=80=AFAM J=C3=A9r=C3=A9mie Dautheribes via
lists.openembedded.org
<jeremie.dautheribes=3Dbootlin.com@lists.openembedded.org> wrote:
>
> In preparation for upcoming work, introduce a new SPDX_SBOM_EXT variable
> explicitly telling the file extension name for SBOMs.
>
> Keep the default value ".spdx.json" to maintain compatibility with the
> current behavior.
>
> Co-authored-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootl=
in.com>
> Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jeremi=
e.dautheribes@bootlin.com>
> ---
>  meta/classes-recipe/sbom-cve-check.bbclass |  2 +-
>  meta/classes/create-spdx-3.0.bbclass       |  3 +++
>  meta/classes/sbom-cve-check-recipe.bbclass |  2 +-
>  meta/lib/oe/spdx30_tasks.py                | 12 +++++++-----
>  4 files changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-re=
cipe/sbom-cve-check.bbclass
> index fe145a2212..ddecb82e52 100644
> --- a/meta/classes-recipe/sbom-cve-check.bbclass
> +++ b/meta/classes-recipe/sbom-cve-check.bbclass
> @@ -14,7 +14,7 @@ python do_sbom_cve_check() {
>      """
>      Task: Run sbom-cve-check analysis on SBOM.
>      """
> -    sbom_path =3D d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.spdx.=
json")
> +    sbom_path =3D d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}${SPDX=
_SBOM_EXT}")
>      image_name =3D d.getVar("IMAGE_NAME")
>      link_name =3D d.getVar("IMAGE_LINK_NAME")
>      run_sbom_cve_check(d, sbom_path, image_name, link_name)
> diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
> index 56fd01fd53..785edb9865 100644
> --- a/meta/classes/create-spdx-3.0.bbclass
> +++ b/meta/classes/create-spdx-3.0.bbclass
> @@ -74,6 +74,9 @@ SPDX_IMPORTS[doc] =3D "SPDX_IMPORTS is the base variabl=
e that describes how to \
>              algorithms, as described by the HashAlgorithm vocabulary in =
the\
>              SPDX 3 spec. Optional but recommended"
>
> +SPDX_SBOM_EXT ??=3D ".spdx.json"

We should perhaps consider making this SPDX_SBOM_EXT_SUFFIX instead;
.spdx.json is the ISO standard extension for SPDX documents and is
non-optional.

> +SPDX_SBOM_EXT[doc] =3D "SBOM file extension name."
> +
>  # Agents
>  #   Bitbake variables can be used to describe an SPDX Agent that may be =
used
>  #   during the build. An Agent is specified using a set of variables whi=
ch all
> diff --git a/meta/classes/sbom-cve-check-recipe.bbclass b/meta/classes/sb=
om-cve-check-recipe.bbclass
> index c80b8ac83f..eaad73ddaf 100644
> --- a/meta/classes/sbom-cve-check-recipe.bbclass
> +++ b/meta/classes/sbom-cve-check-recipe.bbclass
> @@ -16,7 +16,7 @@ python do_sbom_cve_check_recipe() {
>      """
>      Task: Run sbom-cve-check analysis on a recipe SBOM.
>      """
> -    sbom_path =3D d.expand("${DEPLOY_DIR_IMAGE}/${SPDX_RECIPE_SBOM_NAME}=
.spdx.json")
> +    sbom_path =3D d.expand("${DEPLOY_DIR_IMAGE}/${SPDX_RECIPE_SBOM_NAME}=
${SPDX_SBOM_EXT}")
>      recipe =3D d.getVar("SPDX_RECIPE_SBOM_NAME")
>      run_sbom_cve_check(d, sbom_path, recipe)
>  }
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 1821dd7de4..63d93c7901 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -1526,8 +1526,9 @@ def create_image_sbom_spdx(d):
>      image_link_name =3D d.getVar("IMAGE_LINK_NAME")
>      imgdeploydir =3D Path(d.getVar("SPDXIMAGEDEPLOYDIR"))
>      machine =3D d.getVar("MACHINE")
> +    sbom_ext =3D d.getVar("SPDX_SBOM_EXT")
>
> -    spdx_path =3D imgdeploydir / (image_name + ".spdx.json")
> +    spdx_path =3D imgdeploydir / f"{image_name}{sbom_ext}"
>
>      root_elements =3D []
>
> @@ -1567,7 +1568,7 @@ def create_image_sbom_spdx(d):
>              if link !=3D target_path:
>                  link.symlink_to(os.path.relpath(target_path, link.parent=
))
>
> -    make_image_link(spdx_path, ".spdx.json")
> +    make_image_link(spdx_path, sbom_ext)
>
>
>  def sdk_create_spdx(d, sdk_type, spdx_work_dir, toolchain_outputname):
> @@ -1603,6 +1604,7 @@ def sdk_create_spdx(d, sdk_type, spdx_work_dir, too=
lchain_outputname):
>
>
>  def create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, toolchain_outputnam=
e):
> +    sbom_ext =3D d.getVar("SPDX_SBOM_EXT")
>      # Load the document written earlier
>      rootfs_objset =3D oe.sbom30.load_jsonld(
>          d, spdx_work_dir / "sdk-rootfs.spdx.json", required=3DTrue
> @@ -1681,15 +1683,15 @@ def create_sdk_sbom(d, sdk_deploydir, spdx_work_d=
ir, toolchain_outputname):
>                  elem.suppliedBy =3D supplier_id
>
>      oe.sbom30.write_jsonld_doc(
> -        d, objset, sdk_deploydir / (toolchain_outputname + ".spdx.json")
> +        d, objset, sdk_deploydir / f"{toolchain_outputname}{sbom_ext}"
>      )
>
>
>  def create_recipe_sbom(d, deploydir):
>      sbom_name =3D d.getVar("SPDX_RECIPE_SBOM_NAME")
> -
> +    sbom_ext =3D d.getVar("SPDX_SBOM_EXT")
>      recipe, recipe_objset =3D load_recipe_spdx(d)
>
>      objset, sbom =3D oe.sbom30.create_sbom(d, sbom_name, [recipe], [reci=
pe_objset])
>
> -    oe.sbom30.write_jsonld_doc(d, objset, deploydir / (sbom_name + ".spd=
x.json"))
> +    oe.sbom30.write_jsonld_doc(d, objset, deploydir / f"{sbom_name}{sbom=
_ext}")
>
> --
> 2.54.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#236896): https://lists.openembedded.org/g/openembedde=
d-core/message/236896
> Mute This Topic: https://lists.openembedded.org/mt/119282963/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

