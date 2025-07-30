Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C644C83F26
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 15:07:32 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.37882.1753888046557617727
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 08:07:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ijNMSpM5;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-71a44abb9f2so15646357b3.3
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 08:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753888046; x=1754492846; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWVevkcuhSN2cykawVhvjJXMbJ+dtpQqLFULKSvHFbU=;
        b=ijNMSpM5SI0lEvmXtWPQm+DMvgQFthIsQLi9jBFDkP1YzNrgbVTzkR1hlGhckFCfI6
         aZ7Bv3TXIhiWrRYPNJmCFZjZsKeQxtFVmWhcZGI/N0FFlJqTciytqlpBjqiYH6mn4XIc
         qUvS7BzxtrqCNRBuxbUNOh+ZqXiYKiwMcgoWxzcNJHXASnWTeTViJFvwFIbCbGTcz2zV
         tnCm6VGog1AjKb53c4k95VvciNcl7kppQMH1DXRYkTrIR4Je9dwgot+cMFNB3bydZ28h
         1Mzn2dv7QpwicMZllTG3lu2/W9z+ShDTFDrY1T2zUim3YBBsXB4iQwBN2ZwwLeZDVvf3
         pHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753888046; x=1754492846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SWVevkcuhSN2cykawVhvjJXMbJ+dtpQqLFULKSvHFbU=;
        b=oxJ3dPMrdtm72wKp7J2pSQpwbz2rL3bczTOv+u23VXnP5Z/+Ij2qC6nwpJaBsmXMg5
         LN8fOXyL87n5jlaIY6EpyTcds9YQag4pUiQmcSNn59Or9RnwlTgVmwnlCieBNTDH88TL
         r8UUOY1hRhMi4MzlMrQ/rNw/oTuDI3k6dyXNQ5MGbUl+gSdlwzT2IxNQhFvE5CYe4yGJ
         EmuImL0Jl70UIE9BIFTC5d3A5AxcOgjXV201DwqvmrGJJ+u5GJRgOPelI+sm17NoWCio
         DkU6297PhFLpgLOVX7ajvyf5G9Dg54o7yeCxp2wt84nDK1d7FHoXtBEFs8qBPJgvXul7
         nR7w==
X-Gm-Message-State: AOJu0Yz9pPNF1sovT3jPPNnteIrA2xzlpLEvAuUaq32NVwj9etoDSRwL
	KhcJ+eTQKJg+WM/VNCGxARaj4qDvstzTo33CntVZrHXh4xK+YIqQtg8xcJFwTROnTqscVk/Gw5G
	jNl/wn59kb5o8QDJF7TRqr6QbjAH32Tadf3XXxEhGEw==
X-Gm-Gg: ASbGnctEea80Mq3DlxCFIDIaefwkjrZ60zDLJMrfvgVXbxj1T+i0TgV1HmXGA3uUc7/
	yCvBSB5alDJX1OOh+WU5oasJQqGvBevbImFEKoQ9f5Owxjm3H8FtvFJwU/BSzPqmlcuop8yq7Te
	SZlaRz5fi9JMH73Mum0AkXeUTpZnVeRaBpIWqwqXUVJqKZCocaXl/2ToBizpACXGR5jSVH1QuNs
	lNQ1CbmBVsFrdqkuAOablmzNbX8nHKbuoxO3PgM
X-Google-Smtp-Source: AGHT+IG1n9qCDrftGQEvSEvE7EMEk/L0XPKVQDvs9vi4SoDGgey/Yc+UEj5H+33JyLVY2lAIP5VSYn0oEWmldJL46jk=
X-Received: by 2002:a05:690c:6113:b0:71a:2885:7676 with SMTP id
 00721157ae682-71a46667509mr53128737b3.24.1753888045458; Wed, 30 Jul 2025
 08:07:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250729163655.3076122-1-raj.khem@gmail.com> <24681.1753861268208129492@lists.openembedded.org>
In-Reply-To: <24681.1753861268208129492@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Jul 2025 08:06:58 -0700
X-Gm-Features: Ac12FXzRilxAZUAPi86IhkzKFooLR2FT-BBAx85S000EckyHMlqAYr3izxjPObs
Message-ID: <CAMKF1soFtXGDmvj5jBgJXZaHmFLynd1XC_aX_4o3p3GMWatzxg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: Upgrade to 2.45 release
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 15:07:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221119

On Wed, Jul 30, 2025 at 12:41=E2=80=AFAM Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Hi All,
>
> Below are the test results for binutils v2.45 upgrade
>
> qemuarm64
>                                                v2.44      v2.45
> No. of expected passes            258        259
> No. of unexpected failures        1            1
> No. of expected failures            1            1
> No. of untested testcases          1            1
> No. of unsupported tests         12          11
>
>
>
> qemux86-64
>                                                 v2.44 =E2=80=83=E2=80=83v=
2.45
> No. of expected passes             310          315
> No. of unexpected failures           1            1
> No. of untested testcases             1            5
> No. of unsupported tests              9            8
>
>
>
> UNTESTED testcases:
> Below tests are the newly added testcases with v2.45 (specific to x86-64 =
arch)
> +UNTESTED: pr33198 with -R .gnu.lto_* -R .gnu.debuglto_* -R .llvm.lto -N =
__gnu_lto_v1
> +UNTESTED: pr33198-fat with -R .gnu.lto_* -R .gnu.debuglto_* -R .llvm.lto=
 -N __gnu_lto_v1
> +UNTESTED: pr33198 with -R .llvm.lto
> +UNTESTED: pr33198-fat with -R .llvm.lto

These changes aim to resolve the issue where strip fails to correctly
process archives containing LLVM bitcode.
since we do not have llvm in the sysroot these tests failures are expected.
>
> Regards,
> Deepesh
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221107): https://lists.openembedded.org/g/openembedde=
d-core/message/221107
> Mute This Topic: https://lists.openembedded.org/mt/114434048/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

