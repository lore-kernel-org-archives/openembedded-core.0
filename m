Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85ABDC433F5
	for <webhook@archiver.kernel.org>; Sat, 23 Oct 2021 20:12:23 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web08.11135.1635019942546509045
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 13:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YqiBzifM;
 spf=pass (domain: gmail.com, ip: 209.85.222.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id f4so14245990uad.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 13:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5+Pwjfit8WjR7FMex4KS2EEdjnbtTG8PlsPIqr0O5Pg=;
        b=YqiBzifMUxvkfxwOrzMELrDK0KTN1exh/aw8BDIPGJlif0w2TtfyiTDCiGRg+9v6ch
         iRfgcfwGIQxPnvDdV1FxG+UDY2/GxAX30BBy5wlZZf6+RsUE2pdc1s5zwBLNzgCa53qd
         kk9PsRbuhNvlwUCQDA0IBc1/ixOazX0NBifgSyUqwMwNhrRF8DQdh4Jnv00EYlXVnBXE
         DXbYP2B0tYsR6jXq8UXRdlyNYEmCHl1RmigBixAigB3MHk9MwQoyYdALYncTXjE1igKq
         /H920Xzj/eQs1rZQbcE9b5Zq8XFtueU589qiYkxNtfT/hDiYrcSp2eGv9UKWfCGmlHT9
         Cihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5+Pwjfit8WjR7FMex4KS2EEdjnbtTG8PlsPIqr0O5Pg=;
        b=uG+IDFgQA2qw4V/0DKWJDTYU3QYoHVp7ARN6aLjwvUJBWlWq9u6MmstNyBxw/Raf8d
         cbJo7JTIYUiuCSnwEYifPy/v/piIh1eJcaIoXTMi5U5z8jQI8pPRsJsdVzim21cCFTvg
         ZGOUfyvIU/X9yD9rUPhW2QfdEXVnXHcbTNj1P4qWiYy/ITCQBwImpjyw4yE5B5Fbcnu1
         inVVkWZkLu5tQagSEocvapGn9x7+jaWf+ATK17AAXZGjBUV6+VfFsrFfOryZ9K3yM7Fc
         kitrzZsd2UxpDvAMV1vhxg1uXsWLNEaXUfLUEAcLSBqJpFW9g5NKr+Xc4wL+9vlKwpSR
         ROUw==
X-Gm-Message-State: AOAM5316QGCvt8k8ggOBXxNZbfmO5sJkGedGL5RkRWldRsPJWiP2NM4A
	/e3QYM1saTDJ7PrGSLwz6KnGm4BUfOLlHadvcJ0=
X-Google-Smtp-Source: 
 ABdhPJxaFxfGAekIufpE9A6yoGbhRL+LjoKQfaCkOr2tCrQyF4U1EAG4wKZVNGwWSUAgHOQBopxrs6RtaT2nn30psZY=
X-Received: by 2002:a9f:36e5:: with SMTP id p92mr7878770uap.89.1635019941633;
 Sat, 23 Oct 2021 13:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211023181641.424368-1-raj.khem@gmail.com>
 <16B0BC8D2D865084.16488@lists.openembedded.org>
 <16B0BCF990E2640F.16488@lists.openembedded.org>
 <CANNYZj-eX+=QT30g7e50igBLsVjZB2tvs-0QAKsnfJSuNk-9TQ@mail.gmail.com>
 <CAMKF1sq0Dwfs3e78bj7pfUWFbZ8AdOEFXa6pDi74ricLBHWseA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sq0Dwfs3e78bj7pfUWFbZ8AdOEFXa6pDi74ricLBHWseA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 23 Oct 2021 22:12:10 +0200
Message-ID: 
 <CANNYZj9KuNZX16BwQ2mnjJd24N-Wu1=Lvq7+sQRjN8NaPfnEHg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] librsvg: Disable 64bit atomics in crossbeam for
 rv32
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d2619505cf0abe75"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Oct 2021 20:12:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157311

--000000000000d2619505cf0abe75
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm not sure I understand. This is the snippet that your patch is modifying=
:

    if NO_ATOMIC_CAS.contains(&&*target) {
        println!("cargo:rustc-cfg=3Dcrossbeam_no_atomic_cas");
    }
    if NO_ATOMIC.contains(&&*target) {
        println!("cargo:rustc-cfg=3Dcrossbeam_no_atomic");
        println!("cargo:rustc-cfg=3Dcrossbeam_no_atomic_64");
    } else if NO_ATOMIC_64.contains(&&*target) {
        println!("cargo:rustc-cfg=3Dcrossbeam_no_atomic_64");
    } else {
        // Otherwise, assuming `"max-atomic-width" =3D=3D 64`.
    }

NO_ATOMIC_* lists all come from no_atomic.rs, so if the needed entry is
absent, you should add it there.

Alex



On Sat, 23 Oct 2021 at 21:38, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Sat, Oct 23, 2021 at 11:55 AM Alexander Kanavin <alex.kanavin@gmail.co=
m>
> wrote:
>
>> ... which might not be very easy - maybe adjusting no_atomic.rs is
>> easiest.
>>
>
> The entries there are just fine if the build system does not use the buil=
d
> that utils package uses then it does not respect the entries in that file
>
> Perhaps librsvg might change how it builds this module then we can inject
> the no_atomics feature via cargo toml file or rustc =E2=80=94cfg option
>
>>
>> Alex
>>
>> On Sat, 23 Oct 2021 at 20:40, Alexander Kanavin via
>> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
>> wrote:
>>
>>> Oh, and 'risc32gc' is already there, so our rust's riscv target name
>>> should be adjusted to match that (as that's what upstream is using, so
>>> we'll eliminate a mismatch).
>>>
>>> Alex
>>>
>>> On Sat, 23 Oct 2021 at 20:33, Alexander Kanavin via
>>> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org=
>
>>> wrote:
>>>
>>>> On Sat, 23 Oct 2021 at 20:16, Khem Raj <raj.khem@gmail.com> wrote:
>>>>
>>>>> +         println!("cargo:rustc-cfg=3Dcrossbeam_no_atomic_64");
>>>>> +     } else {
>>>>> +         // Otherwise, assuming `"max-atomic-width" =3D=3D 64`.
>>>>> ++        println!("cargo:rustc-cfg=3Dcrossbeam_no_atomic_64");
>>>>> +     }
>>>>> +SRC_URI:append:riscv32 =3D " file://riscv32-no-64bit-atomics.patch"
>>>>>
>>>>
>>>> The correct way to fix this is to adjust the target list in
>>>> vendor/crossbeam-utils/no_atomic.rs.
>>>>
>>>> Alex
>>>>
>>>>
>>>>
>>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#157308):
>>> https://lists.openembedded.org/g/openembedded-core/message/157308
>>
>>
>>> Mute This Topic: https://lists.openembedded.org/mt/86541048/1686489
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>>> alex.kanavin@gmail.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>>

--000000000000d2619505cf0abe75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;m not sure I understand. This is the snippet th=
at your patch is modifying:</div><div><br></div><div>=C2=A0 =C2=A0 if NO_AT=
OMIC_CAS.contains(&amp;&amp;*target) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 print=
ln!(&quot;cargo:rustc-cfg=3Dcrossbeam_no_atomic_cas&quot;);<br>=C2=A0 =C2=
=A0 }<br>=C2=A0 =C2=A0 if NO_ATOMIC.contains(&amp;&amp;*target) {<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 println!(&quot;cargo:rustc-cfg=3Dcrossbeam_no_atomic&=
quot;);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 println!(&quot;cargo:rustc-cfg=3Dcro=
ssbeam_no_atomic_64&quot;);<br>=C2=A0 =C2=A0 } else if NO_ATOMIC_64.contain=
s(&amp;&amp;*target) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 println!(&quot;cargo:=
rustc-cfg=3Dcrossbeam_no_atomic_64&quot;);<br>=C2=A0 =C2=A0 } else {<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 // Otherwise, assuming `&quot;max-atomic-width&quo=
t; =3D=3D 64`.<br>=C2=A0 =C2=A0 }</div><div><br></div><div>NO_ATOMIC_* list=
s all come from <a href=3D"http://no_atomic.rs">no_atomic.rs</a>, so if the=
 needed entry is absent, you should add it there.</div><div><br></div><div>=
Alex<br></div><div><br></div><div><br></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 23 Oct 2021 at 21:38, K=
hem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><b=
r></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sat, Oct 23, 2021 at 11:55 AM Alexander Kanavin &lt;<a href=3D"ma=
ilto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr"><div>... which might not be very easy - maybe adjusting <a href=
=3D"http://no_atomic.rs" target=3D"_blank">no_atomic.rs</a> is easiest.</di=
v><div></div></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"aut=
o">The entries there are just fine if the build system does not use the bui=
ld that utils package uses then it does not respect the entries in that fil=
e=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Perhaps librsvg =
might change how it builds this module then we can inject the no_atomics fe=
ature via cargo toml file or rustc =E2=80=94cfg option=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><br></div><d=
iv>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Sat, 23 Oct 2021 at 20:40, Alexander Kanavin via <a hre=
f=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembedded.or=
g</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.openembedded.org=
" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>O=
h, and &#39;risc32gc&#39; is already there, so our rust&#39;s riscv target =
name should be adjusted to match that (as that&#39;s what upstream is using=
, so we&#39;ll eliminate a mismatch).</div><div><br></div><div>Alex<br></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Sat, 23 Oct 2021 at 20:33, Alexander Kanavin via <a href=3D"http://lis=
ts.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;alex.=
kanavin=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_bl=
ank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 23 Oct 2021 at 20:16, K=
hem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khe=
m@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0println!(&quot;cargo:rustc-cf=
g=3Dcrossbeam_no_atomic_64&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Otherwise, assuming `&quot;max-atomic=
-width&quot; =3D=3D 64`.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 println!(&quot;cargo:rustc-cfg=3Dcrossbeam_no=
_atomic_64&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>+SRC_URI:append:riscv32 =3D &quot; file://riscv32=
-no-64bit-atomics.patch&quot;<br></blockquote><div><br></div><div>The corre=
ct way to fix this is to adjust the target list in vendor/crossbeam-utils/<=
a href=3D"http://no_atomic.rs" target=3D"_blank">no_atomic.rs</a>. <br></di=
v><div><br></div><div>Alex<br></div></div></div>
<br>
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157308): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157308" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/157308</a></blockquote=
></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86541048/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86541048/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div></div>
</blockquote></div>

--000000000000d2619505cf0abe75--

