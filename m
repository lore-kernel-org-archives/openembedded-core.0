Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E80B5EF4ECF
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 11:44:55 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53180.1775475893552021383
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 04:44:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=T89CABGL;
 spf=pass (domain: mvista.com, ip: 209.85.208.45, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-66e6d9610d8so3003070a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 04:44:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775475892; cv=none;
        d=google.com; s=arc-20240605;
        b=NljujbvKXQIiMbwIHNVT4e0OwdGfbVbP3ErKReJjYjhhBSaWR7tdIuKgItyoe9fakT
         XjzZG4bEz+jcQchdOQo/fMonq9ejGNRcJBRODCgBrcx0KUn/cXdBxMAIj/kp4WeBlyQr
         BhlEp6lkrmoRMpPO4S6HhZRHiJriP2p6mK2t08oj/sO8ZxM3NokVKxsKdxacfe9E9TP0
         F6dc4+GdMZJeCrAHLuZ8+rB0lChrOoOCkOQPIfIvvKgHlBBWfVIk6yZMIzBc6u/C8m1x
         pr33TvrbycoLqPYCWiadr8o8R0Q3SDesmbHLcVpZ5r83jGC0fI0Tpk7TjOa4YdGYlxmi
         DPtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sehqNK1rrXPZ6qeFr2aUflu9yI7IsCOKnelgRJBhKDY=;
        fh=Jrj1d8HaAYiMv7gmAPIBI0wt/PuN9yPqoLbsTghdTNg=;
        b=C0/hJaY62Asjd+5MG8TDv3wVrASD6gbdTD6GwgFO5Q7eLXGPQiyAhieOpdSqTAWZw0
         T7l4RQtgZEIIbbsyg8BHFHo+yeDlT6KxlCkuMhrUw4U2dqMt4xx+FL6OWQG4NfmO/Zum
         OZqFOOqK904H3LK8txLa8AAKytlSLiJlg72L7HBUyqljEkDlRIpZ4fHSLT7WcCJ6SPuS
         PEfnuWh6CbboGAqHsY0zwZ8a9BgoeizVnf7Z56Th0/CfzVPlSQgfBs2KdC2o2PZP7EHh
         nXkNBg+nAgvv43etaYcF7a7/j9m0s5cv0t0zReJhiQ+H9mbL8APE/WNjOO3T+YQ7Buq8
         7wKw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775475892; x=1776080692; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sehqNK1rrXPZ6qeFr2aUflu9yI7IsCOKnelgRJBhKDY=;
        b=T89CABGLQ5EQ+2qMVRDH5/5muZgrn2AeY0+bZMbWXYy96vorHOWmbk/bc8OXYAmYBr
         NbKWZMe3V2buqfpCjwJV9j1kroVbmY0WrJlJXbKlbON4I9h4yIogHc/mCXzTJOsmWZMe
         M5nSq2ptiBfuRHOws60+b/jwo16PUqAZh4rK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775475892; x=1776080692;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sehqNK1rrXPZ6qeFr2aUflu9yI7IsCOKnelgRJBhKDY=;
        b=bbZ8E0mHVkM4Yv524VqM5PJUt5/wac0Nodlk1r6x8Qkd9ZFDbMoUMOENawHOvsoQrP
         gZ4T2DxPsv1v+yErVebChcpr2fIyHCvtlkso87txVAcUDCjzUelloMgyKpir/ceLiZFj
         4gcN1KOzLyjcyZimmjw8Q5JbTC8HhEOKZynL+uXf2N8TMlngZVILcTyxw5XvsizHeyyx
         YHBcEQNZuvH2pPOii9w244PAmrbEBlwrDy5jakFxP/hxHdupzSkSKcJqoVgEq6Tx7HI6
         7dXAAkE7+hqbMuaV1BhPoycmhSm/l3wn5B0idqkpcTR0+fGkhj18TA8vgA8chGTohWrR
         yHVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/01+k1gwA1PnLo57FW4vTtLoJ5w92NcPFafO6t0txldRiVYSNZWWDBsxmxyfU68hHV9yZaPerawJ2o9C5eYfWBw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyCXE2+/9IFLT6zkbkfEQXZg34eD6LkK452J33MevUhiedRO/co
	c+23U5HDfPpqz1OI9456jqrrQy6y736DfV61k7i8HIrORMLL0pUdfJMqYpQHV9cbZJ3/h9jOWEW
	MAmyRkLyCj0SswVm8JfGtHo3ogU0utCyOl1v41wV7iQ==
X-Gm-Gg: AeBDietjMZ1CSGscAnBYNbmJlIQCt4u33KHBv5idD4BlHJyORnjjRWpF/tShxDEKFu3
	yhlP1tsELzRFQ8Y9JcyhS/z5zN5xv03wPAu0UYExhFzpEEYnw0mT5AGi6RjPyPkqwJmXLd2AMst
	0vh+28h76HV/JJeXL0J/Ki8VEOYiRH7sNYVMWmJxFp2jiKWTzNEQ5jPzD9jbcJz9AG24frJVM9q
	OLbCfVxzCodk/5adtTl2ngKbwAj03SU1cesWZ2u3/YyypARym+c8eNpKM0PBIht/VyPtiFDkDzA
	HomfJ5/b+bIh58JS1G+CNmIY9jKiMi2tCfh4+3A6qA==
X-Received: by 2002:a05:6402:5190:b0:66e:e024:1a08 with SMTP id
 4fb4d7f45d1cf-66ee0241bc6mr1624646a12.24.1775475891737; Mon, 06 Apr 2026
 04:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1775435063.git.yoann.congal@smile.fr> <c19d97a63c2b9b145a0370a961cbfef90b450010.1775435063.git.yoann.congal@smile.fr>
 <053f62bc5f48a7ef16d955982e64adecf35714be.camel@pbarker.dev>
In-Reply-To: <053f62bc5f48a7ef16d955982e64adecf35714be.camel@pbarker.dev>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Mon, 6 Apr 2026 17:14:40 +0530
X-Gm-Features: AQROBzBbhwCrbHxym_tHC3t_mWpr6fYlCOnvl4vxuZNng-d14egLX_kpoOQ2GcQ
Message-ID: <CANQUz191KfwSFA_n3MP=Xt7KC6ddAvvKkJGKOwCmMBPtUi_5TA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 08/18] python3: Fix CVE-2025-15282
To: paul@pbarker.dev
Cc: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d5a304064ec9313b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 11:44:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234673

--000000000000d5a304064ec9313b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 2:39=E2=80=AFPM Paul Barker via lists.openembedded.o=
rg <paul=3D
pbarker.dev@lists.openembedded.org> wrote:

> On Mon, 2026-04-06 at 08:26 +0200, Yoann Congal via
> lists.openembedded.org wrote:
> > From: Vijay Anusuri <vanusuri@mvista.com>
> >
> > Pick patch from 3.10 branch
> >
> > [1] https://nvd.nist.gov/vuln/detail/CVE-2025-15282
> > [2] https://security-tracker.debian.org/tracker/CVE-2025-15282
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>
> The fix for this issue (referred to as gh-143925 upstream) looks to be
> part of Python 3.10.20 [1]. Should we take a final Python stable update
> instead of this patch?
>
> [1]: https://www.python.org/downloads/release/python-31020/
>
>
--> Along with this CVE, Python 3.10.20 includes multiple security bug
fixes. I think it's good to go with Python stable update to 3.10.20 .

> Best regards,
>
> --
> Paul Barker
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#234671):
> https://lists.openembedded.org/g/openembedded-core/message/234671
> Mute This Topic: https://lists.openembedded.org/mt/118686707/7301997
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
> Hi Yoann,
>
> Can i send upgrade patch on top of this commit ?
>
> Thanks & Regards,
> Vijay

--000000000000d5a304064ec9313b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 6, =
2026 at 2:39=E2=80=AFPM Paul Barker via <a href=3D"http://lists.openembedde=
d.org">lists.openembedded.org</a> &lt;paul=3D<a href=3D"mailto:pbarker.dev@=
lists.openembedded.org">pbarker.dev@lists.openembedded.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 2026-04-0=
6 at 08:26 +0200, Yoann Congal via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=
=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; <br>
&gt; Pick patch from 3.10 branch<br>
&gt; <br>
&gt; [1] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2025-15282" rel=3D=
"noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2025-15=
282</a><br>
&gt; [2] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2025-15=
282" rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.o=
rg/tracker/CVE-2025-15282</a><br>
&gt; <br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.f=
r" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
<br>
The fix for this issue (referred to as gh-143925 upstream) looks to be<br>
part of Python 3.10.20 [1]. Should we take a final Python stable update<br>
instead of this patch?<br>
<br>
[1]: <a href=3D"https://www.python.org/downloads/release/python-31020/" rel=
=3D"noreferrer" target=3D"_blank">https://www.python.org/downloads/release/=
python-31020/</a><br>
<br></blockquote><div><br></div><div>--&gt; Along with this CVE, Python 3.1=
0.20 includes multiple security bug fixes. I think it&#39;s good to go with=
 Python stable update to 3.10.20 . <br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div><div><div><div>
Best regards,<br>
<br>
-- <br>
Paul Barker<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#234671): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/234671" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/234671</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118686707/730=
1997" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118686707/7301997</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:vanusuri@mvista.com" targe=
t=3D"_blank">vanusuri@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br><br></div>Hi Yoann,<br><br></div>Can i send upgrade patch on top of thi=
s commit ?<br><br></div>Thanks &amp; Regards,<br></div>Vijay</blockquote></=
div></div>

--000000000000d5a304064ec9313b--

