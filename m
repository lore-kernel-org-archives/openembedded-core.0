Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8ED5C636D6
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 22:40:32 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.28195.1676932825331732214
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 14:40:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BhMo87sR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id l38-20020a05600c1d2600b003dff4480a17so1272237wms.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/8+jaGBoZpKpnWbb9d6Mb0sJ+yWq1zNDcTE/MnWz2k=;
        b=BhMo87sRGJZcj7PWdbdJxDnJshC0muZDrejeNFg0gXT3ZFkkOBeKySuUHwdEf6ok2t
         icissJUA6+sgkZGb9xAJT/GbQ1KttBK0R8yIcRypQCxqzNl3vvu+td7669vLBU0CzqUn
         x7mNL229Clxaco1fFXZD+3rW5OrnKxeAubH5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T/8+jaGBoZpKpnWbb9d6Mb0sJ+yWq1zNDcTE/MnWz2k=;
        b=b3Bla6qRCtpdTwHK/HRZaPeZSPwv5z3RZwz48nytELHgBx4P9irDWcZCy9Vk+xK+5y
         AEcFORdn+ATFlJx4jVLAEJzsnuemwVowSmjo3Rr0sPHpnqTlFc8H7Vg/nnvob8IWqeFb
         +Dvh1aNe3HpgJVbMm86asTzlQpqlvQJ7ZjPQyfn9kBRF6asteIWGuSizhLDe6e/vOrvU
         w7a3C+ADGkfQPtZ+S8OiIFykPaxT1H9Og5sruMihqfG3hYfsB9w6bs0VPVa9w+igFvRH
         x0LtsVAqahuNQKkXGMkJ0p3vDwlaIJR7xkKMUyyO4c8s306IZWl1eRzcps8xWjhq7Gw9
         JnfA==
X-Gm-Message-State: AO0yUKWlI4HbPjF7HaU9F1wHfR+p2aK9cfxlRE2TJ8orGMInlSmdXyUJ
	lbwd2cFnB165atrYROcwL1N1QQ==
X-Google-Smtp-Source: AK7set8vRIGE9cy6HetRGviI7QB06qKlH8Dz5OHyTKi+VF6jwO6pHnpxpAfGUmYP9W5Li9rvLYh3DQ==
X-Received: by 2002:a05:600c:4486:b0:3e0:185:e916 with SMTP id e6-20020a05600c448600b003e00185e916mr7622209wmo.13.1676932823535;
        Mon, 20 Feb 2023 14:40:23 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:caa8:c89f:773b:f6d6? ([2001:8b0:aba:5f3c:caa8:c89f:773b:f6d6])
        by smtp.gmail.com with ESMTPSA id t23-20020a05600c2f9700b003dc521f336esm1815698wmn.14.2023.02.20.14.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 14:40:23 -0800 (PST)
Message-ID: <3a22927134f9d2466964a0c66e4bac70a7e0a8ab.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] package.bbclase: Add check for /build in
 copydebugsources()
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <Saul.Wold@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 20 Feb 2023 22:40:22 +0000
In-Reply-To: <20230220213022.2898796-1-saul.wold@windriver.com>
References: <20230220213022.2898796-1-saul.wold@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 22:40:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177477

On Mon, 2023-02-20 at 13:30 -0800, Saul Wold wrote:
> This is needed when the SDK or eSDK is installed in a /build top level
> directory as it conflicts with the build directory within the existing
> /usr/src/debug/build (which is really a link). Rename it and then do the
> copy,=C2=A0
>=20

> this is not an issue with master currently due to some other
> changes that occurred in master.

Is this an issue in master or not? I can't parse that! :)

Cheers,

Richard

>=20
> Fixes: [YOCTO #15026]
>=20
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>  meta/classes/package.bbclass | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 8b11fdd155..2950218145 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -636,6 +636,13 @@ def copydebugsources(debugsrcdir, sources, d):
>          # Same check as above for externalsrc
>          if workdir not in sdir:
>              if os.path.exists(dvar + debugsrcdir + sdir):
> +                # Special case for /build since we need to move into
> +                # /usr/src/debug/build so rename sdir to build.build
> +                if sdir.find("/build") =3D=3D 0:
> +                    cmd =3D "mv %s%s%s %s%s%s" % (dvar, debugsrcdir, "/b=
uild", dvar, debugsrcdir, "/build.build")
> +                    subprocess.check_output(cmd, shell=3DTrue, stderr=3D=
subprocess.STDOUT)
> +                    sdir =3D sdir.replace("/build", "/build.build", 1)
> +
>                  cmd =3D "mv %s%s%s/* %s%s" % (dvar, debugsrcdir, sdir, d=
var,debugsrcdir)
>                  subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubp=
rocess.STDOUT)
>=20

