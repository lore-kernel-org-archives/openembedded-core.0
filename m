Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F285C6FD1D
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 19:10:50 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.28439.1679080249150847228
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 12:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JDmc/YSm;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id a32so6160858ljq.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 12:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679080247;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5vBzJQrDFGxviCw6tAh6U72rX9kWdSGSaPdZxVCD83A=;
        b=JDmc/YSm+ZC72adWOS9hU7TRGspxEjkKdHNRN5Xzjyb6v6igsqrDTWpXkEtf85cAc3
         VkCFYBN/5OkZ6vveCzNholNgAxxUaMw5FhBunjUVcey/zdmTQRt4JA+OG6MlfZLYmqVj
         WYJA+CX9AO1siudqkRx1E2G9ni9r7gUPuiiGAN3zGcoksaoj7OSjdf618vIExrA4Ca4a
         57O1nUXj2U3IeRMzf88OPeYhxNUalUySIX6xliZukxTHmudB2XqwjYOoG2Izgod50M42
         PW3UerAglRKj7zl3h8rjIxNe2Tna7ZVm80Bh3mbxEfExEUxkVByXdXirWgo6gR36z7O2
         i/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679080247;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5vBzJQrDFGxviCw6tAh6U72rX9kWdSGSaPdZxVCD83A=;
        b=3LnII6tWCuUgTHI2hVvNDubV9PM1OT64uXQm7tMBezesZsarCP99LojyuROGjuXCV8
         ztPzqA+kOHcUAODobeQT9g5HsNLZKMC5djjEy/PzSZLW5JuVuLPFgaB3ike4TNe2OfIx
         bhYUwtU9wGwKr+2NiL+EHZVed/Of0B5Q/1wthL2QdSFynD6qGGMgSbOnqSsBxT7Djlm4
         PCGwP9T14DZ/uH0KmfifM20pt+FFmdLaK2nkuo11xIQDa+HkepObIOyb2MYfAl2E+7sR
         tp0+RnZOnJWnToY5TREv44HX7JbGjyClI+LDcfNmHil1i19NSdGeSRh8UzyW09ChaV39
         iPfA==
X-Gm-Message-State: AO0yUKW1DN1uRS5TnyEfP4V4WGtvgeduc40FQL0CuEruL+e0sMwzlGT3
	YnoBvIPNm0qaz5ARaRQ+Mq168a2F0d4vInh+wHk=
X-Google-Smtp-Source: AK7set9m3I8iUkrhm3p7Ih0BhcLESVkdGDkXHb8Xtt+RUh22Oit0aD6ucwvHjSih20hrsTWppZ/rVbSPeAQM4FxYuSs=
X-Received: by 2002:a2e:9e08:0:b0:299:9de5:2f1c with SMTP id
 e8-20020a2e9e08000000b002999de52f1cmr2341489ljk.7.1679080246957; Fri, 17 Mar
 2023 12:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230317060202.385862-1-f_l_k@t-online.de> <dd5e0f7df463ddc2733dc126beaa3bf29eb8d49b.camel@linuxfoundation.org>
 <9FONRR.ZLSABXKTP67E@t-online.de> <a1807744c2e652e0d05c1c313039e697b2b07d1e.camel@linuxfoundation.org>
 <B0EORR.JWJ884MGYK8G2@t-online.de>
In-Reply-To: <B0EORR.JWJ884MGYK8G2@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 17 Mar 2023 19:10:36 +0000
Message-ID: <CANNYZj-ZHjZ9nihVrLeNgf_eeT-+k2uAGuZQEku8YAF_a2vd3Q@mail.gmail.com>
Subject: Re: [oe-core][PATCH] Remove usage of /var/volatile/tmp
To: Markus Volk <f_l_k@t-online.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ab5b8105f71d55de"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 19:10:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178759

--000000000000ab5b8105f71d55de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think it would help to at least take this through a-full so we have a
higher degree of knowledge in what breaks and what doesn=E2=80=99t.

I didn=E2=80=99t look at the patch in detail and won=E2=80=99t be able to f=
or a few more
days. We definitely need to understand how it affects other init systems,
but it is totally doable, there is only a limited number of them and how
they handle tmp directories and what they expect from them is tractable
research. As long as no one expects RP to do that.

Alex

On Fri 17. Mar 2023 at 17.31, Markus Volk <f_l_k@t-online.de> wrote:

> Am Fr, 17. M=C3=A4r 2023 um 11:53:17 +0000 schrieb Richard Purdie <
> richard.purdie@linuxfoundation.org>:
>
> It would help me if adverse effects are mentioned in commit messages. In
> this case I can spot it easily enough but I don't always know/spot all th=
e
> issues.
>
>
> It would be too harsh to say that I don't care about sysvinit. Of course,
> if something breaks as a result of this commit, I'm willing to take care =
of
> it if I can help. It's just that I don't personally use it, so I haven't
> identified any other issues that might be relevant to sysvinit. Other tha=
n
> the obvious that anything that would write directly to '/var/volatile/tmp=
'
> would break.
> At least I checked that sysvinit images could still boot. I have
> successfully run core-image-ptest-glib-2.0 with this patch applied. If I
> knew of any problems with sysvinit I would have pointed them out, but
> unfortunately I have no further findings yet
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178758):
> https://lists.openembedded.org/g/openembedded-core/message/178758
> Mute This Topic: https://lists.openembedded.org/mt/97667591/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ab5b8105f71d55de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">I think it would help to at least take this through =
a-full so we have a higher degree of knowledge in what breaks and what does=
n=E2=80=99t.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">I did=
n=E2=80=99t look at the patch in detail and won=E2=80=99t be able to for a =
few more days. We definitely need to understand how it affects other init s=
ystems, but it is totally doable, there is only a limited number of them an=
d how they handle tmp directories and what they expect from them is tractab=
le research. As long as no one expects RP to do that.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Alex</div></div><div><div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri 17. Mar 2023 at 17=
.31, Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blank"=
>f_l_k@t-online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style=
:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><div id=3D"m_-3=
837995915579694033m_3953888058158191395geary-body" dir=3D"auto">Am Fr, 17. =
M=C3=A4r 2023 um 11:53:17 +0000 schrieb Richard Purdie &lt;<a href=3D"mailt=
o:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linu=
xfoundation.org</a>&gt;:<br><blockquote type=3D"cite"><div style=3D"white-s=
pace:break-spaces" dir=3D"auto">It would help me if adverse effects are men=
tioned in commit messages.
In this case I can spot it easily enough but I don&#39;t always know/spot
all the issues.</div></blockquote><div><br></div><div><div>It would be too =
harsh to say that I don&#39;t care about sysvinit. Of course, if something =
breaks as a result of this commit, I&#39;m willing to take care of it if I =
can help. It&#39;s just that I don&#39;t personally use it, so I haven&#39;=
t identified any other issues that might be relevant to sysvinit. Other tha=
n the obvious that anything that would write directly to &#39;/var/volatile=
/tmp&#39; would break.</div><div>At least I checked that sysvinit images co=
uld still boot. I have successfully run core-image-ptest-glib-2.0 with this=
 patch applied. If I knew of any problems with sysvinit I would have pointe=
d them out, but unfortunately I have no further findings yet=C2=A0</div></d=
iv></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#178758): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/178758" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/178758</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97667591/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97667591/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</div>

--000000000000ab5b8105f71d55de--

