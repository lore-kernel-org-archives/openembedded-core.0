Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 107E2C76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 16:38:21 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.50428.1681144692199329762
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 09:38:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cHgjIUgy;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id by8so5517876ljb.13
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681144690;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LYfHc3W3A6/q+LYbw3wwv7+KnpeBhCNfumLk54GcrS4=;
        b=cHgjIUgyUTuqaxHahYKsfVWWrkrj/k+62/rGXN7vdgmo+4eFUHqyNLDmix//P83nw8
         q2v9pcNv2FlPhYFhbY+eBXQFQyf5vEXdHye722oCAHnNQPeTohg6Ay/syBfq1PZPMXd3
         eO0RQa4bZ2+2F0b4ua2WvxrrxsArO6ueARZXTpdNmxo1pRYkCaInKoSIUQFPx3QKy6rr
         2s9oB0IRxA/gkcaB1rt2A/v711jB+TrN2T3OkSZxB0W8Pj0b0TYHrgRruzbxbgKiXs81
         Q/XgYIn3uQ/miznwxq/WrTkbzoiqw9uLag7GJI6xq9w2WSW7JUUfsYJCBclYJonWMKQ4
         CzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681144690;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LYfHc3W3A6/q+LYbw3wwv7+KnpeBhCNfumLk54GcrS4=;
        b=mPhMuavTWH7S/I+c3S00R/VsMZVx89gpPGTNbhkC7dheUopC+Hl7AhYsIgjQDCG5YB
         EiOXRxOGRdXv0YsZap4GqQhFuVOXItxcdpNwnY2KKp8+3lk3WWCNf0vof59EuUxLN7Gt
         Zc9CEVNKbLRvYVkXptgmina6IjMh+QMhVeIcjVo3YvV5zlR+8igILT/KwHlQbsidbyzy
         VX0Twi3HcHeMyCYs07NR5PXxkihf1GUcWHf5FNcB5iuZ2GeQmzaOQafDIOEyOo1h0iXC
         vvFvxwQHP4Okxh0cvEvg6g5S3vdUrnxQv/80fvgNZERyEQKuqOCdEeP3PvBxIXf/mLbz
         ElwQ==
X-Gm-Message-State: AAQBX9cV2olpwoAyTDuu/cgFzjjxYZ8u2OKSjq9WEOz45EkjWceoo6dH
	7jm8E0oIA5OUIyj7TY/P7u/UaTZSSa4F8COkM9o=
X-Google-Smtp-Source: AKy350as94xcyvMyBcYAfo3PFrAqnOsz4dfVPcZoZ2hEFeFMwVimEkrpoJzjIKm+fcz1+OLXj8Sq0pr2K/o8ebYqJUg=
X-Received: by 2002:a2e:7810:0:b0:294:6de5:e642 with SMTP id
 t16-20020a2e7810000000b002946de5e642mr3054425ljc.3.1681144690138; Mon, 10 Apr
 2023 09:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <1753B0402875C548.11304@lists.openembedded.org>
 <CA+cAkerWUvabx_kzN2s6S64454t88ifOR+nqtaLwk0wHfw3n2Q@mail.gmail.com>
 <6381549a7f058cb233c656dca9324ae4d7a435c2.camel@linuxfoundation.org>
 <CA+cAkerd92jAqwA1iDrNOV+W1mK5Tb39yvT_Dp-t18=LCNm09w@mail.gmail.com> <CANPvuRkfQuVdP-WJw58UOK9WVhy95UgujST4k6unnUvYQ7FySA@mail.gmail.com>
In-Reply-To: <CANPvuRkfQuVdP-WJw58UOK9WVhy95UgujST4k6unnUvYQ7FySA@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Mon, 10 Apr 2023 18:37:58 +0200
Message-ID: <CA+cAkeqCwqgDUim1fmoEqmhGTOTJCxBmoW=TeM4A5D=3aaHY4A@mail.gmail.com>
Subject: Re: [OE-core] Reproducible build
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000012655d05f8fe0009"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 16:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179892

--00000000000012655d05f8fe0009
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 10 Apr 2023 at 17:32, Jose Quaresma <quaresma.jose@gmail.com> wrote=
:

> Hi Frederic,
>
> Frederic Martinsons <frederic.martinsons@gmail.com> escreveu no dia
> domingo, 9/04/2023 =C3=A0(s) 16:05:
>
>>
>>
>> Le dim. 9 avr. 2023, 10:43, Richard Purdie <
>> richard.purdie@linuxfoundation.org> a =C3=A9crit :
>>
>>> On Sat, 2023-04-08 at 09:56 +0200, Frederic Martinsons wrote:
>>> > Forget my previous question,
>>> >
>>> > I simply
>>> > edit https://git.openembedded.org/openembedded-core/tree/meta/lib/oeq
>>> > a/selftest/cases/reproducible.py#n137
>>> > to replace by zavariant, and with OEQA_DEBUGGING_SAVED_OUTPUT set , I
>>> > managed to see the html diff
>>> >
>>> > Nevertheless, It took one hour, but it seems that it cannot be
>>> > avoided since there are two builds and one
>>> > without any shared state.
>>>
>>> Unfortunately that is the nature of the test, one side has to be built
>>> from scratch. Tweaking the test as you'd done to target a specific
>>> component is what I'd have done too to speed things up for a specific
>>> recipe.
>>>
>>> To get a further speedup, you could probably keep the sstate for each
>>> of the two builds separate but retain both, then in theory on the
>>> pieces you change would rebuild. Again, it would mean tweaking the test
>>> but for debugging, I think that is fine. Rust can be a pain if you just
>>> rebuild those as it still takes a while. Thanks for taking a look!
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>>
>> Thank you for the tip, I'll try that, everything that help to speed up i=
s
>> good to take of course.
>>
>
> To speedup the build you can take the rust-native from the state cache [1=
]
> and this will improve a bit bit the time needed:
>
> sstate_target =3D [ "rust-native" ]
>
> [1] https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/sel=
ftest/cases/reproducible.py#n139
>
>
> Jose
>
>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#179841):
>> https://lists.openembedded.org/g/openembedded-core/message/179841
>> Mute This Topic: https://lists.openembedded.org/mt/98126404/5052612
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> quaresma.jose@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>


Hey, thank you Jos=C3=A9 for the advice, I'll apply that for sure.

By the way, like I commented in
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15090 , I'm currently
try to reproduce (ahah) the reproducibility issue of zvariant with the use
of reprotest (https://salsa.debian.org/reproducible-builds/reprotest)
and outside yocto environment. For the moment, I was not able to pinpoint
the issue (I must have
put aside the faketime usage since it caused me segfault of rustc).

I plan to dig further in reproducible.py class and how the package is built
under yocto to try to find out
what is going on.

--00000000000012655d05f8fe0009
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, 10 Apr 2023 at 17:32, Jose Qu=
aresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com">quaresma.jose@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Frederic,</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Frederic Martinsons =
&lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank">fred=
eric.martinsons@gmail.com</a>&gt; escreveu no dia domingo, 9/04/2023 =C3=A0=
(s) 16:05:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Le dim. 9 avr. 2023, 10:43, Richard Purdie &lt;<a href=3D"m=
ailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@=
linuxfoundation.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Sat, 2023-04-08 at 09:56 +0200, Frederi=
c Martinsons wrote:<br>
&gt; Forget my previous question,=C2=A0<br>
&gt; <br>
&gt; I simply<br>
&gt; edit=C2=A0<a href=3D"https://git.openembedded.org/openembedded-core/tr=
ee/meta/lib/oeq" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gi=
t.openembedded.org/openembedded-core/tree/meta/lib/oeq</a><br>
&gt; a/selftest/cases/reproducible.py#n137<br>
&gt; to replace by zavariant, and with=C2=A0OEQA_DEBUGGING_SAVED_OUTPUT set=
 , I<br>
&gt; managed to see the html diff<br>
&gt; <br>
&gt; Nevertheless, It took one hour, but it seems that it cannot be<br>
&gt; avoided since there are two builds and one<br>
&gt; without any shared state.<br>
<br>
Unfortunately that is the nature of the test, one side has to be built<br>
from scratch. Tweaking the test as you&#39;d done to target a specific<br>
component is what I&#39;d have done too to speed things up for a specific<b=
r>
recipe.<br>
<br>
To get a further speedup, you could probably keep the sstate for each<br>
of the two builds separate but retain both, then in theory on the<br>
pieces you change would rebuild. Again, it would mean tweaking the test<br>
but for debugging, I think that is fine. Rust can be a pain if you just<br>
rebuild those as it still takes a while. Thanks for taking a look!<br>
<br>
Cheers,<br>
<br>
Richard<br><br></blockquote></div></div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Thank you for the tip, I&#39;ll try that, everything that help t=
o speed up is good to take of course.=C2=A0</div></div></blockquote><div><b=
r>To speedup the build you can take the rust-native from the state=C2=A0cac=
he [1] and this will improve a bit bit the time needed:<br><br>sstate_targe=
t =3D [ &quot;rust-native&quot; ]<br><br><pre style=3D"padding:0px;margin-t=
op:0px;margin-bottom:0px;color:rgb(0,0,0);font-size:13.3333px"><span style=
=3D"font-family:Arial,Helvetica,sans-serif;font-size:small;color:rgb(34,34,=
34)">[1] <a href=3D"https://git.openembedded.org/openembedded-core/tree/met=
a/lib/oeqa/selftest/cases/reproducible.py#n139" target=3D"_blank">https://g=
it.openembedded.org/openembedded-core/tree/meta/lib/oeqa/selftest/cases/rep=
roducible.py#n139</a>
=C2=A0</span></pre>Jose<br>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div dir=3D"auto"><div dir=3D"auto"></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#179841): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/179841" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/179841</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98126404/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/98126404/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span>-- </span><br><di=
v dir=3D"ltr"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</di=
v></div></div></div></blockquote><div><br></div><div><br></div><div>Hey, th=
ank you Jos=C3=A9 for the advice, I&#39;ll apply that for sure.</div><div><=
br></div><div>By the way, like I commented in=C2=A0<a href=3D"https://bugzi=
lla.yoctoproject.org/show_bug.cgi?id=3D15090">https://bugzilla.yoctoproject=
.org/show_bug.cgi?id=3D15090</a> , I&#39;m currently</div><div>try to repro=
duce (ahah) the reproducibility issue of zvariant with the use of reprotest=
 (<a href=3D"https://salsa.debian.org/reproducible-builds/reprotest">https:=
//salsa.debian.org/reproducible-builds/reprotest</a>)</div><div>and outside=
 yocto environment. For the moment, I was not able to pinpoint the issue (I=
 must have</div><div>put aside the faketime usage since it caused me segfau=
lt of rustc).</div><div><br></div><div>I plan to dig further in reproducibl=
e.py class and how the package is built under yocto to try to find out</div=
><div>what is going on.</div><div><br></div><div><br></div><div><br></div><=
div>=C2=A0</div></div></div>

--00000000000012655d05f8fe0009--

