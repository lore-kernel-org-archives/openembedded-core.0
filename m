Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E46B3C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 15:03:15 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web11.37569.1634569394943381761
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 08:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IoJZr0as;
 spf=pass (domain: gmail.com, ip: 209.85.222.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id f4so1140518uad.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 08:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kvczl3sUOakCGzF1oPq/+F8Fw7J6mvmdxdRzS3SOEoM=;
        b=IoJZr0as2I3UODBZSkM9/L06fRu1u5fZhGXV90OrjE3WJTSDi7/nsO6aoe0kGBxNS8
         jiIyux4UpwFfCCLA+/4DHeWW+Voe9SDaH7CxeXlImDDwfU+W2OQuBTBuU11BiaxbS7i8
         IWwvVkeen6QcZXue9dTxMCLLJt0qmcvhELDSpOwoGVjhcm9z9+j6qrwEy9lFWQJhGog4
         4cRKA/VZvMDwObU4hm1oZwY9FGpoA55izXKSFF2aKooqrkMFGfAkLxXEBePNtPCDSunw
         nkASL5pnhOe19TNyiZPZu9IV7aOlANLuN6OewKD9CJ7PHAicWvNXBIFgFLTY9GR0fbAK
         N9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kvczl3sUOakCGzF1oPq/+F8Fw7J6mvmdxdRzS3SOEoM=;
        b=Yb5HX7JdGqtH2t78zWwxVsxVMAUvXjHCvSYpEkQbPD1ZQk8KgTiqDJIddaf6I/XIp1
         x7NJppP1zh69NMrFY0Fb+OmIn4ZGFCkJ5KGHI8q0K+7z4mB4uxwjkKQhlcb40l5HgHq/
         4H2mrijQEnqoYPD7W59O6AgH/Bel9h1Jh7YjrC6bk6W9y9qx2L7PkDQGkijEhvbvIeNL
         Ow/WnHVCR0qK0zNLBFguS3k9+3MFY+s0UvfwJA/nsODXR/32+KPZdjTBLJ5biyPz94OL
         tOs8vEeSwCd2zZkYQ+BpAmkrNQmEiw4BOijoyOPxtQWiYyE352+Mk3MLwIBDkoyV3eOC
         3Cbg==
X-Gm-Message-State: AOAM5325obZ2aTwTXI8Jkbp3XoiI1ONgkQYeOQhah3aYhIELrftwtBWP
	xtjCNWdRoT6VDTzZI+n1PURvZqd1ywN9iNHnPbg=
X-Google-Smtp-Source: 
 ABdhPJyIUnYSZIA5oovADokx/UFBGPK77QHnFovLYRm/HFvQjzZxIOFDYsbXgemgmazESv+7ZLYB+iBke95C1ow+YY8=
X-Received: by 2002:a67:df18:: with SMTP id s24mr27535576vsk.40.1634569394029;
 Mon, 18 Oct 2021 08:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211018135322.246963-1-Martin.Jansa@gmail.com>
 <CANNYZj-A0eNR=GWz+-xdZQSxmWYNuU=0PGNQA-1d0w2tSp+NiA@mail.gmail.com>
 <CA+chaQf06t-OSB-x321YRUcWTTuooP=E4o1a0C+asiJJmQzn4g@mail.gmail.com>
 <CANNYZj_7uKo5qJSqVq0gfc2yjeiEW=oLh3Xvkk+JXb0bkGAQiA@mail.gmail.com>
 <CA+chaQe8qS+GrVA5+hYUH_aSrQKFLssOrg1BzLM-fC4gjXUs+g@mail.gmail.com>
 <CANNYZj_-scmARFF6BmDU-fpG3-me+AfyDyCtrt-0V9f4_-e5vQ@mail.gmail.com>
 <CA+chaQc3Y-yrP45-uYBLNMPigXzGtmZPWThMzRHvsTx2SoU7Fg@mail.gmail.com>
 <CANNYZj8JsSFxV8AyRvYWN7zfLGroW3XSnu3FgxXOHmrmbthqng@mail.gmail.com>
 <CA+chaQf9oSGQvpDOS1kTziUoD3Z8MxS81cQ9qAcTZ8pH0OC7tg@mail.gmail.com>
In-Reply-To: 
 <CA+chaQf9oSGQvpDOS1kTziUoD3Z8MxS81cQ9qAcTZ8pH0OC7tg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Oct 2021 17:03:02 +0200
Message-ID: 
 <CANNYZj8x+Mf82g6U7ZNVy9NfYFFhr19eOq0UFaauM3KqcbC1JA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: add PACKAGECONFIG for opengl-or-es
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001787c005cea1d89d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 15:03:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157079

--0000000000001787c005cea1d89d
Content-Type: text/plain; charset="UTF-8"

I usually run a-full with poky checkout pointing to my package update
branch, so all upgrades are there, and things can and do break and they get
privately addressed before any patches are sent here.

The branch is here
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Just started such a build now:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2768

All of the things in the matrix are poky-based, except that one sato build
definition which uses nodistro:
http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json

If you see gaps in that config.json, they can be addressed. Adding world to
the nodistro build is an option.

Alex

On Mon, 18 Oct 2021 at 16:54, Martin Jansa <martin.jansa@gmail.com> wrote:

> So you're testing your version upgrades by a build which doesn't include
> the upgraded recipes?
>
> and that's the proof that "the upgrade works as intended" and then you get
> angry, because someone reports an regression and even sends a fix for it..
> it's early, but I guess I need more coffee or beer to understand this.
>
> FWIW: I'm not going to continue in this discussion before I calm down.
>
> On Mon, Oct 18, 2021 at 4:45 PM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> On Mon, 18 Oct 2021 at 16:38, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>>
>>>
>>>> I do test all my upgrades on the AB. For major ones like python or
>>>> openssl, I run meta-oe builds too.
>>>>
>>>> If the AB gives a green pass (which it did), then the upgrade works as
>>>> intended. If you think AB is not doing enough testing, find the gaps in the
>>>> AB matrix and address them.
>>>>
>>>
>>>  nodistro build with default oe-core setup obviously isn't covered by AB.
>>>
>>
>> nodistro core-image-sato build is there, but not world. Sato doesn't
>> include webkit:
>>
>>
>> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json#n234
>>
>> Alex
>>
>>

--0000000000001787c005cea1d89d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I usually run a-full with poky checkout pointing to m=
y package update branch, so all upgrades are there, and things can and do b=
reak and they get privately addressed before any patches are sent here.</di=
v><div><br></div><div>The branch is here<br></div><div><a href=3D"http://gi=
t.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dakanavin/package-version-=
updates">http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dakanavi=
n/package-version-updates</a></div><div></div><div><br></div><div>Just star=
ted such a build now:</div><div><br></div><div><a href=3D"https://autobuild=
er.yoctoproject.org/typhoon/#/builders/83/builds/2768">https://autobuilder.=
yoctoproject.org/typhoon/#/builders/83/builds/2768</a></div><div><br></div>=
<div>All of the things in the matrix are poky-based, except that one sato b=
uild definition which uses nodistro:</div><div><a href=3D"http://git.yoctop=
roject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json">http://=
git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.jso=
n</a></div><div><br></div><div>If you see gaps in that config.json, they ca=
n be addressed. Adding world to the nodistro build is an option.<br></div><=
div><br></div><div></div><div>Alex<br></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 18 Oct 2021 at 16:54, M=
artin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr">So you&#39;re testing your version upgrades by a buil=
d which doesn&#39;t include the upgraded recipes?<div><br></div><div>and th=
at&#39;s the proof that &quot;the upgrade works as intended&quot; and then =
you get angry, because someone reports an regression and even sends a fix f=
or it.. it&#39;s early, but I guess I need more coffee or beer to understan=
d this.</div><div><br></div><div>FWIW: I&#39;m not going to continue in thi=
s discussion before I calm down.</div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 18, 2021 at 4:45 PM Alexa=
nder Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank=
">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, 18 Oct 2021 at 16:38, Martin Jansa &=
lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br><div cl=
ass=3D"gmail_quote">I do test all my upgrades on the AB. For major ones lik=
e python or openssl, I run meta-oe builds too.<br></div><div class=3D"gmail=
_quote"><br></div><div class=3D"gmail_quote">If the AB gives a green pass (=
which it did), then the upgrade works as intended. If you think AB is not d=
oing enough testing, find the gaps in the AB matrix and address them.</div>=
</div></div></blockquote><div><br></div><div>=C2=A0nodistro build with defa=
ult oe-core setup obviously isn&#39;t covered by AB.</div></div></div></blo=
ckquote><div><br></div><div>nodistro core-image-sato build is there, but no=
t world. Sato doesn&#39;t include webkit:<br></div><div><br></div><div><a h=
ref=3D"http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/t=
ree/config.json#n234" target=3D"_blank">http://git.yoctoproject.org/cgit/cg=
it.cgi/yocto-autobuilder-helper/tree/config.json#n234</a></div><div><br></d=
iv><div></div><div>Alex<br></div><div> <br></div></div></div>
</blockquote></div>
</blockquote></div>

--0000000000001787c005cea1d89d--

