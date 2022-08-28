Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A852ECAAD2
	for <webhook@archiver.kernel.org>; Sun, 28 Aug 2022 17:13:00 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.61119.1661706779655440614
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 10:13:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AFLfPYEO;
 spf=pass (domain: gmail.com, ip: 209.85.218.43,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id se27so3839143ejb.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 10:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Yu7r89VvHiL8cStCBlTb994dOLbeJd/Ab6WMKXbL3/w=;
        b=AFLfPYEOV7+YHXGMMAgNU07JsG+NF/NvbGg1R7PNJdicWkpvRvCzDRv0nl396ACRSF
         n6xnjR4VbiBwI51XvC6ZDN/aI9AAcugh9SXB3qBl0OldR4BLD9VN9AexBqTk1toPJPBx
         Lu9SMB13JABdLjah+YntUnD99GO6+GJtUo34zImKt6GXll1MDGvK1y0Glh6D93sHMLIz
         J4zVG/azpxauaL1898/z5svBxFA+wWsQ2lkCHN1h8jTWc1z6UYRLTmBPDYkKeG2N2frg
         5IJCkUzeIyq0opYMgXP0Q14tbdE/G89h26sDVo4fmGaUWcGXHOCvi5+ANyXt4d2JXG0O
         eWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Yu7r89VvHiL8cStCBlTb994dOLbeJd/Ab6WMKXbL3/w=;
        b=dv2sSVeequ4p4E1HlXmWFTyLJgXzd8c/LWkBA8psqKWl2jeXZnRAFyupt+i7FM1zfl
         FY2h9ovU54138N59/a1VaphpTqIj2vjEVuyCX6g5GvpZYPMdVRyFHJ4MxlA0fVmrpIGD
         QZd9/dFlEKDTgRmVR7RSqAAQmhsnKiAGGMZ/hU/8P7GsZzraQClxJCKxyrQJ+roGsAw3
         FUmoB1oLrhLDTtU9WdeCclJVaLDDWRtSuk0XIdIJXbxUDNPwi0z8gNTXP9BK/y+lTkRw
         xMz4N5s2fdzIBmUvqm3QYzcNzFHsXiJeFSQEu5T4bIf/3eHKVzmjdVqQPmvJyRCUmrMi
         zL1A==
X-Gm-Message-State: ACgBeo17yCTA0numCSTeyl1pc6zHEdrFRuoOZHfEXtyYJmMS/mdNMc0j
	On2WJwduiyaDq9bDMUSDkCQdB2SFQ9lupYv+Msw=
X-Google-Smtp-Source: 
 AA6agR7EvhQVvALNh+PvQNcze6M8DDLCKyea6/K2OB10Eh8wqQJvgXn/7fOodZdYjm6j5Mb0++7IMMbq9scPHogqgVA=
X-Received: by 2002:a17:907:c24:b0:73d:7c20:cc45 with SMTP id
 ga36-20020a1709070c2400b0073d7c20cc45mr11474276ejc.294.1661706777930; Sun, 28
 Aug 2022 10:12:57 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CABF_=yi9-vQ4b-4qnOz+W5bbJmjRmk72YOog+GvDVBVyQ160+Q@mail.gmail.com>
 <CANNYZj-c97JgQnN-W3Ae3YzpWRGOO9hwO_xF0WDuoMsCaOwyKg@mail.gmail.com>
 <CABF_=yhQmn4Odw1wabzdS+_+D3tqpE0S6r6aCsuP9PbsudF9ow@mail.gmail.com>
 <CANNYZj8M+RfFmhPdM7caohuOtThORatkDZKuxL68xodDd_=v8w@mail.gmail.com>
 <CABF_=yhbfxZG7tPnRX3iw3nmY8DE9MQHr3vV15okerxompoH1w@mail.gmail.com>
 <CANNYZj_mnJ+4YmGfjKd2xDMEoKNjO5L-_B+y0CFGJ=e8KL3Kwg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_mnJ+4YmGfjKd2xDMEoKNjO5L-_B+y0CFGJ=e8KL3Kwg@mail.gmail.com>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Sun, 28 Aug 2022 19:12:45 +0200
Message-ID: 
 <CABF_=yijUsFqwKMP48zT4eTV-0H4eDHfXge7jiorYiiZt0RHhw@mail.gmail.com>
Subject: Re: [OE-core] makeself
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000038329305e7504203"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Aug 2022 17:13:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169988

--00000000000038329305e7504203
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI Alexander,

The recipe is tested for native and target.
I'll make v2 with the remarks.

br

On Sat, Aug 27, 2022 at 6:20 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Sat, 27 Aug 2022 at 10:29, jan vermaete <jan.vermaete@gmail.com> wrote=
:
> > The recipe is currently in  master-next.
> >
> https://patchwork.yoctoproject.org/project/oe/patch/20220826195403.893639=
-1-jan.vermaete@gmail.com/
> >
> > Could you review?
>
> I think Khem's review covers what I wanted to say.
>
> > What I don't know is how to prove the executables used in the script of
> makeself are those of yocto and not those of the host system.
> > E.g. zstd is used by the script as 'zstd' (
> https://github.com/megastep/makeself/blob/master/makeself.sh#L535).
> > But zstd itself is set in the HOSTTOOLS of Yocto
>
> In either case zstd will be in PATH, so it should simply work.
> HOSTTOOLS will also refuse to proceed if anything in the list is not
> yet installed on the host. But didn't you test the recipe?
>
> Alex
>


--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

--00000000000038329305e7504203
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">HI Alexander,<div><br></div><div>The recipe is tested for =
native and target.</div><div>I&#39;ll make=C2=A0v2 with the remarks.</div><=
div><br></div><div>br</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Sat, Aug 27, 2022 at 6:20 PM Alexander Kanavi=
n &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sa=
t, 27 Aug 2022 at 10:29, jan vermaete &lt;<a href=3D"mailto:jan.vermaete@gm=
ail.com" target=3D"_blank">jan.vermaete@gmail.com</a>&gt; wrote:<br>
&gt; The recipe is currently in=C2=A0 master-next.<br>
&gt; <a href=3D"https://patchwork.yoctoproject.org/project/oe/patch/2022082=
6195403.893639-1-jan.vermaete@gmail.com/" rel=3D"noreferrer" target=3D"_bla=
nk">https://patchwork.yoctoproject.org/project/oe/patch/20220826195403.8936=
39-1-jan.vermaete@gmail.com/</a><br>
&gt;<br>
&gt; Could you review?<br>
<br>
I think Khem&#39;s review covers what I wanted to say.<br>
<br>
&gt; What I don&#39;t know is how to prove the executables used in the scri=
pt of makeself are those of yocto and not those of the host system.<br>
&gt; E.g. zstd is used by the script as &#39;zstd&#39; (<a href=3D"https://=
github.com/megastep/makeself/blob/master/makeself.sh#L535" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/megastep/makeself/blob/master/makes=
elf.sh#L535</a>).<br>
&gt; But zstd itself is set in the HOSTTOOLS of Yocto<br>
<br>
In either case zstd will be in PATH, so it should simply work.<br>
HOSTTOOLS will also refuse to proceed if anything in the list is not<br>
yet installed on the host. But didn&#39;t you test the recipe?<br>
<br>
Alex<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Jan Vermaete<br>=E2=80=9CSuccess is a self-corre=
cting phenomenom.=E2=80=9D -- Gary Hamel</div>

--00000000000038329305e7504203--

