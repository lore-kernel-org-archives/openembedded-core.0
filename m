Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93FDFC43602
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 02:38:01 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.375.1783478280805632557
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 19:38:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HkDvN6o5;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-385ea3ce80dso201017a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 19:38:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783478280; cv=none;
        d=google.com; s=arc-20260327;
        b=g5KTXuIreSl8JO+JgWEnlNrHIbYga1mYUVV95N8WSGkbMxR3NSWyxkaiLJ0NEOZ3OL
         vrAgB5sCeO5VxzqIhFeDP5qI2gtqUtaYfcNkbyChKXxrjJZqWsygml+RmdQTSbPBZfwD
         clWoaL/ZrIv3PD7Bxh1eGhgl2UOr5nUOBDWwXPdGVy1eY5i+jzenYPwHUgX/CdWVcsaZ
         onkEFwUaIWQ/j64p75Ym7n3RRQ1ptKwWQEvRlgyuR/fQ9XMUVOATj5m1RDLNgyfaMRwY
         0b6pSX3xvY3UDKWxhY/xHi6S71CRArf/e+cSHC6KVA9Jt9ZPUX13twCOg2OOZxjo92N6
         /E3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zgdrjJkgfS+GsRdGQvxjLF7CWXbqtJcoK2nPmrzf2Co=;
        fh=TGAJ7QN59OjB8lo9bvDUHuorkqAYrWv9Infvq7Fr0k0=;
        b=ZQcwpiKnCC1on5KRRQ0uz0F6P0mJ/VUfc9a+HaYTQ+y9bP/OO9MMh/gfF0RiQj4HWZ
         OgyFqsv6704RUy4A/fhmsVkb4urOAmnIyGn0mJOffQEwjfG034AF4coo6h93QJSKxlEG
         BX2Gn75uXlxPFzgIPT0fvvGW3ewMlqH/f1SyM5p4jFD3BeGhdG+HAw4n6IEN5aSxoi7s
         6nQtvksaCU0Xi5Dh2HzQsbvmcicl+5CZF9I0lNWLxhhDStvzQNw+7S3HRLrPr3SMLOEJ
         Xr3iS6Ty1+zLPNS9KIXgEPHt4eGK1wEr7GznrUv8M12lYDEW8R+A7mg6lqXoG3jSm9fg
         0OlQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783478280; x=1784083080; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zgdrjJkgfS+GsRdGQvxjLF7CWXbqtJcoK2nPmrzf2Co=;
        b=HkDvN6o5x4eXWMlyKTHZYoHi+Z4o7lUBjdPWuyCDoi9njbWgo9/9Q+JSbsa16NpTnf
         Jiq6sM2H+9sZT+2ZQadJPs20VpKwbDZXoJnaedEZF7O8QcGhOmF5zveSFP+Ab87tBFVw
         gZyevXmAgZciY1HPVQy+d6TORW3pevCgzaPFEY6U+JK7yTehuWX6AVUZVyig4KC1rGVZ
         0c7T8VeAY91S0MS6KTPMFuHA6TFqu3RKvyzsCKgHW/xZR6WAIMGKBr+EWptei2NDCa/v
         oBZRYFJuGi+ayNedFw6C6ktk8SBZlYh80FVWAgTRsYcFvuWFfZgPlc9zHBzsq3Z9erxx
         QVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783478280; x=1784083080;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zgdrjJkgfS+GsRdGQvxjLF7CWXbqtJcoK2nPmrzf2Co=;
        b=X7ObnAriwbxOb7Xd3STGPdJir45f9UgO1ay/93CJGJLAJkUE25plL8l3h/d5L7DkVD
         G+JOfh9913yepe+SRAu8nlIwU2rhh6ZPravO+xbYqXkvraK5tg+xDu7JuE/fRhWhOkz2
         fUlBmSEqQKZ3zFuj8qHFJWaJkTMVC0pnyR6mwCMCr6G3jFj45NI2HTB85v3Q+W4hRWMY
         xE8mVlOMt5maxK5uNVqYu/cAqEi55zgelZUzb/Juh4iqTJ6HS2YaRDdIoNuddZnC2KAu
         WzIsIDn/qUwTOj4Dizq3SGD5Z8n2SmhTTtgN8CQv/hSY1mlQwWmXui9JawwVemav8+r2
         n7bg==
X-Gm-Message-State: AOJu0YxREQr92iBI+X8FFroCzJb0m6GGZ6GvAmsdCyvavcVzUr+TcRos
	GNHMBg4ZZKOKRIMRQJXAgCdP26oxu47X+84i8OtLH3S95bpBZA+qxDEar87rOIMUjeZkeQESLVd
	ZxhVKM3ie6qabyt0AfRSHCHuv1lqcBJs=
X-Gm-Gg: AfdE7ck8YgAPohgOImM6nsX8ogzMUZP8Z/PhP1CsFuD+KVJ+IGP0KZhSZoNhRx0LbM4
	CBYSY53cI/dYtYfZ/bRmB8rvDJxAFM/AIQKFezPwrtLgO25YSXRqdmYoJMeFIKoMu73HGD4nRYR
	kq8LKm6Qmrk1ZHCAfx4q9il25jgDiZL4sIjY+8rKFCl4NhLkMqvAxwqmlp6qhWcszLq5OZgdmRO
	eebsAXRiDOOyoxYx2WqhiqQ0GWF0esNkPbKIcgY3PMPIHFwqvvg+ATkmfqsBKXZRV5UkYGJx6Jr
	bBjq+AOlgHLdsE06QJZo3u/2dSm/Pkph7/iRAbeXfJm2GMYNG75oEBE4MZSvyHg81wy0ZfM4XC6
	VZvXQYG4GN9eLzKg=
X-Received: by 2002:a17:90b:3d88:b0:37e:a09:2640 with SMTP id
 98e67ed59e1d1-3893fe5acb9mr582469a91.7.1783478280115; Tue, 07 Jul 2026
 19:38:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260708022856.2087339-1-mark.yang@lge.com>
In-Reply-To: <20260708022856.2087339-1-mark.yang@lge.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 7 Jul 2026 22:37:46 -0400
X-Gm-Features: AVVi8CfPyYGZvCvRdBnyzm8uI8ZY2nBXR9AwhIMC6GRorG9EyvVHl3T2ZyIplck
Message-ID: <CADkTA4O5hcXQxCp-pqTM0yCVLCi3Bt6T=xzZeFkMLX7f17ayyQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 0/3] kernel: make the kernel toolchain switchable
 to clang
To: mark.yang@lge.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 02:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240416

Why do we have this series, when it is almost identical to the one
sent by Harish Sadineni ?

Bruce

On Tue, Jul 7, 2026 at 10:30=E2=80=AFPM mark.yang via lists.openembedded.or=
g
<mark.yang=3Dlge.com@lists.openembedded.org> wrote:
>
> From: "mark.yang" <mark.yang@lge.com>
>
> Building the kernel with clang currently means overriding TOOLCHAIN and
> the KERNEL_* variables in a bbappend. The kernel builds, but modules and
> make-mod-scripts keep the gcc defaults and run the shared kernel build
> tree with the other compiler. kbuild then re-runs syncconfig against the
> shared .config and silently drops compiler-dependent options: a
> CONFIG_CFI_CLANG kernel loses kCFI as soon as any module is built.
> Documentation/kbuild/llvm.rst requires the same toolchain for every make
> invocation against one tree.
>
> This series adds a KERNEL_TOOLCHAIN switch so the kernel, modules and
> make-mod-scripts move to clang together. gcc remains the default.
>
> Tested on qemux86-64 with clang and gcc: both toolchains
> build linux-yocto, make-mod-scripts and cryptodev-module, the shared
> .config stays consistent across module builds (also with ld-is-lld),
> and core-image-sato boots.
>
> mark.yang (3):
>   module.bbclass/make-mod-scripts: inhibit default dependencies
>   kernel-yocto: export CLANG_FLAGS for the kconfiglib config audit
>   kernel-arch: add KERNEL_TOOLCHAIN for building the kernel with clang
>
>  meta/classes-recipe/kernel-arch.bbclass             | 13 ++++++++++++-
>  meta/classes-recipe/kernel-yocto.bbclass            |  7 +++++++
>  meta/classes-recipe/module.bbclass                  |  5 +++++
>  .../make-mod-scripts/make-mod-scripts_1.0.bb        |  5 +++++
>  4 files changed, 29 insertions(+), 1 deletion(-)
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#240415): https://lists.openembedded.org/g/openembedde=
d-core/message/240415
> Mute This Topic: https://lists.openembedded.org/mt/120168206/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

