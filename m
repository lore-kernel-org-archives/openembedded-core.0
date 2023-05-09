Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA12C77B75
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 15:06:23 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.35177.1683644780585401299
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 08:06:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=F2W7P+w4;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2acb6571922so40539151fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 08:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683644779; x=1686236779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/yLdIzhHpmuN3YtEJcb5o06EF2NpdsG0vLDWdkr8I3s=;
        b=F2W7P+w4j1b5YG3cpKy4T2T6+odcepHFx4eyvzRAPctWuD68HdXm54NWuuFCnaePY3
         5FjBvlabvyKId5lKnlomAFqNMUso5mBXWlsP8/BQtv9w0tzoZJaqJ3R8/rxPBTcsgyKs
         VhIRAE++EdHS9Xq/8qMpqLYJUosBuh7Pk35dLz2lYv3mp08q3Zm0szh0mT4VWvxhJtql
         +F+++g7FOiNH6z/IQmJ/+uMIDuJ6OnoYAj18otT2Wspx28YCFp7cEQd1zdN+dewMJPQJ
         +ZVp2i51ajYCRDamD64KdCpP0TMjY57pk5bzyZWAYLCcRN/9PTfetvG1C48s09dRfrkR
         5CCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683644779; x=1686236779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/yLdIzhHpmuN3YtEJcb5o06EF2NpdsG0vLDWdkr8I3s=;
        b=YakXMgcgGOgiuKSzZ3UMOgptz4p1rA0jT0VIekJcl3BF5N3lsherbQ7g5nUdJS4CoD
         k8QNz5H5GjUkZ37whFetrtVHWHAZDUMwzSQfnWIpqV/zWRRrFn32wCp/KMODBtEKC14n
         g2fxeNYQ1z+XxcciZbjwBBKE8pMIdyS54r7kiN392YLg6F7QeRd4T4OvVpSp2PjXRvdW
         Is+mK7g8TcmrtCJC9fixoGpZ2mJnCV6MLIRv6lVaWVxmhV2VEKZOvWz4pcKjTIRYAw+m
         MAet0+qnjPBoOWibPk3tJrzsOZ46NXpyMCLMdro+K1RXVEOpbUc3PEBFIjO5Ajoq/eam
         9z0Q==
X-Gm-Message-State: AC+VfDxQ0dRoF4LbSS/sRwqDaA7vAujjmruDDdD2pEPmToa5ZajMYXkR
	IdpupwCCd8iWgmnpbs+wJsPTicVkBR8uyhadbQU=
X-Google-Smtp-Source: ACHHUZ7J3zJlfVFLlqbo30NN5LC0p7QlZwjRtywnFvfkfjsmkbdGFNng0iyu14aAriQRyxWsrxSnqGyV84M74aLGCfg=
X-Received: by 2002:a2e:9dca:0:b0:2a9:ee54:289f with SMTP id
 x10-20020a2e9dca000000b002a9ee54289fmr847495ljj.13.1683644778540; Tue, 09 May
 2023 08:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230329100257.1612928-1-rybczynska@gmail.com>
 <CAOSpxdYdF8K7bWcc_DCjEt26-ExdYHMSZt1RJgyRoqj0Zm4TTg@mail.gmail.com>
 <CAApg2=RANaJm6ZHR1END-rf+pn5yhxfmuVHd+VbKvz=hFQi2PA@mail.gmail.com> <CAOSpxdau7v6PAtAc2H0g7bVoqyrhaLXjxb+tjtqGVtu4DE+EPg@mail.gmail.com>
In-Reply-To: <CAOSpxdau7v6PAtAc2H0g7bVoqyrhaLXjxb+tjtqGVtu4DE+EPg@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 9 May 2023 17:06:05 +0200
Message-ID: <CAApg2=T3yjO-y0ie=KH9DS9YHMV-Qk95D-WM+dq8YrNNd-8jrw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-update-nvd2-native: new CVE database fetcher
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com, 
	Marta Rybczynska <marta.rybczynska@syslinbit.com>
Content-Type: multipart/alternative; boundary="000000000000f3f31705fb44185c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 15:06:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181044

--000000000000f3f31705fb44185c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 5, 2023 at 8:44=E2=80=AFPM Steve Sakoman <steve@sakoman.com> wr=
ote:

> On Wed, Apr 5, 2023 at 8:43=E2=80=AFAM Marta Rybczynska <rybczynska@gmail=
.com>
> wrote:
> >
> >
> >
> > On Wed, Apr 5, 2023 at 5:55=E2=80=AFPM Steve Sakoman <steve@sakoman.com=
> wrote:
> >>
> >> Hi Marta,
> >>
> >> Is this safe to backport to the stable branches, or should I let it
> >> "age" in master for a while?
> >>
> >
> > Hi Steve,
> > I vote to let it age for a little moment. In the meantime I'm trying to
> figure out when exactly NVD will turn off the old database.
>
> OK, will do!
>

I have received a confirmation from the NVD that they are currently
planning to turn off teh old feed in *September 2023*.
We have time to stabilize then.

Kind regards,
Marta

--000000000000f3f31705fb44185c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 5, 2023 at 8:44=E2=80=AFP=
M Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Wed, Apr 5, 2023 at 8:43=E2=80=AFAM Marta Rybczynska &lt;<a href=3D"mailt=
o:rybczynska@gmail.com" target=3D"_blank">rybczynska@gmail.com</a>&gt; wrot=
e:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Wed, Apr 5, 2023 at 5:55=E2=80=AFPM Steve Sakoman &lt;<a href=3D"ma=
ilto:steve@sakoman.com" target=3D"_blank">steve@sakoman.com</a>&gt; wrote:<=
br>
&gt;&gt;<br>
&gt;&gt; Hi Marta,<br>
&gt;&gt;<br>
&gt;&gt; Is this safe to backport to the stable branches, or should I let i=
t<br>
&gt;&gt; &quot;age&quot; in master for a while?<br>
&gt;&gt;<br>
&gt;<br>
&gt; Hi Steve,<br>
&gt; I vote to let it age for a little moment. In the meantime I&#39;m tryi=
ng to figure out when exactly NVD will turn off the old database.<br>
<br>
OK, will do!<br></blockquote><div><br></div><div>I have <span class=3D"ng" =
style=3D"background:rgba(0,0,0,0) none repeat scroll 0% 0%!important">recei=
ved a confirmation</span> from the NVD that they are currently planning to =
turn off <span class=3D"ng" style=3D"background:rgba(0,0,0,0) none repeat s=
croll 0% 0%!important">teh</span> old feed in *September 2023*.</div><div>W=
e have time to stabilize then.</div><div><br></div><div>Kind regards,</div>=
<div>Marta <br></div></div></div>

--000000000000f3f31705fb44185c--

