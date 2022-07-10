Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB99BC433EF
	for <webhook@archiver.kernel.org>; Sun, 10 Jul 2022 16:55:34 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.18859.1657472133003079924
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jul 2022 09:55:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=KrzgFWQG;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.169,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f169.google.com with SMTP id z12so2426882qki.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jul 2022 09:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=EVFrwvbWOs5binrLyD6bTPHCw+t9Tn+GbsJmbmWeWxY=;
        b=KrzgFWQGpSA9hYf+HydUDkJkI+PcSV/Us5Y0vTh9nVsnen2seErW+UfyqeYFLXE8CF
         AhWLDbCPYYOzskMfRPH3GL8ZMpOA/SUApIF3qgyt+IcZPPtpzxRiS1EyLzEfyt9OnvQA
         rDWi+qpXiEgz3uKPJnNCTnBsX8N4K3JmBUypUPkBGaTr9zJyBIuKsinHb9w9fpbpWq3L
         TR0AHi0G47QEiM/QHN3Zjp/x8bCbrN5+/NzHQ6ObqV7Kj0cWug6nJy9DGCIy1wnG19qm
         ziLK1qvPPvVM+M20LeDb74Ue9Eej/Tn9Kshv+74fd/5eEUYx3RsUUm/22tKrUFOEJhf3
         9G+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=EVFrwvbWOs5binrLyD6bTPHCw+t9Tn+GbsJmbmWeWxY=;
        b=JeL7lhKLUTXs74drag/+AKk7NcMVorD8K3nSLyxB36QffBa6lLo1DRWPUxnJoVYBoV
         ADCQ/cZqlTs9XaVcpb3srzuZy4aUseLI13yPNdWhD/LCyJb05rGWqJws8LGt1BhebUfa
         66p/X6OdE9j6+tSbdk1SdeM1X2bkwTVk8rn3cihHmL1XQR8xSe/Vq5AUKqVJB+EwIwxe
         VzwDqQKUUcW+7PwLF05zTeb4CxGaHs4OMgmzTQIjyEJiaaFCNlrD+rNEkbgTEK1FqpYb
         QReAS9mBzrY9K+zON6anzq8gwY1BFmESZ9/g8XdRHPSPm+0M88Hf/y+comV6v7TJdXpP
         yEsQ==
X-Gm-Message-State: AJIora9cNmK4irkHXkg+Z1QJIRUuM9fjBPLXud7d1C1sDAh7rBWH+lto
	AAW1I2CIyM+XVDxvyzbYJZEYPgqqIcM36SgJ
X-Google-Smtp-Source: 
 AGRyM1vJrfgxLgS7ipKGskiftxjoqise3+20lD9Y+H9m+OALFFxr2nrgXi3FoDNOG6S4rGN4x6qnVg==
X-Received: by 2002:a05:620a:410e:b0:6b2:809f:2f62 with SMTP id
 j14-20020a05620a410e00b006b2809f2f62mr9034968qko.14.1657472131545;
        Sun, 10 Jul 2022 09:55:31 -0700 (PDT)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com.
 [209.85.222.182])
        by smtp.gmail.com with ESMTPSA id
 n16-20020a05622a041000b00304fe5247bfsm3826742qtx.36.2022.07.10.09.55.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Jul 2022 09:55:31 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f182.google.com with SMTP id z11so948057qkz.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jul 2022 09:55:31 -0700 (PDT)
X-Received: by 2002:a37:27d1:0:b0:6b5:79e9:d32a with SMTP id
 n200-20020a3727d1000000b006b579e9d32amr3284176qkn.705.1657472130889; Sun, 10
 Jul 2022 09:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220709201307.2194050-1-limon.anibal@gmail.com>
In-Reply-To: <20220709201307.2194050-1-limon.anibal@gmail.com>
Date: Sun, 10 Jul 2022 13:55:19 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKqdpsBsma8f5VL_T+pyVFesF7fVN=2zOJBZZRjd=HeVSg@mail.gmail.com>
Message-ID: 
 <CAP9ODKqdpsBsma8f5VL_T+pyVFesF7fVN=2zOJBZZRjd=HeVSg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rng-tools: Only install one set of init scripts
To: "An?bal Lim?n" <limon.anibal@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, matthew@rzerosystems.com,
	aleksandar@rzerosystems.com, wangmy@fujitsu.com,
	"Purdie, Richard" <richard.purdie@linuxfoundation.org>, h@denx.de,
	Alexander Kanavin <alex.kanavin@gmail.com>,
 =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal@rzerosystems.com>
Content-Type: multipart/alternative; boundary="000000000000963bdc05e3764daf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Jul 2022 16:55:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167850

--000000000000963bdc05e3764daf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em s=C3=A1b., 9 de jul. de 2022 =C3=A0s 17:26, An?bal Lim?n <limon.anibal@g=
mail.com>
escreveu:

> From: An=C3=ADbal Lim=C3=B3n <limon.anibal@gmail.com>
>
> Check if systemd is enabled to install .service file only instead of
> service and sysvinit files because it will to rngd service twice by
> systemd compatibility.
>
> One called rng-tools.service (sysv compat) and another rngd.service.
>

I think renaming the init script to use the same name as the .service file
should fix it.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--000000000000963bdc05e3764daf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em s=C3=A1b., 9 de jul. de 2022 =C3=
=A0s 17:26, An?bal Lim?n &lt;<a href=3D"mailto:limon.anibal@gmail.com">limo=
n.anibal@gmail.com</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">From: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:lim=
on.anibal@gmail.com" target=3D"_blank">limon.anibal@gmail.com</a>&gt;<br>
<br>
Check if systemd is enabled to install .service file only instead of<br>
service and sysvinit files because it will to rngd service twice by<br>
systemd compatibility.<br>
<br>
One called rng-tools.service (sysv compat) and another rngd.service.<br></b=
lockquote><div><br></div><div>I think renaming the init script to use the s=
ame=C2=A0name as the .service file should fix it.</div><div>=C2=A0</div></d=
iv>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Otavio Salvador =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 O.S. Systems<br><a href=3D"http://www.ossystems.com.br" t=
arget=3D"_blank">http://www.ossystems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=
=A0<a href=3D"http://code.ossystems.com.br" target=3D"_blank">http://code.o=
ssystems.com.br</a><br>Mobile: +55 (53) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0Mobile: +1 (347) 903-9750</div></div>

--000000000000963bdc05e3764daf--

