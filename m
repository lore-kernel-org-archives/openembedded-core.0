Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C55CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 17:13:48 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.web10.1731.1760462018560832800
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 10:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EKVD6k2d;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-63cf081f87fso3695880d50.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 10:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760462018; x=1761066818; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4PlQvrJqyfsfqhzrQbhFGfVc/n0gZNqCYjCHj0neks=;
        b=EKVD6k2ddI4HvmPCSwlgWcGYGFR210H4xmHI35GoCfFwW2FGQ4BrYqCyLWHRcdODp/
         p87CGpAsebXRQBYZBIp2oJa4y3Pj1eyTFiKIQpsbJPid+7iEqt50ZUW27RvwC1w0C3ZJ
         kAhK/QOB2NiZ/SFjKxt2hkjqB1Hp4rz9vpdIRx7JYJmMuAMBd7XXw/gIBqibLmri/27z
         p5PV0Al0tBmZeFyV39V+bF8XUvG+Wh09X5yiGHNKdOwADkOaEkgS0XmbdHka1mn9K8tt
         d89PgIAOdutw+c0/kq8iAtil9VeUnNT86RCYEhH3o/kwRPkNTwmxd6ASS/DzWciU0AAk
         vhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760462018; x=1761066818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t4PlQvrJqyfsfqhzrQbhFGfVc/n0gZNqCYjCHj0neks=;
        b=azxs5BIjN8IieDVKTTZ6dyBtIptImhfGTARPBYVULlDtdwOEk0MqhsjX5EPwjCKAS5
         nhSocCQvidITUkTxbKU1pDAT+4boBMUz+/ixULQYzhxsQp92Wazi1VJEe/z7Z8LYlVkZ
         yEbnHhOBSqdhvylMdBuSHsqMll6O+d+PT8S0yKGRFSA7fndJ9g08LHNtA/rWUtDJekWQ
         Vvyxv8vp4OAIhyq1T/ez2SKHV7NkE9iGe+HeixEgIx8VGhJR/TYzTDocrlurqikqbXp+
         iOXRcJyXUXZs+AZY2wBjPz8+0Apa9xxE3BE7ZWM/0wWgh1OAxL32LhdIIL6TL0PhF7mA
         7qWw==
X-Gm-Message-State: AOJu0Yy/EQDl9t8cw67wvwXmVYIIAuUCGa2Sk97VNtahLBjYBuzM8Tcl
	Z9bwjvvCYgRyuFO61gIVUlBN2uNPrlMbcc8/wY4JYwTC4JIAtB2+vZzgNB04aOCUPMAgy5Ou0vL
	Hzo8UxwUBccCmrG3UzcPVfLdgKZISrUSieLPi
X-Gm-Gg: ASbGncv8BREDrxsBSuwVEaBxSTG7ST707hPgFddcRKW+OggLUgnSfTv0TQTkVAWUyzH
	Op0nODK0b4onjLIkZi7WIeFNnMkNrUoubT/nrkij1IOMVogg4InoUOKiLbdHMNwOHHzq/etmgr8
	wy78dOUZarMnP+C/isWuxpMQxmnrVILlpz0/F9zyXdGVN3DqqCbFHuswroVAHozMJVJdFpI8WtF
	Z6AYkXHz9kwkDcgQsAyRWig3nHZURpD9xWl5cL6Nl1QrQQ5bmlyh9If8G9uHcdvsvgk
X-Google-Smtp-Source: AGHT+IFem5V1oN5CB8qskMbK5wS0YMXmXQkcS7mj2PCY+btPIAMXCBFmK1BnfFQyh3E2D4qPDM9LhfMjRFLhHtfeVtU=
X-Received: by 2002:a53:c059:0:10b0:63c:f0f0:1f87 with SMTP id
 956f58d0204a3-63cf0f02002mr10211616d50.29.1760462017547; Tue, 14 Oct 2025
 10:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <20251014100712.159692-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20251014100712.159692-1-Deepesh.Varatharajan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Oct 2025 10:13:11 -0700
X-Gm-Features: AS18NWAjrKI38IK4jNdwloaue30_YSNL36Ygy0etfHf7dlTVTKs5tVNs03DIo2o
Message-ID: <CAMKF1spy2ixuCftSbF=yLHMGdEwMkgnQ8i29=_QkMxgMbhWXaA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust-target-config: PPC64 targets require
 explicit ABI selection to avoid build failures with rustc.
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 17:13:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224844

On Tue, Oct 14, 2025 at 3:07=E2=80=AFAM Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> Without a specified ABI, rustc panics with the following error:
> |   thread 'rustc' panicked at compiler/rustc_codegen_ssa/src/back/metada=
ta.rs:394:21:
> |   No ABI specified for this PPC64 ELF target.
>
> This issue was occuring because of the following Rust commit:
> https://github.com/rust-lang/rust/commit/9c1180b6238d163fc384d60d85647385=
d9210343
>
> As noted in the upstream changes:
> If the flags do not correctly indicate the ABI,
> linkers such as ld.lld assume that the ppc64 object files are always ELFv=
2,
> which leads to broken binaries if ELFv1 is used for the object files.
>
> Because of this, it is now required to explicitly specify the ABI for PPC=
64 targets
> using one of the following:
> "elfv1" =3D> EF_PPC64_ABI_ELF_V1,
> "elfv2" =3D> EF_PPC64_ABI_ELF_V2,
>
> If no ABI is specified, the Rust compiler will panic with the error:
> No ABI specified for this PPC64 ELF target
>
> To address this:
> - Set 'elfv2' for powerpc64le (little-endian), which mandates ELFv2 ABI.
> - Set 'elfv1' for powerpc64 (big-endian), which defaults to ELFv1 ABI.
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  meta/classes-recipe/rust-target-config.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classe=
s-recipe/rust-target-config.bbclass
> index 6e6b500f5d..0c7e3c0090 100644
> --- a/meta/classes-recipe/rust-target-config.bbclass
> +++ b/meta/classes-recipe/rust-target-config.bbclass
> @@ -403,6 +403,10 @@ def rust_gen_target(d, thing, wd, arch):
>          tspec['llvm-abiname'] =3D d.getVar('TUNE_RISCV_ABI')
>      if "loongarch64" in tspec['llvm-target']:
>          tspec['llvm-abiname'] =3D "lp64d"
> +    if "powerpc64le" in tspec['llvm-target']:
> +        tspec['llvm-abiname'] =3D "elfv2"
> +    if "powerpc64" in tspec['llvm-target']:
> +        tspec['llvm-abiname'] =3D "elfv1"

LGTM

>      tspec['vendor'] =3D "unknown"
>      tspec['target-family'] =3D "unix"
>      tspec['linker'] =3D "{}{}gcc".format(d.getVar('CCACHE'), prefix)
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224815): https://lists.openembedded.org/g/openembedde=
d-core/message/224815
> Mute This Topic: https://lists.openembedded.org/mt/115750134/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

