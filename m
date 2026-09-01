Return-Path: <frezidok1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AEA0C61DE4
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 05:48:42 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1282.1788241717344837878
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 22:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ecg5K+F1;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: frezidok1@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-66e63afda8fso2102019d50.3
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 22:48:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788241716; cv=none;
        d=google.com; s=arc-20260327;
        b=HrF/OJsk4d+2nyrNpsD4RTrOdtHRbOH/YzMfLvAq9AYOq4AU7MNC5+ylBpR+ULDolH
         FeIR4FyHgdKYfocTjQODlZaS1ykGD+DMN6BXbQ3qbd4u7EuN3+hkR+uKXQJrqNrCpSAV
         W4QqU479az9at/vNpt4NzbOJNESYtktNq0UhA4YMwMrqiei6kujPRGvybcTOcU1zLtkx
         GmWDrLef4e13+psaIexuFAs2cltiq2iMj/Wvm/xn/NdzwSI4Tthm27oNnGks7zLFRd9e
         dJq9bKw2gDULuF2rwY+jI1rAb145+WUPf/WRWlopUAi9LUwhPWUbS61dr5YWZ77gWyyj
         XD+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2d7seWZzicr/hYqK3+E4Afa5j15W9jSJ2yKp99hNJKM=;
        fh=OORmwxTzc7lkglRMfNmJ9TSOzQk3MXdj9ntP6C6YZUM=;
        b=Bi8yBDBX5WO7biGNFSKyIDyp4Vt4BGvNNhvwgFIIaOaSmS0/81mIWT8QjEpvp0NTNV
         0yr6qhk7vAifN0zvV0y94WT20UeT5CR0DTM9aBdFV0Sk2ZM7HMlJdOPz8wSPOWQpdH9k
         EF5U5JMcUX2PpaCegN4ODXRQP8gckYWGFo/TprCN5QleF4IvU70XiMM1YYygadIClb68
         Qd5wL0lajk+BoZ6Sz5s0MvzWkn88uH4RBKQNyHe1jYWK8hgT7zAl56Gzme91gOB8AoRE
         JhrG2N+BHcohtnatkfScL+TK51kQP/YuAZGkUVuwTkAEvzEUueCXCc0fB+tEb9SL0XdY
         HC5g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788241716; x=1788846516; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2d7seWZzicr/hYqK3+E4Afa5j15W9jSJ2yKp99hNJKM=;
        b=ecg5K+F1EqJ803iFROdZA8DP7n5D9nfGF47LrMWFUYj1z3lc8S+g59cEUA9XJffMXv
         EAo2xxGfpPWHD+pFPXsF0LyTzdhCmM4NWoPfI563TtPInez8ljAnmxbkKpjgXvrz3CnU
         X5By5r5lvh2lc1Gk009PC2NGrln8IQactYRWxH9xUY7pkKB15HDFUviOLDewap0yxc1Z
         V/+qSpXwZDumWcX+FjxCtB0mF8KX1EwlSxPgUdOTmr4OlVKBr/JMjvvTG/l0djGDiS0M
         cWwQJH6AK8F/BhuMqKB3Dk/2oceFDioGNvlovAMYci3OCUpuYtz4j/nWV+5ad+P5592Z
         1ywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788241716; x=1788846516;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2d7seWZzicr/hYqK3+E4Afa5j15W9jSJ2yKp99hNJKM=;
        b=cVL3/mQ8Xhs2Y987p9UJKJzTd8OUFwItDkCExDji+n247pbc2E/I6o6+SlLB5SP3dK
         aNLSvDyF0d0XkigkAFqkXFdHZ2EgaKSa6wxyj/WW2sypWUGPFrNeSw21sSDbJElazs+1
         gtUzf1lxvSrBSQfS2g2HSpm3NAt70B6BeT+K1WA+sisfhoC7pZNIkfsCu+OKzHlGE6J/
         bS49pLghdJA2Y3jKw/NiSrzXu6HmuuChQpldYmf8YL8cStjLitU4tyiHsMDN6Bpk5O9/
         i+2myv6UU8TbjQvK8ihLjzlO5BRPlJ1kfqkH1TpJxpH22gLdhxzko09FZlBcdp8tayZY
         S/Qw==
X-Gm-Message-State: AFuF++mdrQHmVKTI8XA1v0jy3FNsJ8dbKJMb43GxJZPBPheKysAsus73
	xsR7gWihW8+4HOmq81H5IUyLwhEMJLbpa/4OVMV8X97Srh4p/GP7yRECxWjiP73CW/3YLy1pQ97
	ZYQiuDhaifKj7H7uBUb4OQykqFvRCbTg=
X-Gm-Gg: AYBFou1MA2GKk+lABPNtaRLgbl473a/ZSN0sG0s8Shi0SchvavM5mpwGJOAveTDJ7HC
	JDXnidt41Dhme2OPZkAkp9nEBzvx9eHUx+EXXif053yzwp39xYxvCO8n4ENWEzApvn60hajsY9m
	gbK5Hvt1zMnAPrl0nfmoeqLDD7cmXzyq/891FcVX6qHWdemcESykyxOz3QxR87YUTPck6g81dcz
	6QkbULpVJvEHJFFbRctyVbB141q4NKkbmU38dqpvOf3BaRScGeIIJvKP5s9oAGUBV338sWPgDzq
	3eFDE3U/iAJxmDNWhvK9LTujOC4ktrCrazd37lMZI3rG
X-Received: by 2002:a05:690e:1247:b0:66f:8ea3:9326 with SMTP id
 956f58d0204a3-66f8ea394d7mr359156d50.9.1788241716269; Mon, 31 Aug 2026
 22:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260831080223.124050-1-frezidok1@gmail.com> <DL3QHRJANNVL.8YPDPUMNTLHZ@bootlin.com>
In-Reply-To: <DL3QHRJANNVL.8YPDPUMNTLHZ@bootlin.com>
From: Dmitry Sakhonchik <frezidok1@gmail.com>
Date: Tue, 1 Sep 2026 08:48:24 +0300
X-Gm-Features: AcwNN1VjsLdnTgL8eJDLQJOnDHjaPsGcQbw8c8E98G4BJ5M0h2pZda265FoX7oI
Message-ID: <CAP4GjN78wJPuN=hcN7+ogx_j1We2jAwPQDE=DauQFBowN3-CRw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] io_uring-writev: open output file through io_uring
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, martin.jansa@gmail.com
Content-Type: multipart/alternative; boundary="0000000000004556b1065a6578c7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 05:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244785

--0000000000004556b1065a6578c7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi.

Yes, it=E2=80=99s for Martin=E2=80=99s branch, he=E2=80=99s already merged =
it. I just couldn=E2=80=99t
figure out how to specify a branch I am applying to.

=D0=92=D1=82, 1 =D1=81=D0=B5=D0=BD=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 08:35=
, Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com>:

> On Mon Aug 31, 2026 at 10:02 AM CEST, Dmitry Sakhonchik via
> lists.openembedded.org wrote:
> > From: Dmitry Sakhonchik <frezidok1@gmail.com>
> >
> > The existing test creates the output file with open(), which ends up
> > using openat() and is therefore intercepted by pseudo before the actual
> > io_uring write operation happens.
> >
> > Use IORING_OP_OPENAT to create the output file through io_uring as well=
.
> > This makes the test successfully bypass pseudo
> >
> > io-uring-writev.bb: wrynose doesn't support "S =3D ${WORKDIR}" anymore,
> fix it
> >
> > [YOCTO #15244]
> >
> > Signed-off-by: Dmitry Sakhonchik <frezidok1@gmail.com>
> > ---
>
> Hi Dmitry,
>
> I suspect this was targeting Martin's branch and not master? Otherwise
> we are missing the commits adding the io-uring-writev recipes.
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--0000000000004556b1065a6578c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Hi.=C2=A0</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Yes, it=E2=80=99s for Martin=E2=80=99s branch, he=E2=80=99s alrea=
dy merged it. I just couldn=E2=80=99t figure out how to specify a branch I =
am applying to.=C2=A0</div><div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">=D0=92=D1=82, 1 =D1=81=D0=B5=D0=BD=D1=82. 2026=E2=
=80=AF=D0=B3. =D0=B2 08:35, Mathieu Dubois-Briand &lt;<a href=3D"mailto:mat=
hieu.dubois-briand@bootlin.com" target=3D"_blank">mathieu.dubois-briand@boo=
tlin.com</a>&gt;:<br></div></div></div></div><div><div><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon Aug 31, 202=
6 at 10:02 AM CEST, Dmitry Sakhonchik via <a href=3D"http://lists.openembed=
ded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wr=
ote:<br>
&gt; From: Dmitry Sakhonchik &lt;<a href=3D"mailto:frezidok1@gmail.com" tar=
get=3D"_blank">frezidok1@gmail.com</a>&gt;<br>
&gt;<br>
&gt; The existing test creates the output file with open(), which ends up<b=
r>
&gt; using openat() and is therefore intercepted by pseudo before the actua=
l<br>
&gt; io_uring write operation happens.<br>
&gt;<br>
&gt; Use IORING_OP_OPENAT to create the output file through io_uring as wel=
l.<br>
&gt; This makes the test successfully bypass pseudo<br>
&gt;<br>
&gt; <a href=3D"http://io-uring-writev.bb" rel=3D"noreferrer" target=3D"_bl=
ank">io-uring-writev.bb</a>: wrynose doesn&#39;t support &quot;S =3D ${WORK=
DIR}&quot; anymore, fix it<br>
&gt;<br>
&gt; [YOCTO #15244]<br>
&gt;<br>
&gt; Signed-off-by: Dmitry Sakhonchik &lt;<a href=3D"mailto:frezidok1@gmail=
.com" target=3D"_blank">frezidok1@gmail.com</a>&gt;<br>
&gt; ---<br>
<br>
Hi Dmitry,<br>
<br>
I suspect this was targeting Martin&#39;s branch and not master? Otherwise<=
br>
we are missing the commits adding the io-uring-writev recipes.<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>
</div>

--0000000000004556b1065a6578c7--

