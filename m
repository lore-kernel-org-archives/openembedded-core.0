Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2516C4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 18:57:10 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.1874.1668797822745921129
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 10:57:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TTjJfOe/;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id f27so15309942eje.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 10:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+y5JE6OTqgQj6k/sT8PuGgXEn6Y0bIP+s3nYJqDEOOk=;
        b=TTjJfOe/f6Xl8J0WhJpzIjJ8X9BqQKtOTpXH4aFd/aVupUwvJuWsEvKY6ijRrM31g1
         dRw8k56lsMaRSKxwdF4K8/SNtvCZtGXkcZ6U9zx9ulk11MMyhWuHx5448uDCjGd0/u5p
         27jjM218Vo6fo5rt6yg8MlcM/c/Zw8my/BCqEa4RaObduwQc4rDcp4zkaI2EeWiII3HB
         cbJ88NUAJehzidRruxibk8xenC4tgJv9e5CcTL3Ii0N5WUSam/813XF82ik1Hq7Cbb4p
         10SHytNsvdR7BHMoNnUUvjxPi1uREda9ZyvPn0lxXH9/2BqIvEJZqwkPxsHb+3/gfzGP
         X74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+y5JE6OTqgQj6k/sT8PuGgXEn6Y0bIP+s3nYJqDEOOk=;
        b=R0jJDtsugJ0hIuCDoUEH1BEQuVNR3CYpB373a9OD6hN9aRICZ5CZ9FUetnclKBR2nn
         igqg2Hdq2/DCKrM09DtnwC9BWBYXAUyD/dZOI1ENqbvKI6mCrADXy+IzTD3Vc1WpJ0YF
         D3zQs0BDaAUNXwxkyTWaTOHhQtUDh5p2EGaZ8oT8pumJRay0l270Qw80FPr3QYEOWwl+
         YU7oyJVqUvV4SJRy/PDpMonY/8uduPAwZnVLuZeAm8+3MZoB+T27jhjsEx4yHfK8sekv
         Z4k5NN7M1R394hXhlfvLU1fknfOHQCKnyXaI7cjRyNvTELUYRVtAJN0bo7qMiKqlQcxZ
         GAZQ==
X-Gm-Message-State: ANoB5pmsG7USlhXkphfodMyWJAC1oYEEhAr9BjnbyJAlTpihhwMgIAxu
	l/usQYrJpk1zJQCwvFEEdjIZyoWL6xmhoaTHHWY=
X-Google-Smtp-Source: AA0mqf4KMTkeu9QsX5ZGfRse3U9AavYGik/xdusXPUwJZortX8zrYadS+QMFwyz3ijhr9deZLDTWPDc9c5KeezDWwXY=
X-Received: by 2002:a17:906:6d7:b0:781:951:2fb with SMTP id
 v23-20020a17090606d700b00781095102fbmr7071352ejb.64.1668797821038; Fri, 18
 Nov 2022 10:57:01 -0800 (PST)
MIME-Version: 1.0
References: <cover.1668793524.git.tim.orling@konsulko.com> <CANNYZj-YNwTDML-t_X-6VBC1YhyDSGg9Z7WK7H=yX=MgXNkSbA@mail.gmail.com>
 <CANx9H-AmzbTyy2-++YwKz8qYXabsYQDRV98+VTU4NKhbmTMonA@mail.gmail.com> <CANNYZj_c6FhwH-wrYzUVpKDCj1+qvJJuZWpADB1_PS_pjeYNiQ@mail.gmail.com>
In-Reply-To: <CANNYZj_c6FhwH-wrYzUVpKDCj1+qvJJuZWpADB1_PS_pjeYNiQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 18 Nov 2022 10:56:50 -0800
Message-ID: <CANx9H-B6Ci4o1x=F4sM8Gq39nxdzou9+60S4-+kHaicPUerrsA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/5] liburi-perl upgrade
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005338ba05edc34571"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 18:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173491

--0000000000005338ba05edc34571
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 18, 2022 at 10:35 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Fri, 18 Nov 2022 at 19:24, Tim Orling <ticotimo@gmail.com> wrote:
> >> I trust all of the affected recipes still pass 'devtool
> >> check-upgrade-status'? AUH won't work if that is broken.
> >>
> > It doesn't matter when the author changes and CPAN changes the URL out
> from under us. Unless we figure out a different URL to use for the AUH
> query.
> > liburi-perl was happily reporting no change for a long time.
>
> What I mean is does version check work properly for the fixed recipe,
> and the ones that were newly introduced in your patchset?
>
> I know what you mean. Yes, all of them happily report back a value if you
run 'devtool check-upgrade-status'.

What I am trying to get across is that:
5.0.7 the author was OALDERS, so the URL was
https://cpan.metacpan.org/authors/id/O/OA/OALDERS/URI-5.07.tar.gz
5.0.8 the author was ETHER, so the URL was
https://cpan.metacpan.org/authors/id/E/ET/ETHER/URI-5.08.tar.gz
5.0.9+ the author went back to OALDERS so the URL became
https://cpan.metacpan.org/authors/id/O/OA/OALDERS/URI-${PV}.tar.gz again

So for ALL perl modules, we would need some other scheme for checking if
the author changed. For example:
https://metacpan.org/pod/URI

Alex
>

--0000000000005338ba05edc34571
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 18, 2022 at 10:35 AM Alex=
ander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Fri, 18 Nov 2022 at 19:24, Tim Orling &lt;<a href=3D"mailto:ticot=
imo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt;&gt; I trust all of the affected recipes still pass &#39;devtool<br>
&gt;&gt; check-upgrade-status&#39;? AUH won&#39;t work if that is broken.<b=
r>
&gt;&gt;<br>
&gt; It doesn&#39;t matter when the author changes and CPAN changes the URL=
 out from under us. Unless we figure out a different URL to use for the AUH=
 query.<br>
&gt; liburi-perl was happily reporting no change for a long time.<br>
<br>
What I mean is does version check work properly for the fixed recipe,<br>
and the ones that were newly introduced in your patchset?<br>
<br></blockquote><div>I know what you mean. Yes, all of them happily report=
 back a value if you run &#39;devtool check-upgrade-status&#39;.</div><div>=
<br></div><div>What I am trying to get across is that:</div><div>5.0.7 the =
author was OALDERS, so the URL was <a href=3D"https://cpan.metacpan.org/aut=
hors/id/O/OA/OALDERS/URI-5.07.tar.gz">https://cpan.metacpan.org/authors/id/=
O/OA/OALDERS/URI-5.07.tar.gz</a></div><div>5.0.8 the author was ETHER, so t=
he URL was=C2=A0<a href=3D"https://cpan.metacpan.org/authors/id/E/ET/ETHER/=
URI-5.08.tar.gz">https://cpan.metacpan.org/authors/id/E/ET/ETHER/URI-5.08.t=
ar.gz</a></div><div>5.0.9+ the author went back to OALDERS so the URL becam=
e <a href=3D"https://cpan.metacpan.org/authors/id/O/OA/OALDERS/URI-${PV}.ta=
r.gz">https://cpan.metacpan.org/authors/id/O/OA/OALDERS/URI-${PV}.tar.gz</a=
> again</div><div><br></div><div>So for ALL perl modules, we would need som=
e other scheme for checking if the author changed. For example:</div><div><=
a href=3D"https://metacpan.org/pod/URI">https://metacpan.org/pod/URI</a><br=
></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Alex<br>
</blockquote></div></div>

--0000000000005338ba05edc34571--

