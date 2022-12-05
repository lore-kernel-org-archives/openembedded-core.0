Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E5BC4321E
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 14:04:05 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.15927.1670249040562680519
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 06:04:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112 header.b=QXqBWwco;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.51, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1433ef3b61fso13492319fac.10
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 06:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yylzvz+UKhhhhdtDdPpUtDBzsC2CJW44rUJK17Cnyp0=;
        b=QXqBWwco6MCobIT9DMnENS1Yz+IR5NOCvs+GtBEc7WBRSxhd+F4fe5uRaWb/rUl0sx
         yoNoFQ0IZ0VrM/p3ciOIfZ/ozBF6zRweusEw6K1UK25QVeLTGgTDmsRf4aX6jgLif28Z
         EWvnsV714pzu3pkxkfXdFmrsemQEUMdmqk1eZQduE8Cuy8Xa5QtRs9WgcgjG9UUOAisY
         qNP9/d/aHAxiEdQhvinou55HnWMvOHLjRIrXO5hjC+pYUSV0zUrQ19Bizgr4B5Qa7KJg
         O3UKB5dL36c1BFZPbjOuR1iDvIGFcWQ94x1y/cRODkUDA8DRlnKOmYrh9OUnLcmhbS1n
         Cm1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yylzvz+UKhhhhdtDdPpUtDBzsC2CJW44rUJK17Cnyp0=;
        b=vrOyy8Y4FI0QDX6L44N+fPIAfLVcVPz/b76eCz+GXTpc6ZfQlQMp+IB0FU5B70TROf
         vnDEQcv98pSHkR3SWhRiZHjrcltz95YuEcRGkV+kOEyEMEBBh+fBPGXixqzKSnVDt/e1
         3GzSks2MRPXQBfsj01ySafSNDnqqaGxwTkRHpCdWvY8Udo46EmZ+vC7+mwRHu6mIFKjN
         JjXHUZ9DkUKkn/Mxk8flKMmpbTLRcz1ZiPe+HrVUuT79Pl6JEv95OB1WB1n0pHpQLOWr
         KgA/Xpcr0NAkEXc46BYsb98q/AvViwYNmE0gA6MyhiGKrWTvJHLFzdcJScwXQ9rkq5Ih
         2EQg==
X-Gm-Message-State: ANoB5pkHWo8d5Hl7JvLG6SmSE/cJp3tRIplz1qG+oPWwWC7+KLmZ3lfa
	KdG/D/DY7IKs3KbQ0aBljckEO4ZRmQkxFXKfxek=
X-Google-Smtp-Source: AA0mqf6cTXs2t5FVVOAOPe9nvHFo6cqN3GTFgUwopkZIVgH9W0AAJf6V2pMzuq0jyfPrILsfxK/u4Q==
X-Received: by 2002:a05:6870:f21a:b0:13b:6986:2649 with SMTP id t26-20020a056870f21a00b0013b69862649mr46175984oao.261.1670249039253;
        Mon, 05 Dec 2022 06:03:59 -0800 (PST)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com. [209.85.160.44])
        by smtp.gmail.com with ESMTPSA id k60-20020a9d19c2000000b0066ca9001e68sm6164299otk.5.2022.12.05.06.03.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 06:03:58 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1433ef3b61fso13492234fac.10
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 06:03:58 -0800 (PST)
X-Received: by 2002:a05:6870:ab86:b0:13c:5763:9411 with SMTP id
 gs6-20020a056870ab8600b0013c57639411mr44875194oab.288.1670249038078; Mon, 05
 Dec 2022 06:03:58 -0800 (PST)
MIME-Version: 1.0
References: <20221201173942.1218836-1-f_l_k@t-online.de> <CAMKF1srCn0tDWAxxpVCYhTZmow3uwy0tGqLXy2VDX0qBHDx2ZA@mail.gmail.com>
 <NMLEMR.NA7JF86LUFN83@t-online.de>
In-Reply-To: <NMLEMR.NA7JF86LUFN83@t-online.de>
Date: Mon, 5 Dec 2022 11:03:46 -0300
X-Gmail-Original-Message-ID: <CAP9ODKopgRpWZNiFHjFtw34dYhRHKH188p2_AAs_=Ptyti-ESA@mail.gmail.com>
Message-ID: <CAP9ODKopgRpWZNiFHjFtw34dYhRHKH188p2_AAs_=Ptyti-ESA@mail.gmail.com>
Subject: Re: [oe-core][PATCH] mesa: update 22.2.3 -> 22.3.0
To: Markus Volk <f_l_k@t-online.de>, Martin Jansa <Martin.Jansa@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000099f00c05ef1528ef"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 14:04:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174288

--00000000000099f00c05ef1528ef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 5 de dez. de 2022 =C3=A0s 02:52, Markus Volk <f_l_k@t-online.de>
escreveu:

> Am So, 4. Dez 2022 um 09:23:49 -0800 schrieb Khem Raj <raj.khem@gmail.com
> >:
>
> Not sure if this is related but I think its somewhere in egl headers
> provided by mesa.
>
>
> This is related to an update of the egl headers in Mesa, just as you
> thought:
> https://github.com/meta-qt5/meta-qt5/pull/491
>

It looks fine for me. @Martin Jansa <Martin.Jansa@gmail.com> could you
check the PR above and merge if fine with it?

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--00000000000099f00c05ef1528ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em seg., 5 de dez. de 2022 =C3=A0s 02=
:52, Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de=
</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div id=3D"m_-7398430256557306960geary-body" dir=3D"auto">Am So, 4. Dez =
2022 um 09:23:49 -0800 schrieb Khem Raj &lt;<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;:<br><blockquote type=3D=
"cite"><div style=3D"white-space:break-spaces">Not sure if this is related =
 but I think its somewhere in egl headers
provided by mesa.</div></blockquote><div><br></div><div>This is related to =
an update of the egl headers in Mesa, just as you thought:</div><div><a hre=
f=3D"https://github.com/meta-qt5/meta-qt5/pull/491" target=3D"_blank">https=
://github.com/meta-qt5/meta-qt5/pull/491</a></div></div>
</blockquote></div><div><br></div><div>It looks fine for me.=C2=A0<a class=
=3D"gmail_plusreply" id=3D"plusReplyChip-0" href=3D"mailto:Martin.Jansa@gma=
il.com" tabindex=3D"-1">@Martin Jansa</a>=C2=A0could you check the PR above=
 and merge if fine with it?</div><div><br></div>-- <br><div dir=3D"ltr" cla=
ss=3D"gmail_signature">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems=
<br><a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.os=
systems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossyst=
ems.com.br" target=3D"_blank">http://code.ossystems.com.br</a><br>Mobile: +=
55 (53) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-=
9750</div></div>

--00000000000099f00c05ef1528ef--

