Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3B1EC1115
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 17:44:13 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.356.1771868644068328566
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 09:44:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Iib7JSeM;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-798374d0f44so21514017b3.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 09:44:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771868643; cv=none;
        d=google.com; s=arc-20240605;
        b=bO/MYOO+tCUEtp5vaxEFlu6o23lvpKnW2a06Kls/SAvQHzd6Y8H4b0bvqApoTki9EK
         RhbHb7+BWFq2LvwVTe5du/7Moqv/ouw61+pAmXrBYhFBhvUtoaFmC3GvZzmC8IUlOtpr
         YfFoKUD4Rd1FIfTrjHyXt6fX8le4mUNkr46LGRBo+psKXU81R+sUk3nTD8MAGT3MpVFi
         f52BKV3dkBwjunQRHMkVKoVQBB6VIBrnZqec1E7TspY/ZoPSjmz0dRm8hEbDAyGLWWMK
         qPLPEBsQ3pvatR+zQIPZ6s+ropeGErTIdMpfO0VE7rtrzlpS0wBQgvJd4WG4lpajD5Qd
         fxdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aMI3ydqkaosHuWKyEjtnOHuKFOPMN8CzbW8HHuBsxnY=;
        fh=L7GOyz8kBb5EG0OzDtnxdmI938zogcIu2j9w8d0qzHc=;
        b=YU8datsillQqTIg42DriQcS27o4hT8UTPpwx8dojG1NL1jnMNDrd7Do1wnhlfXoncC
         bYnXcqKG7end0qXfnOTka+gV7bVhqPKnRlk6jxSjEQheA//obYjYeH9IyrDwGkxsscZX
         9LfmoaFgQu37Q8M1BXQEPzUk89Q9E75u+vTn6GIqyZtKfv/LwvVK7I9B3XSwltHfflwh
         Isx2y1mWHPJOOtqiZPTCBDqpJYqNBSMeMt+5Y4gTwLXV9haeZ+SuwGMSGcxRhHeRMpqz
         sR6p+OncyoC0q+IiRmD08sjyUR8GRaQVXGKowQPautKs7QDvyFSBust3dcAc6L65NZ4e
         yETQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771868643; x=1772473443; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMI3ydqkaosHuWKyEjtnOHuKFOPMN8CzbW8HHuBsxnY=;
        b=Iib7JSeMuNtwZue9kJh4n4phrXcKLhNkmykwQZcntLSvNPopIkgCAJ7h6r/gxLwRFO
         9Hh2/WoKNBj0B0qSwdDHgDKnA0W+nUznczyTrWx3r/sDEPpjodBk1mo5aw6ocR0bExEU
         rwz59vnsIlzxQEcDk3tSoc3/BzOaM2O57CwuyiV+qyz72fHtWpNBEAYjNtTDCdVnEAku
         X1NyUwSW3N8Ww47CMme6YxzVIbUA9b/i8o9xdFA33wWreET6Hk9l0e7wlxgcNXYTh54P
         siQ2gnex3VUQ5aOELjEVMf2VKaDef+Qw6im87w7gFIzhyEz73lRN6Z82pgkOl8uvmoT4
         AzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771868643; x=1772473443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aMI3ydqkaosHuWKyEjtnOHuKFOPMN8CzbW8HHuBsxnY=;
        b=gcEP/BM+a4KYUogYpQWWrEUM9307Je18x/PzMDEOh8jKny45qGYiL2N+jTqaPYZ7mB
         cysAAZbH4gHdCFttICWiGgN4PagRJ1np6IzSTn84LZSdnCiSj0FhKepH/zZaxq7h6bck
         qWE0tXW/EEVdVy0aoafB5NFEWvhpQupRnmMInh/nVer1Tvuo1lCHNUHA/UbAP8Vw2HTB
         PiTh/S5ENPcaWhvit79ySKXNupGPgtv/p2V2CDQE5q/p4CGtFBtdFUcfNp7Li3OhXbVN
         aA5TCBcS0T3dvU6csxpODbHuHQs9hPWvTNoUAf559LahOxuFqNe++c27jRidgYljlfES
         SBWw==
X-Gm-Message-State: AOJu0YwTdm0WETRG60jdhayQ+i3oHZ1yiT/R0J8f7/0NmA4syOyDloDm
	AreRomWg1PPQ6S+iG1H5mIUgM4kDSc2Ey6xS8AdgMAZuub+YJ+N3qVsfbGl3XMHkY3avbwv1g1D
	thoIgHgPPIgjnlH5WYhq4lCDnEZMOt6fsILem
X-Gm-Gg: ATEYQzy2SHOw1BEjihsvxpoH8hxOUZTmNzNGh46q+wgVQOEBjDiZbYnlupgt9krNtkq
	MuhCa7MuQqvVxSUZ99kAfu6kiTco0O7uhXv0GgvPK74+HA5+FDPTERrqCrgHsFM574KniK288lH
	ne6+AzNvvA1T6jKKLfFxWRcRVs1+ohcQd/Z2IceE/tT2cNvNR1wy+JxIuSBVQtv6i/EPH/y5GK8
	sWjFwUohruQhbbEN85alkMRZZKhvZ5M1U5kcOhA0vCtzBLROEh5Hh8jXYKtTP1Pkt+T4lq5y/a8
	K1NGO7k0c4xggN4FY9Tm2w==
X-Received: by 2002:a05:690c:4510:b0:796:7077:4a8b with SMTP id
 00721157ae682-7982bf09e3dmr85404067b3.33.1771868643101; Mon, 23 Feb 2026
 09:44:03 -0800 (PST)
MIME-Version: 1.0
References: <20260216-fix-kernel-config-spdx-v2-1-62e65ec2176f@bootlin.com>
In-Reply-To: <20260216-fix-kernel-config-spdx-v2-1-62e65ec2176f@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 23 Feb 2026 10:43:52 -0700
X-Gm-Features: AaiRm52LCckvsgSlhCQPLyDsLPDCXxiZcAJeEYRAoOQvxYMBET3srcA-J_dMyLE
Message-ID: <CAJdd5GZqLc0ocXyMC9v4gV-DYBM4vA+RjQYVgnNyH7HH1QZDBg@mail.gmail.com>
Subject: Re: [PATCH v2] meta: fix generation of kernel CONFIG_ in SPDX3
To: Benjamin Robin <benjamin.robin@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, kamel.bouhara@bootlin.com, 
	mathieu.dubois-briand@bootlin.com, jeremie.dautheribes@bootlin.com, 
	thomas.petazzoni@bootlin.com, antonin.godard@bootlin.com, 
	pascal.eberhard@se.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 17:44:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231685

On Mon, Feb 16, 2026 at 1:47=E2=80=AFAM Benjamin Robin
<benjamin.robin@bootlin.com> wrote:
>
> With the current solution, using a separate task
> (do_create_kernel_config_spdx) there is a dependency issue. Sometimes
> the final rootfs SBOM does not contain the CONFIG_ values.
>
> do_create_kernel_config_spdx is executed after do_create_spdx which
> deploys the SPDX file. do_create_kernel_config_spdx calls
> oe.sbom30.find_root_obj_in_jsonld to read from the deploy directory,
> which is OK, but the do_create_kernel_config_spdx ends up writing to
> this deployed file (updating it).
>
> do_create_rootfs_spdx has an explicit dependency to all do_create_spdx
> tasks, but there is nothing that prevents executing
> do_create_kernel_config_spdx after do_create_rootfs_spdx.
>
> To fix it, instead, now read from the workdir, and write to the
> workdir, and do the processing from the do_create_spdx task:
> we append to the do_create_spdx task.
> Furthermore, update oeqa selftest to execute do_create_spdx instead
> of removed function.
>
> Also only execute this task if create-spdx-3.0 was inherited,
> previously this code could be executed if create-spdx-2.2 is
> inherited.
>
> Fixes: 228a968e7c47 ("kernel.bbclass: Add task to export kernel configura=
tion to SPDX")
> Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootli=
n.com>
> ---
> Changes in v2:
> - Update spdx oeqa selftest
> - Link to v1: https://lore.kernel.org/r/20260213-fix-kernel-config-spdx-v=
1-1-4fd66ca5cb5d@bootlin.com
> ---
>  meta/classes-recipe/kernel.bbclass   | 22 ++++++++++------------
>  meta/lib/oeqa/selftest/cases/spdx.py |  2 +-
>  2 files changed, 11 insertions(+), 13 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
> index f989b31c477c..ce43f6c13036 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -864,13 +864,9 @@ addtask deploy after do_populate_sysroot do_packaged=
ata
>
>  EXPORT_FUNCTIONS do_deploy
>
> -python __anonymous() {
> -    inherits =3D (d.getVar("INHERIT") or "")
> -    if "create-spdx" in inherits:
> -        bb.build.addtask('do_create_kernel_config_spdx', 'do_populate_li=
c do_deploy', 'do_create_spdx', d)
> -}
> -
> -python do_create_kernel_config_spdx() {
> +do_create_spdx:append() {
> +    if not bb.data.inherits_class("create-spdx-3.0", d):
> +        return

I like this in general, but if you're going to bbappend, the `return`
will mess with any other appends, so it needs to be avoided. Probably
just put all the code under a
`if bb.data.inherits_class("create-spdx-3.0", d):` instead

>      if d.getVar("SPDX_INCLUDE_KERNEL_CONFIG", True) =3D=3D "1":
>          import oe.spdx30
>          import oe.spdx30_tasks
> @@ -903,9 +899,11 @@ python do_create_kernel_config_spdx() {
>          except Exception as e:
>              bb.error(f"Failed to parse kernel config file: {e}")
>
> -        build, build_objset =3D oe.sbom30.find_root_obj_in_jsonld(
> -            d, "recipes", f"recipe-{pn}", oe.spdx30.build_Build
> -        )
> +        path =3D oe.sbom30.jsonld_arch_path(d, pkg_arch, "recipes", f"re=
cipe-{pn}", deploydir=3Ddeploydir)
> +        build_objset =3D oe.sbom30.load_jsonld(d, path, required=3DTrue)
> +        build =3D build_objset.find_root(oe.spdx30.build_Build)
> +        if not build:
> +            bb.fatal("No root %s found in %s" % (oe.spdx30.build_Build._=
_name__, path))
>
>          kernel_build =3D build_objset.add_root(
>              oe.spdx30.build_Build(
> @@ -924,9 +922,9 @@ python do_create_kernel_config_spdx() {
>              [kernel_build]
>          )
>
> -        oe.sbom30.write_jsonld_doc(d, build_objset, deploydir / pkg_arch=
 / "recipes" / f"recipe-{pn}.spdx.json")
> +        oe.sbom30.write_jsonld_doc(d, build_objset, path)
>  }
> -do_create_kernel_config_spdx[depends] =3D "virtual/kernel:do_configure"
> +do_create_spdx[depends] +=3D "virtual/kernel:do_configure"
>
>  # Add using Device Tree support
>  inherit kernel-devicetree
> diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftes=
t/cases/spdx.py
> index 41ef52fce1ca..5830d7c0872a 100644
> --- a/meta/lib/oeqa/selftest/cases/spdx.py
> +++ b/meta/lib/oeqa/selftest/cases/spdx.py
> @@ -369,7 +369,7 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase)=
:
>          objset =3D self.check_recipe_spdx(
>              kernel_recipe,
>              spdx_path,
> -            task=3D"do_create_kernel_config_spdx",
> +            task=3D"do_create_spdx",
>              extraconf=3D"""\
>                  INHERIT +=3D "create-spdx"
>                  SPDX_INCLUDE_KERNEL_CONFIG =3D "1"
>
> ---
> base-commit: 3a8f0075d52cb653118774baa03aa8d5231f943c
> change-id: 20260213-fix-kernel-config-spdx-99223936e69f
>
> Best regards,
> --
> Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
>

