Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D42CA5FA5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 14:56:26 +0000 (UTC)
Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.151.1790693781515638768
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 07:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LVlcSj2e;
 spf=pass (domain: gmail.com, ip: 74.125.224.168, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f40.google.com with SMTP id 00721157ae682-8ab42612328so8691247b3.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 07:56:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790693780; cv=none;
        d=google.com; s=arc-20260327;
        b=Zzk6sU+L0FSSb4kHf6ZylPsAN5Rs1FPCtcg6iJSFkvXn9+JI5waWK260j59g+xZimL
         TWRQGV8Y0o1wFSO3fE0C1YhO1l6rw5Wom676MBSHznhBBi2wK84glXsaFhFCkM3IT8jh
         J284HEGRNYp3RZhtPoKzGnRxg7NT40HEh523oZxD7Rr5ImBcZ8hlMiJk4C/7g4DQgMu2
         uuRB4msQImx2Q5AsLwpMwsvzy41meM5tQtRFcj+LK6escOa5a61RbfmgEm0pjwgvBq7O
         yxT32GdFiE75SgEVYpOgUxEvqTwHD9r788esGvCp6s+Q9xL8/CUFV0Q6IRGFQJEAs/OS
         A4dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4v10AYsm7DtXYQGHUlpjnuD6yrtlwnosqsegRmuuRiA=;
        fh=ig4xhMe1T720+ZSytTGL8TmqfXli5V4jkp4Q+xSry9Y=;
        b=YsdMV3JhI1lHe6SUgVPyOVYCx9LiqY1xKJMnHjo6GRfQOjWcDolF4p9Yy52czR7IP4
         PTtuWjPpSRacRSmi+GNCtJszEWe4VEqs/0ERRTbu6+DxjG9rq8P0vFabBowI83jEhfJk
         RYML6C4gSX0zRnB/C5f93lSQOe55ftfSbETDIe0DO7wdxHfWpJ8uMwvV9+gndocOguzB
         EJWNkiiigBopSTpZYaMy/lNLTxcDMVxsEvaWMCY9KsS8TnEaSsoW7XzceCH0QUi3j2WW
         vfKOtMT5WTknuhV/ogYISEsX/C0xqTUY878Pguk59RP4wbuBKJWzxsUYTKaapul6NurD
         y98A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790693780; x=1791298580; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4v10AYsm7DtXYQGHUlpjnuD6yrtlwnosqsegRmuuRiA=;
        b=LVlcSj2erBBZgGXFVED6MihV9qDAVEIbCXodjTvgRySWWBqsvIezRPyQGabhjOQyxK
         P5N3KY5yUcPF/DQvezzj12L5PI27NjuE6SkmX65oYGV1RuUaAtgxmBxpLPdR7j+MdhXh
         wJ+yWXBwluwlaZZd5sf4skGSM82vv2b7SbxKByDRrsLKlhvt5eu6WM8lKPFtwMSLdAQI
         nE+hJv3OlDgPvdP3gMyTXbHI8varhgjJfgQ/OuNwdG62tshxHnT7RaPUlpl3NtIf2OBM
         A/7i+dz6mJGkx7en9Ssg6Vm9/q3lTOgzvSV87uBH0X/qbh8Lm7Xs+xoxejNNmMnHQOIB
         5JlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790693780; x=1791298580;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4v10AYsm7DtXYQGHUlpjnuD6yrtlwnosqsegRmuuRiA=;
        b=k8S351sTYmCHKh+LHr9pkGVYgWF2XidI2JYfOsgGWoFWup3vyjWUzelWIlNzxui6zz
         Lirhu9YpHxaZ0acDBmHJvEyh9v1M9ENV9xZ1pe6+arHm3IyArpCjig269TeVZ/z2joe9
         gX8oLyTWD+Sv6xNWTseqf5jPY3X5/DZBkAveQlYsXtidd5z79Dr1KclPMwKZDIz7vy4d
         CRQ5YXsccw+jKOgilmCLUV+KEBUoGrzxykt4MQB88x4TPzpU3y/90b9PwRqiTBqvGJa7
         vObyy/LW+HPFSfhuQ3GvIG2HdArLsGy1IeLNJfpBdY1qUzZFOUtyitQ55r3/cGwwcW/t
         Zl0w==
X-Forwarded-Encrypted: i=1; AKwUvBz0o+rwPy76tHMarqenFDRN5nclrxWGi8ouoGSRH3qdba3BPiFxCQyZmm0Lq+kBgc9wVD/PWe0pSkCo7E7UR8P/BA==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJouLCrwR4s6X3yP4GDbb94PEaOdCLYSsWEbCZyJWinwC/gVlMd
	Qvwi8thkr/53CdUK8i4u3RMW+o00QRLwpOAfacQGOK0bDSZN1rSDvOEoWZdcsV7NnREU5ws/Xpa
	UMBX9M1EMFq+5e2MMufRS+vhIG5r/GnU=
X-Gm-Gg: AYBFou3oKULEbxlcVr/EYqDPh+vL2VXg7zyz6wtvfFvOVNHN9zSpRxLq58gf4YbCsPl
	ZTlTQAVWDDW8L6qJ/oahwXb4gF/lPz5vR5CJHPl9HajysXS6U5Dm+01aHwt+g5JVSt/gCxE4RZ+
	E4JzNbrCP6csy1KSjQxw8M1pN/z9cxKDnkl+ZOZzBrrWMYH1IA/3hkKgt3cX6RWctsoMA+v9JmN
	T/W+bW1dRcFs19qnrQ5Rjdtuc01VxxKM4exmLZ4/1cNUmQLtAVsRmGCkUhsPPHPbieqq64myrHf
	ZQnNAVgIiruvFdeMQf/LBFIny7qfBBOYQ18vdmcWJhLmkkjBOjd9UlTqdCNlRlscRwNJi6O9cqA
	EscMSzwwO0bVoLnKYRGu8yCmEkPl+qEt7RpapOj8F2Hw7U9W0fWStH+vTtZO863Ibb7+bE+fvXp
	VmDD2T19NNQYZ/QXJW3pSSG0UymMUmA2FN+cRvbhxpCl/r3cc9pvxmOQnTdvBNuWriQKeyGhxwy
	FsHoOPstZtmk+ECvv1TRGdOaFp6LEkwKQczfPI01i0TxmY4BSq7EoydHlJsXhwGAUP6cZLzoSS0
	XFtAjmM3XWh/47isgkQULsXriB2AygntVoa3vG4=
X-Received: by 2002:a05:690c:288:b0:8a6:d7f9:5e03 with SMTP id
 00721157ae682-8a6d7f9632fmr58851247b3.47.1790693780293; Tue, 29 Sep 2026
 07:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260921104520.47933-1-jaipaul.cheernam@est.tech>
 <20260921210644.85026-1-jaipaul.cheernam@est.tech> <20260921210644.85026-3-jaipaul.cheernam@est.tech>
 <6A31FAEC-BA42-4AB0-9778-045997B55EC3@arm.com>
In-Reply-To: <6A31FAEC-BA42-4AB0-9778-045997B55EC3@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Sep 2026 07:55:52 -0700
X-Gm-Features: AclHuK-2p9ftHbFms7BU-uYgJ1zMGoavelq8blOMsYHvC78bWc7_RvX3D6gjmrs
Message-ID: <CAMKF1spFtMd9AyW2X=F-+HvgQ_=SvxG1y61_A1zPUhMB24Et5g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/3] systemd: dlopen-deps: only warn for
 missing required providers
To: ross.burton@arm.com
Cc: "jaipaul.cheernam@est.tech" <jaipaul.cheernam@est.tech>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ad1918065ca06209"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 14:56:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246873

--000000000000ad1918065ca06209
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 3:59=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> On 21 Sep 2026, at 22:06, Jaipaul Cheernam via lists.openembedded.org
> <jaipaul.cheernam=3Dest.tech@lists.openembedded.org> wrote:
> >
> > Optional recommended/suggested dlopen deps often have no provider, so
> musl
> > builds print warnings like:
> >
> >  WARNING: cannot find any provider for dlopen dependency: libintl.so.8
> >
> > Only warn for required deps, note the rest.
>
> If optional dependencies no longer cause a warning then we=E2=80=99d neve=
r know
> that we should be either explicitly disabling them, or adding build
> dependencies.
>
> The actual problem here is that systemd dlopen=E2=80=99s libintl, and und=
er musl
> that doesn=E2=80=99t exist.  Luckily, this has been fixed upstream:
>
>
> https://github.com/systemd/systemd/commit/25714364a981e8e0ca3ac44ff09819a=
22a46b442
>
> It=E2=80=99s late to backport this for blacksail, but the 262 release inc=
ludes
> this change.
>

I guess you mean its late for first release of blacksail but I assume its
ok to backport it to point releases later.


>
> Ross
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#246579):
> https://lists.openembedded.org/g/openembedded-core/message/246579
> Mute This Topic: https://lists.openembedded.org/mt/121364963/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ad1918065ca06209
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 24,=
 2026 at 3:59=E2=80=AFAM Ross Burton via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;ross.burton=3D<a href=3D"mailto:arm.=
com@lists.openembedded.org">arm.com@lists.openembedded.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 21 Sep 2026, a=
t 22:06, Jaipaul Cheernam via <a href=3D"http://lists.openembedded.org" rel=
=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> &lt;jaipaul.ch=
eernam=3D<a href=3D"mailto:est.tech@lists.openembedded.org" target=3D"_blan=
k">est.tech@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; Optional recommended/suggested dlopen deps often have no provider, so =
musl<br>
&gt; builds print warnings like:<br>
&gt; <br>
&gt;=C2=A0 WARNING: cannot find any provider for dlopen dependency: libintl=
.so.8<br>
&gt; <br>
&gt; Only warn for required deps, note the rest.<br>
<br>
If optional dependencies no longer cause a warning then we=E2=80=99d never =
know that we should be either explicitly disabling them, or adding build de=
pendencies.<br>
<br>
The actual problem here is that systemd dlopen=E2=80=99s libintl, and under=
 musl that doesn=E2=80=99t exist.=C2=A0 Luckily, this has been fixed upstre=
am:<br>
<br>
<a href=3D"https://github.com/systemd/systemd/commit/25714364a981e8e0ca3ac4=
4ff09819a22a46b442" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/systemd/systemd/commit/25714364a981e8e0ca3ac44ff09819a22a46b442</a><br>
<br>
It=E2=80=99s late to backport this for blacksail, but the 262 release inclu=
des this change.<br></blockquote><div><br></div><div>I guess you mean its l=
ate for first release of blacksail but I assume its ok to backport it to po=
int releases later.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
Ross<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#246579): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/246579" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/246579</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121364963/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121364963/1997914</a><br>
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

--000000000000ad1918065ca06209--

