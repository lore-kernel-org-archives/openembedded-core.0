Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FFC2C7EE21
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 11:21:16 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web11.46823.1683199273592758647
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 04:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@ossystems-com-br.20221208.gappssmtp.com header.s=20221208 header.b=zb0EFUYE;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.170, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so8233072276.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 04:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20221208.gappssmtp.com; s=20221208; t=1683199272; x=1685791272;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3LliZvYkMthlbpmm1a+VAGLOGCiQWlMT5FOIiYVNpmc=;
        b=zb0EFUYEdMvrPNww40rHUKoW5io/kaREyIpXXj4yWO5kHQai+tEM4vihp+ZFI0AEPV
         1DCrhSs4taoW5jLr6g+LPbWTIxvlAFJ76EhwzOz5k9kcNZgplSljCo1sgOkODoh9/W1h
         EipPJnT5dFIsP1x54SjG0/4dm8UIJV8SrnnmU+EckXStlLtTbd1gKxxLiVorA7zC8n9S
         47H7b7f+ibDU3tmUf1x6qHurEIqJBP9HU4ypZtgYWSInyiGM1zihYQlA9O0yw4c3DJrF
         JY6CXo4UA2DOF9VyZIW1jUcW2PZZW8ZchHbDIt93jh2T0s2lDva4+dnlGgZhqO2fY4jc
         ezVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683199272; x=1685791272;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3LliZvYkMthlbpmm1a+VAGLOGCiQWlMT5FOIiYVNpmc=;
        b=dgKXRQdPhET3oWfyWenUIGJ2qXYnChhGVYEyw21b/lCE/JTnvzqMVPbfJHwXeUQK8f
         6b2wGpl+qNPahAWfuiQhEb42ZkH6WJl961EKAG2tcCK2NprLskBVbUi+j9Ux0q2ITIoW
         0XEEiBNIcMrzobFaPG6SeqIdLzSG70rxN+DdopaxyD9UAoRerPE5dDg76Z4S2vvu7TPq
         vxkGYvxLsDB+pFpi153UrVApWKprkng9iWwYAV88bj/k5jqrgxXfykQCFaUdrKA4HmoT
         TLcHaxqbH00hEaMFYdvQJGvb3JZdu3l9yYylMlvtgihL34OwCWefY0vdOmpSY6uNHhYk
         u5Yw==
X-Gm-Message-State: AC+VfDzJPbgYFXT2jNbHGKNqQSCdt/qea4q8fmX4DDa0lbbjvMglVWfx
	XeKsuQnS1RR2dzEHnorB4uqq7+HTTCD885FpFLfkgA==
X-Google-Smtp-Source: ACHHUZ7Q9N+vmCcOnp3WSQqmPagn16p4RCaXKV7o307LFhJRq5X+CsUpr+exUo+CZA4ZVetSxBMMkw==
X-Received: by 2002:a0d:ca0b:0:b0:559:d78f:db64 with SMTP id m11-20020a0dca0b000000b00559d78fdb64mr1637285ywd.3.1683199272249;
        Thu, 04 May 2023 04:21:12 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id n4-20020a0de404000000b00556d4aac066sm5671917ywe.133.2023.05.04.04.21.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 04:21:11 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-b9a6f17f2b6so8151323276.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 04:21:11 -0700 (PDT)
X-Received: by 2002:a25:d40b:0:b0:b99:4381:d955 with SMTP id
 m11-20020a25d40b000000b00b994381d955mr6400190ybf.2.1683199271316; Thu, 04 May
 2023 04:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230504025102.1658227-1-raj.khem@gmail.com>
In-Reply-To: <20230504025102.1658227-1-raj.khem@gmail.com>
Date: Thu, 4 May 2023 08:20:59 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqgxf6XqW+=KH_xHu1C2zKr9qzXKcpnxvCEySt-MeLCfA@mail.gmail.com>
Message-ID: <CAP9ODKqgxf6XqW+=KH_xHu1C2zKr9qzXKcpnxvCEySt-MeLCfA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cmake: Upgrade to 3.26.3
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a733f305fadc5e27"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 11:21:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180863

--000000000000a733f305fadc5e27
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 3 de mai. de 2023 =C3=A0s 23:51, Khem Raj <raj.khem@gmail.com> esc=
reveu:

> License-Update: Copyright year changed from 2022 -> 2023
>
> - Copyright 2000-2022 Kitware, Inc. and Contributors
> + Copyright 2000-2023 Kitware, Inc. and Contributors
>
> Call bootstrap directly without wrapping it with configure
> since all it does it find the sourcedir
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--000000000000a733f305fadc5e27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em qua., 3 de mai. de 2023 =C3=A0s 23=
:51, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com<=
/a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">License-Update: Copyright year changed from 2022 -&gt; 2023<br>
<br>
- Copyright 2000-2022 Kitware, Inc. and Contributors<br>
+ Copyright 2000-2023 Kitware, Inc. and Contributors<br>
<br>
Call bootstrap directly without wrapping it with configure<br>
since all it does it find the sourcedir<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br></blockquote><div><br></div><div>Ack=
ed-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.br">otavi=
o@ossystems.com.br</a>&gt;</div><div>=C2=A0</div></div><span class=3D"gmail=
_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"=
>Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br><a href=3D"http:/=
/www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br</a> =
=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems.com.br" target=
=3D"_blank">http://code.ossystems.com.br</a><br>Mobile: +55 (53) 9 9981-785=
4 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-9750</div></div>

--000000000000a733f305fadc5e27--

