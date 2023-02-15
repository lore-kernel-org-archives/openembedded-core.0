Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF954C636D4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 11:22:56 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.12754.1676460175034380606
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 03:22:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112 header.b=gUrww7Vx;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.44, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-16df32f2ffdso11834919fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 03:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XhMVYLhyev0HYRji7+nD6hArSlvPk6uafrY0cZEKUp4=;
        b=gUrww7VxmTD+lmDTJVeX5dTKvkG60Qc5okOACowKvPyRAjRVzgSYzowQNYxyO9Wl/P
         aQ5Ux4/4cYAH0lF6RuF4PW+/aOlg5dlNbo12Mcl3pd2N7XA0ThE9dllXPbczmH9ILvZ+
         EvaHLlQ1AKeJklh/UBt+uGqnj6H8hz/zp8804ea9v4rpkgLUIaylzwt2GBUqjHA+psNq
         rrSsqTnOeeV39fFNaI83tctPAmxQhLrklo+uPnVVRl3wTtjXBTBNEDRHJR/Z3pVfA+T4
         Rhqn0VrlmeBcFbAyyQ/Ux9u0+qxh4wa4KWfvwvwUZOXFqoAwCprav0JOPqZebuOeDb1M
         5t1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XhMVYLhyev0HYRji7+nD6hArSlvPk6uafrY0cZEKUp4=;
        b=NZLJ50MXyUidLdPnaC/GmjC/rhRXPl1XfGvoDWU775DteZqEC5MDy/lB9WuLZQPkza
         zPTXnE+NU0UHNbtRW/W1AklutI4bduonFQZsOhtUzKayD52GNrf1WA12N3x7JJlUzxMc
         HZdBTx5cx5X21IZxlobf6c5SHBngZEqdPWHZH2gqVJOjEdlHXn7N/rf0N3BK8S+8QJMC
         M1p/B5M6VYCxW4TNBIgoUW7ih2s+zpjK7uZ3XqwpzyklloH3waQ5W4GRNVOjldXd9+SM
         5IQ16pYfG7VBrRi16by/OlUEM3pQBxPNEi2Eqrs7QEvrvkEWJ3Pr6VuPnKhuphOG5gP4
         HYdg==
X-Gm-Message-State: AO0yUKWk/0gxByQ17Pin17m44DsYTcfgs2iZvC1VFMV1XLDKBSosFfbt
	CC4D1CN173iYaLUF0IzQ94RA9+Qw6JOA7Zcmm2g=
X-Google-Smtp-Source: AK7set+MlNbkKvQ1V7Ry6cisL63RyHUnhlANY2ePmub0g6YsW+m6MthlAl0vofRqcG51W78PR7Gp2A==
X-Received: by 2002:a05:6870:4394:b0:16d:e1a2:259 with SMTP id r20-20020a056870439400b0016de1a20259mr777204oah.34.1676460173866;
        Wed, 15 Feb 2023 03:22:53 -0800 (PST)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com. [209.85.167.181])
        by smtp.gmail.com with ESMTPSA id dx52-20020a05687076b400b0016aaed9794bsm508061oab.3.2023.02.15.03.22.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 03:22:53 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi1-f181.google.com with SMTP id cz14so15467740oib.12
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 03:22:53 -0800 (PST)
X-Received: by 2002:aca:bb82:0:b0:378:2bf7:39b4 with SMTP id
 l124-20020acabb82000000b003782bf739b4mr152990oif.288.1676460172655; Wed, 15
 Feb 2023 03:22:52 -0800 (PST)
MIME-Version: 1.0
References: <20230203135011.2061939-1-m.felsch@pengutronix.de>
 <12e370a3183d04572da1c5749d8e64dcf5091a0c.camel@linuxfoundation.org>
 <acf8b79c23675a2b4c7225e55e4ab369fbcf7f54.camel@pengutronix.de> <7f5ebf2315c969ce7c76d024ec373f45cc8eff3f.camel@linuxfoundation.org>
In-Reply-To: <7f5ebf2315c969ce7c76d024ec373f45cc8eff3f.camel@linuxfoundation.org>
Date: Wed, 15 Feb 2023 08:22:41 -0300
X-Gmail-Original-Message-ID: <CAP9ODKokQpGL3ttukqRaq3-8m0ci7qp8mckbgudGJx1HOu-fPw@mail.gmail.com>
Message-ID: <CAP9ODKokQpGL3ttukqRaq3-8m0ci7qp8mckbgudGJx1HOu-fPw@mail.gmail.com>
Subject: Re: [yocto] [OE-core] [PATCH 1/2] barebox: add initial support
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>, 
	Marco Felsch <m.felsch@pengutronix.de>, openembedded-core@lists.openembedded.org, 
	yocto@pengutronix.de, barebox@lists.infradead.org
Content-Type: multipart/alternative; boundary="00000000000012476905f4bb4d2a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 11:22:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177184

--00000000000012476905f4bb4d2a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Richard,

Em ter., 14 de fev. de 2023 =C3=A0s 10:56, Richard Purdie <
richard.purdie@linuxfoundation.org> escreveu:

> Fair enough, I'm open to the idea. It would be interesting/useful to
> see if anyone else in the community is in favour of this or not. I'm
> sure you appreciate why we need to ask the question and why we can't
> just add everything! :)
>
> The community usage does appear to be primarily phytec/ptx.
>

I have used barebox in some projects in the past for multiple customers. It
is a solid and commonly used bootloader. I consider U-Boot the industry
standard, but Barebox is also widely used, and it makes sense to be part of
OE-Core.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--00000000000012476905f4bb4d2a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Richard,</div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">Em ter., 14 de fev. de 2023 =C3=A0s 10:=
56, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org=
">richard.purdie@linuxfoundation.org</a>&gt; escreveu:</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
Fair enough, I&#39;m open to the idea. It would be interesting/useful to<br=
>
see if anyone else in the community is in favour of this or not. I&#39;m<br=
>
sure you appreciate why we need to ask the question and why we can&#39;t<br=
>
just add everything! :)<br>
<br>
The community usage does appear to be primarily phytec/ptx.<br></blockquote=
><div><br></div><div>I have used barebox in some projects in the past=C2=A0=
for multiple customers. It is a solid and commonly used bootloader. I consi=
der U-Boot the industry standard, but Barebox is also widely used, and it m=
akes sense to be part of OE-Core.=C2=A0 =C2=A0 =C2=A0</div></div><div><br><=
/div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Otavio Salvador =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 O.S. Systems<br><a href=3D"http://www.ossystems.com.br=
" target=3D"_blank">http://www.ossystems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =
=C2=A0<a href=3D"http://code.ossystems.com.br" target=3D"_blank">http://cod=
e.ossystems.com.br</a><br>Mobile: +55 (53) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0Mobile: +1 (347) 903-9750</div></div>

--00000000000012476905f4bb4d2a--

