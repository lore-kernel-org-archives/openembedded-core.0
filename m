Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A80C19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 16:33:10 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web12.8820.1660235580171904685
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 09:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=OBZ4IZBn;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.46,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f46.google.com with SMTP id u10so1443209qvp.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 09:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:from:to:cc;
        bh=cCJjdEONVyMlLFbTqTjGMPHY5iJJvoJmCsxgqXDjR3c=;
        b=OBZ4IZBnBaWsuruo/0ptNQshS0300DXO8Q49WQ6CbrWxe28BREWUoo5Muflnnkoxr1
         iicBy2m/3FO45Jl2Ue6mD8ZRUi0QPuKr3RWHF1FZv32BzjQ5Y6Sv8ZqmqlFCJjKggKKH
         i8o5STGXzhpGn73CcFirAQ9xt/TqLw6LJNWRnPNgCfmvhNMDdXA3yuhS2DiF2gnfEQ+V
         QwWh5g9S42AiRhD1UCdmbDadJgWF7YTN8Ts6crFg+XlC/zOHHkl7uAjM1XS7rPkLZTGg
         2yTZybnBRYUAiZ3BEDpX2Fu/qZAFZiyr6Ja99GE/ANejM1QcGqMBzO0x7FgC2HD3GAJD
         bkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:x-gm-message-state:from:to:cc;
        bh=cCJjdEONVyMlLFbTqTjGMPHY5iJJvoJmCsxgqXDjR3c=;
        b=Iwwvg7NUFmxDQxXNiIVgb5UoLUSl5F/VU233ZJ16MaWL8/MpxTLtwa5YTRWA27Rr+x
         Aq7CmHL05r7hUUn/rgrQRM6a43D3r5anY2zOzpnnYDp2UD47ospn8Wt5EWIZ+rf+hFQX
         AUU3AH79WQznqzEhx3RSvoUCOBiV3WgbeDyaBFjsLbJuHp4a0qjfMVlni/uh6ZZiq/Y0
         4pxL/axYfyoFE/9vQHqvMsp7Mr2f2+lnZ94YlWCTaLcvm4nd72m5CNExu6ovhc3Uu7Ne
         txIIwmGcBvaRMsePeDCVfwu/pU01TMqFmuifkAdJwJ4FkI4Q76NTjQzU6iOwfoEBm62r
         d3eA==
X-Gm-Message-State: ACgBeo3Vc6ArRrnH7AXAnfTZ1T5h3/GzYq+uZyxkYpdTpIp4an3xHOlS
	G5+wTOUbpqbJv6+CTYt3f11/IgTbRNzSb4OH
X-Google-Smtp-Source: 
 AA6agR5HJtGylDymHHSDkLpucrnbVcWXB4aIAIAehkbXXZ/DpZK+6R1WBtv9pegSrkbEjFhfy045vQ==
X-Received: by 2002:a0c:802c:0:b0:478:de2c:9b6f with SMTP id
 41-20020a0c802c000000b00478de2c9b6fmr27178684qva.89.1660235578967;
        Thu, 11 Aug 2022 09:32:58 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com.
 [209.85.160.171])
        by smtp.gmail.com with ESMTPSA id
 z15-20020ac8430f000000b00342fa1f4a10sm1910005qtm.61.2022.08.11.09.32.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 09:32:58 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f171.google.com with SMTP id cb8so1101590qtb.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 09:32:58 -0700 (PDT)
X-Received: by 2002:ac8:5a42:0:b0:343:4eed:43a with SMTP id
 o2-20020ac85a42000000b003434eed043amr10098206qta.90.1660235577773; Thu, 11
 Aug 2022 09:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220811161757.278819-1-jose.quaresma@foundries.io>
In-Reply-To: <20220811161757.278819-1-jose.quaresma@foundries.io>
Date: Thu, 11 Aug 2022 13:32:46 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKodJUGKZGcHM5WqqW-2=Z6iPNtddeo_99h-e_Dv1x_oJw@mail.gmail.com>
Message-ID: 
 <CAP9ODKodJUGKZGcHM5WqqW-2=Z6iPNtddeo_99h-e_Dv1x_oJw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] module.bbclass: rebuild the modules when kernel
 change
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, ricardo@foundries.io,
	daiane.angolini@foundries.io, Otavio Salvador <otavio@ossystems.com.br>,
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000db55b605e5f9b7ed"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 16:33:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169255

--000000000000db55b605e5f9b7ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 11 de ago. de 2022 =C3=A0s 13:18, Jose Quaresma <quaresma.jose@gma=
il.com>
escreveu:

> When the kernel is rebuild or some of they tasks change the
> kernel modules is not rebuild as well and will comes from
> the sstate-cache.
>
> [YOCTO #14885] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14885
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>

Issue: https://github.com/Freescale/meta-freescale/pull/1168
Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--000000000000db55b605e5f9b7ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em qui., 11 de ago. de 2022 =C3=A0s 1=
3:18, Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com">quaresma=
.jose@gmail.com</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">When the kernel is rebuild or some of they tasks change t=
he<br>
kernel modules is not rebuild as well and will comes from<br>
the sstate-cache.<br>
<br>
[YOCTO #14885] <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=
=3D14885" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoprojec=
t.org/show_bug.cgi?id=3D14885</a><br>
<br>
Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries.=
io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br></blockquote><d=
iv><br></div><div>Issue:=C2=A0<a href=3D"https://github.com/Freescale/meta-=
freescale/pull/1168">https://github.com/Freescale/meta-freescale/pull/1168<=
/a></div><div>Acked-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossyst=
ems.com.br">otavio@ossystems.com.br</a>&gt;=C2=A0</div></div><div><br></div=
>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Otavio Salvador =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 O.S. Systems<br><a href=3D"http://www.ossystems.com.br" t=
arget=3D"_blank">http://www.ossystems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=
=A0<a href=3D"http://code.ossystems.com.br" target=3D"_blank">http://code.o=
ssystems.com.br</a><br>Mobile: +55 (53) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0Mobile: +1 (347) 903-9750</div></div>

--000000000000db55b605e5f9b7ed--

