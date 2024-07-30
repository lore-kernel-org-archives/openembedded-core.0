Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1AEC3DA61
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 02:46:57 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.9272.1722307611583443195
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 19:46:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O7v0GQ0j;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7093f3a1af9so2342763a34.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 19:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722307611; x=1722912411; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2HY3RXt6N0g97CSX1qUdZhFV+U0xv8Ose34ZMN40zWs=;
        b=O7v0GQ0jHcUV/dTQQGTZ/twVOefkxOCrv/9Rva4Nh9dDVajaMUrZXGdkKci8lO3Wds
         wIDgG3x+QgFPDCBs/ODO+bLbP615yOKnWMrbIeSjRRrBUT+vAgmVUL2hZs8qWni339S3
         11YpH+kY3yHkvE/g5m815fu2pNjjR0pa6Foeop6Z3C/x+3X/o3W9TH7FBeGmj1GhVv8B
         VXe6dKqO53/8Np/ym8hIJiJmJpZDYJFQ7ypqp2awFtOfCui8U1BURw2+WjbD5uT0Z9SJ
         HsRU4UCwGFqRrvEEN3ZhIauqPc7XQaUPktcQ79SBDrkqy4H++H95dynX/lqyi6TPAj32
         nOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722307611; x=1722912411;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2HY3RXt6N0g97CSX1qUdZhFV+U0xv8Ose34ZMN40zWs=;
        b=iuR3LgTth2oOMKcs2pgn4rkqXd63MCUreCGDV+B7+pzDVs+OXmvL/aFHOkD50HIGwh
         DF+RsBJo7/LtnVYjvkz7sPx7ncoIAgY2b5JN2RYQIwnYgaFUAs3sSphhfTP4KY/eAjkz
         UI5qNKO6Jw74sdhkbQwoNTG2W6eY8zu+y3EWJ/hr+ysnIcf6CNLRsmt5dKPvXQviPYw3
         AOBOVSYWMa1hw1rjPBjCZ/nnw6ZHueE5Kk4+v6slZy4yka80Wp5UVD9O6m/5QZr07YkZ
         oDe6R2G72JnesU0PMyNY0XzViwWAxToukZocQmCEkzZQ9QlNPOmDrqADIM9DzzV5WtuN
         vHhw==
X-Forwarded-Encrypted: i=1; AJvYcCXVOZkfBUw7Sm1voJLo73vy8GS6Kd/iuLh8dDVXFkJSpZK90qp3MMvNGbv3Gv18oxlHuwZsK6fPsy54vPyKy1pmHfKQQQs7LF05gKXBWJLeNQQiKzAeOTgK
X-Gm-Message-State: AOJu0Yx5XvK7yMaPHVfyA721s4aaxNU7IyYSqsvIofiOsEt8nKfbT9Hs
	EC7+v3jXR2fvFu/jF1+M0H0wq8udtkJ86Zmk2mqjE3iVudEmmGC4+/Cc32TJmeG7YLmk48pL0NA
	Ml4At0rgEWS+PHz9hRxv3QYujSGQ=
X-Google-Smtp-Source: AGHT+IGB2ki8EUQlCSP2vEoM7qlEDArHGXJj23kk+qzCQVwjfo0cbwyIrCI9SOeTDDUmUHgPU2PJFThWGAP9iBd2qPE=
X-Received: by 2002:a05:6871:204:b0:25e:19fe:f233 with SMTP id
 586e51a60fabf-267d4eed8b2mr10637493fac.32.1722307610528; Mon, 29 Jul 2024
 19:46:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240729144434.153005-1-li.wang@windriver.com>
 <CANNYZj9boK0816ap5hN8LqmpeyThanWjoYjjT=FtfpEjp-9R4w@mail.gmail.com> <cd90e9bc-b6ee-405e-92fe-42507c7adb88@windriver.com>
In-Reply-To: <cd90e9bc-b6ee-405e-92fe-42507c7adb88@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Jul 2024 19:46:39 -0700
Message-ID: <CAMKF1sqw0B9vWtTU2vdmVkmgGx7PUtoRTZpZQeB4BKN3zL6o8Q@mail.gmail.com>
Subject: Re: [OE-core] [openembedded-core V2][master][PATCH]xinetd: use
 monotonic time
To: li.wang@windriver.com
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000051d162061e6dfd01"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 02:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202666

--00000000000051d162061e6dfd01
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 7:06=E2=80=AFPM Li Wang via lists.openembedded.org =
<li.wang=3D
windriver.com@lists.openembedded.org> wrote:

>
> On 7/30/2024 02:50, Alexander Kanavin wrote:
> > On Mon, 29 Jul 2024 at 16:48, Li Wang via lists.openembedded.org
> > <li.wang=3Dwindriver.com@lists.openembedded.org> wrote:
> >> when using xinet.d to limit rsync connections and time is set back,
> >> the connection limit is reached very quickly and rsync gets deactivate=
d,
> >> if time is changed again, rsync is never reactivated.
> >>
> >> date -s "xxx"
> >> xinetd[xxx]: Deactivating service rsync due to excessive incoming
> connections. Restarting in 10 seconds.
> >>
> >> the timer of xinet.d is based on time() function, and it is affected b=
y
> system time.
> >>
> >> Signed-off-by: Li Wang <li.wang@windriver.com>
> >> ---
> >>   .../xinetd/xinetd/use-monotonic-time.patch    | 246 ++++++++++++++++=
++
> >>   .../xinetd/xinetd_2.3.15.4.bb                 |   1 +
> >>   2 files changed, 247 insertions(+)
> >>   create mode 100644
> meta/recipes-extended/xinetd/xinetd/use-monotonic-time.patch
> >>
> >> diff --git
> a/meta/recipes-extended/xinetd/xinetd/use-monotonic-time.patch
> b/meta/recipes-extended/xinetd/xinetd/use-monotonic-time.patch
> >> new file mode 100644
> >> index 0000000000..2144c3cba2
> >> --- /dev/null
> >> +++ b/meta/recipes-extended/xinetd/xinetd/use-monotonic-time.patch
> >> @@ -0,0 +1,246 @@
> >> +use monotonic time
> >> +
> >> +when using xinet.d to limit rsync connections and time is set back,
> >> +the connection limit is reached very quickly and rsync gets
> deactivated,
> >> +if time is changed again, rsync is never reactivated.
> >> +
> >> +date -s "xxx"
> >> +xinetd[xxx]: Deactivating service rsync due to excessive incoming
> connections. Restarting in 10 seconds.
> >> +
> >> +the timer of xinet.d is based on time() function, and it is affected
> by system time.
> >> +
> >> +Upstream-Status: Pending
> > Is this patch taken from here?
> > https://github.com/openSUSE/xinetd/pull/45
> >
> > If so, it has an incorrect upstream-status. Please fix that.
>
> yes, but the upstream does not merge the patch, yet.
>
> in this situation, what should I fill the status?
>

It=E2=80=99s should say Submitted [link to pr]


> Thanks,
> LiWang.
>
> >
> > Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202665):
> https://lists.openembedded.org/g/openembedded-core/message/202665
> Mute This Topic: https://lists.openembedded.org/mt/107610065/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000051d162061e6dfd01
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jul 29, 2024 at 7:06=E2=80=AFPM Li Wang via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;li.wang=
=3D<a href=3D"mailto:windriver.com@lists.openembedded.org">windriver.com@li=
sts.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><br>
On 7/30/2024 02:50, Alexander Kanavin wrote:<br>
&gt; On Mon, 29 Jul 2024 at 16:48, Li Wang via <a href=3D"http://lists.open=
embedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</=
a><br>
&gt; &lt;li.wang=3D<a href=3D"mailto:windriver.com@lists.openembedded.org" =
target=3D"_blank">windriver.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;&gt; when using xinet.d to limit rsync connections and time is set back=
,<br>
&gt;&gt; the connection limit is reached very quickly and rsync gets deacti=
vated,<br>
&gt;&gt; if time is changed again, rsync is never reactivated.<br>
&gt;&gt;<br>
&gt;&gt; date -s &quot;xxx&quot;<br>
&gt;&gt; xinetd[xxx]: Deactivating service rsync due to excessive incoming =
connections. Restarting in 10 seconds.<br>
&gt;&gt;<br>
&gt;&gt; the timer of xinet.d is based on time() function, and it is affect=
ed by system time.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Li Wang &lt;<a href=3D"mailto:li.wang@windriver.com=
" target=3D"_blank">li.wang@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0.../xinetd/xinetd/use-monotonic-time.patch=C2=A0 =C2=
=A0 | 246 ++++++++++++++++++<br>
&gt;&gt;=C2=A0 =C2=A0.../xinetd/<a href=3D"http://xinetd_2.3.15.4.bb" rel=
=3D"noreferrer" target=3D"_blank">xinetd_2.3.15.4.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;&gt;=C2=A0 =C2=A02 files changed, 247 insertions(+)<br>
&gt;&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-extended/xinetd/xinetd=
/use-monotonic-time.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-extended/xinetd/xinetd/use-monotonic-tim=
e.patch b/meta/recipes-extended/xinetd/xinetd/use-monotonic-time.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..2144c3cba2<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-extended/xinetd/xinetd/use-monotonic-time.patch=
<br>
&gt;&gt; @@ -0,0 +1,246 @@<br>
&gt;&gt; +use monotonic time<br>
&gt;&gt; +<br>
&gt;&gt; +when using xinet.d to limit rsync connections and time is set bac=
k,<br>
&gt;&gt; +the connection limit is reached very quickly and rsync gets deact=
ivated,<br>
&gt;&gt; +if time is changed again, rsync is never reactivated.<br>
&gt;&gt; +<br>
&gt;&gt; +date -s &quot;xxx&quot;<br>
&gt;&gt; +xinetd[xxx]: Deactivating service rsync due to excessive incoming=
 connections. Restarting in 10 seconds.<br>
&gt;&gt; +<br>
&gt;&gt; +the timer of xinet.d is based on time() function, and it is affec=
ted by system time.<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Pending<br>
&gt; Is this patch taken from here?<br>
&gt; <a href=3D"https://github.com/openSUSE/xinetd/pull/45" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/openSUSE/xinetd/pull/45</a><br>
&gt;<br>
&gt; If so, it has an incorrect upstream-status. Please fix that.<br>
<br>
yes, but the upstream does not merge the patch, yet.<br>
<br>
in this situation, what should I fill the status?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">It=E2=80=99s sho=
uld say Submitted [link to pr]</div><div dir=3D"auto"><br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><br>
Thanks,<br>
LiWang.<br>
<br>
&gt;<br>
&gt; Alex<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#202665): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/202665" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/202665</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107610065/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/107610065/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000051d162061e6dfd01--

