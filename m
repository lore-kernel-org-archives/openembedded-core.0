Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1982C76196
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 15:28:12 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.17456.1681226885107555783
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Apr 2023 08:28:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c2b/mb4E;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id g19so53921433lfr.9
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 08:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681226883;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+lx8EAG7iSnZiYrnU8EvMqvLVGUN9ayUHeIBqGcX54A=;
        b=c2b/mb4E4Ol/L4LyjTHmdHRx/RQxXuu9q1e1eRkXpRkB6IQsKhfkgmUwjPg5Qmx132
         JazgLowJSgYeXfl1jVtQYfhoSxMGXTUh0ke03F7W+i7T/UOGqjbv4Z1+GI9yZSukOmzU
         /OasCnPCTpOSUE1DhBt8TRQlrn5wKWar60FxVYa1QnWiqs6PewRAUtY8DztFi9+MlibG
         WFasca9k/fc45LSWCd0VXRpf2861wFLA6/7q7Oxk3d+gg2rUZphQqMUn8nx6kNsJcGOZ
         TXXQ7ILRfTeQz7lDMT8syBZAn5JzJ3W5xXd9f8POWY3AJfPp4NjfTi66pZOXMUSYF2BK
         ah4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681226883;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+lx8EAG7iSnZiYrnU8EvMqvLVGUN9ayUHeIBqGcX54A=;
        b=j38bHzMKBpZLdM9uZArEJmujsmSRGrkD/QE1V4LhcAAI3WGPpWgupHpwVZcIwtk7ge
         7XynfpiLYTQ9V9HtxHaxxnZeYpLuvjp50wIn7XGPT/mP9j4KpdkgLk5I+/CXY6bKOxEo
         NpKf5wSD9hfx8/ohrgfjNtUqw4lJntpDlzZHd+bC0z/HIGiWMxKXlpBYAa5JMCRpWCXV
         i0fMoG3Qz4/iXxu+RGdKYwafM+muieSuxMiihJp73uapa3FQUVpPH41s5pn12ijv/39K
         S/xQqnEmbqc2Q8Z532WRjyOzhsizYFl6Qq/xGILjfj47PFzLIDE6ZFuoLyd8YNJWGuyQ
         u+DA==
X-Gm-Message-State: AAQBX9dwcxvdUzLMmDCfN7SAYUunt/dMao0shNqY3AlHK5xZPmcb/srW
	eAK+Xv18jwbk7uKwPtGws3gSQkOM96kMbVatVaY=
X-Google-Smtp-Source: AKy350bIL4814T6YvjaIqQ6a16yeJGXsP6rVgqmtkvma1wbeH9M4p5ZUE1EiNBcxt3soBpEZmg9P2eF7DASmK2SZ5+U=
X-Received: by 2002:ac2:55ae:0:b0:4d5:ca32:7bc5 with SMTP id
 y14-20020ac255ae000000b004d5ca327bc5mr974000lfg.12.1681226883077; Tue, 11 Apr
 2023 08:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <1753B0402875C548.11304@lists.openembedded.org>
 <CA+cAkerWUvabx_kzN2s6S64454t88ifOR+nqtaLwk0wHfw3n2Q@mail.gmail.com>
 <6381549a7f058cb233c656dca9324ae4d7a435c2.camel@linuxfoundation.org>
 <CA+cAkerd92jAqwA1iDrNOV+W1mK5Tb39yvT_Dp-t18=LCNm09w@mail.gmail.com>
 <CANPvuRkfQuVdP-WJw58UOK9WVhy95UgujST4k6unnUvYQ7FySA@mail.gmail.com> <1754A030DDACF987.21832@lists.openembedded.org>
In-Reply-To: <1754A030DDACF987.21832@lists.openembedded.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Tue, 11 Apr 2023 17:27:51 +0200
Message-ID: <CA+cAkerdCUTNQFcMnAVrR6ZOFZUjTPUZcFWSGU+SsCJm+aQqZg@mail.gmail.com>
Subject: Re: [OE-core] Reproducible build
To: frederic.martinsons@gmail.com
Cc: Jose Quaresma <quaresma.jose@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000271a9605f9112318"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 15:28:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179932

--000000000000271a9605f9112318
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello with the patch below:

--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -134,9 +134,9 @@ class ReproducibleTests(OESelftestTestCase):
     max_report_size =3D 250 * 1024 * 1024

     # targets are the things we want to test the reproducibility of
-    targets =3D ['core-image-minimal', 'core-image-sato',
'core-image-full-cmdline', 'core-image-weston', 'world']
+    targets =3D ['zvariant']
     # sstate targets are things to pull from sstate to potentially cut
build/debugging time
-    sstate_targets =3D []
+    sstate_targets =3D ['rust-native', 'cargo-native']
     save_results =3D False
     if 'OEQA_DEBUGGING_SAVED_OUTPUT' in os.environ:
         save_results =3D os.environ['OEQA_DEBUGGING_SAVED_OUTPUT']

I managed to reduce the time to test to 30mn (which is reasonable). Today,
I made 5 run of this
reproducibility test and if library is indeed different between build A and
build B every time, this
is the same exact difference, that is to day that the 5 libraries in build
A are identical and so are
the 5 libraries in build B.

I admit I'm surprised , I would have waited for some random diff.
I'll continue my investigation but if this rang a bell to someone here,
feel free to tell (this does
seem strange to me).



On Mon, 10 Apr 2023 at 18:38, Frederic Martinsons via lists.openembedded.or=
g
<frederic.martinsons=3Dgmail.com@lists.openembedded.org> wrote:

>
>
> On Mon, 10 Apr 2023 at 17:32, Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
>
>> Hi Frederic,
>>
>> Frederic Martinsons <frederic.martinsons@gmail.com> escreveu no dia
>> domingo, 9/04/2023 =C3=A0(s) 16:05:
>>
>>>
>>>
>>> Le dim. 9 avr. 2023, 10:43, Richard Purdie <
>>> richard.purdie@linuxfoundation.org> a =C3=A9crit :
>>>
>>>> On Sat, 2023-04-08 at 09:56 +0200, Frederic Martinsons wrote:
>>>> > Forget my previous question,
>>>> >
>>>> > I simply
>>>> > edit https://git.openembedded.org/openembedded-core/tree/meta/lib/oe=
q
>>>> > a/selftest/cases/reproducible.py#n137
>>>> > to replace by zavariant, and with OEQA_DEBUGGING_SAVED_OUTPUT set , =
I
>>>> > managed to see the html diff
>>>> >
>>>> > Nevertheless, It took one hour, but it seems that it cannot be
>>>> > avoided since there are two builds and one
>>>> > without any shared state.
>>>>
>>>> Unfortunately that is the nature of the test, one side has to be built
>>>> from scratch. Tweaking the test as you'd done to target a specific
>>>> component is what I'd have done too to speed things up for a specific
>>>> recipe.
>>>>
>>>> To get a further speedup, you could probably keep the sstate for each
>>>> of the two builds separate but retain both, then in theory on the
>>>> pieces you change would rebuild. Again, it would mean tweaking the tes=
t
>>>> but for debugging, I think that is fine. Rust can be a pain if you jus=
t
>>>> rebuild those as it still takes a while. Thanks for taking a look!
>>>>
>>>> Cheers,
>>>>
>>>> Richard
>>>>
>>>>
>>> Thank you for the tip, I'll try that, everything that help to speed up
>>> is good to take of course.
>>>
>>
>> To speedup the build you can take the rust-native from the state cache
>> [1] and this will improve a bit bit the time needed:
>>
>> sstate_target =3D [ "rust-native" ]
>>
>> [1] https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/se=
lftest/cases/reproducible.py#n139
>>
>>
>> Jose
>>
>>
>>>
>>>
>>>
>>>
>>
>> --
>> Best regards,
>>
>> Jos=C3=A9 Quaresma
>>
>
>
> Hey, thank you Jos=C3=A9 for the advice, I'll apply that for sure.
>
> By the way, like I commented in
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15090 , I'm currently
> try to reproduce (ahah) the reproducibility issue of zvariant with the us=
e
> of reprotest (https://salsa.debian.org/reproducible-builds/reprotest)
> and outside yocto environment. For the moment, I was not able to pinpoint
> the issue (I must have
> put aside the faketime usage since it caused me segfault of rustc).
>
> I plan to dig further in reproducible.py class and how the package is
> built under yocto to try to find out
> what is going on.
>
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179892):
> https://lists.openembedded.org/g/openembedded-core/message/179892
> Mute This Topic: https://lists.openembedded.org/mt/98126404/6213388
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> frederic.martinsons@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000271a9605f9112318
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello with the patch below:<div><br></div><div>--- a/meta/=
lib/oeqa/selftest/cases/reproducible.py<br>+++ b/meta/lib/oeqa/selftest/cas=
es/reproducible.py<br>@@ -134,9 +134,9 @@ class ReproducibleTests(OESelftes=
tTestCase):<br>=C2=A0 =C2=A0 =C2=A0max_report_size =3D 250 * 1024 * 1024<br=
>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0# targets are the things we want to test the=
 reproducibility of<br>- =C2=A0 =C2=A0targets =3D [&#39;core-image-minimal&=
#39;, &#39;core-image-sato&#39;, &#39;core-image-full-cmdline&#39;, &#39;co=
re-image-weston&#39;, &#39;world&#39;]<br>+ =C2=A0 =C2=A0targets =3D [&#39;=
zvariant&#39;]<br>=C2=A0 =C2=A0 =C2=A0# sstate targets are things to pull f=
rom sstate to potentially cut build/debugging time<br>- =C2=A0 =C2=A0sstate=
_targets =3D []<br>+ =C2=A0 =C2=A0sstate_targets =3D [&#39;rust-native&#39;=
, &#39;cargo-native&#39;]<br>=C2=A0 =C2=A0 =C2=A0save_results =3D False<br>=
=C2=A0 =C2=A0 =C2=A0if &#39;OEQA_DEBUGGING_SAVED_OUTPUT&#39; in os.environ:=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0save_results =3D os.environ[&#39;OEQA=
_DEBUGGING_SAVED_OUTPUT&#39;]<br></div><div><br></div><div>I managed=C2=A0t=
o reduce the time to test to 30mn (which is reasonable). Today, I made 5 ru=
n of this</div><div>reproducibility test and if library is indeed different=
 between build A and build B every time, this</div><div>is the same exact d=
ifference, that is to day that the 5 libraries in build A are identical and=
 so are</div><div>the 5 libraries in build B.</div><div><br></div><div>I ad=
mit I&#39;m surprised=C2=A0, I would have=C2=A0waited for some random diff.=
</div><div>I&#39;ll continue my investigation but if this rang a bell to so=
meone here, feel free to tell (this does</div><div>seem strange to me).</di=
v><div><br></div><div>=C2=A0</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, 10 Apr 2023 at 18:38, Frederic Ma=
rtinsons via <a href=3D"http://lists.openembedded.org">lists.openembedded.o=
rg</a> &lt;frederic.martinsons=3D<a href=3D"mailto:gmail.com@lists.openembe=
dded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"=
><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Mon, 10 Apr 2023 at 17:32, Jose Quaresma &lt;<a href=3D"mailto:quar=
esma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div dir=3D"ltr">Hi=C2=A0Frederic,</div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Frederic Martinsons &lt;<a href=3D"ma=
ilto:frederic.martinsons@gmail.com" target=3D"_blank">frederic.martinsons@g=
mail.com</a>&gt; escreveu no dia domingo, 9/04/2023 =C3=A0(s) 16:05:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto"><div=
><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">L=
e dim. 9 avr. 2023, 10:43, Richard Purdie &lt;<a href=3D"mailto:richard.pur=
die@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.o=
rg</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Sat, 2023-04-08 at 09:56 +0200, Frederic Martinsons wrote=
:<br>
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
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span>-- </span><br><di=
v dir=3D"ltr"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</di=
v></div></div></div></blockquote><div><br></div><div><br></div><div>Hey, th=
ank you Jos=C3=A9 for the advice, I&#39;ll apply that for sure.</div><div><=
br></div><div>By the way, like I commented in=C2=A0<a href=3D"https://bugzi=
lla.yoctoproject.org/show_bug.cgi?id=3D15090" target=3D"_blank">https://bug=
zilla.yoctoproject.org/show_bug.cgi?id=3D15090</a> , I&#39;m currently</div=
><div>try to reproduce (ahah) the reproducibility issue of zvariant with th=
e use of reprotest (<a href=3D"https://salsa.debian.org/reproducible-builds=
/reprotest" target=3D"_blank">https://salsa.debian.org/reproducible-builds/=
reprotest</a>)</div><div>and outside yocto environment. For the moment, I w=
as not able to pinpoint the issue (I must have</div><div>put aside the fake=
time usage since it caused me segfault of rustc).</div><div><br></div><div>=
I plan to dig further in reproducible.py class and how the package is built=
 under yocto to try to find out</div><div>what is going on.</div><div><br><=
/div><div><br></div><div><br></div><div>=C2=A0</div></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#179892): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/179892" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/179892</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98126404/6213=
388" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/98126404/6213388</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:frederic.martinsons@gmail.=
com" target=3D"_blank">frederic.martinsons@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000271a9605f9112318--

