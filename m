Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99752C982F1
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 09:02:58 +0000 (UTC)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5646.1790067776354138785
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 02:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BKryjAw7;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.228.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f705536so720783066b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 02:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790067774; x=1790672574; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PUv2NmgBEyNXNIzJzPibDhJa1x0CeF0Vmha1JNihDmM=;
        b=BKryjAw7MttQ+B9kjoEvZRcU9M1ljnOD23R79Md2qzoIP1+/9ZrTRL1hoEhUTCIhH0
         hUnUWQ5GRyTAEaCEEHlBk2UsVIiadAs1vn2HQvRgGMiGo/yLqta5w2eUXmrCLMq+aNXj
         0XughRd8LkOME2tF3st/YXvJJUPOwUd3mRYjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790067774; x=1790672574;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PUv2NmgBEyNXNIzJzPibDhJa1x0CeF0Vmha1JNihDmM=;
        b=Bbd5jpIFsEkA8gd4C/Hp91BtwfZY9QUqC438jag6LpuLmDfj4RMyQ5XkcWhSsIfz5J
         YQJjtjfkobWZM+wN829zJfVxFJUslTXgRQ9aW/PaVIKuaKrLymYXcK8SxC9eAxTqfzQR
         uCdlzIcTzJDeShbUYOYlB7MTYgwcjujrmtq5NFy2XNEFtJ5d2BHglwY0MD7IPz873BVs
         l4czL+HYn3xp942ccg9N1qCs8/7/zJzdTVohPv9DjHlmPJ6RNLLzJDt6rWzwejKy1pC+
         4utyzCEVgwm+BkhbKPL93eN9ortJauuPyAk8FZwLVkfuC7fndI2jII25BjcepaPOsG9x
         rohA==
X-Gm-Message-State: AFuF++kWel+G+HY8OQKYKJLjg3CV+Gg7Sq9CYuPqRu2JePCfImkHmNeS
	4OEcPM3xIzNcdgHOt1Pyk0a7YUIm2SAHeIuC7rWcReoy3LY34MXBv9k6j1+EXexIhi8=
X-Gm-Gg: AYBFou2Y94euWN24h9Nf/cZYfNoeu34an7B0OkdLVq1pMpb7GhMEVoBEcEA7CliFTOP
	I8lenbMul6FPCpjXC1tj2uq9FOehf1FRf68rk5jWz2i0VaKOlBsLeoISaB/w8Eew9tffJjjKx9Y
	lIc5DvKpxzmnBa4fR97Qq35P0mZ6Rct3yo1jn3GYl8FM/o5B+2y5V+ySkUZVwQY7ZLnDMXa8jUI
	IcG3mPP7JAz5pV4ffGl310qDJN9Eg4uI+aG4m80UVnVpWvRrUEV2vXfCgpk2DZX4TchCgGxPrLn
	1Zg8nOkGxfP8ArswBCzvvMIoosicdolXK69fg5U0hZbNGUdkQZlcP74Ss9czldAO/H0ipzeEltW
	UA93JkmIjNR+gEzT8jdgHW4cVA7x2A4dCLImGD4pLMyzPOuyQm936y/DFLo5VTpEZNKZhWwrpBK
	MRrl113Kor2wkEaeVkzKW8ge5meh6M5TW+hLAGnBmR33JFGz0GqWIVhZJzZFgYN34SQfUokaOHp
	pfh3q3HHTwRg4UY0biTb+7LgSRB8XFclj95AAcnGaMAynJmrh+JbEJ1dcNeoczn
X-Received: by 2002:a17:907:9703:b0:c26:219f:6f74 with SMTP id a640c23a62f3a-c2a15846232mr1034206566b.5.1790067774535;
        Tue, 22 Sep 2026 02:02:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:57db:f696:45bf:427c? ([2001:8b0:aba:5f3c:57db:f696:45bf:427c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5baa1bsm51459666b.39.2026.09.22.02.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:02:53 -0700 (PDT)
Message-ID: <39df33251804f69c7eda1cbb487b448acd4a1c94.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/2] Fix kernel complementary package
 installation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com, Adrian Freihofer <adrian.freihofer@siemens.com>
Cc: openembedded-core@lists.openembedded.org, Vincent Davis Jr
	 <vince@underview.tech>
Date: Tue, 22 Sep 2026 10:02:52 +0100
In-Reply-To: <6ab1cf58.edd6aae0.7bbc9.5d1d@mx.google.com>
References: <20260921215300.582692-1-adrian.freihofer@siemens.com>
	 <6ab1cf58.edd6aae0.7bbc9.5d1d@mx.google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 09:02:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246390

On Mon, 2026-09-21 at 17:44 -0700, Bruce Ashfield via lists.openembedded.or=
g wrote:
> Thanks for digging into this. I am curious as to what is the use case
> or configuration that you have where this became an issue ? I'm not
> challenging the question, I'm just curious as you've explained it well
> .. but didn't say how you ran into it.
>=20
> The question is real: the kernel emits kernel-dbg/kernel-dev/... after
> KERNEL_PACKAGE_NAME but the auto -src package lands as ${PN}-src
> (i.e. linux-yocto-src), so the family is inconsistent: the PN-named
> -src gets pulled into rootfs-dbg but the KERNEL_PACKAGE_NAME-named
> kernel-dbg doesn't ... you end up with kernel source and no debug
> symbols.=C2=A0 No argument there.
>=20
> Where I want to discuss is the direction of the fix, and it is just
> what you are asking. I'm not only saying this because you asked, since
> I immediately thought it on reading the series :)
>=20
> At the risk of repeating what you know already, let me summarize for
> the mailing list archive. The kernel isn't really a normal rootfs
> package, and I don't think we want it behaving as a complementary
> one. On most of our targets the kernel isn't installed into the rootfs
> at all (as you said) it's deployed by the bootloader / to a boot
> partition, and installing kernel-image into '/' is just one model out
> of several.
>=20
> Riding the generic *-dbg/*-src completion machinery to pull kernel
> debug/src into rootfs-dbg fits the recipes that live in the rootfs,
> but I think it's the wrong thing for the kernel. I'd rather debug/src
> for the kernel be delivered by a purpose-built path (the kernel
> already has its own special install handling) than teach
> oe-pkgdata-util and pkgdata to special-case it.
>=20
> So:
>=20
> - Patch 2 (PACKAGE_BASENAME into PKGDATA_VARS + oe-pkgdata-util glob)
> =C2=A0 is the part I'd push back on. Its whole purpose is to make the
> =C2=A0 kernel participate in complementary install, which is exactly what=
 I
> =C2=A0 don't think we should be doing. A dedicated kernel debug/src
> =C2=A0 mechanism removes the need for it.
>=20
> - Patch 1's underlying point: -src should be consistent with the rest
> =C2=A0 of the kernel-* family, is fair on its own. But I'd rather not
> =C2=A0 introduce a new global PACKAGE_BASENAME variable that every recipe
> =C2=A0 now carries just to fix the kernel. kernel.bbclass already names
> =C2=A0 every other sub-package after KERNEL_PACKAGE_NAME; if we want the
> =C2=A0 -src name aligned, do it locally there, not with a tree-wide
> =C2=A0 indirection.
>=20
> There's also an interaction to be aware of. Vincent Davis had sent
> (and you may have read it) a series ("[PATCH v4 xx/27] ... globally
> define KERNEL_PACKAGE_NAME") that makes KERNEL_PACKAGE_NAME variable
> across the tree for multi-kernel builds. Your PACKAGE_BASENAME is
> defined *as* KERNEL_PACKAGE_NAME, so the two are coupled.=C2=A0 We'd end
> up with two variables both encoding "the kernel's package base name,"
> threaded through packaging, pkgdata, and pkgdata-util, and each series
> would have to reconcile the other.
>=20
> That's probably the opposite of where we want kernel packaging
> complexity to go.
>=20
> My ask: let's not merge this independently. The kernel package-naming
> story, the -src consistency, whether debug/src rides complementary
> install, and Vincent's KERNEL_PACKAGE_NAME variability, should
> converge into one coherent design, and the goal for that design should
> be *less* complexity in the kernel packaging path, not more.
>=20
> Happy to help with that. But as usual, I'll defer to RP if he thinks
> this is ok independently of if the kernel should be in the
> complementary package mechanisms. I've never looked at the much, so
> I don't have all the history behind them.

I have some further thoughts.=C2=A0

* The ${PN}-XXX naming convention is important as it gives users some
kind of handle on where sources for something are. If we rename
everything, it causes more confusion as names match until they don't.
Do we want to break more of our slightly consistent pieces?

* The reason for KERNEL_PACKAGE_NAME was to allow multiple kernel
builds and to allow them to be parallel installed. This is primarily
for kernel-module-XXX style names but PN should be unique in the first
place. The intent was not "name PN not exist" but "make two kernel
builds not clash". For that reason, do we actually need to rename PN-
src? Perhaps -dbg shouldn't be renamed instead?

* Did you think about setting PKG:${KERNEL_PACKAGE_NAME}-src ? That is
an existing mechanism allowing it to be renamed on target whilst the
build system would retain some consistency.

I do agree with Bruce that injecting a general mechanism like this into
the global recipe functionality is potentially problematic. We already
have one "rename" output mechanism through PKG, I'm not sure I want to
add another in the global 'recipespace'.

Cheers,

Richard




