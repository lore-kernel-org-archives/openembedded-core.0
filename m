Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B402CC433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 18:01:17 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.1563.1646416876504870117
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 10:01:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=wzqLiieO;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.180,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f180.google.com with SMTP id z66so7025808qke.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 10:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=3mCr9/cDCX0uEcDS5FIViJpCIVtIJc4xb/uEfl5rAYw=;
        b=wzqLiieOO5HgkRAa7alrXGhOB+4fkzMqJqtbKEdRXnw/pyYDBrt/mpOWMPcGesO5au
         E17YKGyrk4q5CIaesJME4xOXe9vnaTL5jGxWHTE62d1Itha0sYuf8FcOvvJbYOjI/zVw
         hd4BQTAjgVKz5VW7HE7At86kU7uvs7w/lY3eLSp6hEjOmf9i4QRf01REtlfwHq+Ak2E8
         ttqMaClLXOoBmrhEibtRp7nnm6/qOP/49Yf2BimV5unlIYRzc6DZUFUrYnmFZJ1crDFj
         jb13E65HUOFS8SZR9VqaVUmthmqhV86naVF2yS4WeBhD6g8jfzBLIdzbjsH3Ah+fMpPE
         odQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=3mCr9/cDCX0uEcDS5FIViJpCIVtIJc4xb/uEfl5rAYw=;
        b=UHP3uNEUUVbKGMlv8SGb5H11tZyFuZ678YXCZJUpf660oMoMfvL4wXqS9fcHhpa6Bs
         elNXoL88omRP+cNvCSxPIxtPAOX8JmjdKLOdjz3FxYLFFSwUE/BbrVpGL8OuqgHc75vR
         s04U1AbDxsVlsKz3Kx361jZxTYfcIquTa7GYp+NQ1H3BUwtr7HN1GHMCaNiC1B1zZP8P
         dvhLtnDa8Sye83Zu7JoQ3uwONoW3IKqzFfGB6a7kh+FpMh1OpNzEQyVsbigjNDYWZVhE
         qZaNdiYrjf67E+HaAe1fQkwtbBxIfteTqh/NUSVQVPvwvaYIgl5UdTIKnqMNRFBgHOcy
         Slhg==
X-Gm-Message-State: AOAM532wXx2r08fvZeseLkyrVKyZ75uvUcWvOWMS8c/LWtuIPw4Y5kGI
	ZBKQzFoCHdnRVcGwVYb/SxuTJ/IdUDYWbms4
X-Google-Smtp-Source: 
 ABdhPJyRyXBUcr32RtLczXi4i+f3gH5e9dqAWSqy5TPZzMRbHu3mj3hGGZzPHBlvMDjY/e+ZC+DRmw==
X-Received: by 2002:a05:620a:1007:b0:648:c747:6eec with SMTP id
 z7-20020a05620a100700b00648c7476eecmr3252263qkj.777.1646416873193;
        Fri, 04 Mar 2022 10:01:13 -0800 (PST)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id
 n8-20020ac85a08000000b002de658d6748sm3988961qta.55.2022.03.04.10.01.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Mar 2022 10:01:13 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f182.google.com with SMTP id c4so8080286qtx.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 10:01:12 -0800 (PST)
X-Received: by 2002:a05:622a:1747:b0:2de:b3c0:cac4 with SMTP id
 l7-20020a05622a174700b002deb3c0cac4mr29248418qtk.82.1646416872220; Fri, 04
 Mar 2022 10:01:12 -0800 (PST)
MIME-Version: 1.0
References: <20220304115525.2240283-1-ross.burton@arm.com>
 <AM9PR09MB4642E1F4D179551C41AB9217A8059@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAAnfSTugRrDfDxwEKXfbHRM5DznThMN3_jiiTLZ4Nr6J5o_M+Q@mail.gmail.com>
 <AM9PR09MB46429EC89803B44A66B82D44A8059@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAMKF1spt8JqUnosr8n6T2bja9BRvvoH6KKJn7rNLjaBgi0UsEQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spt8JqUnosr8n6T2bja9BRvvoH6KKJn7rNLjaBgi0UsEQ@mail.gmail.com>
Date: Fri, 4 Mar 2022 15:01:00 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKrZT9A=fdjUekvAHEch9LFjNt3mnH+jnGXGK0DR0BOvww@mail.gmail.com>
Message-ID: 
 <CAP9ODKrZT9A=fdjUekvAHEch9LFjNt3mnH+jnGXGK0DR0BOvww@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] classes: add setuptools3_legacy
To: Khem Raj <raj.khem@gmail.com>
Cc: Konrad Weihmann <kweihmann@outlook.com>, Ross Burton <ross@burtonini.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d24ecf05d9684c8f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 18:01:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162750

--000000000000d24ecf05d9684c8f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 4 de mar. de 2022 =C3=A0s 13:56, Khem Raj <raj.khem@gmail.com> esc=
reveu:

> There are recipes in meta-oe and meta-python which would need this
> and both layer only list core as sole dependency, if we put it in either =
of
> these layers, then one will depend on other which is not nice, so I rathe=
r
> would prefer it in core.


Couldn't those recipes (depending on Python) go to meta-python?

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--000000000000d24ecf05d9684c8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em sex., 4 de mar. de 2022 =C3=A0s 13=
:56, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com<=
/a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">There are recipes in meta-oe and meta-python which would need this<br>
and both layer only list core as sole dependency, if we put it in either of=
<br>
these layers, then one will depend on other which is not nice, so I rather<=
br>
would prefer it in core.</blockquote><div><br></div><div>Couldn&#39;t those=
 recipes (depending on Python) go to meta-python?=C2=A0=C2=A0<br></div></di=
v><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Otavio S=
alvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br><a href=3D"http://www.ossys=
tems.com.br" target=3D"_blank">http://www.ossystems.com.br</a> =C2=A0 =C2=
=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems.com.br" target=3D"_blank"=
>http://code.ossystems.com.br</a><br>Mobile: +55 (53) 9 9981-7854 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-9750</div></div>

--000000000000d24ecf05d9684c8f--

