Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 310CBC25B74
	for <webhook@archiver.kernel.org>; Sun, 12 May 2024 20:19:55 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.44383.1715545186991014566
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 May 2024 13:19:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C0/uFer+;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-23f9c2f1df6so2414349fac.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 May 2024 13:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715545186; x=1716149986; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=golPV+gx9qrWkS7U4ITA+iPGOe1y89/CbzCbbLITit8=;
        b=C0/uFer+zOozqePJyax7kgCwy5Nn14rNT3BwozfPWygnfy+AtRUbpZizenTJxG++LN
         Y3ZUIgA42VZHCUsSQg9L2AKcV0//K7dVNpN4AptS/abcH601p6GyxLMF41jXSccteBgz
         0GPjy8gXkV6fq0QhIhwfcjimQnKgfqP2zPSqFMsHTpUDZUCqAkac1en67nnoUQjoK74Y
         VmWD7NGTfjBVynRIp4uRLzaPIaCEvnojlMAqQB3iEa8lcCDh+YmhzrT0XnuRi6Ep5cGV
         2Nalhsqyp1gxYCpubPobqaE5SSCYbY0LG8dsAs0owIdBk3m+pgIFoPlESOgfAee9CwJ4
         zIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715545186; x=1716149986;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=golPV+gx9qrWkS7U4ITA+iPGOe1y89/CbzCbbLITit8=;
        b=ZH31KRXMlL8Z/BHWVs4FX9YFj7SXqp5nKcDebx59dUvZ7na8eU8MFggkeTq4ASbuQn
         sOaydAacrUevAUXkPKeCbkE7zZRLZCI/4FU8IMNXxNENvGMU6whuZ9txb5H4RLFZxRZV
         pUdblaOPt6XMWTD6bF6tWnDM+RBDcb2XRMX5ueZ4u5j6yc5NBvBU8eMY+PZsb6tEy1ez
         dR4yo2u1/3ZFZQ+HSwC/7v4OxTAqbGR+XVxQW2PKV/zyvSqr5BMgziXgRhOhpcpcj2fQ
         NCZSoAgOGF8Ywzgv9tO1Q8Fcwp2wLsvEVI9KqSbdXTH0hxJnOmaSs43Pp8mCFR9ZreGt
         OA7A==
X-Gm-Message-State: AOJu0YxeOP8YfDXUiNjEcmCAg3ThgfkIwM2s8F7KjXRmPPShCVWzBPMo
	r4w6UkK1dnF0O+7/hSdKlDKj+NkXY3EVwdZfnXRl6eAPEq+y//3/f36oRs4iDf8aB/x8DwIyIJU
	v5M7SCWrbGMyju4We9OFqx5kTpFw=
X-Google-Smtp-Source: AGHT+IGdimc/ZbtYsB32DRjIpkrt9aT+/GgvEhRRDLRjhzUGQLbEtB2Pr0OLijGy2FxZ1mWc49fwzlRUarC5zyXJiY4=
X-Received: by 2002:a05:6870:2153:b0:23e:111:cf21 with SMTP id
 586e51a60fabf-24172a7dd70mr10478191fac.13.1715545186050; Sun, 12 May 2024
 13:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240511162231.4102212-1-raj.khem@gmail.com> <CANNYZj9yKE4RAUqqZic6v3jSt7Q1bmDeE2MGBmyHOxUN0-2nJw@mail.gmail.com>
In-Reply-To: <CANNYZj9yKE4RAUqqZic6v3jSt7Q1bmDeE2MGBmyHOxUN0-2nJw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 May 2024 13:19:34 -0700
Message-ID: <CAMKF1soUrT2TNoSJG7hmzdAcKa-jmvrTyUh_YHdfEcEPKqg4Ww@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] valgrind: Upgrade to 3.23.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000692b3f0618477dff"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 May 2024 20:19:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199220

--000000000000692b3f0618477dff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 12, 2024 at 11:51=E2=80=AFAM Alexander Kanavin <alex.kanavin@gm=
ail.com>
wrote:

> On Sat, 11 May 2024 at 18:22, Khem Raj via lists.openembedded.org
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> > +From b17b6d7d3a65c14f91f090f3f4f9898d6fa3a9e4 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 10 May 2024 16:27:34 -0700
> > +Subject: [PATCH] configure: Drop setting mcpu=3Dcortex-a8 on arm
> > +
> > +The -march settings from environment expresses the flags
> > +appropriately, moreover, this conflicts when using armhf
> > +without neon [1]
> > +
> > +[1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D928224
> > +
> > +Upstream-Status: Pending
>
> Please no pending patches. Submit here:
> https://bugs.kde.org/enter_bug.cgi?product=3Dvalgrind
>

I am aware of it and it=E2=80=99s working in parallel, I guess it=E2=80=99s=
 better to
submit it to Debian or arch first and get it tested there than openembedded
perhaps.


> Alex
>

--000000000000692b3f0618477dff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, May 12, 2024 at 11:51=E2=80=AFAM Alexander Kanavin =
&lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">On Sat, 11 May 2024 at 18:=
22, Khem Raj via <a href=3D"http://lists.openembedded.org" rel=3D"noreferre=
r" target=3D"_blank">lists.openembedded.org</a><br>
&lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; +From b17b6d7d3a65c14f91f090f3f4f9898d6fa3a9e4 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; +Date: Fri, 10 May 2024 16:27:34 -0700<br>
&gt; +Subject: [PATCH] configure: Drop setting mcpu=3Dcortex-a8 on arm<br>
&gt; +<br>
&gt; +The -march settings from environment expresses the flags<br>
&gt; +appropriately, moreover, this conflicts when using armhf<br>
&gt; +without neon [1]<br>
&gt; +<br>
&gt; +[1] <a href=3D"https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D92=
8224" rel=3D"noreferrer" target=3D"_blank">https://bugs.debian.org/cgi-bin/=
bugreport.cgi?bug=3D928224</a><br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
<br>
Please no pending patches. Submit here:<br>
<a href=3D"https://bugs.kde.org/enter_bug.cgi?product=3Dvalgrind" rel=3D"no=
referrer" target=3D"_blank">https://bugs.kde.org/enter_bug.cgi?product=3Dva=
lgrind</a><br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I am aware of it=
 and it=E2=80=99s working in parallel, I guess it=E2=80=99s better to submi=
t it to Debian or arch first and get it tested there than openembedded perh=
aps.</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Alex<br>
</blockquote></div></div>

--000000000000692b3f0618477dff--

