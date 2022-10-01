Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59728C433FE
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 22:29:19 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.2348.1664663354498903413
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 15:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gawYXqwb;
 spf=pass (domain: gmail.com, ip: 209.85.167.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id l5so8179609oif.7
        for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 15:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ytZix5IW95mM6TJMUtiQxfzOxGPJxuU33Gv8hxcnCfw=;
        b=gawYXqwbaJ69mS1kJzv7wiYllLgPeTZkVN9UxC7fs/TB+uVJLzZb4Z7BtKhmMe7AEF
         qXM4Pbb7PSMUk44rKmezT5EqGb/Xg3BaSevs3+i0MYqcMvMQDf2o2jQK1pWxPYto6FLr
         Gf9dd97vtTaUzNOs9vXCwJlguhkBZbQgXleF8Vi2qhmFRjE12wlOYio47M43a2ZjCb5D
         jqVJ1zeNJL7g/STsRK8pCNeIeROmonF8lZUzb1i3qgGEThmA/QnLjN43QkwhU8U1Fjzs
         /YrA2R7KJJkfk7dm0ITuDi1jVc8RsJtPNUMzQu+3NZy5F5qwsNfeQLuUIkCIIKc0xcQO
         g+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ytZix5IW95mM6TJMUtiQxfzOxGPJxuU33Gv8hxcnCfw=;
        b=jMOU/DA67r3MLi7PjFcnQ4OTO0u1iL5BUeDT1tLVCHu4ArnFxfVOuB4odveR4JJph4
         gtsCtGrlu6LPW/pWFN02fCJ4sHTS7bcKEZumZMT60fwsKDcwQRiotnCr+oNPNL5m6d4q
         z7k5wdYkfAg2Ig9mQA4eJUevxYjUpCclPUzy2/Gihu3Ob8IsqL9JGkgk8azPzJ3klvqM
         4j6ZAreDQZvwNSl0KIHZiAFlsyRGWkEUiWd/Qxu3tvP91N+cYlwEhbX3x7n17fUOUVAg
         98ab0vmKJh9Rdt/aNQwSetSvO/e57JPiV87S+R2wuCoxdsfW1Ss5l8TxgeZXJk5wE+Un
         MZyw==
X-Gm-Message-State: ACrzQf2O64dQqaYBrYEfPbqAyKPaZSTuUU/XFVWQaWw7XVOCC20nZ6Ii
	DqBWyil4xlh5HbEfAMvK70QfCeRmHeDW4o0uBY4=
X-Google-Smtp-Source: 
 AMsMyM4Ql3KEc1LJ443Ofzj8ZFVK9REifM0QzAmoJlQqTbT74lm1ALqia7/0DrwzoefY5/wrIdPdN828vTmWC444ydk=
X-Received: by 2002:a05:6808:1988:b0:34f:de19:411c with SMTP id
 bj8-20020a056808198800b0034fde19411cmr1611820oib.262.1664663353530; Sat, 01
 Oct 2022 15:29:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220930041614.2704304-1-raj.khem@gmail.com>
 <C9A0CBAD-5373-4F4C-BB73-0AD10A2DF000@arm.com>
 <042F0314-BF16-49A5-AD68-81DFD17739E6@arm.com>
 <CAMKF1srZEorOx-hPiD1zZx1DMiJdZbHgknub04hfyfRFzEhNcg@mail.gmail.com>
 <EA0EFA99-9A83-4699-9D0D-AD5279C58B81@arm.com>
 <CAMKF1sqwQcT-vpk5Ycydd8BCk3OCmPP-zCKZ-MwRr0G+XPHHNA@mail.gmail.com>
 <01558808-3100-4CFA-98DB-244F487435D4@arm.com>
 <CAMKF1sp=ujH14XbTybycQkJWaL93OMfm0dS6FvM_XR+K71EQaw@mail.gmail.com>
 <CAMKF1sp1oqMEXLvXPJhquoFjuDrhc-rtEN5-b05b_FVtYo9w=Q@mail.gmail.com>
 <CAMKF1spSdO680G-gsNe5501L+f5CxcUYt-8eayt8-SwPkKcC1w@mail.gmail.com>
 <DF4844C5-BAA6-4C05-A803-BA1129C1722D@arm.com>
In-Reply-To: <DF4844C5-BAA6-4C05-A803-BA1129C1722D@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 1 Oct 2022 15:29:02 -0700
Message-ID: 
 <CAMKF1sqGKHpeQuDs9tufc7Eu2fnKwutrsuXYKT1bK5j93gC0ug@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssl: Add missing perl module runtime
 dependencies for ptests
To: Ross Burton <ross.burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000db9fa805ea00a3f9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 22:29:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171350

--000000000000db9fa805ea00a3f9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 1, 2022 at 1:01 PM Ross Burton <ross.burton@arm.com> wrote:

> > OK my RRECOMMENDS:perl-modules are fine similar to Ross, however they
> > does not get pulled into final image when openssl-ptest is added to
> > IMAGE_INSTALL
>
>
> That=E2=80=99s definitely worth looking into. This isn=E2=80=99t the solu=
tion, assuming
> you=E2=80=99re not disabling recommendations in your image recipe.


Core-image-ptest works so hmm I don=E2=80=99t know what=E2=80=99s wrong wit=
h my image


>
> Ross
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171349):
> https://lists.openembedded.org/g/openembedded-core/message/171349
> Mute This Topic: https://lists.openembedded.org/mt/94010252/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000db9fa805ea00a3f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Oct 1, 2022 at 1:01 PM Ross Burton &lt;<a href=3D"m=
ailto:ross.burton@arm.com">ross.burton@arm.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">&gt; OK my RRECOMMENDS:perl-modules are fine sim=
ilar to Ross, however they<br>
&gt; does not get pulled into final image when openssl-ptest is added to<br=
>
&gt; IMAGE_INSTALL<br>
<br>
<br>
That=E2=80=99s definitely worth looking into. This isn=E2=80=99t the soluti=
on, assuming you=E2=80=99re not disabling recommendations in your image rec=
ipe.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Core-image-p=
test works so hmm I don=E2=80=99t know what=E2=80=99s wrong with my image=
=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=
=3D"auto"><br>
<br>
Ross<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#171349): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/171349" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/171349</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94010252/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94010252/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000db9fa805ea00a3f9--

