Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F044C04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 19:02:09 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web09.36815.1659034921942197054
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 12:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=pbUG7wWp;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.170,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f170.google.com with SMTP id v28so2102419qkg.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 12:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=tQ4BqL6Pdg1xfwH1Wijz5vHWs9A9fR/IA52z7w1NZ+c=;
        b=pbUG7wWpea7VhsTdXmslNwNhL9rOoqwrPr+WT0PUZSH0VYPo3eY9qAO3yN+pAbQp+J
         SAol/tlWmCfJjtyrgZT4RUrEQGGjKWiA3jJ57mm65QJ3HLr2/Pe6niW8fwQYySjOz6FG
         GWeNTcAJRPEmdCf5EwtkFr/xN7xRroUVkulPStRnz+emgV7BiY96NVS7CynIUCOToj+8
         FFYgkPUcMA/+ZK0TjpFdn1RR2310uXscj4URN8VrWvHin1pLaHvWcZjNP7YaV6NsYyX1
         61iXGe0B6ZjIBBKJRGGWxqNffS4o/NdI8X6c5q7hF91GJjEbrB+kTgp4hOq98Vt2OOPL
         Rn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=tQ4BqL6Pdg1xfwH1Wijz5vHWs9A9fR/IA52z7w1NZ+c=;
        b=f6drJO0khssixqGD+N01JcsmVcvlO7rTTk/q0mxUuBH/cV6U54IluCdTuvYPFwwjgD
         ybni4xD394ZZxEKAJHtW8EH5k/JXlBL/yjOJNB9fJu32SmhcI/wHsc9uWfuTftW+N1hc
         ura/d9PfKjccuDmU7jH+vzSSZyJ2CiS56dlbP6RPiIlkLxGCiJ3ZNH9ZnRhQuVsjgs5C
         gMBBWGXuUI5pOI70g3gVyiPmVMGhpzDWNWViT/fa2O4Ypf7+gW2pWeXSy0lXJSMrltq6
         oAZvoSRAUi8KoePgMk7QBjlDH88JyW6Q/TWZbbsDH6T73l5MPIJKlkjkki7t71f5ATxp
         0QoQ==
X-Gm-Message-State: AJIora9uzXxpZsMpT4BLGIbnFWXmr50YKoA/fit4LNkS4Q+uCJ1G/YNI
	e+Mgws4xNjggWgNb8SOZOLu7KkdS76XTCYV1
X-Google-Smtp-Source: 
 AGRyM1uTqIXoPNJy6VgfFZ2Op6tgVzl6j3YMav641Ttpr3mJDcV+hKl+q2+Mur7fpVY6UGIUJ4LOSA==
X-Received: by 2002:a05:620a:461f:b0:6b6:63a3:72dd with SMTP id
 br31-20020a05620a461f00b006b663a372ddmr184036qkb.681.1659034920425;
        Thu, 28 Jul 2022 12:02:00 -0700 (PDT)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com.
 [209.85.219.42])
        by smtp.gmail.com with ESMTPSA id
 w22-20020ac87196000000b00304bc2acc25sm874953qto.6.2022.07.28.12.01.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 12:02:00 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f42.google.com with SMTP id d1so530059qvs.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 12:01:59 -0700 (PDT)
X-Received: by 2002:a05:6214:29cc:b0:474:5164:b4de with SMTP id
 gh12-20020a05621429cc00b004745164b4demr16839101qvb.105.1659034919689; Thu, 28
 Jul 2022 12:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220728184436.1866411-1-tom.hochstein@nxp.com>
In-Reply-To: <20220728184436.1866411-1-tom.hochstein@nxp.com>
Date: Thu, 28 Jul 2022 16:01:48 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKr72K77fxjo3JRcAq_5keBPpAK2=BkpFyY+8bv8jMXFWQ@mail.gmail.com>
Message-ID: 
 <CAP9ODKr72K77fxjo3JRcAq_5keBPpAK2=BkpFyY+8bv8jMXFWQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] uboot-config.bbclass: Raise error for bad key
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000eea1205e4e22b52"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Jul 2022 19:02:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168616

--0000000000000eea1205e4e22b52
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 28 de jul. de 2022 =C3=A0s 15:44, Tom Hochstein <tom.hochstein@nxp=
.com>
escreveu:

> If an invalid key is used, the class ignores the error, with an
> indeterminate result. In my case, the problem surfaced in do_deploy:
>
> ```
> | cp: cannot stat
> '/.../build/tmp/work/imx6qdlsabresd-fsl-linux-gnueabi/u-boot-imx-mfgtool/=
2022.04-r0/deploy-u-boot-imx-mfgtool/u-boot.imx':
> No such file or
> | directory
> ```
>
> The root cause of this was that the uboot config key did not match
> a valid option. With the fix, the error is caught by the class:
>
> ```
> ERROR: Nothing PROVIDES 'u-boot-imx-mfgtool'
> u-boot-imx-mfgtool was skipped: The selected UBOOT_CONFIG key ['mfgtool']
> has no match in dict_keys(['sd-fslc', 'sd-imx', 'sd-optee-imx', 'sata-imx=
',
> 'mfgtool-imx']).
> ```
>
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--0000000000000eea1205e4e22b52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em qui., 28 de jul. de 2022 =C3=A0s 1=
5:44, Tom Hochstein &lt;<a href=3D"mailto:tom.hochstein@nxp.com">tom.hochst=
ein@nxp.com</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">If an invalid key is used, the class ignores the error, with =
an<br>
indeterminate result. In my case, the problem surfaced in do_deploy:<br>
<br>
```<br>
| cp: cannot stat &#39;/.../build/tmp/work/imx6qdlsabresd-fsl-linux-gnueabi=
/u-boot-imx-mfgtool/2022.04-r0/deploy-u-boot-imx-mfgtool/u-boot.imx&#39;: N=
o such file or<br>
| directory<br>
```<br>
<br>
The root cause of this was that the uboot config key did not match<br>
a valid option. With the fix, the error is caught by the class:<br>
<br>
```<br>
ERROR: Nothing PROVIDES &#39;u-boot-imx-mfgtool&#39;<br>
u-boot-imx-mfgtool was skipped: The selected UBOOT_CONFIG key [&#39;mfgtool=
&#39;] has no match in dict_keys([&#39;sd-fslc&#39;, &#39;sd-imx&#39;, &#39=
;sd-optee-imx&#39;, &#39;sata-imx&#39;, &#39;mfgtool-imx&#39;]).<br>
```<br>
<br>
Signed-off-by: Tom Hochstein &lt;<a href=3D"mailto:tom.hochstein@nxp.com" t=
arget=3D"_blank">tom.hochstein@nxp.com</a>&gt;<br></blockquote><div><br></d=
iv><div>Acked-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.co=
m.br">otavio@ossystems.com.br</a>&gt;=C2=A0</div></div><div><br></div>-- <b=
r><div dir=3D"ltr" class=3D"gmail_signature">Otavio Salvador =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 O.S. Systems<br><a href=3D"http://www.ossystems.com.br" target=
=3D"_blank">http://www.ossystems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a h=
ref=3D"http://code.ossystems.com.br" target=3D"_blank">http://code.ossystem=
s.com.br</a><br>Mobile: +55 (53) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Mobile: +1 (347) 903-9750</div></div>

--0000000000000eea1205e4e22b52--

