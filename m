Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web12.6312.1628681795652656442
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Aug 2021 04:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nn402QeM;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id g1so1270732vsq.7
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Aug 2021 04:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HQM22JPW3DuemoUhWapp6D9AGHsIJNMHxnOHOQzBIJ0=;
        b=nn402QeMF/Uh/UexF+up3ihc8rPb2oz8at+CbPthMVD6P5otbQdWJyKs6zipbm03gN
         /vcG8P8F2YBG49siNHP9EcQd+iDlYuqwFQrcFky/MC0HxzoecI+vF4rUNyzA5l8mG4Ei
         7qL7N/MgwojCj1Z44o35wUwQIGD6lwlWl6+kiQFao9q9REjO8YHRBsJoIjRqtgBLv/my
         7pdQWWZTwVlkOnV4d3W+a+8zn5ya7V4HiRRxIh8pFQcrk1/Q1BCShUBZHWqvtx1zd4XR
         e7hwVyxn8QhOzKht04yxfVxF/YDVVPaYGpvPStYKg5jBxb9+j8ljXFSJwFtP+fZYldn2
         6R1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HQM22JPW3DuemoUhWapp6D9AGHsIJNMHxnOHOQzBIJ0=;
        b=KXwbYxtyu6ZYxYTYWmklqOp6aiMiIlWwH9nSLRUifXuCND+DEFtucx5y8CROFfUxEH
         WaggLIFAA0yDrbWt+CrvKOT8rJ4J8e8Phz0cWxnv/Zqb5b2FgLiOSuIbn7b4L8bszrsi
         7RnxyX/laoCTKtINjPm1lpDiEZmaMbSPqyQirPcsOfvXdnCFe7Y6goUPLDlMYy+Mx10S
         RVi0GEI28c7crW/OgZI54QrcCs7zC9O9wuQmrrtfMqs1Xg/tYRQIr5eahVzDHL7CBjwP
         g1X59V58HnIT4MVSJdhufqzX+67YhRSe53/I3Td6WQlmBeODm0oVu2iSVZFH4SdxuXaG
         cU+Q==
X-Gm-Message-State: AOAM530mt72hRPNMQmG5StJUu2BG88Bgq2KT81d26Dd3tFkgR9YyM9O/
	KdDA77F2h/kaDgH+fJzz3pEAUdaYjeW1mOYiQ24=
X-Google-Smtp-Source: ABdhPJx7wQKur+uGic0Yu8V1BCM8D8B3Abg35AwG46XWUZAxG6mpm299ym0LBh7gu0uGtXD6hr2fqGTIcKNgx5Hw8P8=
X-Received: by 2002:a67:dd02:: with SMTP id y2mr4510951vsj.20.1628681794856;
 Wed, 11 Aug 2021 04:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210803051138.30790-1-qiang.zhang@windriver.com> <CAAnfSTtD=Vz-3SY0UYBh62en9Z_WMzWP7iRQPynmJPmCR+PiHQ@mail.gmail.com>
In-Reply-To: <CAAnfSTtD=Vz-3SY0UYBh62en9Z_WMzWP7iRQPynmJPmCR+PiHQ@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 11 Aug 2021 13:36:23 +0200
Message-ID: <CANNYZj9y7qXt92w0hfkWJufJ=7i6m8ddDcNfNzOJCUw+Ci_a+Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3: use monotonic clock for condvar if possible
To: Ross Burton <ross@burtonini.com>
Cc: "Zhang, Qiang" <qiang.zhang@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d5ac3e05c947072d"

--000000000000d5ac3e05c947072d
Content-Type: text/plain; charset="UTF-8"

I too do not think this is sufficiently explained. All of python ptests
pass, so there needs to be a demonstrator of incorrect behavior, or let's
just revert it.

Alex

On Mon, 9 Aug 2021 at 19:53, Ross Burton <ross@burtonini.com> wrote:

> On Tue, 3 Aug 2021 at 05:41, Zhang, Qiang <qiang.zhang@windriver.com>
> wrote:
> > The timeout for threading.Lock, threading.Condition, etc, is not using
> > a monotonic clock, it is affected if the system time (realtime clock)
> > is set.
> >
> > This patch will make condvar use monotonic clock.
> > Refence: https://bugs.python.org/issue41710
>
> That doesn't quite make sense to me.
>
> As referenced in that bug report,
>
> https://github.com/python/cpython/commit/001fee14e0f2ba5f41fb733adc69d5965925a094
> uses monotonic clocks by default.  That was in 3.8.0 onwards.
>
> So, why is this change to pretend that the semaphore is broken needed?
>
> Ross
>
> 
>
>

--000000000000d5ac3e05c947072d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I too do not think this is sufficiently explained. Al=
l of python ptests pass, so there needs to be a demonstrator of incorrect b=
ehavior, or let&#39;s just revert it.</div><div><br></div><div>Alex<br></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Mon, 9 Aug 2021 at 19:53, Ross Burton &lt;<a href=3D"mailto:ross@burto=
nini.com">ross@burtonini.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Tue, 3 Aug 2021 at 05:41, Zhang, Qiang &lt;<=
a href=3D"mailto:qiang.zhang@windriver.com" target=3D"_blank">qiang.zhang@w=
indriver.com</a>&gt; wrote:<br>
&gt; The timeout for threading.Lock, threading.Condition, etc, is not using=
<br>
&gt; a monotonic clock, it is affected if the system time (realtime clock)<=
br>
&gt; is set.<br>
&gt;<br>
&gt; This patch will make condvar use monotonic clock.<br>
&gt; Refence: <a href=3D"https://bugs.python.org/issue41710" rel=3D"norefer=
rer" target=3D"_blank">https://bugs.python.org/issue41710</a><br>
<br>
That doesn&#39;t quite make sense to me.<br>
<br>
As referenced in that bug report,<br>
<a href=3D"https://github.com/python/cpython/commit/001fee14e0f2ba5f41fb733=
adc69d5965925a094" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
python/cpython/commit/001fee14e0f2ba5f41fb733adc69d5965925a094</a><br>
uses monotonic clocks by default.=C2=A0 That was in 3.8.0 onwards.<br>
<br>
So, why is this change to pretend that the semaphore is broken needed?<br>
<br>
Ross<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000d5ac3e05c947072d--
