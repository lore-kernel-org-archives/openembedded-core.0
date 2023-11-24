Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D2B4C61D97
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 17:05:29 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.144261.1700845519922419435
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 09:05:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jkaYTroQ;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1fa0885e1c2so262488fac.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 09:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700845519; x=1701450319; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w+aO++fj6gvb8hLt2KGGiWLrRFAYxmhk3vHQf1OCvCI=;
        b=jkaYTroQDZ4U/P31EvbkRAIkQb/mf64oG8bbqzq35FvDf3eF3bP9nv/eaIpiYtLXJI
         AT/NpmWh5RCHy/OgXikHXp+JDOJNmp81FpZ5JHSVmo7YprAf6AGDbDrDr7xkZFvKM8v1
         R+IBIKo5Jb/q0cFMn0Hz5FLhVsKSxX21g8/p5duivUL3CJzVJYkxwEl55nzEjigQwRVm
         FuoU1u5hp7Z0f3WotFwtvzhi61h4pUO7zXd6YWGDlZO1HeBdTEVg8oATiH05knXROGBj
         tElL05AwLHVMNmQl0CDGv2Bl2E0TTNtZEbDkTcKTYT54LHtAIWa5Uub+F78hl6fsw8OF
         22JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700845519; x=1701450319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+aO++fj6gvb8hLt2KGGiWLrRFAYxmhk3vHQf1OCvCI=;
        b=wEJrSVWL17MYS0v0NP7ohryW5aKdqYDcJevh8CIIwbHHq2n5o90PGvoRY5SQGcGSJL
         NzW8Ap1r1U+fXZ/6NLuSq9iXIA5NJBUOjUG3x+EsoHW36+uZ5SbouR3NEy/e5GrQtopd
         q2Yx3un7Qc7wlY0XNKWHisO9rqhoBkcL7Nq8Mh1vCdJzEY0K2VDuAP1J2L9nTQMcH3ED
         GF32VCFiqHhtvKzU0kXyynlIhvJbMqh+VVxxiBsCk1DjJnoKkIMJvDvkWfRVV5XxcDT9
         gO4hdUQOEvA/CpYvmkVr1sr4PWf5lmsbZi+cGWM3LVrySpJl14cmwrzq6l6Nkfne4TKC
         V56w==
X-Gm-Message-State: AOJu0YwOJgHACirXxKltnywrGzuupkIJW9+0J49+ejhzSaKuAiNVGl7+
	Hh1wlDzGGwQjWRlcZcMq7xmR88E+wJiO1tExltc=
X-Google-Smtp-Source: AGHT+IE9v4wNeoWzZOYkmVT/lB9roev3x2ld7lajeGqVYi6lLaj1ujFsucW+A25Xg2uCrkTxE5+P4ZFabG5wZzI2VeI=
X-Received: by 2002:a05:6870:788c:b0:1eb:e8b:73cb with SMTP id
 hc12-20020a056870788c00b001eb0e8b73cbmr4919106oab.58.1700845519175; Fri, 24
 Nov 2023 09:05:19 -0800 (PST)
MIME-Version: 1.0
References: <20231122063119.3620722-1-raj.khem@gmail.com> <462EA886-8F44-464F-88ED-609B42680F39@arm.com>
 <307F70DF-9B9F-4A38-9788-F47DB99193D1@arm.com> <CAMKF1srK4r=YYB35noP5f30JJMO-cMYUyMMixWFrAP3tdox1+g@mail.gmail.com>
 <2A0F1B32-90E9-4813-AB9C-833D1264B78C@arm.com>
In-Reply-To: <2A0F1B32-90E9-4813-AB9C-833D1264B78C@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Nov 2023 09:05:08 -0800
Message-ID: <CAMKF1sqRhmNGsuZP9vQDXHa93kja5eyMaEbd+U4C1EN-ed3kRA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v9 1/3] vte: upgrade 2.72.2 -> 2.74.0
To: Ross Burton <ross.burton@arm.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Markus Volk <f_l_k@t-online.de>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fd03c8060ae8f427"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 17:05:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191213

--000000000000fd03c8060ae8f427
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 9:01=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:

> > > Split the packages so that the GTK3 binaries are in separate packages
> to the GTK4 binaries.
> >
> > Hmm interesting I wonder if it Will avoid adding the dependencies for
> dbg and dev packages
>
> It won=E2=80=99t, you=E2=80=99ll need to manually handle those dependenci=
es.
>

Right. So the real question still remains regardless how this is packaged
which is can multilib rootfs have different glib cache

>
> Ross

--000000000000fd03c8060ae8f427
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Nov 24, 2023 at 9:01=E2=80=AFAM Ross Burton &lt;<a =
href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">&gt; &gt; Split the packages so that th=
e GTK3 binaries are in separate packages to the GTK4 binaries.<br>
&gt; <br>
&gt; Hmm interesting I wonder if it Will avoid adding the dependencies for =
dbg and dev packages <br>
<br>
It won=E2=80=99t, you=E2=80=99ll need to manually handle those dependencies=
.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Right. So the re=
al question still remains regardless how this is packaged which is can mult=
ilib rootfs have different glib cache=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><br>
Ross</blockquote></div></div>

--000000000000fd03c8060ae8f427--

