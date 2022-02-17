Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E686C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 18:08:40 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web12.236.1645121319127728644
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 10:08:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=lS1viYtq;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.169,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f169.google.com with SMTP id de39so5503041qkb.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 10:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=RWDX7l6u15PyR17gxR0ZQgBvxN6fK2e2W9CsgJmXXoE=;
        b=lS1viYtqdf/bJh94fCSdK+pZUZpQmLDp3b2+/UDk80A6mOHfMyzIZvnQFn9BF95Qk8
         QORDFuCIL7uJnxCnb7DwfJxXfPDoyWoJ4RtSe8tCdLTzUEnSLXIaV8uGpbl68zuLoa+0
         gG6KJwQXmqxCqTMXmXTz60pTznUbAT2AZIdKv3miaTPAsHHO0+IXWj6b+BmoXzmO6Ji9
         lv/LtksTATmwLgs1RjSO2rrBnuNMiIRqUOC8V2wikz7LZZ0cNfxBNor3xbjrYvNHsO+V
         EGVtzEaY+2/iBsALNcZa1rW6WsHYoBH8PcugPvjLj12phCsG9ZB0sysZy4CwsDqwC+/f
         0Nfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=RWDX7l6u15PyR17gxR0ZQgBvxN6fK2e2W9CsgJmXXoE=;
        b=VFAkEchhJ64Fh1Wxt7UhWEYtY2/0zJIj/2oZJNbK1j8UBf4XueNMv7v61lU/Wxwilo
         JoCawEirpuWzOnNwX7IaAhmOBWUPJ4z4Od7y00wV3JqiEw0Mff1CsSYtJlnPbBqLQdal
         P8zxwlgZdH7g9goQFXCWk27n5ujPvN+YParnX5YRAybegIWtpkln6bf96IXhtV9N5mXI
         eUVdKGRSAm/mjLTJ31GOXgsaWgJwtuxyvV0dvUT8BncZzvf96X/7VR23hYjum5s69Q06
         cGAr3pzqICn30/ypBbZCKu4i5yOiqg+/hpOHrCc32mGwIfE5rLX/B9LyhJvI2JvKKdcm
         8THQ==
X-Gm-Message-State: AOAM532e5q8E6pw9jwvOdmLxTulpQUyAEOpgp9p0Ig53VCgFmouRJhjS
	BJIiW0KCP1oHRnTtfk4Mfxd3TO6JtDBEsH8o
X-Google-Smtp-Source: 
 ABdhPJzk3/DkrT/gBWwq/MAhMDoxPNzImG3tVLjv9fybA51cVN/gGLa35x/yPRFdZIcJUyqRwrWShA==
X-Received: by 2002:a05:620a:2707:b0:60d:f0f0:37bf with SMTP id
 b7-20020a05620a270700b0060df0f037bfmr1122484qkp.629.1645121317798;
        Thu, 17 Feb 2022 10:08:37 -0800 (PST)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com.
 [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id
 x13sm21661594qko.114.2022.02.17.10.08.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 10:08:37 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f181.google.com with SMTP id b22so5508138qkk.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 10:08:37 -0800 (PST)
X-Received: by 2002:a37:95c3:0:b0:5f1:87b3:e83e with SMTP id
 x186-20020a3795c3000000b005f187b3e83emr2420984qkd.735.1645121316992; Thu, 17
 Feb 2022 10:08:36 -0800 (PST)
MIME-Version: 1.0
References: <20220217141735.3776221-1-andrey.z@gmail.com>
In-Reply-To: <20220217141735.3776221-1-andrey.z@gmail.com>
Date: Thu, 17 Feb 2022 15:08:25 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKqsBzCUm1C=xpumh6H=ucw-iy2W=ou9qKKOwgsjvAWPEw@mail.gmail.com>
Message-ID: 
 <CAP9ODKqsBzCUm1C=xpumh6H=ucw-iy2W=ou9qKKOwgsjvAWPEw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] waffle: add wayland-protocols when building
 with wayland
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b6433105d83aa7ff"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 18:08:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161851

--000000000000b6433105d83aa7ff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 17 de fev. de 2022 =C3=A0s 11:17, Andrey Zhizhikin <andrey.z@gmail=
.com>
escreveu:

> When 'wayland is selected in ' DISTRO_FEATURES, following build error
> occurs during do_configure:
>
> | Run-time dependency wayland-protocols found: NO (tried pkgconfig)
> |
> | ../git/meson.build:120:2: ERROR: Dependency "wayland-protocols" not
> found, tried pkgconfig
>
> Add "wayland-protocols" to PACKAGECONFIG to resolve missing dependency.
>
> Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--000000000000b6433105d83aa7ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em qui., 17 de fev. de 2022 =C3=A0s 1=
1:17, Andrey Zhizhikin &lt;<a href=3D"mailto:andrey.z@gmail.com">andrey.z@g=
mail.com</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">When &#39;wayland is selected in &#39; DISTRO_FEATURES, followin=
g build error<br>
occurs during do_configure:<br>
<br>
| Run-time dependency wayland-protocols found: NO (tried pkgconfig)<br>
|<br>
| ../git/meson.build:120:2: ERROR: Dependency &quot;wayland-protocols&quot;=
 not found, tried pkgconfig<br>
<br>
Add &quot;wayland-protocols&quot; to PACKAGECONFIG to resolve missing depen=
dency.<br>
<br>
Signed-off-by: Andrey Zhizhikin &lt;<a href=3D"mailto:andrey.z@gmail.com" t=
arget=3D"_blank">andrey.z@gmail.com</a>&gt;<br></blockquote><div><br></div>=
<div>Acked-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.b=
r">otavio@ossystems.com.br</a>&gt;=C2=A0</div></div><div><br></div>-- <br><=
div dir=3D"ltr" class=3D"gmail_signature">Otavio Salvador =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 O.S. Systems<br><a href=3D"http://www.ossystems.com.br" target=3D"_b=
lank">http://www.ossystems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D=
"http://code.ossystems.com.br" target=3D"_blank">http://code.ossystems.com.=
br</a><br>Mobile: +55 (53) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mo=
bile: +1 (347) 903-9750</div></div>

--000000000000b6433105d83aa7ff--

