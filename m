Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D6BC5B572
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 14:46:05 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7762.1787409961057908879
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 07:46:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GMVamw/G;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-52d37b65926so8987521cf.2
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 07:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787409960; x=1788014760; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f4dQAWv5GVBkF5N9m9QbepaRRUkdWLYL1zlnmQja+Yc=;
        b=GMVamw/GlE/yb8RSPTzXk74fHjWLfGLXNjaF3HT+czE5Ayw9Hdadun3TixpHmQMZF8
         L4veNeO7n/cJo0PjSp+NXPPJ0PzEz53hi2DSePqDHkEXVGZzph/K+iZqBhe2OfevoWZ/
         KxWXtjpBOod5gYKCzQurHlmRtYDBl8Cb4tvuk9XBjAnuPd6pDSF/AACsk0uv88/o4h3e
         VYyIKKbYy6UikAcLE3G0dRJGCSGtd/O9i4JnidPgcpbvTVi9h40MwkU5ESsbMMN2XR6s
         WgSRr5jIog63pcCyUNAM3g0vqOW5R1F6sBBK4fX8YhCM+X64xxZcLvEN12vtIbg8bDjK
         Unaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787409960; x=1788014760;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f4dQAWv5GVBkF5N9m9QbepaRRUkdWLYL1zlnmQja+Yc=;
        b=dELFevR9GFVZys4dyZ7kTBfRH0AE084mttUNaBPahKtpGSC4FybBYb+CAfann52gM4
         kGDT4/5xQwbT4XiKdtU3znJx+63vXAvlDeM8WqBI9DlVRI1QhEcua/T9W+MB0hf65POr
         LrHx2+lH9Gb6ZOoRvLLjQaZT7ZM0Z1gdaGVHCDmVW9AA8wCQWgqokW68XAvJ4ldXLrRo
         yZ6JBjNVYCIJrojUFZWsyD9pQSZRbSeZX5OOa/7oIQ7nFOCnmJ7Oo+SZOG+p8Ft0W+80
         HKdnJXREGxLImESZdBDU8TYqVgJHAQAxqITZod7HvhUbxx60LeyXlNylwMe6jVcrj4DR
         Hzag==
X-Gm-Message-State: AFuF++kYx2/oliTH/7cHSx1btg4pgzaDHVFQvYOKCvAOlwR2yHGIFFod
	5G/Q3RVYgHywG7KyurbGKS4BW9ZSER0xXpHTTPNxJuPxphIJP+SqKdlm+XVqyQVx
X-Gm-Gg: AR+sD11Y+Lr2W7epsAMkbaIyPJkdrzbyKBVgzGqk/aBd7HVnS/IdKkEbrnHlfFB7dcq
	2PZekTeEfJxxclMmsRiawgs/wVInFjS8DeJj3XM+Xz2Gw1nJnDk3J1L/1hJtTOKmfLe6uPIjvXN
	GG5PEwJ9mgtSB6G6kCR10lP8p7qXevn+O3cgtpGam4U5DWyF9wOaGoJ8r46rK7ofFTceBNRm2hU
	9+IYgui8xf3nF7mOXVUJM++1lT0Otkr3J/MV8pdrv3jFBMDeVZReXIch28d42TGaJsV9ph/wZAI
	a6irDpyF7OqvVv1z5b7zwuLxlzgEp7Z/iuXAQeSEo8TdyVc2SdgUJSrUL4U9wWSsL15Jirs612X
	7OC1ejj6AO0HbKAFQK/NJb6aEaZUlS2frSrpDQi6+myYd17koeBMV8JSAmFqBwA9cHiBjqGx09A
	PKhUpV0WMDYZ+/y43hF1iAMG1QG24x/mwgNWh3v9z+utjy50pqCoIqjGrJa9iNfzHL1eWc7iJNX
	dEwIdMkeW1cuOQpylHiIWphKCAlJhM=
X-Received: by 2002:a05:622a:a12:b0:52d:f12c:59ba with SMTP id d75a77b69052e-52df5a3d5b1mr131196981cf.33.1787409959888;
        Sat, 22 Aug 2026 07:45:59 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e0996b4a2sm15176271cf.3.2026.08.22.07.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 07:45:58 -0700 (PDT)
Date: Sat, 22 Aug 2026 10:45:56 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com,
	Harish.Sadineni@windriver.com
Subject: Re: [OE-core] [PATCH 2/2] toolchain-scripts, oeqa/sdk: build the
 kernel's host tools with a host pkg-config
Message-ID: <aom2JAFEPijstuHB@localhost.localdomain>
References: <20260805065718.3497815-1-twoerner@gmail.com>
 <20260805065718.3497815-3-twoerner@gmail.com>
 <50d7d13a895765f87612109f737f012d43ecceb6.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <50d7d13a895765f87612109f737f012d43ecceb6.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 14:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243986

On Thu 2026-08-13 @ 03:04:04 PM, Richard Purdie wrote:
> On Wed, 2026-08-05 at 02:57 -0400, Trevor Woerner via lists.openembedded.org wrote:
> > The SDK environment sets PKG_CONFIG_SYSROOT_DIR, PKG_CONFIG_PATH and
> > PKG_CONFIG_LIBDIR so that pkg-config answers for the target. That is
> > right for everything built to run there and wrong for a program built to
> > run on the SDK host.
> > 
> > The kernel build compiles host tools of its own, and objtool asks
> > pkg-config where libelf is. It gets the target's include directory,
> > compiles a host tool against the target's C library headers, and stops
> > on warnings that -Wno-system-headers would otherwise have covered:
> > 
> >   usr/include/sys/cdefs.h:486: error: "__attribute_const__" redefined
> > 
> > Export a HOSTPKG_CONFIG that undoes those three variables, and pass the
> > same value on the make command line when the test builds an external
> > module. Both halves are needed: the kernel assigns HOSTPKG_CONFIG with
> > '=', so only a command line assignment takes effect today, and the
> > export is there for kernels that assign it with '?=', which is proposed
> > in
> > 
> >   https://lore.kernel.org/linux-kbuild/20260805055438.3482019-1-twoerner@gmail.com/
> > 
> > OE-Core already does the command line half for its own kernel builds, in
> > kernel.bbclass.
> > 
> > Fixes [YOCTO #16239].
> > 
> > AI-Generated: codex/claude-opus 5 (xhigh)
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> >  meta/classes-recipe/toolchain-scripts.bbclass | 3 +++
> >  meta/lib/oeqa/sdk/cases/kmod.py               | 7 +++++--
> >  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> The kmod test piece of this is probably ok, as you say, we do that in
> the kernel classes. I do note that the kernel class redirects to a pkg-
> config wrapper and perhaps the kmod class should match, rather than
> doing something different though?

Agreed. I just sent a v3 that does that, so the test now passes the same
wrapper rather than spelling it out.

> The toolchain piece is a but more of a concern since we're encoding
> kernel specific variables into the generic toolchain environment file
> and in general we don't want to do recipe specific things there...

Yes, and it is dropped. My v2 crossed with this email and already does
this.

> Cheers,
> 
> Richard

