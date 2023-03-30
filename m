Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E967C761A6
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 12:26:11 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.23594.1680179166481298194
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 05:26:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hAKvtK7D;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id q16so24258094lfe.10
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 05:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680179164;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y6xSebUseBsAMYuoujZvVX5D69kD4gI3oVG84VQnpKQ=;
        b=hAKvtK7D5FTJb1y1EZaJNHifEUKtu9aOg2sY8qDS0b7wywebDrs3LRR3Ml9NUToLuS
         8GQEgeWPxDWZNHsr7Fbgm7a7HHX8C/jG5mcBdv7hTMFBiRiURv4sDW6feMUVMrdFF9Mm
         h2Lev3ZYOt8B4Uz5QHqxwtaxY466WKjLuOJorV+w+zJoWkDFAFyF9k0yX+Wl8Y51bUlJ
         BQLsR8ahIY0JQ7Q3mW+Q1xKTn8gl+/JIR1PSSw7Ewd1P4VQNTY6RKtRhoTv4YBG+JBwA
         kmvS2ZcU1jrty6OA6ZXzzdVlSU4Dc/Y9ykG6GySMJF/6G8MqB4WrsPi9qUEYnEC1h6/o
         UZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680179164;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y6xSebUseBsAMYuoujZvVX5D69kD4gI3oVG84VQnpKQ=;
        b=VKc36fP0nf3lyPrAxXwbq0CN2JqSVBDy1hKrjwjQyXeaRW/uQ6IhppDQ7Fko/ZorLq
         plzb+dFiYCU2tHPe8kasXvMvpDJXnCttslvyiwvaNQytZX3WQzBHxQaHrU/e0Hn2E6bG
         j2fhErnJ/UxSHCmao/wybj2HI7pID7USor8mhCbcCxOyHXqKE9TzfhteA9Jy2UX4eq5A
         9knHx3v2Qa0ToIiabFRsVrgN+Y+ejhga9zxTSVDuZT++LYvO9N5KFSkhAtwxR7tvRfqz
         5yz2H62ehcgTSb+C/t8o4VywDr6tpKcXa92/RufXTf5SCKqfRiBkgL7y75lJMzcUUADm
         k/Mg==
X-Gm-Message-State: AAQBX9fcdmLk6HRgDis0ZG3e5ZvZBICJeu7spE4O9zajx/IEKooAm2Xx
	HuV7z/mgqhwbSBUa7DiTLGHLYe7P3QsHAEgBN9o=
X-Google-Smtp-Source: AKy350YynEZcbmeIxel1BXfoswpi1g/k4RKbymmbjSu5wihnd0eq2cjN06BHSeY0wBoYF9db5jigoikiI9X6UIyExr4=
X-Received: by 2002:ac2:5a5c:0:b0:4ea:fc8f:7852 with SMTP id
 r28-20020ac25a5c000000b004eafc8f7852mr6761867lfn.12.1680179164271; Thu, 30
 Mar 2023 05:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680103647.git.frederic.martinsons@gmail.com>
 <8d69fe1e3f390a7e8fa568abdc20e5d0ee634fc1.1680103647.git.frederic.martinsons@gmail.com>
 <20230330090324705e693e@mail.local> <2023033009145701b67168@mail.local>
 <CA+cAker5pJUBoOSEVZtk++394xGgXqcDDD9eFJpu07+Ai5PaWg@mail.gmail.com> <d83c8058e83e33d02e4650c2d29c1a03a6db739f.camel@linuxfoundation.org>
In-Reply-To: <d83c8058e83e33d02e4650c2d29c1a03a6db739f.camel@linuxfoundation.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Thu, 30 Mar 2023 14:25:53 +0200
Message-ID: <CA+cAkeqci0jX=+1tyRrPpUZMaLBc2Z1zH3TGB+V_QX7kzsymtw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V4 5/5] meta-selftest: provide a recipe for zvariant
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org, 
	alex.kiernan@gmail.com
Content-Type: multipart/alternative; boundary="0000000000003ed74305f81d32d9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 12:26:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179316

--0000000000003ed74305f81d32d9
Content-Type: text/plain; charset="UTF-8"

Ok,  I'll do this rebase in the coming hours.


On Thu, 30 Mar 2023 at 13:35, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2023-03-30 at 11:47 +0200, Frederic Martinsons wrote:
> > What version of bitbake you had pulled ?
> > Because "mandatory checksum on crates" is a patch I submitted two
> > weeks ago
> > (https://patchwork.yoctoproject.org/project/bitbake/patch/20230317081
> > 916.1857201-2-frederic.martinsons@gmail.com/))
> > and it is not yet merged in bitbake master nor in poky master.
> >
> > So I construct the present series without these patches in mind since
> > it is not related.
> > I you plan to merge the previous series, I can update the zvariant
> > for this recipe of course
> > it can be done by issuing "bitbake -c update_crates zvariant" if this
> > patch
> > (https://patchwork.yoctoproject.org/project/bitbake/patch/20230316121
> > 249.28209-1-frederic.martinsons@gmail.com/) is present
> >
> > I'm sorry, I must admit that I'm kinda lost with the patch submission
> > process when it impacts multiple different
> > projects.
> > Can you advise on the way of doing this?
>
> I've merged the other series now so could you rebase this one on master
> please?
>
> Usually if there are two related series you'd base one on the other and
> note it in the 0/X of the series. We'd work on the assumption the
> earlier patches would merge first.
>
> The holdup was that I wanted to check something in the bitbake patch,
> which turned out to be fine, I just needed to do it as part of review
> due diligence.
>
> Cheers,
>
> Richard
>

--0000000000003ed74305f81d32d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ok,=C2=A0 I&#39;ll do this rebase in the coming hours.<div=
><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Thu, 30 Mar 2023 at 13:35, Richard Purdie &lt;<a href=3D"mail=
to:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 Thu, 2023-03-30 at 11:47 +0200, Frederic Martinsons wrote:<br>
&gt; What version of bitbake you had pulled ?<br>
&gt; Because &quot;mandatory checksum on crates&quot; is a patch I submitte=
d two<br>
&gt; weeks ago<br>
&gt; (<a href=3D"https://patchwork.yoctoproject.org/project/bitbake/patch/2=
0230317081" rel=3D"noreferrer" target=3D"_blank">https://patchwork.yoctopro=
ject.org/project/bitbake/patch/20230317081</a><br>
&gt; <a href=3D"http://916.1857201-2-frederic.martinsons@gmail.com/" rel=3D=
"noreferrer" target=3D"_blank">916.1857201-2-frederic.martinsons@gmail.com/=
</a>))<br>
&gt; and it is not yet merged in bitbake master nor in poky master.<br>
&gt; <br>
&gt; So I construct the present series without these patches in mind since<=
br>
&gt; it is not related.<br>
&gt; I you plan to merge the previous series, I can update the zvariant<br>
&gt; for this recipe of course<br>
&gt; it can be done by issuing &quot;bitbake -c update_crates zvariant&quot=
; if this<br>
&gt; patch<br>
&gt; (<a href=3D"https://patchwork.yoctoproject.org/project/bitbake/patch/2=
0230316121" rel=3D"noreferrer" target=3D"_blank">https://patchwork.yoctopro=
ject.org/project/bitbake/patch/20230316121</a><br>
&gt; <a href=3D"http://249.28209-1-frederic.martinsons@gmail.com/" rel=3D"n=
oreferrer" target=3D"_blank">249.28209-1-frederic.martinsons@gmail.com/</a>=
) is present<br>
&gt; <br>
&gt; I&#39;m sorry, I must admit that I&#39;m kinda lost with the patch sub=
mission<br>
&gt; process when it impacts multiple different<br>
&gt; projects.<br>
&gt; Can you advise on the way of doing this?<br>
<br>
I&#39;ve merged the other series now so could you rebase this one on master=
<br>
please?<br>
<br>
Usually if there are two related series you&#39;d base one on the other and=
<br>
note it in the 0/X of the series. We&#39;d work on the assumption the<br>
earlier patches would merge first.<br>
<br>
The holdup was that I wanted to check something in the bitbake patch,<br>
which turned out to be fine, I just needed to do it as part of review<br>
due diligence.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>

--0000000000003ed74305f81d32d9--

