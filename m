Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2B6C79FBB
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 21:44:56 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26074.1789076688350644142
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 14:44:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=h5Xxk7dI;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-855c26cf490so1365627b3.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 14:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789076687; cv=none;
        d=google.com; s=arc-20260327;
        b=KjfndjxBM6Zx7hDJxlJI/a02JZXeZBaz3jVDB8vr7nbSNIZG3HoaIVIQ4cPf0o5dr/
         WBbdKJMs/qkluIKR2yscIvaj8fmUY9zejjRK+SoTnHXv9XmWFfYD3KIlHMtkrXiE55dQ
         tT6tZakXcZNC8OqVNxhVKws0plDW7bN4RbUQEAVDRnnIBLOIUefXymWn7zAdQG9nx7Er
         DHjzgr2e7GLIWK7kdS3Dk8PHAp6qHIqx4rOLA58d81D53Uugl10r6YRxxRDB/RWSBVsi
         lCyGVbRfX4ehWXMFxSSBUIksR9GAC1mv/yiXkaPiGGcWvN+9sf8oKSynjufrVKHHVD+E
         vyAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2oHREbZFfJzROdF57Zw38K17OM0EdKrFuoP/JAK0BOU=;
        fh=L6iXS8r6Mj1xZEj4UIigPnrPS/sRGAbUqeeA0HeBmg0=;
        b=nyCwgxLJCkeGaY91CrxlW1TZjX1JDSkI5e7p76LtngftM+RceAM6QtmzvmzBuFvKsv
         G2adAydZcDBPrK3ILX87z8HaOQ3iv9G7I0goKSULkP64mapa2dxqDV0dhWeqUTakH96e
         2xCXsLxibmp7cpAP+KDHp0yrwbCswViWHb4JeKF/T4wF8dv9jzt2LLAgGF1WwFNr/nnn
         8byd16qTfKqb8PuV9UkT1ZSpGpGHeSMwmrg+ubCxojnB9VTTOX40gu5JnT+zNR33w24F
         UB3cbucXJzAWPK9jg0Atnl/hSXup/9IRPJmsdChasICNWhG9OHuSWQibEp613KtvC4U/
         GsMw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789076687; x=1789681487; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2oHREbZFfJzROdF57Zw38K17OM0EdKrFuoP/JAK0BOU=;
        b=h5Xxk7dI6y++Eb+YNYLIt2o/3xCUPbA1k7u+6qTOrM8mMSqynPPnGiicrvuMM95tZF
         K6oNRVDpDjcGanZmnctxvnDBpXaqU3gq/ZZ5CGew4VmEy2BIYSpOTG8t80nSq01ROW26
         QUaXpggRUtyv7alUtNZl5dMVGOq91pA3mdexsldi0qs3/FdD9olrxWOdYGTyb3Vy1yaQ
         /8fA1EG9TFvOFuOhIb0IjE34YP06fkJSUauL3kxCKV/518cR1Xoh8HPy2uqxNoMPhcXH
         SoaF+HqZ4OH+Slr772e2vMPArlqRpxgxNh+M3ovkP7M8972YZUj/fr/+DwgvFnJCagdM
         x1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789076687; x=1789681487;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2oHREbZFfJzROdF57Zw38K17OM0EdKrFuoP/JAK0BOU=;
        b=drb4KE/hnPs/VI4SDPkoGKBsy93wufKGYFsZhyjPTXt1SknbcH+dIxnTH/E7y5BIpc
         Kgx2Z7bgpArRJWYgq1bxqe8x4RhrTE9hPEfo+zjCXmACiTc/JX3mCGrSCSVFF10mHTVi
         M7fvEwlGJoh84y5aSUoUos4uo/TQMee4Yp8F+AbVmwShTZVcZWvDTxYOK1CY+7JwFKos
         /O5Lg2sd9m5s7c4ZsPTYopHxaYYXSUW1I8V8xFBP/vhf4eFs5NY62b9g2+rW+uyFBcan
         7/7X2UFiUJe5oOK7NSguRTbPl+A4JasqbK6zmerBx29YZU1PiRF7tak1YmtuQ4BvEYcR
         KRQg==
X-Gm-Message-State: AFuF++m2gYBUKzeA6rAnk09TAPAgkvwa1hCxymxDOlBpH1vdlouw/ORD
	pOC55M0cV+32fkuGU63ARSp28aR+hhpupuuLgiIWisslvgycpmDWyzTVz4cmZjvT1F5+Q/X0MX/
	7Q2L/5dtXmOqshhG8mBckB7g8PaQfUjw=
X-Gm-Gg: AYBFou1tETN3aRj8lVjNdEczDf/i6RKMwXhdXvqyMdqjHyrY3vHZvYMh1z4SmLvI/Al
	FTxyVGxcP5mxfACMQM83/SpJfbj0nA134kO2iXW2qLqBj96XrLXSRtjyKKqnG6oZuhSgPVQEbRz
	6f6bu0RP4OaqLdoaVXZrkltpSBuBcZRBvIOct0Fa5Uno90wGhdtrbza/c4KiOCbWCknntdeeiDJ
	pA9O/K8HsajPcL6NoLnguliHw75+LEXDuZqT1KCY7Rs2LK78TbnwPyG8PgrG2TloPU8yMEkjKCC
	5ZBUOOvm0/H9WxRzIOap93acV/Kt35+g7/cuYjtKtAEwgjfXoGx4ee1yywlJk8pYYA02bw==
X-Received: by 2002:a05:690c:e249:20b0:884:c7fe:d26d with SMTP id
 00721157ae682-884c7fed397mr4079417b3.9.1789076687349; Thu, 10 Sep 2026
 14:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <ED0527D7-E28C-432C-99E2-D8AF19330D85@gmail.com>
In-Reply-To: <ED0527D7-E28C-432C-99E2-D8AF19330D85@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 10 Sep 2026 15:44:36 -0600
X-Gm-Features: AcwNN1WZOK_UHSdLmMiku--XhJdEdYY7bvtdCstYwePBWEqC5tTUyu2JY7-mSUk
Message-ID: <CAJdd5GaqcWujQae-GXQpcgAGtosHe7_X0T+8LyOfrr8-mOgzLA@mail.gmail.com>
Subject: Re: [OE-core] [BUG][scarthgap] SPDX 3.0: NameError when
 SPDX_CUSTOM_ANNOTATION_VARS is set
To: emzei.j@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006cedcc065b27e0f5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 21:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245604

--0000000000006cedcc065b27e0f5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 7:07=E2=80=AFAM =EC=A0=84=EB=AF=BC=EC=A7=80 via lis=
ts.openembedded.org <emzei.j=3D
gmail.com@lists.openembedded.org> wrote:

>
>
> Hello,
>
> While investigating SPDX 3.0 annotation generation on the scarthgap
> branch, I noticed a difference between scarthgap and master in how
> SPDX_CUSTOM_ANNOTATION_VARS is handled in spdx30_tasks.py.
>
> In scarthgap (meta/lib/oe/spdx30_tasks.py, around line 520):
>
> new_annotation(
>     d,
>     build_objset,
>     build,
>     "%s=3D%s" % (var, d.getVar(var)),
>     oe.spdx30.AnnotationType.other,
> )
>
> In master (meta/lib/oe/spdx30_tasks.py, around line 549):
>
> objset.new_annotation(
>     build,
>     "%s=3D%s" % (var, d.getVar(var)),
>     oe.spdx30.AnnotationType.other,
> )
>
> When SPDX_CUSTOM_ANNOTATION_VARS is set on scarthgap, do_create_spdx
> fails with:
>
> Exception: NameError: name 'new_annotation' is not defined
>
> The failure occurs at meta/lib/oe/spdx30_tasks.py:520 while processing
> SPDX_CUSTOM_ANNOTATION_VARS.
>
> I could not determine whether this difference is intentional or whether
> the corresponding fix was missed when changes were backported to scarthga=
p.
>

It was unintentional. The correct fix is to backport:

 52ab3b640c ("spdx30_tasks: Fix SPDX_CUSTOM_ANNOTATION_VARS implementation"=
)

to scarthgap. It probably happened because the ordering of the backport to
scarthgap and the bug fix caused it to be missed, but I did not verify that=
.



>
> Would it be appropriate to backport the master implementation to scarthga=
p?
>
> Thanks,
> Minji Jeon
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#245564):
> https://lists.openembedded.org/g/openembedded-core/message/245564
> Mute This Topic: https://lists.openembedded.org/mt/121179868/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> JPEWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000006cedcc065b27e0f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 10,=
 2026 at 7:07=E2=80=AFAM =EC=A0=84=EB=AF=BC=EC=A7=80 via <a href=3D"http://=
lists.openembedded.org">lists.openembedded.org</a> &lt;emzei.j=3D<a href=3D=
"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
br>
<br>
Hello,<br>
<br>
While investigating SPDX 3.0 annotation generation on the scarthgap<br>
branch, I noticed a difference between scarthgap and master in how<br>
SPDX_CUSTOM_ANNOTATION_VARS is handled in spdx30_tasks.py.<br>
<br>
In scarthgap (meta/lib/oe/spdx30_tasks.py, around line 520):<br>
<br>
new_annotation(<br>
=C2=A0 =C2=A0 d,<br>
=C2=A0 =C2=A0 build_objset,<br>
=C2=A0 =C2=A0 build,<br>
=C2=A0 =C2=A0 &quot;%s=3D%s&quot; % (var, d.getVar(var)),<br>
=C2=A0 =C2=A0 oe.spdx30.AnnotationType.other,<br>
)<br>
<br>
In master (meta/lib/oe/spdx30_tasks.py, around line 549):<br>
<br>
objset.new_annotation(<br>
=C2=A0 =C2=A0 build,<br>
=C2=A0 =C2=A0 &quot;%s=3D%s&quot; % (var, d.getVar(var)),<br>
=C2=A0 =C2=A0 oe.spdx30.AnnotationType.other,<br>
)<br>
<br>
When SPDX_CUSTOM_ANNOTATION_VARS is set on scarthgap, do_create_spdx<br>
fails with:<br>
<br>
Exception: NameError: name &#39;new_annotation&#39; is not defined<br>
<br>
The failure occurs at meta/lib/oe/spdx30_tasks.py:520 while processing SPDX=
_CUSTOM_ANNOTATION_VARS.<br>
<br>
I could not determine whether this difference is intentional or whether the=
 corresponding fix was missed when changes were backported to scarthgap.<br=
></blockquote><div><br></div><div>It was unintentional. The correct fix is =
to backport:=C2=A0</div><div><br></div><div>=C2=A052ab3b640c (&quot;spdx30_=
tasks: Fix SPDX_CUSTOM_ANNOTATION_VARS implementation&quot;)</div><div><br>=
</div><div>to scarthgap. It probably happened because the ordering of the b=
ackport to scarthgap=C2=A0and the bug fix caused it to be missed, but I did=
 not verify that.</div><div><br></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
Would it be appropriate to backport the master implementation to scarthgap?=
<br>
<br>
Thanks,<br>
Minji Jeon<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#245564): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/245564" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/245564</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121179868/361=
6693" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121179868/3616693</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:JPEWhacker@gmail.com" targ=
et=3D"_blank">JPEWhacker@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000006cedcc065b27e0f5--

