Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA99D75E47
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 13:40:56 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.24626.1732282853886852566
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 05:40:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P+PO2/DJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb584a8f81so25044571fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 05:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732282852; x=1732887652; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+O9O/vE3Gqlr798WzBLILdkrfIS5a2Y+pPyHPs1OzrM=;
        b=P+PO2/DJQfcZ5cGyDDAdbYR6pyTFB7g+yr4zEZH/n+HbFqiu0/kXDvAsTKQUkY6TdB
         ENtwrNhR7AHQ4v+FEbF7AIAzoQkF54+3qG6hKqHB+jzd0nRzzSiXdEPfjBJ9P/6aDJic
         4OverNjRhaXsS/x0wU2vqSTDE817CQXil7JFNVyq7/E9o4vAWKb65YbeuTu/9a5ISck7
         qVXlxYJNy3Bu6gRjJpNClBA9D10Mcn1IFx+FzUokdnH2vPs3mdegunxNTW18Acv5cJvs
         9MWpdwz1au3j318hbT3F5nTCyOgjw3w7dtD2D3ZCyQ9yYHF8kpvF0+2hoHEOTXQvsjDS
         +Yyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732282852; x=1732887652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+O9O/vE3Gqlr798WzBLILdkrfIS5a2Y+pPyHPs1OzrM=;
        b=jnbSiYtftP88U9xAU4IwJnLHBmVru1yIHmwwEBFZCSxoFwlvkK3xRWf1DiFo6RtoMA
         ngnnSQXNILWifqg6LVHyPhAHgwbSYeXz9KJI6Plj3UMO14vGyklCE7zzt3NKLTlJGOPX
         VQVh+oB35QLg1QiZFaSPHwOnbsPYX4+1oxV+tiJ0PJF//Y+a/yrEXmI5c4XMDDjRdRJJ
         5AOvg6IrLYbid2LIx56Z80dw2krTCdN8I80sLU3YdLHZ+6FlKNOMC/MrmIgArd1CIG6U
         2eydPZd74pPJaOS5tCn4fUvlc5bti0pHwH7uKhk5Bn9lKFv3yY9FDt1Ct0blbyfzpcjP
         Ia5Q==
X-Gm-Message-State: AOJu0YzYL+6P7586mR1m34dIn3YxnJ+Hddtk4pNNjMEDZDzQRCMlZfhS
	X1h1Ucsh2QpSlA8io28LXGXadLQtgQ2WJGu4lE8SRyD8Lva34Nx9x1P4sQHCVg5uRhjNYh+m6tQ
	8JcMSKowQQWyl6wZcQtfik3LzqaWG9O5N
X-Gm-Gg: ASbGncsSUS2UmnEzjmkiH1O5CB+8KYrqQP2mcV45/str8xYRKsUdfvVWQkysvgT3gEm
	x8zVes+MEebtSKlQbkNAI8Ug+vMrU836FOA==
X-Google-Smtp-Source: AGHT+IGqREHbSTyZK23pyI/jBOL6g+ObGbwRqnfxsGUi/RYSUcRy+mYJc4bfWtBREymt0ZUD4tYxjADyE1hMvHeaZyI=
X-Received: by 2002:a2e:a902:0:b0:2ff:a4c6:b144 with SMTP id
 38308e7fff4ca-2ffa7180014mr17196271fa.25.1732282851673; Fri, 22 Nov 2024
 05:40:51 -0800 (PST)
MIME-Version: 1.0
References: <20241122133140.1627-1-karem.ibrahim46@gmail.com> <20241122133140.1627-2-karem.ibrahim46@gmail.com>
In-Reply-To: <20241122133140.1627-2-karem.ibrahim46@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 22 Nov 2024 14:40:40 +0100
Message-ID: <CA+chaQe5wbdQjO=KWzCEOadxexo6ke_RRaoesk1GET-Jy5V4GA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] Added a new cargo-online bbclass for
 recipes requiring remote crates
To: karem.ibrahim46@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 13:40:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207617

This isn't a fix, it's just very bad work around, see:
https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/car=
go-update-recipe-crates.bbclass
which you can use to avoid needing the network access during do_compile.

On Fri, Nov 22, 2024 at 2:32=E2=80=AFPM Kareem Ibrahim via
lists.openembedded.org
<karem.ibrahim46=3Dgmail.com@lists.openembedded.org> wrote:
>
> - This change was intended to abstract user from having to set compile ne=
twork flag to get remote crates
> - as network access was disabled by default in kirkstone version
> - I faced an do_compile error with bitbaking Qualcomm qcrosvm under yocto=
 kirkstone with message "Could not resolve host: github.com"
> - And after some hours of debugging I noticed that cargo inherited by rec=
ipe needs remote crates during do_compile of the cargo.bbclass
> - It was fixed by adding line do_compile[network] =3D "1" to the recipe
> - So I found it more convenient, since cargo build usually need network a=
ccess, to abstract users from these details of cargo.bbclass do_compile
>
> Signed-off-by: Kareem Ibrahim <karem.ibrahim46@gmail.com>
> ---
>  meta/classes/cargo-online.bbclass | 7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 meta/classes/cargo-online.bbclass
>
> diff --git a/meta/classes/cargo-online.bbclass b/meta/classes/cargo-onlin=
e.bbclass
> new file mode 100644
> index 0000000000..175c94e09d
> --- /dev/null
> +++ b/meta/classes/cargo-online.bbclass
> @@ -0,0 +1,7 @@
> +# This bbclass is added to abstract recipes writers from
> +# having to set do_compile network flag to 1
> +# if his cargo package need external remote crates
> +# as network access was disabled by default since kirkstone version
> +
> +inherit cargo
> +do_compile[network] =3D "1"
> \ No newline at end of file
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207615): https://lists.openembedded.org/g/openembedde=
d-core/message/207615
> Mute This Topic: https://lists.openembedded.org/mt/109721978/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

