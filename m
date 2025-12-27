Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D7FE92716
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 17:35:09 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11129.1766856903119083685
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Dec 2025 09:35:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W3aC6b+X;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-88a3d2f3299so96173256d6.2
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 09:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766856902; x=1767461702; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hOEv2fIUY3CKXU1gVnBgz3LKUvB6nQnbDvBJjEJ1C8Y=;
        b=W3aC6b+XS4zWJfqsJ0L4M04SMPVXE/qQsLmzc7+9Vbajo4foyfKCLOTgLEKBG60UJz
         pCtVFEER8LaXW7G29giUhlavC8rk06+JmAEYA7j5SibWF7oll2SVrNLt7XDx689t/VLb
         ucGStJCh8vStiXqExSigH1lotWaN5RtJqi2wwH7aKLupvdbEqKjQZMRULkr2DUhnjrOu
         sUD6F857gcITi9EsUTTHaOqqbVgP683dfi3jvG6EKc1xtbIqDmgLhVbbBV4CuX9sh6RY
         BdS/jcptU8VMpEMKktcQz44aEdnDj2z1mrOIVzJnH9MWcekAGz1Z162BcXlYcN7nzFKb
         7Eqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766856902; x=1767461702;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOEv2fIUY3CKXU1gVnBgz3LKUvB6nQnbDvBJjEJ1C8Y=;
        b=HuS41RaCDNkD/d91LFoI5P0643CmaPtN8GI9dJXAqgUuMwGZNpyVWe5XxNVeSI4MNj
         Xf9xUAWeOTNqG5SeQ/VDBVu1dBMkG4xt8OfXZv4xzzb4pTfXItnI6bk6CWEkyvGB34rC
         IDzTsen4FiW+UNfxcaHslGb7Spyo7KOzNe0wbQHr6j5Bq1F2ERxFW6yVTyFdiD/13BvZ
         4QLDrAOEAS7aeUFrValhq8GjHZBg8jH+tX1w8+T6Y8q0YNpJVEEogHovHq8XgCLcoQGi
         bFn0sLaHHMndwxGOeIpubAlK7gUlWgHsXnlC0vmljGaQSpOD5kO2owIWxhWDhx8nDkjc
         FfIw==
X-Gm-Message-State: AOJu0Yx07EmkMTtPxCtOYr+FQHl02Que36aDy1P4wWVR4zCICtso8lp+
	QOUl0xm0AnBaFA68R0pDG87edDMZGyo9FqoaydifXoOaItbtfpjaLBxxSx5wnL6E0jJqMF8QCwz
	7YNuiLCKeSKuy01HwI01GL33eaUiwNj+4hA==
X-Gm-Gg: AY/fxX72JD4Ltf+tlOkh3wso7tQxeOH9Uydy1ypOjX+v0A+QP55mlCBvBZO53s3rtFh
	8VdqppP3dlsvGnbcPW1JIgaOKrYrmMFeZpcDDYuCXGL7kcjNPNm988hrR2iimaZ+esQBEklsLnw
	GnwnJeAQOE5546eT+okLPLd0GKJ7INPAPorSSQLeIedFUQBSufRqdzQWsVgban5MkgTixrVrljb
	HJKabMLZlgV0Vgj/0o0/JvFPWLCe+azP4BvJcAfxFBN0/uySdV5aDneJW1mrHu8JYR55w==
X-Google-Smtp-Source: AGHT+IGsGOWW6PMAFYsImtwwRBRukdT2uDKJUU3B93J9Gt00Z5JrbYNQ+mZJxo8SCVkPtymgkFJF4AIfn0MkTfMgBoY=
X-Received: by 2002:ad4:5def:0:b0:880:5001:17d1 with SMTP id
 6a1803df08f44-88d86290b9cmr436168386d6.37.1766856902031; Sat, 27 Dec 2025
 09:35:02 -0800 (PST)
MIME-Version: 1.0
References: <20251226073545.11152-1-mark.yang@lge.com> <CANNYZj9LnX1-9TGMcNJ_E_VMF=TxuX9Y4V-6o2RvJB2ANQonPQ@mail.gmail.com>
 <359949.1766825181217178563@lists.openembedded.org>
In-Reply-To: <359949.1766825181217178563@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 27 Dec 2025 18:34:51 +0100
X-Gm-Features: AQt7F2pDrt1hUxFZ9vvhAnv49pc6SQ2wlV-KAg3kEiGxpGBEMkyYNpUe7RozoFo
Message-ID: <CANNYZj8QU5D-GE-ZkHzmBvy_d5QLQ4GEjrem=ozM=3E3oGw7XA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package.py: warn if target is not a valid ELF
 file in dwarfsrcfiles
To: mark.yang@lge.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 17:35:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228577

On Sat, 27 Dec 2025 at 09:46, mark.yang via lists.openembedded.org
<mark.yang=lge.com@lists.openembedded.org> wrote:
>
> My error report is as follows.
> https://errors.yoctoproject.org/Errors/Details/892988/
>
> I am using only the openembedded-core layer, with nodistro.
> local.conf
>
> PREFERRED_TOOLCHAIN_TARGET = "clang"
> DISTRO_FEATURES:append = " ld-is-lld"
> require conf/distro/include/lto.inc
> DISTRO_FEATURES:append = " lto"
> # The settings below were taken from meta-clang.
> LTO:toolchain-clang:class-target = "${@bb.utils.contains('DISTRO_FEATURES', 'thin-lto', '-flto=thin', '-flto -fuse-ld=lld', d)}"
> LTO:toolchain-clang:class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'thin-lto', '-flto=thin', '-flto -fuse-ld=lld', d)}"
>
>
> dwarfsrcfiles checks .a files during the package process.
> Whether using LTO or not, DWARF information is extracted by iterating through .o files inside .a files.
> However, they must be ELF objects.
>
> To summarize, it is as follows.
> The problem is that when using clang + LTO, the .o files are not ELF but LLVM IR bitcode.

Thanks for the reproduction instructions and the error message.

The fix is somewhat problematic:
- it relies on the particular console output from dwarfsrcfiles which
may change over time (maybe subtly), and then the code around it will
quietly cease to work;
- it obscures other possible issues that would be exposed by the same
error from dwarfsrcfiles: there can be many reasons for something not
being a valid elf file, and they should remain fatal errors;
- conversely for this particular use case it still emits warnings,
even though there's nothing the user can do about it - should it
rather say nothing if .a has only llvm-ir files?

Is it possible to rather guard the call to dwarfsrcfiles with a set of
conditions: inspecting .a file, clang as toolchain and lto in
distro_features, and skip the call if all conditions are true?

Alex

