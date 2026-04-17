Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B248F4369D
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 13:08:11 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44502.1776431286332643411
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2026 06:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DNIafz0N;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9c01854477so135446666b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 06:08:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776431285; cv=none;
        d=google.com; s=arc-20240605;
        b=WOach/QtnZ2YydumPwfSCaqq0wrH/nW0dF8L51yyfrRAK7dLRk9ugx5QnPnsevT1Bu
         u/+tqQ4cdbvQWg2+fVOryBXz1SplbZEuIPogi6cjUkXelsqmCkr00KD7637Ozy7+Fi8w
         jRgAM/UyXnXuOWYniSksmobKinez4tXdwwv/7/EXjT2CvCXwhu2OkS/ZpnkVMzWaccgP
         AneY51z8Fyo6r6HuqzAGH9OU80wCMgF1Gl3tA+YCdPABtA3eFLvs0WIBJOjRlRlUdx+G
         w5Nzo92Myo6KERROly1IcJGID1KQ6aPCf/XbPB0j3jjpAOvGZgy/zpPcjLTCjMol2Cae
         NeoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=c5Gq8aivpPh9cnXMWHwliQ4qofBNNZB/vaesx6T3YJ0=;
        fh=E5ilaYtv1WdTuyt6V2EYk/83154v411Kypn542jaU7s=;
        b=H+eiyRXIKdFs1GrPC3/glMPxsTBNJWu8rejdjIpLdpw2YZYF2cTSOK0KABrqLcyt6d
         D5WCh702eWms+SwUyxAysM52jA5/0qJTO32/Fsc/yUTbvQlB87Rm/ekvnlALhbv+eRtW
         qfJxPL0AQwfmgkm1fXNeSbvQ+QNtB/DtkMntHT0xIB7TCjvZnQ3YUP1M6nIwTXJ9VBgq
         5R3rWF0AUEje8rRMTPcOcs6BYqhtoIYxOsW8XoXRe5Fu2Pgri2hhztYuATd93BORr/1Z
         Ne8VKhTGwG7Q9Z4RG1+fFugKzBlR0NP8G3q1Ibqn2gd4peesc/tWs6zSHY6zFoC/WORP
         PdVg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776431285; x=1777036085; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c5Gq8aivpPh9cnXMWHwliQ4qofBNNZB/vaesx6T3YJ0=;
        b=DNIafz0N4+EwIf5wFTrW6sluI0szf3jJ/R+Zng0gbTbWjNaktop/TajCOXSLDJokFn
         Pgo3WkK1JKTxWED7STADcSKKQbY0Ks0YTuIo34yFEKS1c40vjg9vpzjApnMA+lj9c6F2
         EIGZyfZVQ6FsaDoMA9ClRumEzevV6e90ko9D3iOeeq/kuA9GWstHmQhhn8ZJ8L+PSVCf
         emUGqizkEswW2nItc/vBFs62L6q64FZons+At738pLs3xzoUPxnHEVJ6dX4LAFjMApCx
         qIH+WZWlD+xarn9FcXKY1G/I29D1LXfgRCnfoCcgla6N5Y8AZslzGj6oMjJWQjgNxSvI
         V96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776431285; x=1777036085;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5Gq8aivpPh9cnXMWHwliQ4qofBNNZB/vaesx6T3YJ0=;
        b=keTzkwfW0NHbsk1ZjGgZ3rH8tPQeA7p84zDTgwDwR3aYGGu50ocNVku1N1Ajsr57nG
         62jZtZtvLDT+90WQHCB+fkyBUzDs8TWZC28kdaHBaM4n04ADZPMBiC2a+ivsSYAsLzNc
         Di3LZ7zjDn+wuKl+TAni/0uyOIY8tsbI1c6UToyn15k0svK9tJJqrJajvqLhQpN8s9Qx
         tHlBUN4NowQrPesGC02zN62yIqrGS5b/cXntqYsWUNvH88H1WtBS6O8+YjZqyODXDAxL
         TK/3ZhqCR6bbkUoR4s9ZgG16qpc0o/luyNHondoUiEvB+j6flMwadz68EOczAtekVCZx
         2Oyg==
X-Forwarded-Encrypted: i=1; AFNElJ8ZIGPzKIWFk/wNhtbG41s4scA4Kq3TS8ZW1Cs+N9UQhgXmu0f0F6cJn52CENq7XGdkW3NpcQ/Mi/RAmBBAdxqSTg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzNh6y1w6LGUJ3n+RyGAthnGD8xuiAOY4j/7husPw/EmpptuR8V
	lkF15OIYTOKbcHA/1a6WVuttmNj6dDB2dsroo5CMKMZMzRLNpOezKLul6V/vNgecgCPnmMJxTTB
	El6TgyCoLzLJWUu4AraQBgtJnHf8TYww=
X-Gm-Gg: AeBDiev4oFBIH7skqVy/7gONQ4dCj7E+TOYqR/UmGHuMsR+Ag+7HaZn4t5lWTdEtY3l
	/JMdcz/e5U/cfWUATmvCzUs9OdQkK3vJjxU7c03pEx/hv5kn0bnIc4bgensgQvpCQjk5ZGjuB8p
	palXZYORDrSjL2Bk4H6C61xpLkt894cu6A1y9C4tgWU2WgYXLFkslpGIf4fCdG0+B7GsHnFMB2K
	W3pMO89xtItE/f0A43w6Ry6wSJVdx/qrMe/s7E88czma2VHOycmPJWNxeuuJNTOTX2mj5MD/u8L
	aVwU65x3IUT80TwyXX2rnGmt6KSC7vD11oTHywTzEtqP8SMH0ZEm6P2UYka4DYW6P3T9ZLlPlJl
	w/Nac
X-Received: by 2002:a17:906:c145:b0:b94:1df4:3525 with SMTP id
 a640c23a62f3a-ba41bad0123mr142378366b.1.1776431284102; Fri, 17 Apr 2026
 06:08:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260407094759.3116923-1-mangadi@qti.qualcomm.com>
 <DHOHLMLD4MQ9.34VQG7IIO7F3C@bootlin.com> <DHVA1T5G5BSM.1PPMQ6SPQQC5X@bootlin.com>
In-Reply-To: <DHVA1T5G5BSM.1PPMQ6SPQQC5X@bootlin.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 17 Apr 2026 14:07:52 +0100
X-Gm-Features: AQROBzCofITOC45tHJ6z6qU2D2EwLF2Do-gSxu8bkfB-2qoJpzCm-XHTdgwI-ig
Message-ID: <CANPvuRmcLJJzoVqeeU81w0xSLqUZMZ8ACcifEFG0XgU4dDzSmw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] weston: backport gl-shaders fix to avoid shader
 compiler crashes
To: mathieu.dubois-briand@bootlin.com
Cc: mangadi@qti.qualcomm.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a82f36064fa7a394"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 13:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235498

--000000000000a82f36064fa7a394
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

First of all, I want to apologize for the inconvenience caused by the
meta-qcom layer.

We have a proposed fix in place to unblock the autobuilder and it should be
integrated today.
https://github.com/qualcomm-linux/meta-qcom/pull/1940

Thanks for reporting the issue.

Jose

Mathieu Dubois-Briand via lists.openembedded.org <mathieu.dubois-briand=3D
bootlin.com@lists.openembedded.org> escreveu (sexta, 17/04/2026 =C3=A0(s) 0=
9:12):

> On Thu Apr 9, 2026 at 10:38 AM CEST, Mathieu Dubois-Briand wrote:
> > On Tue Apr 7, 2026 at 11:47 AM CEST, Mahesh Angadi via
> lists.openembedded.org wrote:
> >> Some GPU shader compilers do not optimize away unused YUV shader
> >> uniforms, even when the associated code paths are unreachable. This ca=
n
> cause
> >> Weston to hit assertion failures at runtime on non-Mesa platforms,
> despite
> >> working correctly on Mesa-based drivers.
> >>
> >> Backport the upstream gl-shaders fix to restore stable behavior across
> >> GPU drivers.
> >>
> >> Signed-off-by: Mahesh Angadi <mangadi@qti.qualcomm.com>
> >> ---
> >
> > Hi Mahesh,
> >
> > I note this is breaking builds with meta-qcom, as the patch is also
> > present in there. But as you are the author of changes in both side, I
> > bet you already knew this. :)
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/113/builds/565
> >
> > Thanks,
> > Mathieu
>
> Hi Mahesh,
>
> This patch is now merged into master, so builds with meta-qcom are now
> failing. Are you taking care of fixing this into meta-qcom or should I
> contact maintainers?
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/113/builds/619
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#235485):
> https://lists.openembedded.org/g/openembedded-core/message/235485
> Mute This Topic: https://lists.openembedded.org/mt/118705814/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000a82f36064fa7a394
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Mathieu,<br><br>First of all, I want t=
o apologize for the inconvenience caused by the meta-qcom layer.<br><br>We =
have a proposed fix in place to unblock the autobuilder and it should be in=
tegrated today.<br><a href=3D"https://github.com/qualcomm-linux/meta-qcom/p=
ull/1940">https://github.com/qualcomm-linux/meta-qcom/pull/1940</a><br><br>=
Thanks=C2=A0for reporting the issue.</div><br>Jose<div><br><div class=3D"gm=
ail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Math=
ieu Dubois-Briand via <a href=3D"http://lists.openembedded.org">lists.opene=
mbedded.org</a> &lt;mathieu.dubois-briand=3D<a href=3D"mailto:bootlin.com@l=
ists.openembedded.org">bootlin.com@lists.openembedded.org</a>&gt; escreveu =
(sexta, 17/04/2026 =C3=A0(s) 09:12):<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Thu Apr 9, 2026 at 10:38 AM CEST, Mathieu Dubois-Br=
iand wrote:<br>
&gt; On Tue Apr 7, 2026 at 11:47 AM CEST, Mahesh Angadi via <a href=3D"http=
://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.opene=
mbedded.org</a> wrote:<br>
&gt;&gt; Some GPU shader compilers do not optimize away unused YUV shader<b=
r>
&gt;&gt; uniforms, even when the associated code paths are unreachable. Thi=
s can cause<br>
&gt;&gt; Weston to hit assertion failures at runtime on non-Mesa platforms,=
 despite<br>
&gt;&gt; working correctly on Mesa-based drivers.<br>
&gt;&gt;<br>
&gt;&gt; Backport the upstream gl-shaders fix to restore stable behavior ac=
ross<br>
&gt;&gt; GPU drivers.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Mahesh Angadi &lt;<a href=3D"mailto:mangadi@qti.qua=
lcomm.com" target=3D"_blank">mangadi@qti.qualcomm.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;<br>
&gt; Hi Mahesh,<br>
&gt;<br>
&gt; I note this is breaking builds with meta-qcom, as the patch is also<br=
>
&gt; present in there. But as you are the author of changes in both side, I=
<br>
&gt; bet you already knew this. :)<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/11=
3/builds/565" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/valkyrie/#/builders/113/builds/565</a><br>
&gt;<br>
&gt; Thanks,<br>
&gt; Mathieu<br>
<br>
Hi Mahesh,<br>
<br>
This patch is now merged into master, so builds with meta-qcom are now<br>
failing. Are you taking care of fixing this into meta-qcom or should I<br>
contact maintainers?<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/113/bui=
lds/619" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/113/builds/619</a><br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#235485): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/235485" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/235485</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118705814/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118705814/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div></div>

--000000000000a82f36064fa7a394--

