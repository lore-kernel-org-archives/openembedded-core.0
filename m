Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BEFFC35FFC
	for <webhook@archiver.kernel.org>; Sat, 22 Mar 2025 06:51:12 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.5165.1742626264426387912
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 23:51:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D6BWUJFA;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3f94b7bd964so1740012b6e.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 23:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742626263; x=1743231063; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rxmfu7bz6c2KDtpx37LBgXKUgxDpGM7F8kfx4KjBFvs=;
        b=D6BWUJFAOlF/B8EF6GsEG34wkDNAomKA1146v+iKjJ28XJns5csO6lqxzb+2bH3e4e
         MpOXWagmv7V4je/pf8CBG+mJHxmIMMo+/YsIASilQaEXdCh0IVCOFe/P4K9ssyAnYbZs
         KXG3krlY2+A+yjAkr4MOUDaIE/2XEbdWpXmZMOqKjMqm7AxB8jOcztppszFB8tnRqght
         x2xCnX00koXpbPf7OsiEK4Tcv5C8J5eqBevzJIx7UaT897tA1EL7Hu5O78AZXoCRcj8u
         DaLqv3ktCvomAP3yYXDlEKXg6A5kEmpP7wWYNZFcT0qUfjHjsJ0N7zyeaZBWBJW9Wy4s
         4NwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742626263; x=1743231063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxmfu7bz6c2KDtpx37LBgXKUgxDpGM7F8kfx4KjBFvs=;
        b=c5VcwF/MsdAp5Nfc26sIMe9pt5aPNC3Jg+1Iv07qwyaJeG+rFvaEtzL/R+rKyx4NUa
         cvOWeiesNc4LIoMzY5evXytBOVfaoTOGYGJBcR6e1GIl7o+NzPPRQ9INUJvIFp+5TO+H
         zo4F5PYt/FXqOU3ulDmuD0C1n16rJs/pb+yZdlkb4BW3N0bFqdnC6RlIxLsB+LSc0y/m
         lhQV4CF3nwkyg755bvtn7NAyZBCeUkciu9aSRhf5OEtvP6JSxpm1sgHV+QDcZch7uqDI
         VZix6dkczr8txw3kHDINJusEmZ+QsQklDC3TqY1iTwrdKSjdgYD1SI8C/fgexPulu71P
         yRkA==
X-Gm-Message-State: AOJu0YxP6kmfcPBOTn7GS9SvNX5Y/a+PuAcelEUL5hk52xAtqYWA31mT
	z8WhrsUNBSjabGgr+hAp+o9ClvSs2wCdN1r47WwRJlL+GQXSaQMcttUxKqm9HyGu65EzGjp+vE4
	042adXs7fb2GWnixT3g6XeqprP2Y=
X-Gm-Gg: ASbGncsqUAMP/q3scqPySSbynxVxrAVNIVBfqiU1B2VF0wHCm8I9mCr0FTEeAYtqQYC
	bug1q+EojOheKfkmXNdNeyJkScGHlL8qTvFl8OUCvip5lUGvEhQpEilwqp771K9Y4M3VkuEfa7D
	EiCIe4e22kLZttcn/0uAy1uHdC
X-Google-Smtp-Source: AGHT+IGUDlrWNxYaewXngYtvwA9Z+lo6Qpw1V7xItAwR2yfmwzL28sPU71toaG95GaQXTymm3vWossqR5FYViewEnBc=
X-Received: by 2002:a05:6808:1a12:b0:3fb:7ac1:512c with SMTP id
 5614622812f47-3febf7481femr4294909b6e.17.1742626263617; Fri, 21 Mar 2025
 23:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250321132502.2607941-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20250321132502.2607941-1-Deepesh.Varatharajan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Mar 2025 23:50:37 -0700
X-Gm-Features: AQ5f1Jp4n9hLh2THJC3okTQf-k6vP63Jgj-qhlLUKWM_6zJYOy_73fZK2OdwmJo
Message-ID: <CAMKF1somisP6v-wJ3tG6ydH9EJ8LOJpDuWMGeWnnskdwc0yOKg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] rust: Fix bloat issue in recent rust updates
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, 
	Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Mar 2025 06:51:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213493

On Fri, Mar 21, 2025 at 6:25=E2=80=AFAM Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> Remove the "src/gcc" directory from the Rust source code to reduce the
> filesystem build space.
>
> In Rust 1.83 (and 1.84), a full GCC-14 tree was included, which caused
> the tar.xz archive to increase by 128 MB and the unpacked sources to
> grow by 1.3 GB. This was an upstream error that has been resolved in
> Rust 1.85.
>
> After updating to Rust 1.85 we can revert this removal of "gcc/src"
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  meta/recipes-devtools/rust/rust_1.83.0.bb | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/meta/recipes-devtools/rust/rust_1.83.0.bb b/meta/recipes-dev=
tools/rust/rust_1.83.0.bb
> index cd470b1883..aaf35692ab 100644
> --- a/meta/recipes-devtools/rust/rust_1.83.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.83.0.bb
> @@ -50,6 +50,16 @@ setup_cargo_environment () {
>
>  inherit rust-target-config
>

Lets add a comment here to remind us about removal with/when 1.85 is brough=
t in.

> +do_unpack:append() {
> +    import os
> +    import shutil
> +
> +    # Remove gcc directory after unpacking
> +    gcc_dir =3D os.path.join(d.getVar('S'), 'src', 'gcc')
> +    if os.path.isdir(gcc_dir):
> +        shutil.rmtree(gcc_dir)
> +}
> +
>  do_rust_setup_snapshot () {
>      for installer in "${UNPACKDIR}/rust-snapshot-components/"*"/install.=
sh"; do
>          "${installer}" --prefix=3D"${WORKDIR}/rust-snapshot" --disable-l=
dconfig
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213451): https://lists.openembedded.org/g/openembedde=
d-core/message/213451
> Mute This Topic: https://lists.openembedded.org/mt/111827574/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

