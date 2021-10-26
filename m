Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA56DC433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 21:51:54 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.3445.1635285114292945905
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 14:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YW3dK+WM;
 spf=pass (domain: gmail.com, ip: 209.85.216.46,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 n11-20020a17090a2bcb00b001a1e7a0a6a6so3475329pje.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 14:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/q3u+1RBNNNAd6lj4aukq0iCoqhpStRSpg6SLdSgjno=;
        b=YW3dK+WMJ5m8ExNNoGSUN8Mix7b0kHJmf6R/5n8JPWPx5AttWaJ8sz+qrU95Y/jehe
         aF58keeas2CV3lfBPIBsukXnDfrpiB8QwNMtcBxdEJCa/w1cbetdtAzufjFyVsH6P14l
         EfhpSsN660CdvXNc98S6G1KJmmWNeOJEzz4+ERPCVns15TnoSqLezG3duXNThZXQfHDX
         tev0rqRp9LAtLPUyPUb4DruykZvzvM/5ANs33QQBSb6jSO4AQS8EjjTKKMxq4ZrYyfAM
         cfH/GqLhVDqv1W6lQewlRRacTASTEXj5vuo2yQV3Sn32nEtEZ5deJrpva2NSQiMSPmwU
         LPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/q3u+1RBNNNAd6lj4aukq0iCoqhpStRSpg6SLdSgjno=;
        b=FiaW77jyW8ISo21tqJRHwuq5ZlGDy2gHqiwVT0hKP7w+CNzmI64+U7AhhT7xOHWuAB
         1sEH4xncy16ixzsddDL5SG6yID4/a77PINZ11sJsPY/2r3Meeog0nLZNlA1BSpLQv40r
         dnKnosEWv1IdHheMyH6uxQ0bRKWK76JW5qCQr71zc3XougwugdnKzx/j+OLBivjgub/b
         kwzldyDrJ8t39GOBwqmsuZV3zyTjRRtiIYZzBEGSR2TsxhRVg+F7FLbuYuTRbXDtJToc
         4IUpOlUcBHNoTieBLz9kyHinWtFe2nN45AR3PLrJi+wP60tO6dLYotfw0uhY+rzlvzzc
         WrSQ==
X-Gm-Message-State: AOAM533QTIUr7lM71Z4IykhvfikqbYzUf6VQxKuHXFE2B8PlecOZMIRJ
	GcjxDXOycksvQLFPYQHeFo3dh2P1OGDTiChFQ88=
X-Google-Smtp-Source: 
 ABdhPJykKnGewoCGYPSsHivg5RNX2JGfCyFlonu6Dupot5opQBhRk74CqdfGhgGcU0tQEEn2hlJJgzWRNHFeXUMBhFk=
X-Received: by 2002:a17:902:8205:b0:141:525d:e169 with SMTP id
 x5-20020a170902820500b00141525de169mr6216250pln.76.1635285113767; Tue, 26 Oct
 2021 14:51:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211011094059.4184654-1-alex@linutronix.de>
 <20211011094059.4184654-24-alex@linutronix.de>
 <CA+chaQc7S7fmdDaWQfqPGv+o6UYrp_hUKgdr08uoegESuDPqew@mail.gmail.com>
 <CANNYZj8NPhV_b9QapAG=SYqhy60Z6cRxqE76Cpxs=qpjQ0F=7g@mail.gmail.com>
 <CA+chaQc13DNKNTFUc4u1EBvOs3ejtNaFiggEVL7rqtfXymq-Bw@mail.gmail.com>
 <CANNYZj9HxF_wLCVECqbfoM-X1uTeN4E=d4=gDkRyz46dV4Di3g@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9HxF_wLCVECqbfoM-X1uTeN4E=d4=gDkRyz46dV4Di3g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 26 Oct 2021 23:51:42 +0200
Message-ID: 
 <CA+chaQfoto-nsiMhsx=X0MdS5CSoydFecoNRgYxMr1QYot+ZbA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 24/25] webkitgtk: update 2.32.3 -> 2.34.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000005009ab05cf487c03"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 21:51:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157455

--0000000000005009ab05cf487c03
Content-Type: text/plain; charset="UTF-8"

PACKAGECONFIG="systemd wayland                                        webgl
gles2 angle                   opengl-or-es                    enchant
             libsecret                   "

On Tue, Oct 26, 2021 at 11:35 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Tue, 26 Oct 2021 at 22:40, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>>
>> No, this one was with opengl enabled, which was failing in do_configure
>> do to missing gperf-native, but now when that was fixed it fails in
>> do_compile.
>>
>> Build without opengl still works with works with my patch.
>>
>
> I can no longer see the issue the patch was supposed to be fixing :-/
> Maybe I had a broken build tree at some point. The patch can probably be
> dropped, but I need to run it on the AB to be sure.
>
> What does 'bitbake-getvar -r webkitgtk PACKAGECONFIG' say on your side? I
> wonder what combination of options triggers your issue.
>
> Alex
>

--0000000000005009ab05cf487c03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">PACKAGECONFIG=3D&quot;systemd wayland =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0webgl gles2 angle=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opengl-or-es =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enchant =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libsecret=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Tue, Oct 26, 2021 at 11:35 PM Alexander Kanavin &lt;<a href=3D"mailto:ale=
x.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 26 Oct 2021 at 22=
:40, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_=
blank">martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><b=
r><div>No, this one was with opengl enabled, which was failing in do_config=
ure do to missing gperf-native, but now when that was fixed it fails in do_=
compile.</div><div><br></div><div>Build without opengl still works with wor=
ks with my patch.</div></div></div></blockquote><div><br></div><div>I can n=
o longer see the issue the patch was supposed to be fixing :-/ Maybe I had =
a broken build tree at some point. The patch can probably be dropped, but I=
 need to run it on the AB to be sure.<br></div><div><br></div><div>What doe=
s &#39;bitbake-getvar -r webkitgtk PACKAGECONFIG&#39; say on your side? I w=
onder what combination of options triggers your issue.</div><div><br></div>=
<div>Alex<br></div></div></div>
</blockquote></div>

--0000000000005009ab05cf487c03--

