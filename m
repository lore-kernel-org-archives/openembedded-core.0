Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A7DC54E41
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 00:09:46 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.11624.1709770177007104157
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 16:09:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WOhcH67C;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-609ed7ca444so2154067b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 16:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709770176; x=1710374976; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3Nf0ZIF72Yoj6wPmUJmGVRD5TBE53RRS068HkMhYElA=;
        b=WOhcH67CyZgM730r1SMXxUwq8m0DMr1Kqe1PfTCMiMwxFQNiXJ/WpAmaguQ1GlKTlA
         ZnNQiQq3jieNALr+mtApiU0TraMgA+0GeSVEKNzbrBYqPRunlEJeSkn/sd2c5/gTSQD/
         vG9rTITMdM9O3H1qAvG5LAg5hNk+scpv4Ckd057DbO3m9rvsIyyJO3FAVmpVAPrVgIP2
         TfK1qsVU+GeFWeZ/jLviM68XuiU4T2gZw95yr/2BfyTGewW4Y/gZAmm4by72gIXr+piF
         P7xSRUkeXxS1NmIEwQirpQbghyP/njsJRtJlKcGm7e3nrL84A8Dr148M/a5jJ10tUvmV
         H51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709770176; x=1710374976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Nf0ZIF72Yoj6wPmUJmGVRD5TBE53RRS068HkMhYElA=;
        b=pvVJcJRuSX0eetanIDZsG7fcgBg/Q2TVhR4qEdcLYCtvr6Z4S6NgXwWLH7KA84xI+J
         tFhWwu9dDKiiOgIII5mrgnNMALnWrAqw5K/ANsM7P73cH4jyAK4AHqeU0Fg8nn9if8j3
         9haRaU8ylidBDa6YDo2Gu77cHTxFfYzh87Tcx66pNKmbAgVgBs31+TBkam+dlFkUEFVm
         sEP6npRPVpFg9bWIg/ZtPUKx55B+9AZqWWOHwyiqlqvYieQvML8Hrv2vZQrsrGCDJfiT
         3fu3yxHWy2m/TfDeVJxNH8tXzE+i4+ot3zBHcprmIhssbcGD0nUzGJQUM1/5vNuT9Ecl
         1Pqw==
X-Forwarded-Encrypted: i=1; AJvYcCXfSSP2UdxFueRGZAY2I46ovJhZytknDN0PAoTFVyHeuyDGkI1X3bt92EVGhYzn4YWVs7YYH65UEIOkY8cL2ZX2d4IMauYps9f8cWtQbano0XAnlLsJSPrT
X-Gm-Message-State: AOJu0Yx97Sg/AHwUqO3d+nRadB2VdCElvYsfpd6cY+OXTlMKj8IIFCic
	yqAzKwbnIhodMgF1SweqoTRO+3lub3dIAHZ/MBxW4hhHvqmms+aLwCDy3lbiXO/e6F9PT7z6lC7
	dqeI5aLq8aytJ9c+Fx/owU+HyO+A=
X-Google-Smtp-Source: AGHT+IHKxS7Kwrq18bA4siVfaVP874sebN5z0qq7lDO6pRR5fqfDa8PDEF2yrdb6I2z7kBVCXSWzR8spvwg6X8vVW3k=
X-Received: by 2002:a25:2107:0:b0:dcc:ca51:c2e1 with SMTP id
 h7-20020a252107000000b00dccca51c2e1mr13015942ybh.2.1709770175119; Wed, 06 Mar
 2024 16:09:35 -0800 (PST)
MIME-Version: 1.0
References: <20240305203608.3039688-1-tom.hochstein@nxp.com>
 <3b991e85a5ee7b24c728c3bf59906dc44c756385.camel@linuxfoundation.org>
 <CAP9ODKrUcNXcEQFAzPy77jS7uYPJ0Lx56pQzfVzTMescPnsYvw@mail.gmail.com>
 <0331b56aadffd139fca065008a38e7784a3e06df.camel@linuxfoundation.org>
 <CAP9ODKp1sK65kaejiHMm5TS4=e0bbCC2Da9HrBoN=c88wF6dbQ@mail.gmail.com>
 <ba338ad83d02efbaeac55e4f80d9560cab92a54d.camel@linuxfoundation.org>
 <CAP9ODKq7ONvW6Axw74zU65TqKT6v9QnqvV_BOB=rY4yRDh3SUg@mail.gmail.com> <CANNYZj_5rvDDj8C5Hxy+OuhitveUwsG0gBbMjSYgZkavD_7HHQ@mail.gmail.com>
In-Reply-To: <CANNYZj_5rvDDj8C5Hxy+OuhitveUwsG0gBbMjSYgZkavD_7HHQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 6 Mar 2024 16:09:23 -0800
Message-ID: <CANx9H-B=And+mZyP+BcBk71G-9eJVyXbW1i3PXwMHS7OAqQRrg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bmaptool: Add bmap-tools alias for compatibility
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Tom Hochstein <tom.hochstein@nxp.com>, 
	openembedded-core@lists.openembedded.org, 
	Otavio Salvador <otavio@ossystems.com.br>
Content-Type: multipart/alternative; boundary="000000000000ef8a7c061306e364"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 00:09:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196759

--000000000000ef8a7c061306e364
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 7:04=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmai=
l.com>
wrote:

> On Wed, 6 Mar 2024 at 14:08, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
> >> Put another way, if I were to merge the PROVIDES, when would it ever b=
e
> >> acceptable to remove it?
> >
> >
> > I'd do it in next release; so it keeps a time for upgrade.
>
> But what would incentivize people to fix the metadata? If you put
> PROVIDES in there, they are not going to notice that they have to fix
> anything, and when it's removed later, it will break all the same.
> What's the point of this additional work then?
>
> It's master branch, it can and does break. No one ever promised that
> you can make a layer that works across several releases, and I would
> strongly object to making such a promise.
>

As one of the new maintainers for bmaptool, I was somewhat leaning towards
the old name, but that ship has sailed.
As Alex points out, change happens in master. This is normal. This should
not be prevented nor should workarounds
to let users continue to follow now "wrong" practices continue.

I will also chime in to say that layers that claim multiple
LAYERSERIES_COMPAT are really a problem for the layerindex.
The existing update mechanism is driven by well behaved stable branch
names. Anything else requires manual intervention.

This means that layers that do not follow stable branch names will not
automatically be installed with something like:
bitbake-layers layerindex-fetch
which is really a shame because that tool is much easier for users (and
likely to be part of upcoming bitbake/oe-core setup behavior).

Branches are cheap. CI can push to multiple branches with the same content.


> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196681):
> https://lists.openembedded.org/g/openembedded-core/message/196681
> Mute This Topic: https://lists.openembedded.org/mt/104753355/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ef8a7c061306e364
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 6, 2024 at 7:04=E2=80=AFA=
M Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kana=
vin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Wed, 6 Mar 2024 at 14:08, Otavio Salvador<br>
&lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">o=
tavio.salvador@ossystems.com.br</a>&gt; wrote:<br>
&gt;&gt; Put another way, if I were to merge the PROVIDES, when would it ev=
er be<br>
&gt;&gt; acceptable to remove it?<br>
&gt;<br>
&gt;<br>
&gt; I&#39;d do it in next release; so it keeps a time for upgrade.<br>
<br>
But what would incentivize people to fix the metadata? If you put<br>
PROVIDES in there, they are not going to notice that they have to fix<br>
anything, and when it&#39;s removed later, it will break all the same.<br>
What&#39;s the point of this additional work then?<br>
<br>
It&#39;s master branch, it can and does break. No one ever promised that<br=
>
you can make a layer that works across several releases, and I would<br>
strongly object to making such a promise.<br></blockquote><div><br></div><d=
iv>As one of the new maintainers for bmaptool, I was somewhat leaning towar=
ds the old name, but that=C2=A0ship has sailed.</div><div>As Alex points ou=
t, change happens in master. This is normal. This should not be prevented n=
or should workarounds</div><div>to let users continue to follow now &quot;w=
rong&quot; practices continue.</div><div><br></div><div>I will also chime i=
n to say that layers that claim multiple LAYERSERIES_COMPAT are really a pr=
oblem for the layerindex.</div><div>The existing update mechanism is driven=
 by well behaved stable branch names. Anything else requires manual interve=
ntion.</div><div><br></div><div>This means that layers that do not follow=
=C2=A0stable branch names will not automatically be installed with somethin=
g like:</div><div>bitbake-layers layerindex-fetch</div><div>which is really=
 a shame because that tool is much easier for users (and likely to be part =
of upcoming bitbake/oe-core setup behavior).</div><div><br></div><div>Branc=
hes are cheap. CI can push to multiple branches with the same content.</div=
><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Alex<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#196681): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/196681" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/196681</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104753355/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/104753355/924729</a><br>
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

--000000000000ef8a7c061306e364--

