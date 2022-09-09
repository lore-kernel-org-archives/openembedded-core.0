Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F7EECAAA1
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 16:56:17 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web09.254.1662742572159124712
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 09:56:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=p1RF7j44;
 spf=pass (domain: ossystems.com.br, ip: 209.85.218.45,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-ej1-f45.google.com with SMTP id lc7so5502183ejb.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 09:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:from:to:cc:subject:date;
        bh=PB1NCt9cMK5tim6FYvv9+eKwN4ZCmi5zDLsEBoegOTY=;
        b=p1RF7j44/S8/QD9iRNv9FhhhJCaYdLACJzwkb/ZplbDncHoZxeqkO02TXkbRd1Lk6u
         51WIOI8m9HxVvXmDA5eYhgst3S/IfUVIX7AUC5MKfqklVKXSjgVRHmZYs9U1HO9wAMDy
         RH3BZd98va0snX2k73BkPQCkpD+R9HLyvILDI9SLQTB/X997axEw/fbQvQN/CqM4WXIB
         jnwzU9Pehg9vonFDG3djwhU6KVHbPSoMM1cGwVXuerG6Se1D+OYe1mQ9zWYw0DE+72d1
         WWhIFhy7rBo9vNsg9013UsAnyOLH5980ALWUU9Ie0G5mhxPOnsLNv0yFsYfGimz9CHm+
         zqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=PB1NCt9cMK5tim6FYvv9+eKwN4ZCmi5zDLsEBoegOTY=;
        b=cyA0b0PFsTdthMI5M6HLSxe1ugRDR6AznDZuNu95EuP2UV2ZaICdNwx+8ckZNVWsuu
         x3GNIpb0lkuJ/infr2T1pepQWxFqNlB/MYpM7EWy1rJrJtyCm7S4RD8qLR3b266KwtRU
         49tQlUDaxifXR44LNnPBRx+sq/xYv/6zndCMeO4bMCaMukGJQN7vQ5Av6hMy8NOCHdzi
         38cz2RaIFBoU9YWsM+jIdJqdf+wUcYBkTODz4ADJZ9QT4r1U9HoeCNltLSIdRb02qY3b
         eEWzBzyrMcGKUWm6HeotaxbU+c/0TD0lEftTYfty5wQ9W8otj3sRXCvzaYVO2UBZHoDB
         6+wQ==
X-Gm-Message-State: ACgBeo0JP2qhFuwQbvNyLTxJV4svg8JscgOYvgqeJk4hsVPNUsiairtn
	larBIwxkMAcVM419VZkv55JwVriz9LO2b0PQ
X-Google-Smtp-Source: 
 AA6agR4yBOwniRRv64d64RsB0yaIp+15bjtmbzJERDdiUILA055YJs+TIn9cShhmc7iJ9Qxgb/GmKQ==
X-Received: by 2002:a17:906:974b:b0:733:10e:b940 with SMTP id
 o11-20020a170906974b00b00733010eb940mr10603884ejy.326.1662742569897;
        Fri, 09 Sep 2022 09:56:09 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com.
 [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id
 u20-20020aa7d0d4000000b00450a2c0e22asm626098edo.89.2022.09.09.09.56.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 09:56:09 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ej1-f41.google.com with SMTP id gh9so5382903ejc.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 09:56:09 -0700 (PDT)
X-Received: by 2002:a17:907:3186:b0:777:3fe7:4659 with SMTP id
 xe6-20020a170907318600b007773fe74659mr5693478ejb.336.1662742568870; Fri, 09
 Sep 2022 09:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220909151221.434124-1-otavio@ossystems.com.br>
 <f1f703776907dd518e83f15cc333c99094241cac.camel@linuxfoundation.org>
 <CAP9ODKqjc8VuRCVoBZLG7+e2aYZRjnQ4LRFMLZcot3-7V0jCrQ@mail.gmail.com>
 <833b85038912859a815e58ed789b9c7be5689c5c.camel@linuxfoundation.org>
In-Reply-To: 
 <833b85038912859a815e58ed789b9c7be5689c5c.camel@linuxfoundation.org>
Date: Fri, 9 Sep 2022 13:55:56 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKq+qESAhoZkzBhcZo=jrRX+PdfwffUs=o5Jf1wZSpmqLg@mail.gmail.com>
Message-ID: 
 <CAP9ODKq+qESAhoZkzBhcZo=jrRX+PdfwffUs=o5Jf1wZSpmqLg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] rust-hello-world: move to recipes-extended
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002baa5805e8416c55"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 16:56:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170501

--0000000000002baa5805e8416c55
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 9 de set. de 2022 =C3=A0s 13:49, Richard Purdie <
richard.purdie@linuxfoundation.org> escreveu:

> On Fri, 2022-09-09 at 13:14 -0300, Otavio Salvador wrote:
> > Em sex., 9 de set. de 2022 =C3=A0s 12:16, Richard Purdie
> > <richard.purdie@linuxfoundation.org> escreveu:
> > > On Fri, 2022-09-09 at 12:12 -0300, Otavio Salvador wrote:
> > > > There is no need to have a single recipe in recipes-example;
> > > > moving it
> > > > to recipes-extended allow it being use inside QA tests.
> > >
> > > I'm a bit puzzled why it doesn't work from it's current location?
> > >
> >
> >
> > It does but  recipes-example only has this recipe.
>
>
> That makes the commit message a bit misleading then as it doesn't fix
> any QA test.
>

I'll send a v3.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--0000000000002baa5805e8416c55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em sex., 9 de set. de 2022 =C3=A0s 13=
:49, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.or=
g">richard.purdie@linuxfoundation.org</a>&gt; escreveu:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Fri, 2022-09-09 at 13:14 -0300, =
Otavio Salvador wrote:<br>&gt; Em sex., 9 de set. de 2022 =C3=A0s 12:16, Ri=
chard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt; escreveu:<br>
&gt; &gt; On Fri, 2022-09-09 at 12:12 -0300, Otavio Salvador wrote:<br>
&gt; &gt; &gt; There is no need to have a single recipe in recipes-example;=
<br>
&gt; &gt; &gt; moving it<br>
&gt; &gt; &gt; to recipes-extended allow it being use inside QA tests.<br>
&gt; &gt; <br>
&gt; &gt; I&#39;m a bit puzzled why it doesn&#39;t work from it&#39;s curre=
nt location?<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; It does but=C2=A0 recipes-example only has this recipe.<br>
<br>
<br>
That makes the commit message a bit misleading then as it doesn&#39;t fix<b=
r>
any QA test.<br></blockquote><div><br></div><div>I&#39;ll send a v3.</div><=
div>=C2=A0</div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Ota=
vio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br><a href=3D"http://www.o=
ssystems.com.br" target=3D"_blank">http://www.ossystems.com.br</a> =C2=A0 =
=C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems.com.br" target=3D"_bla=
nk">http://code.ossystems.com.br</a><br>Mobile: +55 (53) 9 9981-7854 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-9750</div></div>

--0000000000002baa5805e8416c55--

