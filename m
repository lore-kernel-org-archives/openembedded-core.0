Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 365E1C624D4
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 22:47:07 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8109.1788389216972982706
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 15:46:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EFJlhkil;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b965570d7so15142965e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 15:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788389215; x=1788994015; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6UsQxytu1s6ErdXApgKBAfvAy43wk3MVFnwk2GSg9Rw=;
        b=EFJlhkiljpTsF/4aYwZI8I/q8foh/v3FFq/TlqaYN+qaszcdoepU/IqwVSOSMSOLBV
         kQCVhc+YPaGha8ZoKLfewIBb837dNE099lWZDtvjqM23t/Jv3DTRoNAMSoEjalGw/+vg
         v9PTrhF4YQuo/mmFCTaeceIX9txeCT771LEX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788389215; x=1788994015;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6UsQxytu1s6ErdXApgKBAfvAy43wk3MVFnwk2GSg9Rw=;
        b=FB3RGc+mrjPR0wWcHIhIQ+YjEaGG5vO+CUUknyCHs2EmXcdrEzukAS1OWoX1XSsCTC
         ZUMv5tyPswFaqd3gH/VcnK+YZjBkQZ4GUul9yZ56fzTOH7pzT7V9UentRiWCaV4DdKgu
         VkfH70yWidgtlBYRm31yr0rYZsCH/u7sG73AG7w9VHIcU0IGVGg7fLd9CwK/buLmw0L1
         tlblku+KoYS8fmlEeOpHArp9a26uUKOa6APwh6zmSeVhKpuHXqHy5zkY2BkdYa20X8Au
         0bgGDfrqlZ0bmu8JjOvrUwwWJBzuFDGpG9jY1NpmxQqW28eHqxSodm7F89XoFQchggwn
         ytgQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/YIJpEbXOVxdvJiXZySNQhd+co47r5oN4vZKdv55cZXocyx40drzY2+2tODU12hOsdD1UzvqI0+bYihcPuWNJWQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++mrmASz21xYBS7IBf6rqoroNT57EyGncN0Hfau2sWxUB49MzpE8
	WGVQoUyZRYM2XUZa0wuwBKRY3dHGD+coFNFSlCwej2W8yZErqPkEFuYlNfluniiEg2E=
X-Gm-Gg: AYBFou2a66jGSOSAAHBh86mPmgnoF0ITNPu2sKAZO3D/W69hhT1jxyz3SzQGHbRFxsC
	zte6L2C4KtdjP0ckXypAKJBysCQj+wJpIkweeFJcEDh3FKmfq58IsPd0lmweMJZfnmZva80uOqU
	Ihz4sv3/FLtcZ+raQeX4m7FyRgBttKj/Mz/F2TlFfm3igrUGUz1nEQJnnxCefb7ni9bj230AYN3
	kAyY+yIQ9GvDF+paz5rC4ctxfLXs00uPVgkphWLTipNTaNpuwP2NIveMmwegbs2hIuXcGMZ7smG
	h3XYygqFp6FkWa5IhFbqHPCStrcdzjzBtuCwPN+PVwi+VTJ4cK3KD4X4bk1mOSXqCGa+2b55EPu
	+X56V3xSCT4M+wXuvVwyvMGhy/e+zj1dx8rlQUl36qLdncK9qaCdyLVuib58n1Yd4GkShvDTlN/
	lAOZ/wBU9ouMcxq+HfQ1jPysMMVEVk0RtHsnJ2D67KjNwlI103/qB/dcL2PCTcmDLcvDIhjQIiQ
	bqWQE0DKlGBHCO0HOScoFp43uu0/jxxSPYD3GolxHQYU2TNocxixQ==
X-Received: by 2002:a05:600c:e558:10b0:49c:e9c1:2819 with SMTP id 5b1f17b1804b1-49ce9c12842mr81996965e9.16.1788389215227;
        Wed, 02 Sep 2026 15:46:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:132b:ac98:148c:98d4? ([2001:8b0:aba:5f3c:132b:ac98:148c:98d4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm59250665e9.0.2026.09.02.15.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:46:54 -0700 (PDT)
Message-ID: <44e11d55e07f423de965992fc4821ff8573e7049.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 01/27] bitbake: globally define
 KERNEL_PACKAGE_NAME
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: vince@underview.tech, openembedded-core@lists.openembedded.org
Date: Wed, 02 Sep 2026 23:46:53 +0100
In-Reply-To: <2546320.1788388183210489037@lists.openembedded.org>
References: <20260712184307.3259642-1-vince@underview.tech>
	 <DB5PR02MB102131BF9EDB1F84965702DABEFFA2@DB5PR02MB10213.eurprd02.prod.outlook.com>
	 <953617.1784488771319074426@lists.openembedded.org>
	 <f3e758ba0987e94d70e6b2f9f4950073a9d6f80d.camel@linuxfoundation.org>
	 <2546320.1788388183210489037@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 22:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244992

On Wed, 2026-09-02 at 15:29 -0700, Vincent Davis Jr via lists.openembedded.=
org wrote:
> Hello resurfacing this,
>=20
> Finally setup a layer that builds multiple distro's
> simultaneously. It doesn't set KERNEL_PACKAGE_NAME.
> Builds just fine by changing TMPDIR in each multiconfig.
> Will run into issues like bellow if you don't.
>=20
> ERROR: mc:liveusb-install:liveusb-install-linux-6.12.101-r0 do_packagedat=
a:
> Recipe liveusb-install-linux is trying to install files into a shared are=
a
> when those files already exist. The files and the manifests listing them =
are:
> =C2=A0 /../../runtime-rprovides/kernel-6.12.101-amd-tiny/kernel-base
>=20
> I think if we want the kernel-XXX prefix to be the default namespace we m=
ay
> need to remove KERNEL_PACKAGE_NAME entirely and force user to build
> in different TMPDIR's. Which I'm fine with that. I also think the origina=
l
> ideal was to 1 allow a single TMPDIR to be used and 2 have better
> separation between the kernels when using a package manager.
> If you build 2 separate kernels, but they both have the same package
> name which one would the package manager install.
>=20
> To fix this I have to set KERNEL_PACKAGE_NAME.

Have you tried setting PACKAGE_ARCH and adding a new level of packaging
architecture to PACKAGE_ARCHS?

It will default to MACHINE_ARCH for a kernel but defining a new one
should avoid some of the clashes as above...

Cheers,

Richard

