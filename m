Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B72AFFF885D
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 10:47:13 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10492.1777373225535956265
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 03:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=i7Bh63rJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b9c603ec2dfso1431155666b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 03:47:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777373224; cv=none;
        d=google.com; s=arc-20240605;
        b=QeCyh1xzCgVXqZZMJChnRla8V7GjgoLCm9EpUC58h/gkA1VZnvl9N5DQvfaux0wa+v
         r2svxQLmg2VFXe9qlIHIhY1+1Yev2N3hAo8X0/bMZJ008Pa17/NLxS4rZQRU7DZcj0xL
         IqIDOHyWz+AEOZrU2Sgc8bmChJYRqCDZGQ9X9v3+dLpjfOrPBKAiJP19x7fiQnY0HdDu
         mc8RD2bY106y24mJdx59+06yzFPXFWw/mrSQpmJjjdyid+0kSse/dfWMSlnpw/Is6sip
         HmGYmyN5tJzqOmnrk8Ii9CVHU8adV8tJc0VJkLIlk9y+BtoRXcyGctd9ubA5O07yot8m
         5YRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LafWdBzSwi8vu+uKV/2tHD7Xa246Tsit6Wwg729Sds4=;
        fh=Dh52gPozsrJK0ysPU83ajvVTNKY9lxgffT07wjoYCdE=;
        b=FLJKhUYG/tJwSct+ruytcRL4mvKO2mwpyE6O5XrHIXKS7PfEpc6JijvX0tRt5PyB/D
         ijwpGocNtwGI4sCjGTpL1BjDy0qCwElKhM+KqGPcuX6WpVnpMAJ4HvIwjfkl/ApnN82e
         RToi8n0uAj+6j7s6jGIRSHzIaEhz+0w6cYprDx0iXQVd5Ftk4JkgKIKWevMO9Rp06ljd
         ptM5OSiJpMxL5F1FkP8Kw40mkqk39UuG2r3JpsFQsZJ2QJbqssqRMS53D4JzYtfET3x4
         MWRwSjUbOBzGfrzDaeSTb91+n9gRAP7Cyjp6G03jkbPVHlCMSMUPwY+ShOeLNFq2rOCo
         0OHQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777373224; x=1777978024; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LafWdBzSwi8vu+uKV/2tHD7Xa246Tsit6Wwg729Sds4=;
        b=i7Bh63rJCrymbvqXqB8rNZKhcsTQv8B8A8KX6KtGqYTnkcdFWzn7yW6X2QjFURtLib
         Q35FdlrJKZETO40yi5BfxnR8lhG7Fekq/773nU1gEZ68zVBPvnxYplCu708dPGz59APe
         1C8cTwPMGWTfwheQleOi3Lhd47pVtXny8Swy6asV+QrrxMMtIgAp055oX38sQXBJ+WD6
         4ekJ7Zh7sOXIx4Bkb7Ticba7VCN7hhR+1uIql8ZR28JoPTFG+v2EMnMLhrdEZd2WrZYe
         tGm4LMD30iPV0Eg4o8LXBPg7l7LbRzSMaoiuJG5p6SIYHDH+wXf2q3Jq4qptFEWiewO2
         VDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777373224; x=1777978024;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LafWdBzSwi8vu+uKV/2tHD7Xa246Tsit6Wwg729Sds4=;
        b=oKZixd2YSuMxJ02UN0UUXjm+dU/lubrJdb0mwLjVyTYEXydoS1qGtzQs3TWHe6zhrA
         5EY0RTEFdJp5g3GqBfuXy8qh3ljwanpDgB09GzIERzaCHvPYXsmLDGTo/iEkIxa6MqAF
         sWIE2bhcTDHIId18nEbs1ckJrDDzTAj59MzhAgydnRVdSH/RZz+4yV3fmEiGKIWyaHIH
         dwR9mh5ALjr/kDSq2AlRUvvi2hk7n84vHIZF5QqitLfGQGbEhp/B4uZ/XSyACyuPNOa6
         cTvFJKTsqC4RBjHe8A9wpetVFjjBIPxXADDzjepslsPQbAYUz0bDmyInJQUnOQl9cHP+
         KYeA==
X-Forwarded-Encrypted: i=1; AFNElJ/b+KpnC4GXWILZOzOiD0Q+u9rNsPjLimr633piiyPsRw+zpPLcOUWK4zyL9AlErFKlaxQoU/6l3i3yyYEhZDo5+A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyENgaLeLFO5p3zjdePJFY2kDU9pGMoJ3fxm1NsiQrNRs8z/VdR
	+SqG3TAP4eBDbGWOxKIdj5D6z0ElC+/WQfBCwtVb6Eoip7+GRQsrBdzGXWkBDFsuHBIyVwhgk1O
	ghkL/r+ffVn50pOwd+t34y8tXC77rLJA=
X-Gm-Gg: AeBDiesrnCowfhtei1mNsagSB1HKtUa04TJNakUUUhimQ5z1z8hzF3LdJFFZ3OAmDL7
	XDRMU1lYrT1be6w2wl/VDzqd51+97bIva/HxhroPlNE+X8QFdtLBWHmrukkOf4LoFJOH0jGdP5U
	53PFJ2oy/btFUq1Yc/tQNKL27c9xcQy7fqKnwUaLzyWAbDe1iASUx2h/hYMJNkaVJ6m2kITWVbg
	wN/DImDVAm4Ycjk4KYR8zHurS7oe/PfvD51GWmsOqBm5hwMiC4EmjCpc53dPTniYMSsGioaPldo
	3Ssc99INtoLDic7vPULaunHoSbXFwf+AxVN99ZtWDhSfgUR4AtwaIHaNXuVYP5IcHUTUrwwpobB
	4Pyx/jA==
X-Received: by 2002:a17:907:3d0d:b0:ba6:a05c:ac2b with SMTP id
 a640c23a62f3a-bb8024c5383mr134781166b.18.1777373223335; Tue, 28 Apr 2026
 03:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260427103040.1519121-1-viswanath.kraleti@oss.qualcomm.com>
 <DI3WQFOXA6GG.23KER0QY230XL@bootlin.com> <18AA3C050EE61D30.2188217@lists.openembedded.org>
In-Reply-To: <18AA3C050EE61D30.2188217@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 28 Apr 2026 11:46:52 +0100
X-Gm-Features: AVHnY4IzO6kArPg0EWJVy7-jSv9Z3G4ttR5bW8XdWqtyDTDyYgj40OGM7sDlo7s
Message-ID: <CANPvuRkVsWWCmUtt=O821j0YH0mCirsCytTywEx7YD=Qu4TMog@mail.gmail.com>
Subject: Re: [OE-core][PATCH] mirrors: switch Yocto Project mirrors to HTTPS
To: quaresma.jose@gmail.com
Cc: antonin.godard@bootlin.com, viswanath.kraleti@oss.qualcomm.com, 
	openembedded-core@lists.openembedded.org, 
	Michael Halstead <mhalstead@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000009c4004065082f3d6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 10:47:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236052

--0000000000009c4004065082f3d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu (segunda, 27/04/2026 =C3=A0(s) 1=
5:09):

>
>
> Antonin Godard via lists.openembedded.org <antonin.godard=3D
> bootlin.com@lists.openembedded.org> escreveu (segunda, 27/04/2026 =C3=A0(=
s)
> 12:40):
>
>> On Mon Apr 27, 2026 at 12:30 PM CEST, Viswanath Kraleti via
>> lists.openembedded.org wrote:
>> [...]
>> >  svn://.*/.*     http://sources.openembedded.org/ \
>> >  git://.*/.*     http://sources.openembedded.org/ \
>> >  gitsm://.*/.*   http://sources.openembedded.org/ \
>>
>> On a related note, it seems that http://sources.openembedded.org/ is no
>> longer
>> active. Could we remove it?
>>
>
> I also noticed that when I tried it, but I was unsure if it was
> intermittent or if it didn't even exist.
> Add Michael in cc and perhaps he can confirm.
>

It's not intermittent, because the address still can't be resolved today.
I think it's safe to remove this addresses in a subsequent commit,
and if there are any complaints, we can revert the commit.

Jose


> Jose
>
>
>>
>> Antonin
>>
>>
>>
>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#236012):
> https://lists.openembedded.org/g/openembedded-core/message/236012
> Mute This Topic: https://lists.openembedded.org/mt/119028000/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000009c4004065082f3d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Jose Quaresma v=
ia <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt=
;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.=
com@lists.openembedded.org</a>&gt; escreveu (segunda, 27/04/2026 =C3=A0(s) =
15:09):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Antonin Godard via <a href=3D"http://lists.op=
enembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;antonin.go=
dard=3D<a href=3D"mailto:bootlin.com@lists.openembedded.org" target=3D"_bla=
nk">bootlin.com@lists.openembedded.org</a>&gt; escreveu (segunda, 27/04/202=
6 =C3=A0(s) 12:40):<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Mon Apr 27, 2026 at 12:30 PM CEST, Viswanath Kraleti via <a href=3D"=
http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.o=
penembedded.org</a> wrote:<br>
[...]<br>
&gt;=C2=A0 svn://.*/.*=C2=A0 =C2=A0 =C2=A0<a href=3D"http://sources.openemb=
edded.org/" rel=3D"noreferrer" target=3D"_blank">http://sources.openembedde=
d.org/</a> \<br>
&gt;=C2=A0 git://.*/.*=C2=A0 =C2=A0 =C2=A0<a href=3D"http://sources.openemb=
edded.org/" rel=3D"noreferrer" target=3D"_blank">http://sources.openembedde=
d.org/</a> \<br>
&gt;=C2=A0 gitsm://.*/.*=C2=A0 =C2=A0<a href=3D"http://sources.openembedded=
.org/" rel=3D"noreferrer" target=3D"_blank">http://sources.openembedded.org=
/</a> \<br>
<br>
On a related note, it seems that <a href=3D"http://sources.openembedded.org=
/" rel=3D"noreferrer" target=3D"_blank">http://sources.openembedded.org/</a=
> is no longer<br>
active. Could we remove it?<br></blockquote><div><br></div><div>I also noti=
ced that when I tried it, but I was unsure if it was intermittent or if it =
didn&#39;t even exist.</div><div>Add Michael in cc and perhaps he can confi=
rm.</div></div></div></blockquote><div><br></div><div>It&#39;s not intermit=
tent, because the address still can&#39;t be resolved today.</div><div>I th=
ink it&#39;s safe to remove this addresses in a subsequent commit,</div><di=
v>and if there are any complaints, we can revert the commit.</div><div><br>=
</div><div>Jose</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><br></div><div>=
Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
Antonin<br>
<br>
<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#236012): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/236012" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/236012</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119028000/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119028000/5052612</a><br>
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
div></div></div>

--0000000000009c4004065082f3d6--

