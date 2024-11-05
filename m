Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5ECAD12694
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 11:55:28 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.15911.1730807725856600857
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 03:55:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bfNcRVEI;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2e34a089cd3so4216745a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 03:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730807725; x=1731412525; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pGAcXpdGUrJHamDe/1UCfMK3h+AugpghPGx9LA5NzYA=;
        b=bfNcRVEIEZ0I5I7Gunx/YPEGvPmDve6e3Qt5JiWNr9/922tTCjwYb/XFr6dJdHWGX1
         Nohn3WJZc7P9CZB+FnNrB2yDyxt06PNYTjw0bD3E4SXTMETfVN16yakpBn4D67A8RbiN
         TY3kD+vFnt4YhYrD219FZHoXpv3FUm5hYVBgXFcXUnJcX3eFfDrxZi4/d0K2eZOuvNzr
         UETFETP+I4d9rRUnqe2i1I+vPZIpd2HRnpUS5mo9GLZvjpXoOVMrAM9wvCWAWN/xgwTp
         XCQ0RYLJO5K7EsQb3xrW8OU+1YhPj0ZkwF6uKKT37OvZC1AO5wKxRjklwMUiRglzhwz7
         MRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730807725; x=1731412525;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pGAcXpdGUrJHamDe/1UCfMK3h+AugpghPGx9LA5NzYA=;
        b=Z294fH/GV8s4nzqnfR+Ifva0Y/vSC6DaVsAQSTTWtxYMdQCNwb4xzYS1TDLW4heiJJ
         MecdjQ3B/AsFO+gAXyXVMouyYb9gwlx0SLtd0F4zhEfgdYqvHD/t9BITEUF51cgiXMi7
         cGXx8wKh79WwBGEqq5awiradp5MGje/LyEGUavfbTZjAkcXTQ3slMhQCZ3Ggn8dwSR9d
         GZbwPUfkE3stI6tNTndhNUJfwAEMKcJ0zqNrBB3v6qjX4o+mraEs4gKeStg7X+/Vi3fh
         7fVk3+LjUVn3omqkNnHi6axoUKGxyWKN/EQHVPclYD4yv1AYJlW4sqyxBIQgkiJwfybg
         eBUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk7g9fzfsYcRAK+dg2uU+W5WYP6Co9/ZdOR6zv0eAukRltR4DI15we7E09CAbUtK9JbCZC2RMbQ7Zghg8rSgHXbA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy3+IY6e+sD/mGpZBbnJmMkoSNkPZ+VgpT2tPpJp8nWp6u5Gu4U
	BQWSNsPioLx8IZlfzQVypZaHRnyIUv68Hdni/CGffy7D9ZovgH/PL3lPvJtYKF2GaGT7OoHGed1
	r4946RXa2H177e077ZPOQLThsYuQ=
X-Google-Smtp-Source: AGHT+IGJZJHh1PU5stldru0mXOXvbGHC3oQIZfQ2Aurf7baUcULHU5NYX+LKHRTnaLmtnyk3LyEyDwqHHTCrw+7DAGk=
X-Received: by 2002:a17:90b:342:b0:2e2:cd22:b092 with SMTP id
 98e67ed59e1d1-2e8f10601a5mr39148159a91.16.1730807725207; Tue, 05 Nov 2024
 03:55:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1723636705.git.steve@sakoman.com> <468a9077d9b3466d60ee8c5b6144529ea5e5c849.1723636705.git.steve@sakoman.com>
 <CAApg2=Q13Q7mHWMOuC4=oL2AJVMBJpHAOPV_3xCphiotCrVuMg@mail.gmail.com>
 <17EB9EED917D6CD6.10903@lists.openembedded.org> <CAOSpxdYkNiYFE3n2KBaAPH=Qrxu3DGxgnLuWaJkMQbwHkEmVAA@mail.gmail.com>
 <0ac8780b1703a929a085f732db8647e5f091d933.camel@linuxfoundation.org>
 <CAApg2=SBM7Bqmt7ZYTPOOan9T9FTdawoA1zt8+hqS+UAQzu9Ew@mail.gmail.com> <920805f21a597824d6acf2195a5434000599d83f.camel@linuxfoundation.org>
In-Reply-To: <920805f21a597824d6acf2195a5434000599d83f.camel@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 5 Nov 2024 20:55:13 +0900
Message-ID: <CAApg2=Rxw7TObeDWAfSCEa+9vGLBFYVNWPu7by1XxZp2kHwimg@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 1/9] cve_check: Use a local copy of the
 database during builds
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Steve Sakoman <steve@sakoman.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a2bd1106262913bd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 11:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206704

--000000000000a2bd1106262913bd
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Oct 2024, 07:40 Richard Purdie, <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2024-10-25 at 07:08 +0200, Marta Rybczynska wrote:
> > To make a summary, this patch did not solve the issue on master, it
> > was the change of the database path that did.
>
> Originally, I couldn't isolate the change to tell or not. Now, by
> changing the database path we've shown the issue is occurring on the
> branches without the patch.
>
> >  Is this correct? And we still do not know what the cause is? So,
> > when we change the path on all branches, the issue is likely to come
> > back ?
>
> I think if we move the database operations to the local filesystem and
> out of DL_DIR, we're likely to stop seeing the issues. We know they're
> isolated to something about the older releases.
>
> > My problem with this patch is that it changes names of variables that
> > are in use. It should at least not fail silently for people who
> > decide to use a pinned database.
> >
> > Do you see another solution than renaming the _DLDIR_ version to the
> > old name?
>
> We either backport the patch as is and have the same functionality
> across the branches, or we do some special version of the patch for the
> LTS branches. In many ways I think it might be better to have things
> consistent rather than doing something special with all the confusion
> that can cause, even if people do have to actively adapt to the change.
>

Well, I'm not happy with a change of variables in existing releases.
However the split would be complicated either way.

And as a bonus, I'm not able to reproduce on my systems (the lack of NFS
might be a factor).

So, I'll say go for this backport even if unhappy with it.

Kind regards,
Marta

>
>

--000000000000a2bd1106262913bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, 30 Oct 2024, 07:40 Richard Purdie, &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, 2024-=
10-25 at 07:08 +0200, Marta Rybczynska wrote:<br>
&gt; To make a summary, this patch did not solve the issue on master, it<br=
>
&gt; was the change of the database path that did.<br>
<br>
Originally, I couldn&#39;t isolate the change to tell or not. Now, by<br>
changing the database path we&#39;ve shown the issue is occurring on the<br=
>
branches without the patch.<br>
<br>
&gt;=C2=A0 Is this correct? And we still do not know what the cause is? So,=
<br>
&gt; when we change the path on all branches, the issue is likely to come<b=
r>
&gt; back ?<br>
<br>
I think if we move the database operations to the local filesystem and<br>
out of DL_DIR, we&#39;re likely to stop seeing the issues. We know they&#39=
;re<br>
isolated to something about the older releases.<br>
<br>
&gt; My problem with this patch is that it changes names of variables that<=
br>
&gt; are in use. It should at least not fail silently for people who<br>
&gt; decide to use a pinned database. <br>
&gt; <br>
&gt; Do you see another solution than renaming the _DLDIR_ version to the<b=
r>
&gt; old name?<br>
<br>
We either backport the patch as is and have the same functionality<br>
across the branches, or we do some special version of the patch for the<br>
LTS branches. In many ways I think it might be better to have things<br>
consistent rather than doing something special with all the confusion<br>
that can cause, even if people do have to actively adapt to the change.<br>=
</blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Well=
, I&#39;m not happy with a change of variables in existing releases. Howeve=
r the split would be complicated either way.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">And as a bonus, I&#39;m not able to reproduce on my sy=
stems (the lack of NFS might be a factor).</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">So, I&#39;ll say go for this backport even if unhappy wi=
th it.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Kind regards,</di=
v><div dir=3D"auto">Marta=C2=A0</div><div dir=3D"auto"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">
<br>
</blockquote></div></div></div>

--000000000000a2bd1106262913bd--

