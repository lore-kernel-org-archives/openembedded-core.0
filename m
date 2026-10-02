Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF375CA5FC4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 09:35:43 +0000 (UTC)
Received: from mail-qk2-f39.google.com (mail-qk2-f39.google.com [74.125.230.231])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7478.1790933730985267067
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 02:35:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qQlKocPC;
 spf=pass (domain: gmail.com, ip: 74.125.230.231, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk2-f39.google.com with SMTP id d75a77b69052e-5338b9a146dso13048481cf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 02:35:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790933730; cv=none;
        d=google.com; s=arc-20260327;
        b=RhAIcEOHoKUOCfArYjYjKHawZowepVd47GrSMEyHEamft2OIxnAJXIjVOjVF7zg5nR
         88/b7WICQQCXcpJkprubfLOU5eehxa4BTM/jwInHVYUKKSCDfBfwpJo+9pE9jhdX6m4E
         zbulgHQZXumwoZwtTEBsXBWAQRCR5Lei49PM0S1ckupV4KFiaV/8MVUonYhcTudFk0pQ
         3jTOiGud+4XUdkrmSmC9TmY+gH4bakIsWL/z0TFI6uGwK+0vFl0NWqs4/3PL3avwaCkX
         nC7or/rMjBAV8DxfzsVVTWFv5CM6iqBTFmb+JGYVMTgLAtX/gXOhjC62zU5z1NHn8ZXc
         diRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x+2DK2UHMBGtLn1OgOnmeM45p74YQqlaq+cwqLXNY5E=;
        fh=CaKl3nTvzE2YIuFRnqq40iBFgIGpQ3v+g5GjbTQPVfs=;
        b=XQvoBE1oM/Pf7L6V5WsID4BSC7i8xSiDq+2w6APvS1oIJHckmG8buKYV/zIDXYtE/j
         z1015zUoTr2nFzdMD2oRLS6rbJMgruHGwC8xdb5OsIlBcgtAW1djTsqhbVun0Y6CpHzj
         mw4KteY+aKSdMt+3WOl0mywMniws3uO3ke+gE8MqhKALz8NG616p+qvr1cWKSCzagqDJ
         YXJNtcxv6n7vzc8BJmzZN6b5XqZOFwjadsWkQP7W8L0HifDm3Sd6N1JJkOW02nlbmkJQ
         RFcO/tSVZHIINeB3SnMociRq6OXm6fA7bWJMybC+3psjelO12QJqCa5CtzKrHhA0EDT7
         BhDA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790933730; x=1791538530; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x+2DK2UHMBGtLn1OgOnmeM45p74YQqlaq+cwqLXNY5E=;
        b=qQlKocPCWn4YO2FAT3APLi3d5Bw0IgZuPTE6UO/42ow5GVP8BGURfJizDAOMQn3TVS
         AjgAmlMHqAtvM8qKuqwq00ehqQwaTW2gv2uVSUsGTXo5u6A2JtM0UGe8ykTIxiwFBaQs
         iHF9kjD17eglDb129oQiqnrPvXM+vpnk4l+kUqTUhx6yty6I36q0rhZMrU5ev9n5mrrO
         YxJtiO0yQnlWhsG91yYw+66BdJgALqCt4AH/klWxTbidwb1d55rVJSoV5eVzY3v/eTWS
         yoymtKpgTcKIy9FLjBeIr8LZTXbfRVPIYR0zZAySYgLYhlbiPrcmuP/nlSNCAsaXI1qe
         Oayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790933730; x=1791538530;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x+2DK2UHMBGtLn1OgOnmeM45p74YQqlaq+cwqLXNY5E=;
        b=eSVromIUAByUODA5sEYhgbtiivNYOS7LuYMmJxE6aNeHd+2PvcWNk0mjHVNvxkf9zg
         kaHRYQMgyeh7fZpC3bS+i1eZCPqDLySlDA7rOQUSaetDVYhwPuI1T9ydMTiyH55txjH9
         ciGTK+IxZX6qQs0BfPbmaKn089EGlq1Fis28f9aLWHnKWJr0W5mmWimzwjU0Pqw6kpiA
         ptXzes8TMR3GUYEwLXLw1lKD8f1NFEeahnrNNBp6eIKfL14RO5EsY3jAT7B4EZW/QRVN
         G8vKHxg9Rz/PR6COkXoqEYIg7HqhIiu4bXHKS0MFZgDYcwUzzM7CB+Z7wWS4ieEGKO8N
         JOMw==
X-Forwarded-Encrypted: i=1; AKwUvBxJFpA9yf1vTQOeRjs+tOqsmLrnp7neEePv3kOsZw/nOLi6ouR/ftYePuPzr1GwKu6RyP0TPH2LUdbGts0zTMaY3g==@lists.openembedded.org
X-Gm-Message-State: AFuF++nXN+qYtOZdyRvNuAmPLcuIY3Z0eHoMkPAoWnwHVbDlLDV+uc5X
	mkxZdos49l6NigNdRvD5F9r2BDiT1aLoKZfjp+ZwRP92IE1GeUIbIyZxZdjPXvNruGJphU4duZv
	frubrUXkzyNn7ifbaYtiRukcVfb/GSmg=
X-Gm-Gg: AYBFou3XkE0eqkFFw747XjnyJuz+AUgJK6o0nZWKk4irWH5cWcDI2e0wCtmgrSMSqVv
	fa4rNDQUAHvShLtzhjkKpYDfUw92PU5DNql4gTdKTeGCjdfxFlFbTAPYCehRtBQvU1V7rJ51Gta
	cvuc+dB2bac3kQ031ydL0//iRRwzvbLxDBJ9kQjaPOjzAxMdUGZagHR2nyi5KF8g/GtFROpwIRw
	3t+6Qk4vi04F9ogxW2yqMs4PWIM/gZjFvdhiXUHE69AtGlMoRjLRBUthaioseO5vvrTk9CaGc/Y
	6FDwOa7H963d+RvjWaSE3ljpEQx62S5d5LrhG+j/AEmSnSl84+9skjamvEPYYilhJwMJ4bGC5PQ
	0pZY1qCOL6qJfV4WZ8XWf0Fk8
X-Received: by 2002:a05:622a:1211:b0:530:f729:d7af with SMTP id
 d75a77b69052e-533d989f344mr31717371cf.54.1790933729789; Fri, 02 Oct 2026
 02:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <20261002071557.74249-1-jaipaul.cheernam@est.tech>
 <20261002071557.74249-2-jaipaul.cheernam@est.tech> <DLU83IUWHFP0.2IU6H1IY0JSAW@bootlin.com>
In-Reply-To: <DLU83IUWHFP0.2IU6H1IY0JSAW@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 2 Oct 2026 11:35:18 +0200
X-Gm-Features: AclHuK_49rkVt_rAdIwTxAFW4grQhEyVBt7R3q_BdAbU3EMYI7vHCzQ_PKDT_QA
Message-ID: <CANNYZj-gd90Ls3UOXrQsSmfmNqiJXRunO2xC1btwpDSAUxCHrw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] libjitterentropy: upgrade 3.6.3 -> 3.7.0
To: mathieu.dubois-briand@bootlin.com
Cc: Jaipaul Cheernam <jaipaul.cheernam@est.tech>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c7c9da065cd84065"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 09:35:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247095

--000000000000c7c9da065cd84065
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Oct 2026 at 10:52, Mathieu Dubois-Briand via
lists.openembedded.org <mathieu.dubois-briand=
bootlin.com@lists.openembedded.org> wrote:

> On Fri Oct 2, 2026 at 9:15 AM CEST, Jaipaul Cheernam wrote:
> > Source: CHANGES.md
> >
> > 3.7.0
> >  * Add secure memory implementation for Linux and {Net,Open,Free}BSD,
> MacOS and Windows
> >  * Update supported CMake version to 3.10
> >  * doc: use Doxygen-style comments
> >  * NTG.1 compliance: Modify startup such that the memory access and
> SHA-3 loop are treated as independent noise sources which are sampled to
> collect at least 240 bits each before first block of random numbers is
> released
> >  * Remove all code when JENT_CONF_DISABLE_LOOP_SHUFFLE is unset. This
> code is already discouraged for a long time. Now it is taken out for good.
> >  * If cache size cannot be detected from base system (e.g.
> virtualization), use the requested memory size.
> >  * Change the stuck test to always calculate the absolute values of the
> 2nd and 3rd discrete derivation of time.
> >  * Replace SHA3-256 output generation with XDRBG-256
> >  * Prune the jitterentropy.h header file of internal definitions and
> delcarations which are moved to src/jitterentropy-internal.h. With that,
> jitterentropy.h only contains the API. This modification does not alter the
> Jitter RNG behavior at all.
> >  * Update secure storage memory implementation for libgcrypt and OpenSSL
> >  * Add API jent_status
> >
> > License-Update: copyright years updated.
> >
> > Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> > ---
>
> Hi Jaipaul,
>
> Thanks for the upgrade.
>
> It looks like this is breaking rng-tools:
>
> ERROR: lib32-rng-tools-6.17-r0 do_compile: oe_runmake failed
> ...
> | ../sources/rng-tools-6.17/rngd_jitter.c: In function 'rngd_notime_start':
> | ../sources/rng-tools-6.17/rngd_jitter.c:56:45: error: invalid use of
> undefined type 'struct jent_notime_ctx'
> |    56 |         ret =
> -pthread_attr_init(&thread_ctx->notime_pthread_attr);
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/4614
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/4816
>
> Can you have a look at the issue?
>

I think
https://github.com/smuellerDD/jitterentropy-library/commit/a038d0c372f83aba10f3850c5b122dc5ff8cdc8c
needs to be backported.

Alex

--000000000000c7c9da065cd84065
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, 2 Oct 2026 at 10:52, Mathieu Dubois-B=
riand via <a href=3D"http://lists.openembedded.org">lists.openembedded.org<=
/a> &lt;mathieu.dubois-briand=3D<a href=3D"mailto:bootlin.com@lists.openemb=
edded.org">bootlin.com@lists.openembedded.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">On Fri Oct 2, 2026 at 9:15 AM =
CEST, Jaipaul Cheernam wrote:<br>
&gt; Source: CHANGES.md<br>
&gt;<br>
&gt; 3.7.0<br>
&gt;=C2=A0 * Add secure memory implementation for Linux and {Net,Open,Free}=
BSD, MacOS and Windows<br>
&gt;=C2=A0 * Update supported CMake version to 3.10<br>
&gt;=C2=A0 * doc: use Doxygen-style comments<br>
&gt;=C2=A0 * NTG.1 compliance: Modify startup such that the memory access a=
nd SHA-3 loop are treated as independent noise sources which are sampled to=
 collect at least 240 bits each before first block of random numbers is rel=
eased<br>
&gt;=C2=A0 * Remove all code when JENT_CONF_DISABLE_LOOP_SHUFFLE is unset. =
This code is already discouraged for a long time. Now it is taken out for g=
ood.<br>
&gt;=C2=A0 * If cache size cannot be detected from base system (e.g. virtua=
lization), use the requested memory size.<br>
&gt;=C2=A0 * Change the stuck test to always calculate the absolute values =
of the 2nd and 3rd discrete derivation of time.<br>
&gt;=C2=A0 * Replace SHA3-256 output generation with XDRBG-256<br>
&gt;=C2=A0 * Prune the jitterentropy.h header file of internal definitions =
and delcarations which are moved to src/jitterentropy-internal.h. With that=
, jitterentropy.h only contains the API. This modification does not alter t=
he Jitter RNG behavior at all.<br>
&gt;=C2=A0 * Update secure storage memory implementation for libgcrypt and =
OpenSSL<br>
&gt;=C2=A0 * Add API jent_status<br>
&gt;<br>
&gt; License-Update: copyright years updated.<br>
&gt;<br>
&gt; Signed-off-by: Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;<br>
&gt; ---<br>
<br>
Hi Jaipaul,<br>
<br>
Thanks for the upgrade.<br>
<br>
It looks like this is breaking rng-tools:<br>
<br>
ERROR: lib32-rng-tools-6.17-r0 do_compile: oe_runmake failed<br>
...<br>
| ../sources/rng-tools-6.17/rngd_jitter.c: In function &#39;rngd_notime_sta=
rt&#39;:<br>
| ../sources/rng-tools-6.17/rngd_jitter.c:56:45: error: invalid use of unde=
fined type &#39;struct jent_notime_ctx&#39;<br>
|=C2=A0 =C2=A0 56 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -pthread_attr_=
init(&amp;thread_ctx-&gt;notime_pthread_attr);<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/buil=
ds/4614" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/17/builds/4614</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/build=
s/4816" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/3/builds/4816</a><br>
<br>
Can you have a look at the issue?<br></blockquote><div><br></div><div>I thi=
nk=C2=A0<a href=3D"https://github.com/smuellerDD/jitterentropy-library/comm=
it/a038d0c372f83aba10f3850c5b122dc5ff8cdc8c">https://github.com/smuellerDD/=
jitterentropy-library/commit/a038d0c372f83aba10f3850c5b122dc5ff8cdc8c</a> n=
eeds to be backported.</div><div><br></div><div>Alex=C2=A0</div></div></div=
>

--000000000000c7c9da065cd84065--

