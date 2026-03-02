Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81033EA4E38
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 16:06:46 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.164051.1772467600128930940
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 08:06:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WmUh+7k/;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-793fdbb8d3aso55065397b3.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 08:06:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772467599; cv=none;
        d=google.com; s=arc-20240605;
        b=WZ5I2DTDrAnTIuWmaYImx94wtffYRWu6rBJir4mEmt0GkAckPkaJfsVrKLKStI9ZRi
         fC6AiQf05t3K/L5hzeG8VNR+DqZ2V11HK3WwFBPx9ezjIzHCK98E2dVGyaX78+lFzUwU
         gXJqC6Qvz7AMhvRBaVAPv9QNIFri6p9dYRx1xcQwpCmk+7tGMVyBc6V6UYLTR3siyIRs
         dKG5g0FZBIxSGPbeVUoRzLhFxgakoXgmzQo9BtMRR/u9zeWeIMFPLh7FDz8TGKtJW5dj
         KHfOySzTiaX3ytag0lR5Cv29h/XepBAbfr8pbd/sKw5Ep/bIW+XGmq/nruWiw2wh8ekx
         ObDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=44+6vBDQv6Z+Zw7wqhlNKCFzjI04W+qBWijta8m0yoE=;
        fh=L7GOyz8kBb5EG0OzDtnxdmI938zogcIu2j9w8d0qzHc=;
        b=IjQbZjMZ1eu7MDgZIxUjwilrAh70TtlKskmjH5RI9myLu/dulK14f/zLF16RJiuADu
         cxhfnCc1zhzDiLOdKG1kHC5smXCYHSqA3ZxuwVTfs1ovAqafZd0Z706T6YQFpDfxGllr
         WXRhWMyT5FMBhnTzFj0FjIF9UCniYs72hYW/HD1krZzOM0BE+Ln678QyjEvG6NEXQ23M
         OIRvALn0feVnjNhmSQS31c7iVGSRncLHwVnYlluTIZ9WbP1TONrwP61W34q442ZVb1IB
         PD0prSv0IfN3Q0XWIkHtrhoVotUxzl32MlyABKYSzJBVt1NjMN43V/5w8xAFhyODkZjz
         OsqQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772467599; x=1773072399; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44+6vBDQv6Z+Zw7wqhlNKCFzjI04W+qBWijta8m0yoE=;
        b=WmUh+7k/KC8Nx0at0RBtXtWTA2bCCtHOzsFjmedSy9JPo8mvdiOsezWBciOIMzMoiu
         rPQzPIFndvZDyl6hMLg95bbD2LWYa1VTm12ecdfmoqmaaGRSbpYuAc/w3EWoUgyWz0Ra
         f1VOT82LUF/VrwqP57+0pN7KeSgqxZB/34dlznQSxqJNsfJ5CEK6iW5EgCq/isAmUTw0
         bIeqLeIASF/9NxRnAaogGd9gIvBWpSDHU6KJdiP7/m9IhTPs0vZxpPl9s/jsAI6VuAoS
         6UM22Fh8qTZHXEpvKSEnYxE3Xqhzx9h21LIuDxtQBoN+uZBLcTSRXKbwKoY+sCvOtlKh
         YoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467599; x=1773072399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=44+6vBDQv6Z+Zw7wqhlNKCFzjI04W+qBWijta8m0yoE=;
        b=McMlUrrbBeLQqsAzLx17oXbqpZ+mNINtNLjGatJXEi94eatoD//UJjDNIDbX83NYMd
         +hk3Ecuq+uZ9ChD1Ic+0irq7UJ/i5veD0w/TEHdZ1dCum8nC67NGFTy7IZvFiNIZ3Gda
         2DipP07ct0AWH0rxnmV/PjTVeypcU3odEx8EnFpriQRdwi8iiJ8TnLjW1SjzVm8Ca25J
         DPLPp7qOjTg78pxV+0hKl5C9MZCMuiOg1vE6CcSK3YwZOjMuqkxo+Get/W/jBSXxAatU
         vJnuuTcUXGz7EtO7gDVLiNvuFkUwGbar4TdXZvMQsq9qSnFDDB7TsHKLqJ12Zs6MkrjG
         4QRA==
X-Gm-Message-State: AOJu0YxmzgoWgFohCygR/MgVUeearSu4Gz3R3NwVjOaE1kJDIXlv49mi
	zO1rs1EKR39AfQU2Fhr/YqvqKZokCtOORgdvZZ/DtGPadaCOAtNKOixevsd0wHlfbI8FfKoEnkP
	tikIcOID1Xm/3SybBA5YiFYHlnreffIw=
X-Gm-Gg: ATEYQzxC9HZOyQG+IVHu4xXVW3+VqR/gKq/oIJw0XaPqdW4fh/Bxjd32vvsXBJA40CP
	2WsmkxGm0sh88a2bMN7XWQNKdBan5Awt4E5uFCFWQcCr7JNCQw0MKwMQb1QJKoZz9BwYwncdRSz
	OX5pVw9weDYUH5Vbp6dT0N+RJ0r2j9UkezcW2rN95SnIeU1ibHZD2C1u6bA7/o2LnD5FfA2a9mM
	bFjobr7q1a3sqBI6SIoFGc46EwSRVsG02jcrmv9iaNkK95c2+9Dle3AoFhPaPMytzYxTToRivRU
	EGbnkIobuSVFzEy+UQSEiQ==
X-Received: by 2002:a05:690c:883:b0:798:670c:d235 with SMTP id
 00721157ae682-798856518d0mr104520797b3.64.1772467598889; Mon, 02 Mar 2026
 08:06:38 -0800 (PST)
MIME-Version: 1.0
References: <20260224-fix-kernel-config-spdx-v3-1-011b7badd942@bootlin.com>
In-Reply-To: <20260224-fix-kernel-config-spdx-v3-1-011b7badd942@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 2 Mar 2026 09:06:26 -0700
X-Gm-Features: AaiRm51hqCyErCrv7PIRMByJinTiSnwL1b6EfWu-GS0dc3xZRmFfMG5NZefzb9c
Message-ID: <CAJdd5GZ7qYEkV2DkNG1xMFVyh53LPCZ5rzxT=s7BqgbYi6JGLQ@mail.gmail.com>
Subject: Re: [PATCH v3] meta: fix generation of kernel CONFIG_ in SPDX3
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
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 16:06:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232220

LGTM, thanks

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

On Tue, Feb 24, 2026 at 2:17=E2=80=AFAM Benjamin Robin
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
> Changes in v3:
> - Move the code inside a function declared inside do_create_spdx(),
>   this way we can declare variables safely and use return.
> - Link to v2: https://lore.kernel.org/r/20260216-fix-kernel-config-spdx-v=
2-1-62e65ec2176f@bootlin.com
>
> Changes in v2:
> - Update spdx oeqa selftest
> - Link to v1: https://lore.kernel.org/r/20260213-fix-kernel-config-spdx-v=
1-1-4fd66ca5cb5d@bootlin.com
> ---
>  meta/classes-recipe/kernel.bbclass   | 27 +++++++++++++++------------
>  meta/lib/oeqa/selftest/cases/spdx.py |  2 +-
>  2 files changed, 16 insertions(+), 13 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
> index f989b31c477c..222a5d74f7bf 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -864,14 +864,13 @@ addtask deploy after do_populate_sysroot do_package=
data
>
>  EXPORT_FUNCTIONS do_deploy
>
> -python __anonymous() {
> -    inherits =3D (d.getVar("INHERIT") or "")
> -    if "create-spdx" in inherits:
> -        bb.build.addtask('do_create_kernel_config_spdx', 'do_populate_li=
c do_deploy', 'do_create_spdx', d)
> -}
> +do_create_spdx:append() {
> +    def create_kernel_config_spdx(d):
> +        if not bb.data.inherits_class("create-spdx-3.0", d):
> +            return
> +        if d.getVar("SPDX_INCLUDE_KERNEL_CONFIG", True) !=3D "1":
> +            return
>
> -python do_create_kernel_config_spdx() {
> -    if d.getVar("SPDX_INCLUDE_KERNEL_CONFIG", True) =3D=3D "1":
>          import oe.spdx30
>          import oe.spdx30_tasks
>          from pathlib import Path
> @@ -903,9 +902,11 @@ python do_create_kernel_config_spdx() {
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
> @@ -924,9 +925,11 @@ python do_create_kernel_config_spdx() {
>              [kernel_build]
>          )
>
> -        oe.sbom30.write_jsonld_doc(d, build_objset, deploydir / pkg_arch=
 / "recipes" / f"recipe-{pn}.spdx.json")
> +        oe.sbom30.write_jsonld_doc(d, build_objset, path)
> +
> +    create_kernel_config_spdx(d)
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

