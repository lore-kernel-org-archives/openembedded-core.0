Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E968E7C4FD
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 08:55:36 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.10947.1696496131137309924
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 01:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=MhxSWha9;
 spf=pass (domain: smile.fr, ip: 209.85.218.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9b974955474so129741166b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 01:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696496129; x=1697100929; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JcSHB0bVLof8oEKfODTA5LYP2whbD2aNVd/ASQ/XEy4=;
        b=MhxSWha9PtgMAQ7mpdDb6ABjACCMNoRLCKLi0kQ1Utizp2VfTvBHPjwEZuRT0V2DqU
         JvzxzAxOxlJnmqlXO0nBRZrVkolwdtLj6lQ1T+mrqLKD4lKZ3gN7xCi3nq8T/UkgsyiV
         1pOqtnYZY6rbMfEw/XhTJzIObdILefaedzC6xSpcYy6nCtBMrGTZ/ZhiCDOjlNDZ1LfE
         iJUKj6/KeLJbxu/PnanAiRHHoCW1/Q5ofeRwQb5888bXX1gu30+rb1TVZoYioxOMbF2x
         PmRkCXmofM6G5lKV+SUzk2JDjhmJH7ZuHnRVKGllmzct9OI8DAuKCvEbvf3RBjuXuu4e
         nWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696496129; x=1697100929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JcSHB0bVLof8oEKfODTA5LYP2whbD2aNVd/ASQ/XEy4=;
        b=TH7Wdy8B1O9YLkn7e2vTym4hvR2xsbV1gxXq/T2KRH7+4twLqm5UWFBWqPhm+ZbQlb
         Xs4aPKyBGPhb7HkYMdyX+rvkP02+4IJ7jvp0k2GzUgJ04BgCp8vsGO4JDiI7IluDXK0F
         xDDliraRFA0W53tS/o1zMP9lVgZN/XK82Xa9PC7jIN7eCAAsh4QSXKLOmE9EvfPSAjCW
         Tc8mhgwkXFPhvkI1ecc2dvgPs6C7paCGiRaUCHYQ8dAW+l07/jxRyIqhee+du3+xwK41
         x9CyiAOYXsf5hrYzodlOSPQ4w5PHDs8vpvv6pwQdwMl6gWbizs5XNwekl7rdlfwkCYhn
         wujg==
X-Gm-Message-State: AOJu0YxB7RpAy9CP15uwPaZf8G07K9uijIeGR/fMsCn6E9w5uOvi/N7X
	EUfJKL4Tn3kBIygDcJs+xhGtFdZFWeWJLSRAA0DoLQQ/ClGa5PyZfpusaA==
X-Google-Smtp-Source: AGHT+IFfK2Ecw1ggB3Z3yBkCHANJoJpbhL2xX4N4xITNZ1lG4flwed/a5Ely2qCg1fCmXAYSq5WqpkW8leW3X8hk8sc=
X-Received: by 2002:a17:907:7797:b0:9a3:faf:7aaa with SMTP id
 ky23-20020a170907779700b009a30faf7aaamr4070733ejc.15.1696496128944; Thu, 05
 Oct 2023 01:55:28 -0700 (PDT)
MIME-Version: 1.0
References: <20231004125731.1785803-1-yoann.congal@smile.fr> <CANNYZj8ZHKMXWbiG_wRTPm3Za4bYJXhg+19F=PO4RD2BWX35aQ@mail.gmail.com>
In-Reply-To: <CANNYZj8ZHKMXWbiG_wRTPm3Za4bYJXhg+19F=PO4RD2BWX35aQ@mail.gmail.com>
From: Yoann CONGAL <yoann.congal@smile.fr>
Date: Thu, 5 Oct 2023 10:55:02 +0200
Message-ID: <CAMSfU+7qjYQ9GrX9zdzA=g2tnNbzZfzXu-KP38MpdQUFQGryRg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/4] insane: Add unimplemented-ptest checks
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002109640606f44989"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 08:55:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188710

--0000000000002109640606f44989
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeu. 5 oct. 2023 =C3=A0 10:47, Alexander Kanavin <alex.kanavin@gmail.com=
> a
=C3=A9crit :

> On Wed, 4 Oct 2023 at 14:57, Yoann Congal <yoann.congal@smile.fr> wrote:
> > Currently, this check find:
> > * 309 unimplemented ptest in oe-core/meta-poky/meta-yocto-bsp
> > * 827 unimplemented ptest in meta-openembedded
>
> Does this mean there will be this many warnings in everyone's builds?
> If so, this cannot be enabled by default; any new QA warning must
> either not be triggered at all on the current revision (and is added
> specifically to prevent regressions), or come with a realistic plan to
> address the warnings. Implementing hundreds of ptests in a short time
> frame is not realistic.
>

Of course! The warning is not enabled by default. One has to add to
local.conf:
  WARN_QA +=3D "unimplemented-ptest"

See [PATCH v2 1/4] insane: Add unimplemented-ptest infrastructure :
https://lists.openembedded.org/g/openembedded-core/message/188681

>
> On the other hand, the output could go into some kind of report, I'm
> just not sure which one.
>
> Alex
>


--=20
Yoann Congal
Smile ECS - Tech expert

--0000000000002109640606f44989
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 5 oct. 2023 =C3=A0=C2=A010:47, A=
lexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_b=
lank">alex.kanavin@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On Wed, 4 Oct 2023 at 14:57, Yoann=
 Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=3D"_blank">yoan=
n.congal@smile.fr</a>&gt; wrote:<br>
&gt; Currently, this check find:<br>
&gt; * 309 unimplemented ptest in oe-core/meta-poky/meta-yocto-bsp<br>
&gt; * 827 unimplemented ptest in meta-openembedded<br>
<br>
Does this mean there will be this many warnings in everyone&#39;s builds?<b=
r>
If so, this cannot be enabled by default; any new QA warning must<br>
either not be triggered at all on the current revision (and is added<br>
specifically to prevent regressions), or come with a realistic plan to<br>
address the warnings. Implementing hundreds of ptests in a short time<br>
frame is not realistic.<br></blockquote><div><br></div><div>Of course! The =
warning is not enabled by default. One has to add to local.conf:<br></div><=
div>=C2=A0 WARN_QA +=3D &quot;unimplemented-ptest&quot;</div><div><br></div=
><div>See [PATCH v2 1/4] insane: Add unimplemented-ptest infrastructure :<b=
r><a href=3D"https://lists.openembedded.org/g/openembedded-core/message/188=
681">https://lists.openembedded.org/g/openembedded-core/message/188681</a><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
On the other hand, the output could go into some kind of report, I&#39;m<br=
>
just not sure which one.<br>
<br>
Alex<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><font face=3D"Raleway, regular">Yoann Congal</font><div><font face=3D"R=
aleway, regular">Smile ECS - Tech expert<br></font></div></div></div></div>

--0000000000002109640606f44989--

