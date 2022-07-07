Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 499E2CCA479
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 17:21:57 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.427.1657214514480018099
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 10:21:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=mgCiY63I;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.172,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f172.google.com with SMTP id k14so23703195qtm.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 10:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=4O6KTzpsIF5qY/Bb9lU0RamQ0JgpjMNm6o5Z1KAKs6k=;
        b=mgCiY63IqxbZMWXnZ2rPQT5ZxbUI3V55hqEzRFA9qLwQ7yckaNcVMCj1IhnZv/jO90
         YzuvDjf2xMkgI7VS3JmACI+4tcsBzL6Hdz4q3ydbK2cU6enjodmVPZYfWeLDlUsM8J89
         z+XKoYx1+lszc43kOlkG5dC176CSGXhVVkHhYJODcJ0d85HyT391QN+28eC557P9A2OH
         /TU//kdVwx9k694DDro4ukpW22Cm9Ftev9yfMhZqvrvQ3N+MO4eWlp5zDbUlFBwOm5TG
         PYaI8XQPezyXl6dZZJalWQIBzTlOckE8UFjAjVVcM4ayCwIgKhashr48BlNik83Ybj1a
         3fOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=4O6KTzpsIF5qY/Bb9lU0RamQ0JgpjMNm6o5Z1KAKs6k=;
        b=UIE7bLDTpxbKhyMdEij+lD/Nu45OIybvwQX1lvM01ovhx9eq3Bw4GZNr3ZlhpJgB8O
         qtoF8ZQOyWGUHYgEkFUIRaCpJ9ggKfKdBV2KgEoDLB5JvkRWkDc2Lru+/SMXgAdYaMpC
         Yc1ZHQWi2GqGo0eIObcaBe4YtbMJ9BdQfEc3ZYpnwFZD/vok9RmYjLGQhd8iNUHqsa+L
         Q5GCjvphaIrSY052sK4kKjFc7RZxjCnsLiRgfhyY8rMRjbVgCXWSXX7j02mfG2SN3He/
         R5dDA1FHvN4s6bMJndAfKXm1rs9DOyhNuJGclgMHVZm5Zp3wsOXwV3iutnuQ0BDxhVwy
         khrw==
X-Gm-Message-State: AJIora8Hy7ohJsKph/UDSSFgagjwSgdxeW7JhQlqp/YjOrHl+tLJETP4
	m6TEK+sh5afcp/Hb8g5G+8j/U3bSa6GNuajp
X-Google-Smtp-Source: 
 AGRyM1s6Y6VGx70WOSyIpfsR7dIa/gobmIrKlhVRQ5KH55MVDXsTrxx1sPFPgnI5myGO6WllsAyIgA==
X-Received: by 2002:a05:6214:410e:b0:470:4609:c87c with SMTP id
 kc14-20020a056214410e00b004704609c87cmr42739624qvb.62.1657214513057;
        Thu, 07 Jul 2022 10:21:53 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id
 9-20020a05620a048900b006aee741fa3esm32946176qkr.40.2022.07.07.10.21.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 10:21:52 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f182.google.com with SMTP id ck6so23688472qtb.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 10:21:52 -0700 (PDT)
X-Received: by 2002:a05:6214:c8c:b0:473:3e1:5007 with SMTP id
 r12-20020a0562140c8c00b0047303e15007mr12642721qvr.1.1657214512284; Thu, 07
 Jul 2022 10:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220707171904.338441-1-otavio@ossystems.com.br>
 <16FF9BAD54CACFDA.9983@lists.openembedded.org>
In-Reply-To: <16FF9BAD54CACFDA.9983@lists.openembedded.org>
Date: Thu, 7 Jul 2022 14:21:40 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKp-6s2jcTNYwaMH3AB3b84LhvpGL2QYqMKC+9wQQR23kg@mail.gmail.com>
Message-ID: 
 <CAP9ODKp-6s2jcTNYwaMH3AB3b84LhvpGL2QYqMKC+9wQQR23kg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Linux 5.4.202
To: Otavio Salvador <otavio.salvador@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jon Hunter <jonathanh@nvidia.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
 Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>,
	Hulk Robot <hulkrobot@huawei.com>
Content-Type: multipart/alternative; boundary="0000000000005249d905e33a52de"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 17:21:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167797

--0000000000005249d905e33a52de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

My mistake, sorry.

Em qui., 7 de jul. de 2022 =C3=A0s 14:19, Otavio Salvador via
lists.openembedded.org <otavio.salvador=3Dgmail.com@lists.openembedded.org>
escreveu:

> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> Link:
> https://lore.kernel.org/r/20220627111927.641837068@linuxfoundation.org
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> Tested-by: Florian Fainelli <f.fainelli@gmail.com>
> Tested-by: Shuah Khan <skhan@linuxfoundation.org>
> Tested-by: Guenter Roeck <linux@roeck-us.net>
> Tested-by: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
> Tested-by: Hulk Robot <hulkrobot@huawei.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index ae9156f804e5..021878dc23f9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  VERSION =3D 5
>  PATCHLEVEL =3D 4
> -SUBLEVEL =3D 201
> +SUBLEVEL =3D 202
>  EXTRAVERSION =3D
>  NAME =3D Kleptomaniac Octopus
>
> --
> 2.36.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167796):
> https://lists.openembedded.org/g/openembedded-core/message/167796
> Mute This Topic: https://lists.openembedded.org/mt/92233382/3617537
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> otavio.salvador@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--0000000000005249d905e33a52de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">My mistake, sorry.=C2=A0</div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">Em qui., 7 de jul. de 2022 =C3=A0s=
 14:19, Otavio Salvador via <a href=3D"http://lists.openembedded.org">lists=
.openembedded.org</a> &lt;otavio.salvador=3D<a href=3D"mailto:gmail.com@lis=
ts.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; escreveu:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">From: Greg Kroah-Ha=
rtman &lt;<a href=3D"mailto:gregkh@linuxfoundation.org" target=3D"_blank">g=
regkh@linuxfoundation.org</a>&gt;<br>
<br>
Link: <a href=3D"https://lore.kernel.org/r/20220627111927.641837068@linuxfo=
undation.org" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/=
r/20220627111927.641837068@linuxfoundation.org</a><br>
Tested-by: Jon Hunter &lt;<a href=3D"mailto:jonathanh@nvidia.com" target=3D=
"_blank">jonathanh@nvidia.com</a>&gt;<br>
Tested-by: Florian Fainelli &lt;<a href=3D"mailto:f.fainelli@gmail.com" tar=
get=3D"_blank">f.fainelli@gmail.com</a>&gt;<br>
Tested-by: Shuah Khan &lt;<a href=3D"mailto:skhan@linuxfoundation.org" targ=
et=3D"_blank">skhan@linuxfoundation.org</a>&gt;<br>
Tested-by: Guenter Roeck &lt;<a href=3D"mailto:linux@roeck-us.net" target=
=3D"_blank">linux@roeck-us.net</a>&gt;<br>
Tested-by: Sudip Mukherjee &lt;<a href=3D"mailto:sudip.mukherjee@codethink.=
co.uk" target=3D"_blank">sudip.mukherjee@codethink.co.uk</a>&gt;<br>
Tested-by: Hulk Robot &lt;<a href=3D"mailto:hulkrobot@huawei.com" target=3D=
"_blank">hulkrobot@huawei.com</a>&gt;<br>
Signed-off-by: Greg Kroah-Hartman &lt;<a href=3D"mailto:gregkh@linuxfoundat=
ion.org" target=3D"_blank">gregkh@linuxfoundation.org</a>&gt;<br>
---<br>
=C2=A0Makefile | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/Makefile b/Makefile<br>
index ae9156f804e5..021878dc23f9 100644<br>
--- a/Makefile<br>
+++ b/Makefile<br>
@@ -1,7 +1,7 @@<br>
=C2=A0# SPDX-License-Identifier: GPL-2.0<br>
=C2=A0VERSION =3D 5<br>
=C2=A0PATCHLEVEL =3D 4<br>
-SUBLEVEL =3D 201<br>
+SUBLEVEL =3D 202<br>
=C2=A0EXTRAVERSION =3D<br>
=C2=A0NAME =3D Kleptomaniac Octopus<br>
<br>
-- <br>
2.36.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#167796): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/167796" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/167796</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92233382/3617=
537" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92233382/3617537</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:otavio.salvador@gmail.com"=
 target=3D"_blank">otavio.salvador@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Sys=
tems<br><a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://ww=
w.ossystems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.os=
systems.com.br" target=3D"_blank">http://code.ossystems.com.br</a><br>Mobil=
e: +55 (53) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) =
903-9750</div>

--0000000000005249d905e33a52de--

