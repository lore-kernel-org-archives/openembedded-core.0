Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E0D1ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 09:19:35 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.4234.1666948772068555000
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 02:19:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hC3MUnD4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id m29-20020a05600c3b1d00b003c6bf423c71so6102278wms.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 02:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBjHlMmrNNF3k3m40qBJk6OQBe0IqUQ6z0y/gS98BiU=;
        b=hC3MUnD4kh/VDgmmEsgl4lUwxfz3k2VMGP5aHaJ3HYDPv2Bqy7PQi396hHl0J9dOSY
         /FadWjr0xcSbgg62k7LQagAtnbzY3KbDNL/NDFyPeuxbUBG8bqsHUa8/wxi4qapfcLHD
         bCLHsbZxXNQDUC03AwUC7fFboLKZtcDFVMshE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eBjHlMmrNNF3k3m40qBJk6OQBe0IqUQ6z0y/gS98BiU=;
        b=YJrvM77Q2LYC1i0VPLINFborCodV2yaRAZG9tz+ESrYmnB+AN/6EHeNeKIy4l8HZzo
         8tKOLzhplVTj05v2lYaQg+3sO6KfArsA2scUObXIwXFBoAKnpKVt0Hy0A+XavLUMdPCD
         +M/SyyiYnop/MhlKaqAOgE1RYjHz8ogiI+Sm+0Hx25pqNwtFPwRpMB2R/W5e9XapCTTz
         cNhwAK5igGBf6KQR1qlK06UD2cZtB35zhcGfqOK02tqDLGvaVczEzXqQynXx+QtGN8Jx
         2tIYwmvt5HssVgnsanxM+g+AmzTYm1QXkwRZ3kLceHXUJQ/9ZYFEoa5ehalDENwxARRW
         BZVQ==
X-Gm-Message-State: ACrzQf0iF2wUTV0wQVVMaL+YWRP2eSGD0RHZSq9G3Ia6jUUOHgabiwNh
	Y0TGJA9N/uqTpUNAzgBLtXwoGg==
X-Google-Smtp-Source: AMsMyM4TJoTbiLDJEro54sG/tP5OgdfdJrb4l0MgxX3t7oF/wSW/IbI4Qe/z2GyOzKe0AUtUqi+x0g==
X-Received: by 2002:adf:f9cf:0:b0:236:6a26:c055 with SMTP id w15-20020adff9cf000000b002366a26c055mr18435260wrr.195.1666948770247;
        Fri, 28 Oct 2022 02:19:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a0a9:5e25:6ede:d416? ([2001:8b0:aba:5f3c:a0a9:5e25:6ede:d416])
        by smtp.gmail.com with ESMTPSA id o7-20020a5d6847000000b00236545edc91sm3208323wrw.76.2022.10.28.02.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 02:19:29 -0700 (PDT)
Message-ID: <7da31600351db0da8ccabe7b4ad490dbe4a1902c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cargo.bbclass: avoid calling which ${RUSTC}
 with undefined ${RUSTC}
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <Martin.Jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2022 10:19:27 +0100
In-Reply-To: <20221028085823.1971805-1-Martin.Jansa@gmail.com>
References: <20221028085823.1971805-1-Martin.Jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 09:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172240

On Fri, 2022-10-28 at 10:58 +0200, Martin Jansa wrote:
> * causes which help text ending in log.do_compile, e.g.:
>=20
> > DEBUG: Executing shell function do_compile
> > NOTE: Using rust targets from /OE/build/oe-core/tmp-glibc/work/core2-64=
-oe-linux/openssl-sys/0.9.77-r0/rust-targets/
> > NOTE: cargo =3D /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/open=
ssl-sys/0.9.77-r0/recipe-sysroot-native/usr/bin/cargo
> > Usage: which [options] [--] COMMAND [...]
> > Write the full path of COMMAND(s) to standard output.
> >=20
> >   --version, -[vV] Print version and exit successfully.
> >   --help,          Print this help and exit successfully.
> >   --skip-dot       Skip directories in PATH that start with a dot.
> >   --skip-tilde     Skip directories in PATH that start with a tilde.
> >   --show-dot       Don't expand a dot to current directory in output.
> >   --show-tilde     Output a tilde for HOME directory for non-root.
> >   --tty-only       Stop processing options on the right if not on tty.
> >   --all, -a        Print all matches in PATH, not just the first
> >   --read-alias, -i Read list of aliases from stdin.
> >   --skip-alias     Ignore option --read-alias; don't read stdin.
> >   --read-functions Read shell functions from stdin.
> >   --skip-functions Ignore option --read-functions; don't read stdin.
> >=20
> > Recommended use is to write the output of (alias; declare -f) to standa=
rd
> > input, so that which can show aliases and shell functions. See which(1)=
 for
> > examples.
> >=20
> > If the options --read-alias and/or --read-functions are specified then =
the
> > output can be a full alias or function definition, optionally followed =
by
> > the full path of each command used inside of those.
> >=20
> > Report bugs to <which-bugs@gnu.org>.
> > NOTE: rustc =3D
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes-recipe/cargo.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)

I've wondered about this. Lets just get rid of that "which RUSTC" call
in cargo.bbclass instead?

Cheers,

Richard

