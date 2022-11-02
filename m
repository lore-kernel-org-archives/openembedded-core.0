Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B29C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 11:04:14 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web12.4821.1667387044135782131
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 04:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hfqnziuz;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id a15so24637363ljb.7
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 04:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I8e1OPrkJSjtcThz5ov9IhNAbYkYQZzbI+0EQVlhB7c=;
        b=HfqnziuzgFs1XebwToK/H4hnB1lZ0jtS2KdZCVEhrrxZrG9gt3QgeO3Lr87JzbgwII
         QshVcsK3JRGBkdMtVXi1iB8e+NYrcYWEtNmG8ka3TeUpi07iooZEqgAJFFSeFpSun0qB
         eYeo57ZxR0/+kmNIw/JdB66scrvdfxe4+RiExFrwpUEceIsyC12RslUwcbLl81S68cCj
         x0rWamtyfOqdu562eccBqEbjQw7gcqIxe1up/WMAmXIBqrw1ekn4LvoScbBcLh+W0vLI
         Oja9R89L0wOzR7pU2RosdyDdwjN/WbGGSyuE/EkTVoUAGgox70podj8O17aaD2Biybg0
         D3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I8e1OPrkJSjtcThz5ov9IhNAbYkYQZzbI+0EQVlhB7c=;
        b=pnjN5HuJ9VFjbSSgjWpT7sXfKUKuPNv7PSvg+u9x1qQdPbGgWFDSO8QVg1pwV4s9T6
         qbzL85xomqBHk/HaNzE+r5bxEiSVaiXeQtRbiyAvUtEfch30uFS89epM8RRB14z40l5G
         FN+I6xKOgR9m7WDwSHk0qDNMKZuiTsYKcWmTy/89ACMeaEg5E54uFqNWUXh+fDfASx/m
         xegh//4Kb9J+2Ff9AQRZ0UoddXFOluMm7b9vU47xRNBaxxvG5wnE5Z+FrM9y+K5WDaOh
         NLfGs6upuAw6uonX4Ydd4HU60lmeXu0x77gdJiQalzaYLh3BlRwwuECmFWD3UJ3RqJKB
         Y1YQ==
X-Gm-Message-State: ACrzQf2pGpl3+HHiK/8MKG/k74S+hnJgnuO5T2rer0YDz/AYCR2hzchn
	YmWOu6pkgpuB/5JMm/msQJ6cbLrO6JKrOZt3Ic4=
X-Google-Smtp-Source: AMsMyM73hQahWLHNRbSVtpF9CdmkwIgKb5EPReusJwSGOZ4+oMulH1knfDH2Vcnlj7vUFuPFKYS7nyBc/Z18qBq0BAU=
X-Received: by 2002:a2e:a785:0:b0:277:6076:31ba with SMTP id
 c5-20020a2ea785000000b00277607631bamr4868882ljf.159.1667387042353; Wed, 02
 Nov 2022 04:04:02 -0700 (PDT)
MIME-Version: 1.0
References: <20221014152245.243292-1-jose.quaresma@foundries.io>
 <171DF8E2F2B472D4.2422@lists.openembedded.org> <CANPvuRntRt1e33kujzgs_=K_FSoOOj0N7KCKkyoiyrSynDJc9w@mail.gmail.com>
 <bc610ce45417a57c2212c3fd20a61e57189765bb.camel@linuxfoundation.org>
In-Reply-To: <bc610ce45417a57c2212c3fd20a61e57189765bb.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 2 Nov 2022 11:03:07 +0000
Message-ID: <CANPvuRngat-CF5LGok1i9o8=8YgNZTeNWpjwtaQmF1uKFunrfQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3 2/2] archiver: avoid using machine variable as
 it breaks multiconfig
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, ricardo@foundries.io, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="0000000000005cd7a005ec7acc27"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 11:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172584

--0000000000005cd7a005ec7acc27
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia quarta,
2/11/2022 =C3=A0(s) 10:55:

> On Wed, 2022-11-02 at 09:42 +0000, Jose Quaresma wrote:
> > Are there any issues with this patch or the oe-selftest in the
> > previous one that I need to address?
>
> When I was reviewing the patches that were queued while I was away,
> this one wasn't one I could immediately look at and make a decision on.
> It was therefore deferred for me to spend a bit more time on. I'm
> trying to get there!
>

Thanks for the update.
I decided to ask now because I saw that the master branch has started the
integration again.
If anything is needed from me please let me know.

Jose


>
> Cheers,
>
> Richard
>
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000005cd7a005ec7acc27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia quarta, 2/11/2022 =C3=A0(s) 10:55:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Wed, 2022-11-02 at 09:42 +0000, J=
ose Quaresma wrote:<br>
&gt; Are there any issues with this patch or the=C2=A0oe-selftest in the<br=
>
&gt; previous one that=C2=A0I need to address?<br>
<br>
When I was reviewing the patches that were queued while I was away,<br>
this one wasn&#39;t one I could immediately look at and make a decision on.=
<br>
It was therefore deferred for me to spend a bit more time on. I&#39;m<br>
trying to get there!<br></blockquote><div><br>Thanks for the update.<br>I d=
ecided to ask now because I saw that the master branch has started the inte=
gration again.</div><div>If anything is needed from me please let me know.<=
br><br>Jose<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000005cd7a005ec7acc27--

