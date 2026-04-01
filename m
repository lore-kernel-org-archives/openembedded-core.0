Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E5FD3515E
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 08:37:03 +0000 (UTC)
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8248.1775032620903862552
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 01:37:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YSyAEIkd;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: rybczynska@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12776bebe9fso3157683c88.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 01:37:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775032620; cv=none;
        d=google.com; s=arc-20240605;
        b=OH04gk3PkHpNdAbGHDA80rtnsOYLHuRkG2G7tJ/FgCzD3hZBAjOB6DtTFaeAZwlSDo
         tcHmZUQZ13VXKOiW4vTtHrkAfGE/ReXn4b5mN/UfcgyvkD4/NPC5sFtIxfUxlTokijw7
         gHQX64ZkwtilJy7KsP5YSP54afIyxukJP8IwNldCS84pAYQy2Oox/y4b1+GNO/h7OsUL
         1WlqO3OZ21mSMEnHcl5yxwOGSZx00Y3GrEGDtBbYFaoGtaQ2AlG1HzGW2NC+ptWSgMk3
         ZNaurX7xqtDgM8KnXbrljCLaI2YXNS7sVnRNw49/WS1Jc+D++80GpMT74UJtx6hW/XHl
         F/nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tGuU6FtdYedBlqmfqQ4qwd7W8Ah4AUF1X9G8cJb8e0g=;
        fh=dro7sZJtEULj09cNebRx10PrDA+PQMFe3InRd7oV0I0=;
        b=Yor8tvy2f6l2IvEm8H1u9UExvi4Zz+YxAPM3cyIYZJJof0Y8scabpB2VmFBnUhWSyv
         yauoIY0FLeHMqP8VubQ4V6uP83ncm68nO5KnsvEQmTMNv7O+7IB9jrLgfGnnL3W7sSuM
         Y0aVju8H2d2a90fyzY7v3lm3e82x3t6Fi6bWIDsgN6xdyiSURMUjH+FMSwWO3vDxNh83
         H0mCnvB9n6meb5hxxB11LngpuMOa6KdOoovGxu2siOv0f1B7y4ZNSR2bNuPyr24GP7TC
         WW9xbJ1hq6IqUldbgL1S0fje+OpwiLArumOjXRXpfETZlPEAdkHRkwgycfqAR6yH8Tfg
         Cm/A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775032620; x=1775637420; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tGuU6FtdYedBlqmfqQ4qwd7W8Ah4AUF1X9G8cJb8e0g=;
        b=YSyAEIkd6GNxllcU9R8UEM7ls84+eEgRh+g8CiO5+jY9oCSbZ2GO9OmAiCeEP+7dtt
         yckSKlep7kWG9AEu4PfMgVlp8wHNFkjwPahW/pUX2L8cvQxMYH7e1Jy6aAfZ/QLnio1G
         Q+pDz+n4nfcJNikgaVU8pShYDQhDIqmC1ABt4FD2gV7Z1KBPAXKrNvJHsjAb9yEjy7u1
         /IgQ9wiaa49g6d1EDvjgF1aoHvEOsLarUuBPhi9ehojYKMXyKMndA+uicj3rIcrmxg1z
         d7AQ9p31ooBejgzfVEVaV2SUw40JanTYuYS7KMq/e1OQ3qOf9Z04+ulH3kChtfZoAAHC
         u+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775032620; x=1775637420;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGuU6FtdYedBlqmfqQ4qwd7W8Ah4AUF1X9G8cJb8e0g=;
        b=hT5iItqEIpgZQzZIy6yYo+O33oHZOjvuFjXav8oE9l3XbOF/FKuaSe+YK5vS+Pk8cq
         3bsnAUJ2jaOZinXcSYiPPafdT1VgCEFxq23s+T+OZ83bUE0V6VAFCuDYXy6QCOyYExls
         Ow6CuaVqZhAKH8km1JvnlD4THufBQL8rp2dWidjK71rzu59OFrYxBj5/SePLF6qIS/ML
         vKEg/k1tn1W+I7mTWJMeqvcvpTG/wdcxoiZ2unaNVRlA0Gar1VmFeJc5525hZufuKDxx
         JsDqBhOrDadaOcGGJj+qHmFaewVSVS35asJFHKnc9wACLt/MbV1DXOlhVqzmkMmyo3lV
         eLSg==
X-Forwarded-Encrypted: i=1; AJvYcCUwulgQFDofWSkk0SF+RcBl9JxnpHJPT8a+J2zxYy1bGQGhQ+Cibu9CFGcCIaGscjeY+f9c/JPQKUYdxwiajHyHZw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzXufxDfAgfQMW2xD088T2n542rLVHhVcqbknnIOK5L7UTYb2Fd
	AwshVJRkL28GpKGCqzPLFljE3Ug1t0XPs22heN5LfC7RwrihxaOgrrp++uISQ1PGvnqH6hh1Tg7
	VKCmSzs5EwhmrR0V1eSjxvOulMzFOPMY=
X-Gm-Gg: ATEYQzw2627JFVoP89e+CKPqTEmLbDK7UmEvp9nfzgCU6xmSl+IRNKDD1OtfgHK5xiY
	KcMydnlwUO5Un0elZRYfRETQGz6amJsYDA0OatglZi2IH201lzt0yKuy88J4ehsZLo9gTsHb+sa
	02JrRG8+MlCwblIDYZYk8G2PmKJaq1kguXHuVc3fwcmzcJpTEYU1ZjZUe40ew9yVWpZ1O6zDFlP
	mc0NPK7XrUx0dSQItzkH30dEE9W6A1aimkwknIplM6L/UggqHBkKl9xLF2yYqSOGdG1Epu/J5si
	Ue/liv+lR/Ff8zlaHxV5+v6uwPka9m8aQuhCXtDDhUrkoj9pUn8=
X-Received: by 2002:a05:701b:271a:b0:12a:b932:81d2 with SMTP id
 a92af1059eb24-12be64ed397mr1023571c88.21.1775032620009; Wed, 01 Apr 2026
 01:37:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAApg2=RgxG+NY7sLTBMNEhPmX-O5dNC+AHmSSUQCDREgV6VToQ@mail.gmail.com>
 <CADySD0HH=KMgU7kXKXeNEOG38ZtVZjjb3mZ5dLpQw9XewfuV+w@mail.gmail.com>
 <CAApg2=SPPo68XtvWioHO_T1=5EQiNABnntGJhM59hDkWhm6N9A@mail.gmail.com> <df72394376fdd01fe7d3298c4d3995f00705fc16.camel@linuxfoundation.org>
In-Reply-To: <df72394376fdd01fe7d3298c4d3995f00705fc16.camel@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 1 Apr 2026 10:36:46 +0200
X-Gm-Features: AQROBzCr_-mkTtw0ld3KNQPnJgQm3WfaGddFy-iNBBmWOM4ZgbhCYpiS5A6xxmQ
Message-ID: <CAApg2=QRwSxM_HvE8hvzfp-DY1wfCZSr2rXKEjt-zFm9GOCJxQ@mail.gmail.com>
Subject: Re: [OE-core] Runqemu error on core-image-minimal
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c7cd24064e61fc31"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 08:37:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234333

--000000000000c7cd24064e61fc31
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 9:49=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2026-04-01 at 08:04 +0200, Marta Rybczynska via
> lists.openembedded.org wrote:
> > On Tue, Mar 31, 2026 at 9:35=E2=80=AFPM Ankur Tyagi <ankur.tyagi85@gmai=
l.com>
> wrote:
> > > On Wed, Apr 1, 2026 at 4:30=E2=80=AFAM Marta Rybczynska via
> > > lists.openembedded.org <rybczynska=3Dgmail.com@lists.openembedded.org=
>
> > > wrote:
> > > >
> > > > Hello all,
> > > > As mentioned on the call today, I have an issue in a configuration
> with bitbake-setup, oe-core-master fragments and runqemu:
> > > >
> > > > $ runqemu qemux86-64
> > > > runqemu - INFO - Running MACHINE=3Dqemux86-64 bitbake -e  ...
> > > > runqemu - WARNING - Couldn't run 'MACHINE=3Dqemux86-64 bitbake -e  =
'
> to gather environment information, maybe the target wasn't an image name,
> will retry with virtual/kernel as a target:
> > > > ERROR: A builtin fragment 'machine/qemux86-64' is used while MACHIN=
E
> has already got an assignment.
> > > > Please either disable the fragment or remove the value assignment.
> > >
> > > drop "qemux86-64" argument, it is not needed since the machine config
> > > fragment is set.
> > > "runqemu core-image-minimal" should succeed.
> >
> > Hello Ankur,
> > This leads us to another problem (also happens if I remove the fragment=
):
> >
> > $ runqemu
> >
> > runqemu - INFO - Running bitbake -e  ...
> > runqemu - ERROR - .zst images are only supported with snapshot mode. Yo=
u
> can either use the "snapshot" option or use an uncompressed image.
> > runqemu - INFO - Cleaning up
> > runqemu - INFO - Host uptime: 17100244.13
>
> Try "runqemu snapshot" :)
>
> We should find a way to fix the MACHINE=3D issue. We did briefly remove
> the support for using bitbake -e entirely but it was requested we put
> that back.
>
> The snapshot message was added recently to cleanly support compressed
> images (also relatively new) but obviously the new user interface to it
> could use some improvement.
>
>
Ok... with 'snapshot' it works (I tried it yesterday and it didn't -
probably a manipulation issue).

I note then that we have a MACHINE=3D issue and the docs are out of sync
https://docs.yoctoproject.org/dev/brief-yoctoprojectqs/index.html#building-=
your-image

I can submit a docs fix (there are more things not up to date) when this is
solved: is this option necessary now or it will be hidden in runqemu?

Regards,
Marta

--000000000000c7cd24064e61fc31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 1, =
2026 at 9:49=E2=80=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purdie=
@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 2026-04-01 =
at 08:04 +0200, Marta Rybczynska via <a href=3D"http://lists.openembedded.o=
rg" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<=
br>
&gt; On Tue, Mar 31, 2026 at 9:35=E2=80=AFPM Ankur Tyagi &lt;<a href=3D"mai=
lto:ankur.tyagi85@gmail.com" target=3D"_blank">ankur.tyagi85@gmail.com</a>&=
gt; wrote:<br>
&gt; &gt; On Wed, Apr 1, 2026 at 4:30=E2=80=AFAM Marta Rybczynska via<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.openembedded.org</a> &lt;rybczynska=3D<a href=3D"mailto=
:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openem=
bedded.org</a>&gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Hello all,<br>
&gt; &gt; &gt; As mentioned on the call today, I have an issue in a configu=
ration with bitbake-setup, oe-core-master fragments and runqemu:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; $ runqemu qemux86-64<br>
&gt; &gt; &gt; runqemu - INFO - Running MACHINE=3Dqemux86-64 bitbake -e=C2=
=A0 ...<br>
&gt; &gt; &gt; runqemu - WARNING - Couldn&#39;t run &#39;MACHINE=3Dqemux86-=
64 bitbake -e=C2=A0 &#39; to gather environment information, maybe the targ=
et wasn&#39;t an image name, will retry with virtual/kernel as a target:<br=
>
&gt; &gt; &gt; ERROR: A builtin fragment &#39;machine/qemux86-64&#39; is us=
ed while MACHINE has already got an assignment.<br>
&gt; &gt; &gt; Please either disable the fragment or remove the value assig=
nment.<br>
&gt; &gt; <br>
&gt; &gt; drop &quot;qemux86-64&quot; argument, it is not needed since the =
machine config<br>
&gt; &gt; fragment is set.<br>
&gt; &gt; &quot;runqemu core-image-minimal&quot; should succeed.<br>
&gt; <br>
&gt; Hello Ankur,<br>
&gt; This leads us to another problem (also happens if I remove the fragmen=
t):<br>
&gt; <br>
&gt; $ runqemu<br>
&gt; <br>
&gt; runqemu - INFO - Running bitbake -e =C2=A0...<br>
&gt; runqemu - ERROR - .zst images are only supported with snapshot mode. Y=
ou can either use the &quot;snapshot&quot; option or use an uncompressed im=
age.<br>
&gt; runqemu - INFO - Cleaning up<br>
&gt; runqemu - INFO - Host uptime: 17100244.13<br>
<br>
Try &quot;runqemu snapshot&quot; :)<br>
<br>
We should find a way to fix the MACHINE=3D issue. We did briefly remove<br>
the support for using bitbake -e entirely but it was requested we put<br>
that back.<br>
<br>
The snapshot message was added recently to cleanly support compressed<br>
images (also relatively new) but obviously the new user interface to it<br>
could use some improvement.<br><br></blockquote><div><br></div><div>Ok... w=
ith &#39;snapshot&#39; it works (I tried it yesterday and it didn&#39;t - p=
robably a manipulation issue).</div><div><br></div><div>I note then that we=
 have a MACHINE=3D issue and the docs are out of sync=C2=A0<a href=3D"https=
://docs.yoctoproject.org/dev/brief-yoctoprojectqs/index.html#building-your-=
image">https://docs.yoctoproject.org/dev/brief-yoctoprojectqs/index.html#bu=
ilding-your-image</a></div><div><br></div><div>I can submit a docs fix (the=
re are more things not up to date) when this is solved: is this option nece=
ssary now or it will be hidden in runqemu?</div><div><br></div><div>Regards=
,</div><div>Marta=C2=A0</div></div></div>

--000000000000c7cd24064e61fc31--

