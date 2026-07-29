Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36733C53219
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 02:50:49 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3131.1785293443220815581
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 19:50:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PwPXT1SF;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca7bea5e5b3so305022a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 19:50:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785293442; cv=none;
        d=google.com; s=arc-20260327;
        b=QIx9W4NMIZN/fp9VEhJ2Kp4YJELi6Jbn+Lkj7mBemLHCfAZL+dHvffa3+tlJ0lAiUq
         1lgbp8OzP+qQUwCJDk83e0xc+bP0Bdx52MRKMLkhCzWRMmiHUhOyrjtA6y1PrW581iYC
         dBSCgZOxhJQK7udhWPqzrm3Clu9SrNTiXqVomK0QHf1CHoknnbMFJUQZlDFf+0S1uNYW
         Tm7Of3VfC6oDGx864KmkSRT8HPMjenwoRXC61snt8Y9gplau0emGBrK2YjVjTvl1tcmO
         4caBLRZuyR+DNEFS37rzSqmsW2UbtBT7Z8+HBFaRnvC3wInKgSiXjC5pEdqyOV3xdkXZ
         fjKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dbdY6ZgGGBso0dPPFnSUcBx8kR+YdKwN5md4mdAtDN4=;
        fh=KDBggjr8BLztnc4QKL9wpIZeKsRhbOowKcZEQS8F7CA=;
        b=pMvuQZLkQTj9VJgQWRApv3n9g3JfODJ6i8HAczG6oJb3k42Hbo1YPW+OirPPQ9j0tW
         Hc+C+5qkFShzeKtx3ySprHf1G4NcjJepxNz1n4Y1KyhBkNfUjg+vsn1YHPWE2LtaxsJx
         WHTQmpY0AtEfPNBOdnweSXgPa1yPpIx1S49qrXKjJ9Tkp0YcSuDD1UyheGrJFJlpCo52
         ANXYC2DS6Movm5xNYv9RwFcbjFHjQVi5MSnomDTSBdVenCbF8YZ3CT6m+QqQ/KVMtkJv
         /2oLg5CjxuFA9JA+a7XJ1r6pJ+r+y/2SCTrpwD2qUqXK0si5pcBEFEXYgbL8n0g+drXz
         X6QA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785293442; x=1785898242; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dbdY6ZgGGBso0dPPFnSUcBx8kR+YdKwN5md4mdAtDN4=;
        b=PwPXT1SFw4kBoALG3XOuEYr01DBrx6VstdpIYLAbwG2VMag7WEu2xH9D5VDGdOf3NF
         Ivu6dpAH3OKje/8+8apJeWVJeDNzW7MxISUG0wcAqUyO7xWoK1hDguXgm8tFF7xtyFVM
         AtxrKuWppbRvtPpir4zVnaXSo8Yw0P/xotIuqUy0TVjTSkn38cwQ9Bqs9KVN1ZP4tdOB
         fo0viWcZWzv/5+deeVoWxEy5BpNWFCTwxA7SVHWI04IFS0NgCo3qXshGVij9JQhbeoRl
         e+41cGrC+hIUUMIX73NCIsXA9hoyDUfbs/TGU4uqQqk98Bw14PoYpecOSOBDGGKXxaNj
         +KSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785293442; x=1785898242;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dbdY6ZgGGBso0dPPFnSUcBx8kR+YdKwN5md4mdAtDN4=;
        b=Lf1dGaPcMHXQJF7wSxaKSE9SWfgDCiiUz//HKwBZpN3KKOmns87cvQ881cS3ClUoVh
         91+if0wh8EPB1df/d5kE6Q/zv3k3x8rnW4Za2AEpMKhZ018x+GqKCSNFI03SJJ181qBH
         GH42MwJPKkzv5fs0s8JdIC4sFgj2aQkBph/mfGaPiBTQHwdWrh/dEoTyDhZ6tFA0SlIJ
         Xff8gJqzlSEQLMLWyOok35O5bQoEwbw8NJJBADdsIH+XYgo8FYWip/Xrg2jeOz0cllHc
         W9ROEJPTqT24+jCFNdI023cEqvjEFPWcN9Ic8MIn1S/mbmLxN2ui2u2fvO0+lB9/v6A1
         1zRg==
X-Gm-Message-State: AOJu0YxKez+Z52QsxOLkZh6GYzIGLooZChyF0y8KzbA7e9jwttJW5Cdr
	hGSIJkTbTuyzz9Hce3t8lWq5D7QNddf6F8ycXoTwxE6rNoCokzhGsA4Wvjr/HXTAsZCBZMaSYVW
	SA3c4J8wj4K6WIuexqEUooAhAR4jbUjD/ZqfF
X-Gm-Gg: AR+sD12gX7l+7UF15EJz01cpbqy4AlENdmfZNl3VXdcaTgVxypu2I50MlibEePnw2Gf
	Rcqy5PpAThCP7RKtOvJYTLo0mutqrujk/PDdMLwg79/AvT4FRqnfsLuOhE3T0syTF/LjB8OP9Fz
	4p91GvYMU0wsqp+RD0xQpHOhpJGwoEnWz4TCRzHygcB1qfg0aT5xzPWhGAlBDJD1OgMySOtBy0c
	hzJ1kkPyujNjbN0j8OU8G5oAyFujic6LuMhwRT3EQrERuUU2OHMhiiiVdsW9tmrSqdANCiBYsiy
	MGV/EU++fWDePZb2qu5HTLdKgaDy42XTSVaGD5zsh38J87zsweWRcJvH2JcesMtLCS3LGsZQEcK
	xqL+rWbHlSLnaETy0abtWkVUkk/QXZCHSKJoV4hv6V5rrrfPaaNZqG/29Ipll7J4=
X-Received: by 2002:a05:6a21:b8c:b0:3c3:8255:8c4a with SMTP id
 adf61e73a8af0-3c8aafd663bmr6300305637.17.1785293442505; Tue, 28 Jul 2026
 19:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260729024416.1443-1-wangmy@fujitsu.com>
In-Reply-To: <20260729024416.1443-1-wangmy@fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 28 Jul 2026 22:50:31 -0400
X-Gm-Features: AUfX_myI3Jbx2hnBkzVztepQtxpgecPRzL4nB-EFqwL1tXiFWeXoIVDVQv62m5k
Message-ID: <CADkTA4NFH8TeobepQc14Pn1HCg88BmoO7EEsvbDTte52Z0QaBA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-devsrc: include tools needed for BTF
 when enabled
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 02:50:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242225

On Tue, Jul 28, 2026 at 10:44=E2=80=AFPM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> When CONFIG_DEBUG_INFO_BTF is enabled in the kernel, building external
> modules that use BPF requires the 'resolve_btfids' host tool. This tool
> and its dependencies live in tools/bpf/ and tools/lib/, but were not
> included in the kernel-devsrc package.
>
> This caused a build failure in the SDK when running 'make scripts prepare=
':
>
>   make[4]: *** No rule to make target '.../tools/bpf/resolve_btfids/main.=
o'
>
> Copy tools/bpf/ and tools/lib/ into the devsrc build directory when
> CONFIG_DEBUG_INFO_BTF=3Dy is detected in the kernel config, matching the
> existing pattern for the 'rust' directory and for objtool.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-ke=
rnel/linux/kernel-devsrc.bb
> index 237dec6b12..23779ed107 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -176,6 +176,19 @@ do_install() {
>              cp -a --parents $(find tools/arch/${ARCH}/ -type f) $kerneld=
ir/build/
>          fi
>
> +        # In sdk, when CONFIG_DEBUG_INFO_BTF is enabled, building extern=
al modules
> +        # that use BPF may require the 'resolve_btfids' host tool. This =
tool
> +        # and others require sources from tools/bpf/ and tools/lib/ to b=
e built
> +        # within the SDK environment.
> +        if grep -q "CONFIG_DEBUG_INFO_BTF=3Dy" ${B}/.config; then

You need to find another way to make this conditional, or if the files are
small, just copy them over.

kernel devsrc cannot grep and be coupled to specific CONFIG_
symbols.

> +            echo "NOTE: CONFIG_DEBUG_INFO_BTF is enabled, including BPF =
host tools sources in kernel-devsrc."
> +            # The 'rust' example copies the whole dir. We do the same fo=
r consistency.
> +            # This includes resolve_btfids and other potential BPF tools=
.
> +            cp -r tools/bpf ${kerneldir}/build/tools/
> +            # This also requires the shared tools/lib directory.
> +            cp -r tools/lib ${kerneldir}/build/tools/

What does it actually use from those directories? We avoid complete
copies whenever possible. Rarely are all the files needed.

Bruce

> +        fi
> +
>          if [ "${ARCH}" =3D "arm64" ]; then
>              # arch/arm64/include/asm/xen references arch/arm
>              cp -a --parents arch/arm/include/asm/xen $kerneldir/build/
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#242224): https://lists.openembedded.org/g/openembedde=
d-core/message/242224
> Mute This Topic: https://lists.openembedded.org/mt/120497655/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

