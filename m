Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E1CC6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 23:45:04 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.42585.1680219903774599769
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 16:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=YJAIup43;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id j18-20020a05600c1c1200b003ee5157346cso14351219wms.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 16:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680219902; x=1682811902;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jNgK16FUqrx39nqLyQQxCoDNiqH774NukkHPByMbvsE=;
        b=YJAIup43evwvjb60KidMiVkcjuIQuhIfaXzjawdcJdsUBcxbnqsG6jaZh/mZEcfj45
         vxSbYNSQFQSYvTbyW7x2Qc3Cq0LQtFQPirPDw/ickshwxi+z6B/ARrK3J00mPzjK+sxR
         9fFLrNjgQo6nqUGdY5s2Vg4w2+aI+Iu6w4KymEopo9VdzB9FMiwnzVonfCckQZopLcit
         r8Pvdaq0nV0jaKZGTJgcbAKSG4bjJCaCyIvMOZGNkD6OR/bXm4AjF5SEr0CGyu7SeTuI
         PeLzYATF3Ui91Kpm6TewVIeKmQmbVLGlS5yth98BqIbkOKGqZaJn/U/KmH9mg110bh8f
         yUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680219902; x=1682811902;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jNgK16FUqrx39nqLyQQxCoDNiqH774NukkHPByMbvsE=;
        b=dnOcZ04FqZI/CGJGXMS78xNowAKQGT6G107xpHHO/ko4O9/6zOLMAlMHv812JnL5BM
         PdzjfnALvTYdpnxPn3InjjPSBwqVIz6lcmkTapXLH4OOeFbcmIPiJlSBOB+RyUhE4oec
         R2ltT3hSvT4lv8Xv1tgiH/kGwz8Q4EI+eVwtGvbC1MqRrT2oq/BaaCyPP+xCRYvQk6+I
         BLihMDkHd19pRUWmn2siMgJ0cc230iPi0tXAX640mkYd6x+i/pjUJhY3YEHYInIYvnH9
         wgDU09mFmGuV6OWQxsKLw/5mNTqFEJnxU4ZyijXrJu72RgpveTeAIYsfgTbEfsGBOAQB
         t4hw==
X-Gm-Message-State: AO0yUKWTqrzYbUn92YFUZxOYdm1cwCJFCK+EyZvCVXxd/gv0XTY+v2Tk
	W+h2zYAx1DtRjZUIWO4mkSHjOWjtaNtuRJNgWbY=
X-Google-Smtp-Source: AK7set+UPgyZn0luNszgG3iOUFKYmnq8+xurBpBuUY8W8Cf8Inhpo6SLdTDtFOxQIiebpe2gtEHll9FoJAsjaj24Yeo=
X-Received: by 2002:a1c:790b:0:b0:3eb:5824:f0ea with SMTP id
 l11-20020a1c790b000000b003eb5824f0eamr5926858wme.3.1680219902137; Thu, 30 Mar
 2023 16:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230330224404.51167-1-richard.purdie@linuxfoundation.org>
 <CA+chaQfbGEFeADX9oxo34RCL8Ffb7QXOHpvN6g6aNxv26nW+Tg@mail.gmail.com> <681c50ecd228ac9b44fc4debfc287f046934faa0.camel@linuxfoundation.org>
In-Reply-To: <681c50ecd228ac9b44fc4debfc287f046934faa0.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 31 Mar 2023 01:44:47 +0200
Message-ID: <CA+chaQda4rY_77xvuYkuyiunOzsmGw0zXQN2W_YnkBFeCyB5cA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/loader: Ensure module names don't contain
 uppercase characters
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000695ee505f826aee2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 23:45:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179382

--000000000000695ee505f826aee2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 31, 2023 at 1:28=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2023-03-31 at 01:16 +0200, Martin Jansa wrote:
> > I've similar one locally, but this one works for me as well.
> >
> > Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> I did check your public branches and didn't see it and wanted to get
> the other patch in so I quickly put it together!
>

Yeah, I was hiding it in my poky branches I'm using for selftest testing,
sorry. I was going to send it after resolving eSDK failure when uninative
is not enabled (which is taking too long, because I got stuck in something
else again :/).

I've sent at least the pending runqemu changes and small fix for
imagefeatures.py change merged today.

Cheers,


> Cheers,
>
> Richard
>

--000000000000695ee505f826aee2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Mar 31, 2023 at 1:28=E2=80=AFAM R=
ichard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">ric=
hard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 2023-03-3=
1 at 01:16 +0200, Martin Jansa wrote:<br>
&gt; I&#39;ve similar one locally, but this one works for me as well.<br>
&gt; <br>
&gt; Acked-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
<br>
I did check your public branches and didn&#39;t see it and wanted to get<br=
>
the other patch in so I quickly put it together!<br></blockquote><div><br><=
/div><div>Yeah, I was hiding it in my poky branches I&#39;m using for selft=
est testing, sorry. I was going to send it after resolving eSDK failure whe=
n uninative is not enabled (which is taking too long, because I got stuck i=
n something else again :/).</div><div><br></div><div>I&#39;ve sent at least=
 the pending runqemu changes and small fix for imagefeatures.py change merg=
ed today.</div><div><br></div><div>Cheers,</div><div><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--000000000000695ee505f826aee2--

