Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C425CC76196
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 15:36:56 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.70327.1680017812593474331
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 08:36:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ii/rG5+l;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id q16so16345785lfe.10
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 08:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680017811;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WXCMUYQrorjcxVBzVqhdlxjuyT5W5Q5KFaH/DPcQgwk=;
        b=Ii/rG5+lcefHIn9yRis5sTru3gPgYWJIq2ZACYo6MrT/m3PeiA+QakbwG8qbYYKpJ5
         bgpJ57/aRiRWRtvE4QguEiGDfDazC+V7McVWcfSqr2q/if5NUZMwg6+idCsXBh8qIqGD
         G1KjlgUmmB0niCUxO1j0D8okLOsH1vQtZw7/diyhohp60C+RUJGn+zeqmww9xJecXPUf
         VcxWiLJZE0NquApj0c4HPZ/V98lc4REAjgTkxeQNNT9VdL4KIRWrZO3GsCzBMqzQUN8P
         1LBehCEs73Uxlk9TmoLAFfX1FJKAjTAFUNWXXfvGfIzkl3ALey/RdkpSNjsZPPCrmVVD
         Nc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680017811;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WXCMUYQrorjcxVBzVqhdlxjuyT5W5Q5KFaH/DPcQgwk=;
        b=mE1kXq7y7ITS0C2T8gUq53q/ONUNP2CQzMSFFAQxDF7IY2ODQ/YtDq2Z+OJhMh5mXL
         ithKQTL1KhkKlQitdvRYlnKbOISVqWs+AUD8QKbd7WTS4Da3+CdJCN9ZKhbCRrCYzeL0
         6Gz5ygl9+IJvL7eif9l7ZIUZ23PGLU2/iP8HK3/kznOB54oBGIiL01dfj/s5QaCq0o14
         uoBXMsvFnzwoik0MBMajt+5H8sz6KyHW+25v9Rvw8wnKU5jRkqS5K0NWsnKdfCcEY8OI
         WSkceHOk9VqhBLXsYJPvFaQIsigcLyf0d8sabzKgXNg7RUZtkzI4bO5iZdQPaYpcXJUE
         P9Ew==
X-Gm-Message-State: AAQBX9dLBsmkfoRErUiUDZz3Udi57YtIsxXJaMxd3/D8JHU4csD0ZYQo
	/N0xeB0OGEoxXJs947yLKlwVF5ep3NFN3/6wbHw=
X-Google-Smtp-Source: AKy350bJgwQw2NfEKHUZM5I+FfAnVFWMsQZQeovrvmi0ABoAblUX6HcflMVtkvhWEkxcaPEu8acFLGLPQ8dVcI4NxRw=
X-Received: by 2002:ac2:5a06:0:b0:4e8:45d5:53cd with SMTP id
 q6-20020ac25a06000000b004e845d553cdmr4574127lfn.12.1680017810668; Tue, 28 Mar
 2023 08:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <CA+cAkeqygZo7JXaaatanuNUaq2tpP7jfa8ZgFZ3pj7WgCuN_=w@mail.gmail.com>
 <CANNYZj_gMBkeMPO=zG+OFx84kJj=+DFqQUdULOQ_jR5wGApfjQ@mail.gmail.com>
 <53196741237572435b0a5965aa77a72b021d6fed.camel@linuxfoundation.org>
 <CA+cAkeo_CnnQDLrrmcDE1PP_65qoxkAXU20Ho8r_N-BwqqbObw@mail.gmail.com> <72921856ae24cb434edf3698ea51614d7a73a4fb.camel@linuxfoundation.org>
In-Reply-To: <72921856ae24cb434edf3698ea51614d7a73a4fb.camel@linuxfoundation.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Tue, 28 Mar 2023 17:36:39 +0200
Message-ID: <CA+cAkerVECW3BPi8nE4SspKVd1BV9ro0j5d3fHT86CAYGahUwQ@mail.gmail.com>
Subject: Re: [OE-core] oe-selftest for devtool failed
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d23e1a05f7f7a0cb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 15:36:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179240

--000000000000d23e1a05f7f7a0cb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Note that I managed to build libtirpc-native and shadow-native with bitbake
(and the same setup).

I currently try the build on another machine and under /home.

I'll tell you the results soon

Le mar. 28 mars 2023, 15:13, Richard Purdie <
richard.purdie@linuxfoundation.org> a =C3=A9crit :

> On Tue, 2023-03-28 at 14:40 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
> > I just finished a pristine build of core-image-sato on poky master,
> > and set up SSTATE_DIR in my local.conf.
> > Tests are now ok, I can start to write some now.
> >
> > If anyone is interested , please find attached the full log of the
> > two first failures.
>
> Having the errors helps, thanks.
>
> The short summary is these two lines:
>
> libtirpc-native
> | chown: changing ownership of
> '/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build-st/tmp/work/x86_64-li=
nux/libtirpc-native/1.3.3-r0/image/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/p=
oky/build-st/tmp/work/x86_64-linux/libtirpc-native/1.3.3-r0/recipe-sysroot-=
native/etc/netconfig':
> Invalid argument
>
> shadow-native
> | chown: changing ownership of
> '/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build-st/tmp/work/x86_64-li=
nux/shadow-native/4.13-r0/image/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky=
/build-st/tmp/work/x86_64-linux/shadow-native/4.13-r0/recipe-sysroot-native=
/var/spool/mail':
> Invalid argument
>
>
> I'm wondering if the fact the build is under /var might be triggering
> something somehow...
>
> Cheers,
>
> Richard
>

--000000000000d23e1a05f7f7a0cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Note that I managed to build libtirpc-native and sha=
dow-native with bitbake (and the same setup).=C2=A0</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">I currently try the build on another machine an=
d under /home.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#=
39;ll tell you the results soon=C2=A0<br><br><div class=3D"gmail_quote" dir=
=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">Le mar. 28 mars 2023, 15:13=
, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">=
richard.purdie@linuxfoundation.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On Tue, 2023-03-28 at 14:40 +0200, Fr=C3=A9d=C3=
=A9ric Martinsons wrote:<br>
&gt; I just finished a pristine build of core-image-sato on poky master,<br=
>
&gt; and set up SSTATE_DIR in my local.conf.<br>
&gt; Tests are now ok, I can start to write some now.<br>
&gt; <br>
&gt; If anyone is interested , please find attached the full log of the<br>
&gt; two first failures.<br>
<br>
Having the errors helps, thanks.<br>
<br>
The short summary is these two lines:<br>
<br>
libtirpc-native<br>
| chown: changing ownership of &#39;/var/lib/jenkins/YOCTO_POKY_MASTER_TEST=
/poky/build-st/tmp/work/x86_64-linux/libtirpc-native/1.3.3-r0/image/var/lib=
/jenkins/YOCTO_POKY_MASTER_TEST/poky/build-st/tmp/work/x86_64-linux/libtirp=
c-native/1.3.3-r0/recipe-sysroot-native/etc/netconfig&#39;: Invalid argumen=
t<br>
<br>
shadow-native<br>
| chown: changing ownership of &#39;/var/lib/jenkins/YOCTO_POKY_MASTER_TEST=
/poky/build-st/tmp/work/x86_64-linux/shadow-native/4.13-r0/image/var/lib/je=
nkins/YOCTO_POKY_MASTER_TEST/poky/build-st/tmp/work/x86_64-linux/shadow-nat=
ive/4.13-r0/recipe-sysroot-native/var/spool/mail&#39;: Invalid argument<br>
<br>
<br>
I&#39;m wondering if the fact the build is under /var might be triggering<b=
r>
something somehow...<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div></div>

--000000000000d23e1a05f7f7a0cb--

