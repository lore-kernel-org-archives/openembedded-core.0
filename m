Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C89DC36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 22:28:16 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.52623.1742855293110667235
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 15:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ElnMCfwL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso32039625e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 15:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742855291; x=1743460091; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cnqP9YVo6OuvEEjTBRo3l9a/Tgha5+WfQaTMqDBhYYU=;
        b=ElnMCfwL0U7hXX08rno4hV2Tl8RppGx8qCXdg6I7KuCJSPCY0QuHL6Uw2aUcw0d+/U
         SzS+73aRJ9JAXjD9LmRC+dWVzLPVlhwSsFlPIRX8W185txXnIiionJMdljhaRx8kJNIk
         AQ8Jmb1Ttkmm2YzhWz+o/aTiHvsD1NjLrMrOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742855291; x=1743460091;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cnqP9YVo6OuvEEjTBRo3l9a/Tgha5+WfQaTMqDBhYYU=;
        b=mV/Hv8VeXmdyVyCo+qE26XX6tx+abSOzNtDybEig4xca7X06XjTG96E+GaAhzgft5L
         7mf3s3m99vcirj36NK6v2zFanormZVENgQ61uWmVDDfRisyxNcV/Jm6feXLjVFoli+nz
         dHuHa1nD/gVAu6pqvoS1r3NNZ9sX96Gqgy9cBeOQkl4zPW6vuqQFLfgwhZncdJmEvm17
         IEeD4vg3wc5MkzQmXedp9IOiKaSm+FS7jemw5XYjG2t0aq57Qke8xUB5QwO67BJcsa5K
         AS3yOGGugIyf+C6Qra9uqXpsKCMsEGx4H3jkBqDwOpiXCoLRBvRxs8wPzHVVG8kuQHUa
         CliQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf7wPo69f+WamvvwNdz5RQqfaarXEsrhTVFAsy4HvfsEoIinH68GeUhjn007En6t6VIu0kE+NywnRwNtdD1jszVA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz9O2Kq78/u9v7aF97DDADkqlrzkhNDFiKMnGJeN/vCBjd61leS
	yTZVUrPy7CGmkb9/u7SzTUInRNsjHiZWJ8IW706GC7LerchJN8s6q8XSnEldX468O23FU40KSxG
	f
X-Gm-Gg: ASbGncswG9bZo59slMvdoqWQgXje936ajtX92uF/wTXWxfMYcSmo5NIdhTpcX2ov6ck
	FIne6BV9TZ2wdq/LI57hcjLOZDTsEQvWGo2nmQlyD2cV1KON+Qm8ASns9MCVrZ7zj1xi/cGliAw
	fw69Fp5Kh5uWoH7xKYSH3QLstTfgYn7dZJ8O1egM5AA4cFjLfjAP7xboM0BqESa1ydmw4/KRcrd
	4JTgi7WNnB6OGKvIWaphxg1L62D4tYnFxdLR61yPZSD28gQE8ZgKxOSiouLK32ZJMyHcdqKIcAv
	BBFqGwDn/c3Bg1dQFkFxCY7UXMvLJ1nwjFUwzscn2CYyn23AurSkO7IROnCU3SjOYGQqantL88c
	gShYGNLeO4yQ6Pf9l15EZupexelbyowehzw==
X-Google-Smtp-Source: AGHT+IHPVZ7hXi0jEZI6BLIpQ5t94mmt0tso/i0TcbSjuL8lCbbO6LPClN4RtQdAuTi24jhIZ64oMg==
X-Received: by 2002:a05:600c:3c9b:b0:43c:fffc:786c with SMTP id 5b1f17b1804b1-43d50a319a3mr134456975e9.19.1742855291463;
        Mon, 24 Mar 2025 15:28:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a60f:7d04:efa2:677a? ([2001:8b0:aba:5f3c:a60f:7d04:efa2:677a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f43ecbsm182390995e9.10.2025.03.24.15.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 15:28:10 -0700 (PDT)
Message-ID: <3b9316c9aa4a857ecfb79f191bf766286b292548.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/5] rust: Fix bloat issue in recent rust
 updates
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: deepesh.varatharajan@windriver.com, 
	openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Date: Mon, 24 Mar 2025 22:28:09 +0000
In-Reply-To: <20250321132502.2607941-1-Deepesh.Varatharajan@windriver.com>
References: <20250321132502.2607941-1-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 22:28:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213584

On Fri, 2025-03-21 at 06:24 -0700, Varatharajan, Deepesh via lists.openembe=
dded.org wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>=20
> Remove the "src/gcc" directory from the Rust source code to reduce the
> filesystem build space.
>=20
> In Rust 1.83 (and 1.84), a full GCC-14 tree was included, which caused
> the tar.xz archive to increase by 128 MB and the unpacked sources to
> grow by 1.3 GB. This was an upstream error that has been resolved in
> Rust 1.85.
>=20
> After updating to Rust 1.85 we can revert this removal of "gcc/src"
>=20
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
> =C2=A0meta/recipes-devtools/rust/rust_1.83.0.bb | 10 ++++++++++
> =C2=A01 file changed, 10 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/rust/rust_1.83.0.bb b/meta/recipes-dev=
tools/rust/rust_1.83.0.bb
> index cd470b1883..aaf35692ab 100644
> --- a/meta/recipes-devtools/rust/rust_1.83.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.83.0.bb
> @@ -50,6 +50,16 @@ setup_cargo_environment () {
> =C2=A0
> =C2=A0inherit rust-target-config
> =C2=A0
> +do_unpack:append() {
> +=C2=A0=C2=A0=C2=A0 import os
> +=C2=A0=C2=A0=C2=A0 import shutil
> +
> +=C2=A0=C2=A0=C2=A0 # Remove gcc directory after unpacking
> +=C2=A0=C2=A0=C2=A0 gcc_dir =3D os.path.join(d.getVar('S'), 'src', 'gcc')
> +=C2=A0=C2=A0=C2=A0 if os.path.isdir(gcc_dir):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shutil.rmtree(gcc_dir)
> +}
> +
> =C2=A0do_rust_setup_snapshot () {
> =C2=A0=C2=A0=C2=A0=C2=A0 for installer in "${UNPACKDIR}/rust-snapshot-com=
ponents/"*"/install.sh"; do
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "${installer}" --prefix=
=3D"${WORKDIR}/rust-snapshot" --disable-ldconfig

Thanks for the patch, it is important we fix this. Unfortunately this
change isn't quite enough. We need to apply it to all users of the rust
source, so it needs to be in the rust-source.inc file, not in the rust
recipe.

Secondly, this would be better done as a postfunc for the do_unpack
task, so it can be a separate function rather than a append. For
example:

base.bbclass:do_unpack[postfuncs] +=3D "create_source_date_epoch_stamp"

Cheers,

Richard

