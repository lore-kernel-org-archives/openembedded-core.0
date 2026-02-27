Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5AC81039892
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 20:06:44 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105393.1772222795861101661
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 12:06:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KqjymjV0;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: ticotimo@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-389e71756d8so35542161fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 12:06:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772222794; cv=none;
        d=google.com; s=arc-20240605;
        b=dOb2HEkShECnRW8mmvfX0F/6XianwyfCIAzQreKuzqr9eHj8tCZzHvO1soyMyXPgvE
         DnpOICxhVZ0SNhRwD4j/fbs+XccMlmN9XQu+EmchP7XEix1FYsuJSxOJw/66SBpTz6t8
         xIp02PO46PJ+YTRWTArq2mfWPzKHHoUyfRS40ZU1K9BO4iRVTO+oGEzomi8+48Z1Quar
         Q2nBmOzW2l+1d4JNFWDaupz+srRiHnsUcsxnn23QDaUC2llXdP9iZ0uYrX8T/8gWuX8b
         K+SEOwFTZT1RIJlzSFLinixEftzWalXX4oawXeZfRsXqgRuBCRFomptNBupTwJqBX/V7
         jAdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=maZ3i8+jANs16wwSW//AZ1EyKRiuvsJKW3DQ7DKGKL0=;
        fh=XLI8NW8LkHvxa++iYGSCEvttml4AfhAEGjK94zMd834=;
        b=jhUmS/5oCqDFBygE/y9Mbnrq2qp1c6Y6Fb84MNgL5pGLdi+dRSTDf+9fffcf1e9iXD
         l7Ln3/SlQQ96E/k5l39ABhwlT/MXpkcIhxUzkHW8g3YOuJwJpB5jpGSrV6hMw7Aler3c
         TSXOwGnZdSWC35Ibm9v4s2IXWr3mgAkmzG3gLOLppnBG+KNHHbZUS+X4u4sThVJ8JByV
         q1XTGpFQ8XPGcyl75BT7z3RVXsNzZjm7CowmC6GH43J8C74WyftYqns5lxKCtVlRgfFf
         KekmhvfWMGQZOegWfAKo/UK00cbsPZ+g2lh71Grke/zKwX+tIG40MtV6zG5NJmUxerur
         cpfQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772222794; x=1772827594; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=maZ3i8+jANs16wwSW//AZ1EyKRiuvsJKW3DQ7DKGKL0=;
        b=KqjymjV0Oc4wfuDkDaQoMi2P3xY7H9kxYVoh1GSEyMv593yPfIDima27gMEF+O//dI
         RrvaODcZxEnfMfVSCozk7z3B88ULGaJTmh7uDyb1WytAHwXFnBPzT9mWrU8ysrMq/ldA
         9mTGoJ+OrPFstwMUo454gsS1Ghotz1gbDY35uou/Qa+KLam3aehf/o8PWp5ZOujtKdsP
         6JCfMkNPfJvCXVOboYUaTIK/BOZcP+5VzP1DacwvGq4nzz6hWHLO5s/rx1dakdL4hAyt
         by7cPIpObl+VJQawzHlthZmh1kbfIlE1DKx9O0ED2mkrrjpPuJd7212fqSoTOSpA8KTm
         cDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772222794; x=1772827594;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maZ3i8+jANs16wwSW//AZ1EyKRiuvsJKW3DQ7DKGKL0=;
        b=d7nViRgYuygaobYoLHOhPUPVvLcZrzP+smPHZWwPoPbqG7/i+DWGKsbaH0apwypsPV
         GYXCsBXbsjNYvMI4tm1tHB2CLf2JscrKmDk/TZLnhv+TcJkIkcCqA+Zv3w++3CadON1m
         0rXIt3aexUEJJLTHx+SRzYrhtgCNRIeYFSHBpHkFehdZlylX4cY3UIYqtHPVFJPfYuTC
         JNchOeC6sXCjBU8P3cP5xGT/y9YsJaAPO5WSOjb0BVbhrUx9xuLZwgZ6FFS3DoPxbqWG
         HkL8oH9whdOrnIttB/CQ/kN7/AEULHAr+czNcwrc6sFKTc1OYhdy1pdBRp94rn6oREUe
         wXCg==
X-Gm-Message-State: AOJu0YzcUp9sDi1LZM8RQ2UO/1RYoRWUzgkDGEvHSD09lPwGY7XM9Eoi
	cJG5kTlv3nhfVQLelprHlSfkJACXyfA4qqnsbqJmZEDt+A6DZaO8T3ki8uCFJW4HDCslZLQN8Ai
	+AXt2tq0C1MqlU2NA/7ZvRmNNnrY6e5s=
X-Gm-Gg: ATEYQzwjESVgYFR7TPsjsxjc4kSFrCOtbLQ/wphJo4mpaoovpRmJRz/r5QFqG+PNTAY
	LCgIJfdgwaHWgZNNLP4Jw0xjdTzZt04MIfgRForX++LO4I+L6AX2nBvKe2NpQLHjppyzkt0E+CO
	3KYhxZHNtK+jFi4Fmkafd0yHW0WBdowhvOLU8huSYjNBn1mrRHfvLRqq+TPF/KWwiU/3XO5EMWa
	PfayZU8gU3EuqTovVEUUjA/bFy4CPe7xihyF+vo/ZeMAkFrxhm7D42gJEu7n4jkd+xHu+T27RrJ
	BlVVSHs=
X-Received: by 2002:a2e:a001:0:b0:389:fdfb:652 with SMTP id
 38308e7fff4ca-389ff1404camr17654631fa.18.1772222793600; Fri, 27 Feb 2026
 12:06:33 -0800 (PST)
MIME-Version: 1.0
References: <189831C5FB60E175.1454197@lists.openembedded.org>
In-Reply-To: <189831C5FB60E175.1454197@lists.openembedded.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 27 Feb 2026 12:06:21 -0800
X-Gm-Features: AaiRm53WuSkTbO0Vzjdp2clNP6D8BM5qwQcwIf95I-7dixku2eYC9dmJAJpMbq0
Message-ID: <CANx9H-BD-6ACjhjG=uzD-oYq5=kvHnAH+HVH=uj7QmV6HP1rZQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/3] Introduce PTEST_RUNNER_TIMEOUT variable
To: ticotimo@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001354d9064bd3c609"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 20:06:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232115

--0000000000001354d9064bd3c609
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Related yocto-docs submission:
https://lists.yoctoproject.org/g/docs/message/9014

On Fri, Feb 27, 2026 at 11:39=E2=80=AFAM Tim Orling via lists.openembedded.=
org
<ticotimo=3Dgmail.com@lists.openembedded.org> wrote:

> In https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16163 analysis sho=
wed
> that one of the root causes is the hard coded 450 second timeout passed t=
o
> ptest-runner in lib/oeqa/runtime/cases/ptest.py.
>
> This series introduces the PTEST_RUNNER_TIMEOUT variable, which is consum=
ed
> in lib/oeqa/runtime/cases/ptest.py but needs to be updated in
> testimage.bbclass
> to make sure the value of the variable is consumed at runtime.
>
> For python3-cffi which drove the change, the value is set in
> core-image-ptest.bb
> to 600 seconds, as an example of how a per recipe change can be enabled.
>
> The test run on the AutoBuilder cluster that proves this works is:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3136
>
> https://valkyrie.yocto.io/pub/non-release/20260227-113/testresults/qemuar=
m64-ptest/core-image-ptest-python3-cffi/
> where you can see:
> PATH=3D/usr/sbin:/sbin:/usr/bin:/bin; ptest-runner -t 600 -d "/usr/lib"
> in
> https://valkyrie.yocto.io/pub/non-release/20260227-113/testresults/qemuar=
m64-ptest/core-image-ptest-python3-cffi/log.do_testimage.2323256.2026022719=
1837
>
> [YOCTO #16163]
>
> Tim Orling (3):
>   oeqa/runtime/ptest: Make ptest-runner timeout configurable
>   core-image-ptest: add PTEST_RUNNER_TIMEOUT
>   testimage.bbclass: enable PTEST_RUNNER_TIMEOUT variable
>
>  meta/classes-recipe/testimage.bbclass        | 4 +++-
>  meta/lib/oeqa/runtime/cases/ptest.py         | 3 ++-
>  meta/recipes-core/images/core-image-ptest.bb | 1 +
>  3 files changed, 6 insertions(+), 2 deletions(-)
>
> --
> 2.50.1 (Apple Git-155)
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232111):
> https://lists.openembedded.org/g/openembedded-core/message/232111
> Mute This Topic: https://lists.openembedded.org/mt/118036273/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001354d9064bd3c609
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Related yocto-docs submission:=C2=A0<a href=3D"https://lis=
ts.yoctoproject.org/g/docs/message/9014">https://lists.yoctoproject.org/g/d=
ocs/message/9014</a></div><br><div class=3D"gmail_quote gmail_quote_contain=
er"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 27, 2026 at 11:39=E2=
=80=AFAM Tim Orling via <a href=3D"http://lists.openembedded.org">lists.ope=
nembedded.org</a> &lt;ticotimo=3D<a href=3D"mailto:gmail.com@lists.openembe=
dded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">In <a href=3D"https://bugzilla.yo=
ctoproject.org/show_bug.cgi?id=3D16163" rel=3D"noreferrer" target=3D"_blank=
">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16163</a> analysis sh=
owed<br>
that one of the root causes is the hard coded 450 second timeout passed to<=
br>
ptest-runner in lib/oeqa/runtime/cases/ptest.py.<br>
<br>
This series introduces the PTEST_RUNNER_TIMEOUT variable, which is consumed=
<br>
in lib/oeqa/runtime/cases/ptest.py but needs to be updated in testimage.bbc=
lass<br>
to make sure the value of the variable is consumed at runtime.<br>
<br>
For python3-cffi which drove the change, the value is set in <a href=3D"htt=
p://core-image-ptest.bb" rel=3D"noreferrer" target=3D"_blank">core-image-pt=
est.bb</a><br>
to 600 seconds, as an example of how a per recipe change can be enabled.<br=
>
<br>
The test run on the AutoBuilder cluster that proves this works is:<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/buil=
ds/3136" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/61/builds/3136</a><br>
<a href=3D"https://valkyrie.yocto.io/pub/non-release/20260227-113/testresul=
ts/qemuarm64-ptest/core-image-ptest-python3-cffi/" rel=3D"noreferrer" targe=
t=3D"_blank">https://valkyrie.yocto.io/pub/non-release/20260227-113/testres=
ults/qemuarm64-ptest/core-image-ptest-python3-cffi/</a><br>
where you can see:<br>
PATH=3D/usr/sbin:/sbin:/usr/bin:/bin; ptest-runner -t 600 -d &quot;/usr/lib=
&quot;<br>
in <a href=3D"https://valkyrie.yocto.io/pub/non-release/20260227-113/testre=
sults/qemuarm64-ptest/core-image-ptest-python3-cffi/log.do_testimage.232325=
6.20260227191837" rel=3D"noreferrer" target=3D"_blank">https://valkyrie.yoc=
to.io/pub/non-release/20260227-113/testresults/qemuarm64-ptest/core-image-p=
test-python3-cffi/log.do_testimage.2323256.20260227191837</a><br>
<br>
[YOCTO #16163]<br>
<br>
Tim Orling (3):<br>
=C2=A0 oeqa/runtime/ptest: Make ptest-runner timeout configurable<br>
=C2=A0 core-image-ptest: add PTEST_RUNNER_TIMEOUT<br>
=C2=A0 testimage.bbclass: enable PTEST_RUNNER_TIMEOUT variable<br>
<br>
=C2=A0meta/classes-recipe/testimage.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 =
+++-<br>
=C2=A0meta/lib/oeqa/runtime/cases/ptest.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 3 ++-<br>
=C2=A0meta/recipes-core/images/<a href=3D"http://core-image-ptest.bb" rel=
=3D"noreferrer" target=3D"_blank">core-image-ptest.bb</a> | 1 +<br>
=C2=A03 files changed, 6 insertions(+), 2 deletions(-)<br>
<br>
-- <br>
2.50.1 (Apple Git-155)<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#232111): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/232111" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/232111</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118036273/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/118036273/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000001354d9064bd3c609--

