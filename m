Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB2B0C433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 14:38:28 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web08.37790.1634567907942313445
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S+JA4+vz;
 spf=pass (domain: gmail.com, ip: 209.85.216.50,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so121982pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u2/UHCShvN6YHPm1ZDF1iTeyGeVd77cIPumj3vveb6U=;
        b=S+JA4+vzWlu5u/5Gq1saV0U8LP/HjUFzKaq6La+JdKWPylly4weooZnCDdb0XU4cN6
         JfYlxoWnc02YX7Hic+fDfUtL3Js+tn6YtkdoXVqT+ZTL2tI/Vhv+bFfOY67A73yDyuv9
         TjpQAfZpq748Mf1EmfJLsO3BSfJ4qIxhDuJRh0FlWljMZYIiF4dFvKC5c3PS3VtWK0LM
         GmA6Cif5Iz+iISb3owygMQxUZZcvyqQe1VRuaXph7Z6rtxSkBc+1o0IhlL4jsFXTXyLf
         SkAFdgPNcWBw4mtWXvOrdMOlN7HNDxQObUd34PC/4hisFF6OFrvZav2VfQZXfYzjl3yb
         nyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u2/UHCShvN6YHPm1ZDF1iTeyGeVd77cIPumj3vveb6U=;
        b=TTAOzTeLHqocwvwG3ixlFrqTOvUZN6ojL3cJzulRSp3ZAfTFPiMd9406Zl0jTXly6h
         6OqdtooC0ob4/Mf4c2tW/ypSDWH0re3oiV8Vyqy7wzQpfGarqHc56aZjP0czK7TZ+IWV
         Hd04caQnjtqeMwRVtvx9Bi0iFqQWw9D6NUAojz9pNg61rIdIuxDRhOb56UOsdGFm3/sA
         nwjIbeDAJO9Y4wKt+OqCYttzdo5Bx9hoHsoU4qOJFJ/o8R8LrCzI5v+XJcdzA8TQ0WjL
         APXgO9phMpzf91VCCSA1dcStqec4ylPAAV0WxggLRPFJEJc8HvXoxtPYOsq4Np4fmrBn
         zs9A==
X-Gm-Message-State: AOAM532DHKz+p2BetsTsUr9AHcJURfpttX9wfNgIjzdXnTwhIqHdB5ft
	WURvppUbVwRlNnM5MZ4NiHh083QqUdRIKwh4o8M=
X-Google-Smtp-Source: 
 ABdhPJze5xjGSHDMpRkVmnqhtGp+ZK+esewHxvgoLpzDjkgQH1PG3sUb2Mb83IXtUStJeE1AJAgudKdUjy+6RN+lxB8=
X-Received: by 2002:a17:90a:df0e:: with SMTP id
 gp14mr33636737pjb.35.1634567907570;
 Mon, 18 Oct 2021 07:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211018135322.246963-1-Martin.Jansa@gmail.com>
 <CANNYZj-A0eNR=GWz+-xdZQSxmWYNuU=0PGNQA-1d0w2tSp+NiA@mail.gmail.com>
 <CA+chaQf06t-OSB-x321YRUcWTTuooP=E4o1a0C+asiJJmQzn4g@mail.gmail.com>
 <CANNYZj_7uKo5qJSqVq0gfc2yjeiEW=oLh3Xvkk+JXb0bkGAQiA@mail.gmail.com>
 <CA+chaQe8qS+GrVA5+hYUH_aSrQKFLssOrg1BzLM-fC4gjXUs+g@mail.gmail.com>
 <CANNYZj_-scmARFF6BmDU-fpG3-me+AfyDyCtrt-0V9f4_-e5vQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_-scmARFF6BmDU-fpG3-me+AfyDyCtrt-0V9f4_-e5vQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 18 Oct 2021 16:38:16 +0200
Message-ID: 
 <CA+chaQc3Y-yrP45-uYBLNMPigXzGtmZPWThMzRHvsTx2SoU7Fg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: add PACKAGECONFIG for opengl-or-es
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007df87805cea17f10"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 14:38:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157074

--0000000000007df87805cea17f10
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 18, 2021 at 4:32 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Mon, 18 Oct 2021 at 16:20, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> OK, I'll simply PNBLACKLIST all the recipes your AUH upgrades break or
>> stop doing the CI builds completely.
>>
>> Having latest versions is nice, but this approach to regressions
>> introduced by version upgrades is quite a pain already.
>>
>
> I do test all my upgrades on the AB. For major ones like python or
> openssl, I run meta-oe builds too.
>
> If the AB gives a green pass (which it did), then the upgrade works as
> intended. If you think AB is not doing enough testing, find the gaps in the
> AB matrix and address them.
>

 nodistro build with default oe-core setup obviously isn't covered by AB.

--0000000000007df87805cea17f10
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Oct 18, 2021 at 4:32 PM Alexander=
 Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.c=
om</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"></div><div d=
ir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Mon, 18 Oct 2021 at 16:20, Martin Jansa &lt;<a href=3D"mailto:martin.ja=
nsa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">OK,=
 I&#39;ll simply PNBLACKLIST all the recipes your AUH upgrades break or sto=
p doing the CI builds completely.<div><br></div><div>Having latest versions=
 is nice, but this approach to regressions introduced by version upgrades i=
s quite a pain already.</div></div></blockquote></div><div class=3D"gmail_q=
uote"><br></div><div class=3D"gmail_quote">I do test all my upgrades on the=
 AB. For major ones like python or openssl, I run meta-oe builds too.<br></=
div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">If the =
AB gives a green pass (which it did), then the upgrade works as intended. I=
f you think AB is not doing enough testing, find the gaps in the AB matrix =
and address them.</div></div></div></blockquote><div><br></div><div>=C2=A0n=
odistro build with default oe-core setup obviously isn&#39;t covered by AB.=
</div></div></div>

--0000000000007df87805cea17f10--

