Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC95C433FE
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 16:42:19 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web11.1184.1664556134689794624
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 09:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BoVbb3wZ;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id
 u3-20020a4ab5c3000000b0044b125e5d9eso2595241ooo.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 09:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=zB77ZgE7G9Shb5ZNQO/dafToQi9y5m1iKpNQG/gDNqI=;
        b=BoVbb3wZcpXQ6KtJrms7FEaBjrWAkf8FXbgwIKEvMMqb/M9EHTIdA/9vBvMUfA53lI
         1nkTgt5pQImTx+HWe1HG8Do3um+loVSBfv9xhEz1WmUgtrLAQlJxKC5YgZfnEvhNEH3N
         63xtkbssBv7ZMiEEfRH+wqVCRG2NG5HFEh19kkSdY8LNgezImUDPpF+WcmHWTEZKDA6t
         zh2TDhi7oX8mqn4+6OuOPiZ/iyXzNNQTmsSp/1lZwxOZL7Z7XWvviGQz9wC/HOlD4+nf
         x0LKZu8Vndc6eTl9AYJ7Ix7IxIDchoPMEms+wA95/uH0qzc8R+fu6uIq0xwPbk4XKADF
         AyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=zB77ZgE7G9Shb5ZNQO/dafToQi9y5m1iKpNQG/gDNqI=;
        b=w1TX+LbMIekPbX9vEWqFCMUJfFjqh6/VnzSrTWOnSD4z1G4SJ93UlKjbQVz7rfW+2H
         HZRZ7YERQ+yhpn37qJcOWbLna0wrMbmo0J9RfuoOKHdAlEQmX4CV1WGqdDAeQe6VwsFm
         nikbT+rLVAWY6hDtyitSbPHb6xsFqQTVaq6rUFF5lVdhKHS/+XS7gBQTki14AqRj55hn
         Pk6Z+H5vL7a95/qUAHQfhLH2UQ8LHhHVhm1KXgJCDwF14s321bKvqXPRwONI6OBQk4uf
         Uz+bPvWt4nV1iYY0zz1oX3337xM1WHUA9Nz5yoXGW7Cx1itGnzSjS0k5ocBiY87HRWsh
         bdwA==
X-Gm-Message-State: ACrzQf3lK67z6K9Fg9HpqlSFCwJz1Ko4gyAQ4L/UozDOGB25uOx7dD6n
	9PNuCNiNLGUBeTTjeLvrryoqTvddeblj/IfxJGs=
X-Google-Smtp-Source: 
 AMsMyM48wABQVSTQCXOChUoWzy48XTcAxZgY02JJyUJcUulQoRFCyQuLtMG0WAdKwG3L6MG7r1FF0uQQBVQ+vQIsj0Q=
X-Received: by 2002:a05:6830:2019:b0:65b:f320:8cd2 with SMTP id
 e25-20020a056830201900b0065bf3208cd2mr3879905otp.111.1664556133703; Fri, 30
 Sep 2022 09:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220930041614.2704304-1-raj.khem@gmail.com>
 <C9A0CBAD-5373-4F4C-BB73-0AD10A2DF000@arm.com>
 <042F0314-BF16-49A5-AD68-81DFD17739E6@arm.com>
 <CAMKF1srZEorOx-hPiD1zZx1DMiJdZbHgknub04hfyfRFzEhNcg@mail.gmail.com>
 <EA0EFA99-9A83-4699-9D0D-AD5279C58B81@arm.com>
In-Reply-To: <EA0EFA99-9A83-4699-9D0D-AD5279C58B81@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Sep 2022 09:42:02 -0700
Message-ID: 
 <CAMKF1sqwQcT-vpk5Ycydd8BCk3OCmPP-zCKZ-MwRr0G+XPHHNA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssl: Add missing perl module runtime
 dependencies for ptests
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000ee57005e9e7ad16"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 16:42:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171228

--0000000000000ee57005e9e7ad16
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2022 at 9:30 AM Ross Burton <Ross.Burton@arm.com> wrote:

>
>
> > On 30 Sep 2022, at 17:03, Khem Raj via lists.openembedded.org <raj.khem=
=3D
> gmail.com@lists.openembedded.org> wrote:
> >
> > Good point I will check in think it worked fine with glibc but not with
> musl based images I see that Perl-modules is fully empty in packages-spli=
t
> area so soMething does not add up
>
> It will be empty as it=E2=80=99s a metapackage, but it should have lots o=
f
> rrecommends.


Right that was the point the folder should not have been empty it should
have had those rdepends control files


>
> Ross

--0000000000000ee57005e9e7ad16
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Sep 30, 2022 at 9:30 AM Ross Burton &lt;<a href=3D"=
mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><br>
<br>
&gt; On 30 Sep 2022, at 17:03, Khem Raj via <a href=3D"http://lists.openemb=
edded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> =
&lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; Good point I will check in think it worked fine with glibc but not wit=
h musl based images I see that Perl-modules is fully empty in packages-spli=
t area so soMething does not add up <br>
<br>
It will be empty as it=E2=80=99s a metapackage, but it should have lots of =
rrecommends.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Righ=
t that was the point the folder should not have been empty it should have h=
ad those rdepends control files=C2=A0</div><div dir=3D"auto"><br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Ross</blockquote></div></div>

--0000000000000ee57005e9e7ad16--

