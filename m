Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50DE4ECAAD5
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 16:14:44 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.887.1662740076467848161
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 09:14:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=QdPJD4Oc;
 spf=pass (domain: ossystems.com.br, ip: 209.85.208.50,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-ed1-f50.google.com with SMTP id b35so3320244edf.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 09:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:from:to:cc:subject:date;
        bh=LLsRWBijY1/UsF279uaGFzTdjmZQVAz867ATkYhGH8Y=;
        b=QdPJD4OcPTGHDOTiCs3IqzSgHCg1FIPnek44zHlHxUztqqasQE7JwbKC3uoFLpuLnS
         Dw8OhII/pNE+UcOrIN0lUlkewm3SF3vyD3qxmVQCsK++buiI8feBXKGC4sHc1PwaP/9U
         aTWSXbm7eKYaMC3J+lfg8czvQpp/Q0ewkq5eMJfT1rHLQXAisJ8HP2cBBBU1kLJ5HStL
         DAEvyBKANgepHF9FJOKGGJ9YX3qQOCf67FiCtmMc0rWZDdwcg+g0f9hhnW14P0gZoDsk
         sopM941tgz2VU9tSo5iREUszkUk21tjvZlvPsMjBcRQPwlyUgHSm0qZVQvh07sw13UEH
         HxDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=LLsRWBijY1/UsF279uaGFzTdjmZQVAz867ATkYhGH8Y=;
        b=7Fs4HCKXJiOKipQGV027WxQLjs9r1LiZwNOf/lUvJ9U9NLGA2oz3+67ICYmfrVbxAL
         OKZf2ZCpyOspgJe0kKUPzTcx4T62Sm83R5YDObGS0I+CTaUxAR9Ty6qmrwKq0DLOmh+P
         kQbpUv1w3IBQRFh5h5M2AXDkyV3cF7KXJb7W4koQuC5fBifshMnIVnyawYAZlfBZ3MOA
         xN21YkLKn2lySrsMupwb6U3TSz/SxYSUb8XycxudoQMC/z73eM4ICXU/MufoM03z8n+h
         tQNfg0CEY+wmtg8hFRal1S7BCbRrzSLcTQWTNW1NI/mD0Bmyk9LGjM/0cvd7EiUERP+a
         9qwA==
X-Gm-Message-State: ACgBeo1dD+3bgRw02s46kWyrdQBFcS8WEsZszRskBlsXEZ5csZUxHNS+
	qBV4hygd7U/5hsLX5e0i8f/ihhCrjpvklcFV
X-Google-Smtp-Source: 
 AA6agR7FEyPIn98DwTYrowsifzm7LGybZRGY633295ZjriVK+cE0dca/qqPmr1yzI/+EW3cIVGqLzA==
X-Received: by 2002:a05:6402:4311:b0:448:7bba:146a with SMTP id
 m17-20020a056402431100b004487bba146amr11986126edc.317.1662740074041;
        Fri, 09 Sep 2022 09:14:34 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com.
 [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id
 l10-20020a1709063d2a00b007763f1adbc1sm479450ejf.49.2022.09.09.09.14.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 09:14:33 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ed1-f45.google.com with SMTP id q21so3255362edc.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 09:14:33 -0700 (PDT)
X-Received: by 2002:aa7:da4f:0:b0:44e:864b:7a3e with SMTP id
 w15-20020aa7da4f000000b0044e864b7a3emr12403419eds.378.1662740072985; Fri, 09
 Sep 2022 09:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220909151221.434124-1-otavio@ossystems.com.br>
 <f1f703776907dd518e83f15cc333c99094241cac.camel@linuxfoundation.org>
In-Reply-To: 
 <f1f703776907dd518e83f15cc333c99094241cac.camel@linuxfoundation.org>
Date: Fri, 9 Sep 2022 13:14:21 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKqjc8VuRCVoBZLG7+e2aYZRjnQ4LRFMLZcot3-7V0jCrQ@mail.gmail.com>
Message-ID: 
 <CAP9ODKqjc8VuRCVoBZLG7+e2aYZRjnQ4LRFMLZcot3-7V0jCrQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] rust-hello-world: move to recipes-extended
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000677af605e840d7ba"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 16:14:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170494

--000000000000677af605e840d7ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 9 de set. de 2022 =C3=A0s 12:16, Richard Purdie <
richard.purdie@linuxfoundation.org> escreveu:

> On Fri, 2022-09-09 at 12:12 -0300, Otavio Salvador wrote:
> > There is no need to have a single recipe in recipes-example; moving it
> > to recipes-extended allow it being use inside QA tests.
>
> I'm a bit puzzled why it doesn't work from it's current location?
>

It does but  recipes-example only has this recipe.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--000000000000677af605e840d7ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em sex., 9 de set. de 2022 =C3=A0s 12=
:16, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.or=
g">richard.purdie@linuxfoundation.org</a>&gt; escreveu:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Fri, 2022-09-09 at 12:12 -0300, =
Otavio Salvador wrote:<br>
&gt; There is no need to have a single recipe in recipes-example; moving it=
<br>
&gt; to recipes-extended allow it being use inside QA tests.<br>
<br>
I&#39;m a bit puzzled why it doesn&#39;t work from it&#39;s current locatio=
n?<br></blockquote><div><br></div><div>It does but=C2=A0 recipes-example on=
ly has this recipe.</div><div><br></div></div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br=
><a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossys=
tems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems=
.com.br" target=3D"_blank">http://code.ossystems.com.br</a><br>Mobile: +55 =
(53) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-975=
0</div></div>

--000000000000677af605e840d7ba--

