Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A8FC38A2B
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:36 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web08.571.1649379052729689340
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 17:50:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=q0xr7z1y;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id j8so6522806pll.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 17:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WIdzIYhOH9O8KrVmgNcGYb4iU7rQPG8eafIBaWl54d0=;
        b=q0xr7z1yHzhMRr0eWkMSzHdAZHcdAycETq0WLBJLdeSCRLvAkt9XvpLTkYqmIPQ8Vp
         cATbJ6U4QSUaGVSJtaRjkOsPO7P2zgycSHwfmihoxDLPmNeU8YLVRZ6zSoGOy7MumAxr
         /XgfJNOuVNNeQ8JJ5Zw5fetdJ13sTIrECMFndVv451jkElPLM1B1v86szjnQg25ljEOz
         rEYVsR+mdS/lHxyc8+VN49G4LAZYIswKcXRK+oAkSFi5Sxjdc9hkkekmYJ+eAdat3CM9
         AWxJ0nQR8Uh+8yI0yVEtpfK1udJtmvlLeTKxHdEJkGhNxzDtfg2TerNZcjkJwN/JN4dP
         2iFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WIdzIYhOH9O8KrVmgNcGYb4iU7rQPG8eafIBaWl54d0=;
        b=T8RZpqEyU8qQ5hTbS/A9fMmDHJP7endXRqDmzMeqCCLhBx/WvmMc7hK2a0xuZBKrSy
         vL0GHWA/wlFXMrAvX76gmSK6DVbRY17NvlEqMDqec+e3+vy37XlABwdfo94/4hSRG1f6
         y98CjiT4JaRIK/sCKV/jYPGYWlY1W02q7xVfxfHsRs+Lcoi+pIGZwgnLwW/Mlh0ozVw/
         VpqIMEulZqUZXjXmshOImAANioLit8SQU+qCxKUF44/qIwqANwxgEE1GA4No1GQNIsAp
         yrb9Cfm7Do97yP6AlPdf+ImG7soh8GFY+gpMFSgM7rrduDSzMj7MdEwTKfeKKqgB894s
         MMzQ==
X-Gm-Message-State: AOAM5332KACNp3MW/bpv2wLJMyisVKFFo58+ZlMckIGUmwMcgpiqpW/Y
	DmvZ3iPuQICal5gG31DfjvmVJvCYx6aBxqvabOs=
X-Google-Smtp-Source: 
 ABdhPJy0HtKFFWBuu6gf5lhNYB6cNkClLYBgZjqED8rqX0CZ00LDn2cVYE0xVhyqHdnsTbj+0sWWYAipDX0DeO6D3cc=
X-Received: by 2002:a17:90b:1809:b0:1c7:28fb:bdd0 with SMTP id
 lw9-20020a17090b180900b001c728fbbdd0mr18749483pjb.231.1649379051983; Thu, 07
 Apr 2022 17:50:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220317164434.387779-1-ross.burton@arm.com>
 <20220317164434.387779-2-ross.burton@arm.com>
 <16E1E04DCAF22D86.750@lists.openembedded.org>
 <CA+chaQduTDhBx33DP0ChwQ0y+Foqt6Kx5cSZABqvRi3kriMtfA@mail.gmail.com>
 <94115621dac10ec60dbb9e16ffc18688f7e0b32e.camel@linuxfoundation.org>
 <CA+chaQdtP0GigmX+v=UjR+vgWvM8jvBCBDo99gmhbGKnXMBpxg@mail.gmail.com>
In-Reply-To: 
 <CA+chaQdtP0GigmX+v=UjR+vgWvM8jvBCBDo99gmhbGKnXMBpxg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 7 Apr 2022 17:50:40 -0700
Message-ID: 
 <CANx9H-B2vNFSEmsSO1+m5+UJfm9zGA=Nyrw0jJzpWcNVJcvNug@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] python3-cryptography: enforce identical
 version for -cryptography-vectors
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Alejandro del Castillo <alejandro.delcastillo@ni.com>,
 Alex Stewart <alex.stewart@ni.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
 Ross Burton <ross@burtonini.com>,
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007e59ec05dc19fc6a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Apr 2022 17:09:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164150

--0000000000007e59ec05dc19fc6a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 7, 2022 at 5:37 PM Martin Jansa <Martin.Jansa@gmail.com> wrote:

> On Thu, Apr 7, 2022 at 11:10 PM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Thu, 2022-04-07 at 16:48 +0200, Martin Jansa wrote:
>> > I've tried with rpm and surprisingly it works and dnf was able to
>> > install python3-cryptography-ptest in the image (even after bumping PR
>> to r1 -
>> > n python3-cryptography-vectors recipe).
>> >
>> > But still not clear why it works and if it's expected behavior.
>> >
>> > In fresh fedora:37 docker image with rpmdevtools installed I see:
>> >
>> > [root@aaa509e35d1f /]# rpmdev-vercmp 36.0.2-r0 36.0.2-r1
>> > 36.0.2-r0 < 36.0.2-r1
>> > [root@aaa509e35d1f /]# rpmdev-vercmp 36.0.2-r0 36.0.2-r0
>> > 36.0.2-r0 =3D=3D 36.0.2-r0
>> > [root@aaa509e35d1f /]# rpmdev-vercmp 36.0.2-r0.0 36.0.2-r0.1
>> > 36.0.2-r0.0 < 36.0.2-r0.1
>> >
>> > But I'm not familiar with dnf/rpm to see how the versioned runtime
>> dependency
>> > is handled during installation (isn't it resolved by the same libsolv
>> as what
>> > opkg is using now by default as well?
>> >
>> > + Alejandro in case it should be fixed in opkg somehow.
>>
>> I did a bit of digging on this and it is basically a difference in
>> behaviour
>> between the debian and rpm worlds.
>>
>> In Debian, "1.2.3" !=3D "1.2.3-r0" but in the rpm world, a recipe saying=
 "(=3D
>> 1.2.3)" with PR=3Dr0 is ok and matches.
>>
>> We can't obtain the PR of another recipe when writing package manager
>> fields so
>> this is rather tricky to solve. Debian doesn't support any kind of
>> wildcard in
>> the versioning either. I've proposed a patch which uses >=3D and << to
>> force a
>> very specific range which is horrible but the best I could come up with.
>> I'm
>> open to other ideas...
>>
>
> For this specific case the cure is almost more horrible than the issue
> this commit was trying to prevent, but I agree that being able to depend =
on
> version might be useful elsewhere as well and your package*bbclass fix
> helps with that.
>
> Thanks for looking into this.
>

If the pain (which is what I understand with limited investigation) is
cryptography vs cryptography-vectors being in sync (already a painfully
known problem) =E2=80=94 I again propose merging the recipes. Now I think a=
bout
PYPI_PACKAGE being extended to understanding lists=E2=80=A6

And I want a pony, with wings, and rainbow hair, and a horn.


> Regards,
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164149):
> https://lists.openembedded.org/g/openembedded-core/message/164149
> Mute This Topic: https://lists.openembedded.org/mt/89849717/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007e59ec05dc19fc6a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Apr 7, 2022 at 5:37 PM Martin Jansa &lt;<a href=3D"=
mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"></div><div dir=3D"ltr"><=
div dir=3D"ltr">On Thu, Apr 7, 2022 at 11:10 PM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a>&gt; wrote:<br></div></div><div dir=3D"ltr"><di=
v class=3D"gmail_quote"></div></div><div dir=3D"ltr"><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 2022-04-07 a=
t 16:48 +0200, Martin Jansa wrote:<br>
&gt; I&#39;ve tried with rpm and surprisingly it works and dnf was able to<=
br>
&gt; install=C2=A0python3-cryptography-ptest in the image (even after bumpi=
ng PR to r1 -<br>
&gt; n python3-cryptography-vectors recipe).<br>
&gt; <br>
&gt; But still not clear why it works and if it&#39;s expected behavior.<br=
>
&gt; <br>
&gt; In fresh=C2=A0fedora:37 docker image with=C2=A0rpmdevtools installed I=
 see:<br>
&gt; <br>
&gt; [root@aaa509e35d1f /]# rpmdev-vercmp 36.0.2-r0 36.0.2-r1<br>
&gt; 36.0.2-r0 &lt; 36.0.2-r1<br>
&gt; [root@aaa509e35d1f /]# rpmdev-vercmp 36.0.2-r0 36.0.2-r0<br>
&gt; 36.0.2-r0 =3D=3D 36.0.2-r0<br>
&gt; [root@aaa509e35d1f /]# rpmdev-vercmp 36.0.2-r0.0 36.0.2-r0.1<br>
&gt; 36.0.2-r0.0 &lt; 36.0.2-r0.1<br>
&gt; <br>
&gt; But I&#39;m not familiar with dnf/rpm to see how the versioned runtime=
 dependency<br>
&gt; is handled during installation (isn&#39;t it resolved by the same libs=
olv as what<br>
&gt; opkg is using now by default as well?<br>
&gt; <br>
&gt; +=C2=A0Alejandro in case it should be fixed in opkg somehow.<br>
<br>
I did a bit of digging on this and it is basically a difference in behaviou=
r<br>
between the debian and rpm worlds.<br>
<br>
In Debian, &quot;1.2.3&quot; !=3D &quot;1.2.3-r0&quot; but in the rpm world=
, a recipe saying &quot;(=3D<br>
1.2.3)&quot; with PR=3Dr0 is ok and matches.<br>
<br>
We can&#39;t obtain the PR of another recipe when writing package manager f=
ields so<br>
this is rather tricky to solve. Debian doesn&#39;t support any kind of wild=
card in<br>
the versioning either. I&#39;ve proposed a patch which uses &gt;=3D and &lt=
;&lt; to force a<br>
very specific range which is horrible but the best I could come up with. I&=
#39;m<br>
open to other ideas...<br></blockquote><div><br></div></div></div><div dir=
=3D"ltr"><div class=3D"gmail_quote"><div>For this specific case the cure is=
 almost more horrible than the issue this commit was trying to prevent, but=
 I agree that being able to depend on version might be useful elsewhere as =
well and your package*bbclass fix helps with that.</div><div><br></div><div=
>Thanks for looking into this.</div></div></div></blockquote><div dir=3D"au=
to"><br></div><div dir=3D"auto">If the pain (which is what I understand wit=
h limited investigation) is cryptography vs cryptography-vectors being in s=
ync (already a painfully known problem) =E2=80=94 I again propose merging t=
he recipes. Now I think about PYPI_PACKAGE being extended to understanding =
lists=E2=80=A6</div><div dir=3D"auto"><br></div><div dir=3D"auto">And I wan=
t a pony, with wings, and rainbow hair, and a horn.</div><div dir=3D"auto">=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gma=
il_quote"><div dir=3D"auto"></div><div><br></div><div>Regards,=C2=A0=C2=A0<=
/div></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#164149): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/164149" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/164149</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89849717/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
89849717/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000007e59ec05dc19fc6a--

