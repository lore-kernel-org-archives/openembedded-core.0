Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB09C433EF
	for <webhook@archiver.kernel.org>; Sat, 23 Oct 2021 21:12:16 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web12.11617.1635023535499199026
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 14:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iMtSb3w4;
 spf=pass (domain: gmail.com, ip: 209.85.222.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id bp7so7907152qkb.12
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 14:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r7DTMz3dZHl5aAwiiHoF2V/TsX/Qfd+3RGD1hgFG76U=;
        b=iMtSb3w4RBQhnxwrpz0lV/yzf7A8zoJoQCkdkI9HHy+k80dgGHtnV0XK3xLcGbfobV
         mqRErYi/qsDllD8yYmkgcw/t+7t7LMHEC6sZx7KuuXcgjoKAnCG27L9p/+Pc2o1x7a7k
         wWcD7lmVDkDeNJzsoSugw8gmCDmbJkZfETTfwsmub5Yxw3TXjSsvNv4+3tB9uP1XhGKg
         hu9G73blkTLmCxJNLNyVxZaRK0qozah4dnbqONP8nUw3b9x2gkOoh34HVyfqrxQVPeGH
         Fe0RKHJkZwIbTo3UZV7mBWPU1d9luOsshjhyBHD6Uj+K69Yrix61WVcCr25OZtfXto1p
         WdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r7DTMz3dZHl5aAwiiHoF2V/TsX/Qfd+3RGD1hgFG76U=;
        b=sNbo6VxPAOLGvGW7lj0oPVqDlG8kFV2NaY3TgGEpOgRchCgP19a637SV0XmhThRuWB
         8EmmNFv+LKu4IdW72/Nqxhj1qzOpKbEc1CkGfTW4fEPELimsDTQCSoBhKy33iScyqo6q
         ip30VIySip7i6Ovp3Puga9gq+tB7sn45FpvgUmgItshdZLtz50Ae9R1kf+CiRtNCm+sI
         b3ooRKH4HTjF6V2DuVJqpE0sUBEumCeV+yRZZ++IllqJMegcYVrvUB3r9+JbxK7w7BvF
         U+JywLVcBwgZ2sNX6Go0xuUWeXHfAnT0ymI4qXmpe+ak3NbzTEehXXv0xixZ74TRw8j/
         Xh3g==
X-Gm-Message-State: AOAM533YXvjgpPETQXrKy9sBET7Exl5GiO9uJ17rlHNh1sKhXl7q3AOL
	sAgg4wMosFZeXE2KDCWttJabHVXvgRRvrDlKYHs=
X-Google-Smtp-Source: 
 ABdhPJwzGmkN2NcR2drq22sGlV7eNf43DQkQb0yoT0fG004emgBHBU4B/peS+sN+DKS7ta63bbmIqmJq4hgw96lAJMc=
X-Received: by 2002:ae9:de07:: with SMTP id s7mr6235217qkf.47.1635023534401;
 Sat, 23 Oct 2021 14:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211023181641.424368-1-raj.khem@gmail.com>
 <16B0BC8D2D865084.16488@lists.openembedded.org>
 <16B0BCF990E2640F.16488@lists.openembedded.org>
 <CANNYZj-eX+=QT30g7e50igBLsVjZB2tvs-0QAKsnfJSuNk-9TQ@mail.gmail.com>
 <CAMKF1sq0Dwfs3e78bj7pfUWFbZ8AdOEFXa6pDi74ricLBHWseA@mail.gmail.com>
 <CANNYZj9KuNZX16BwQ2mnjJd24N-Wu1=Lvq7+sQRjN8NaPfnEHg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9KuNZX16BwQ2mnjJd24N-Wu1=Lvq7+sQRjN8NaPfnEHg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 23 Oct 2021 14:11:48 -0700
Message-ID: 
 <CAMKF1spbzRoRRJX5rdkMxs8zR0xKw1a9A+2YXKwTeLCuM51=7A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] librsvg: Disable 64bit atomics in crossbeam for
 rv32
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f7ab1e05cf0b949c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Oct 2021 21:12:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157314

--000000000000f7ab1e05cf0b949c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 23, 2021 at 1:12 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> I'm not sure I understand.
>

try MACHINE=3Dqemuriscv32 bitbake librsvg
and try out your suggestion and if it works then lets rework this patch.


This is the snippet that your patch is modifying:
>
>     if NO_ATOMIC_CAS.contains(&&*target) {
>         println!("cargo:rustc-cfg=3Dcrossbeam_no_atomic_cas");
>     }
>     if NO_ATOMIC.contains(&&*target) {
>         println!("cargo:rustc-cfg=3Dcrossbeam_no_atomic");
>         println!("cargo:rustc-cfg=3Dcrossbeam_no_atomic_64");
>     } else if NO_ATOMIC_64.contains(&&*target) {
>         println!("cargo:rustc-cfg=3Dcrossbeam_no_atomic_64");
>     } else {
>         // Otherwise, assuming `"max-atomic-width" =3D=3D 64`.
>     }
>
> NO_ATOMIC_* lists all come from no_atomic.rs, so if the needed entry is
> absent, you should add it there.
>

> Alex
>
>
>
> On Sat, 23 Oct 2021 at 21:38, Khem Raj <raj.khem@gmail.com> wrote:
>
>>
>>
>> On Sat, Oct 23, 2021 at 11:55 AM Alexander Kanavin <
>> alex.kanavin@gmail.com> wrote:
>>
>>> ... which might not be very easy - maybe adjusting no_atomic.rs is
>>> easiest.
>>>
>>
>> The entries there are just fine if the build system does not use the
>> build that utils package uses then it does not respect the entries in th=
at
>> file
>>
>> Perhaps librsvg might change how it builds this module then we can injec=
t
>> the no_atomics feature via cargo toml file or rustc =E2=80=94cfg option
>>
>>>
>>> Alex
>>>
>>> On Sat, 23 Oct 2021 at 20:40, Alexander Kanavin via
>>> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org=
>
>>> wrote:
>>>
>>>> Oh, and 'risc32gc' is already there, so our rust's riscv target name
>>>> should be adjusted to match that (as that's what upstream is using, so
>>>> we'll eliminate a mismatch).
>>>>
>>>> Alex
>>>>
>>>> On Sat, 23 Oct 2021 at 20:33, Alexander Kanavin via
>>>> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.or=
g>
>>>> wrote:
>>>>
>>>>> On Sat, 23 Oct 2021 at 20:16, Khem Raj <raj.khem@gmail.com> wrote:
>>>>>
>>>>>> +         println!("cargo:rustc-cfg=3Dcrossbeam_no_atomic_64");
>>>>>> +     } else {
>>>>>> +         // Otherwise, assuming `"max-atomic-width" =3D=3D 64`.
>>>>>> ++        println!("cargo:rustc-cfg=3Dcrossbeam_no_atomic_64");
>>>>>> +     }
>>>>>> +SRC_URI:append:riscv32 =3D " file://riscv32-no-64bit-atomics.patch"
>>>>>>
>>>>>
>>>>> The correct way to fix this is to adjust the target list in
>>>>> vendor/crossbeam-utils/no_atomic.rs.
>>>>>
>>>>> Alex
>>>>>
>>>>>
>>>>>
>>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#157308):
>>>> https://lists.openembedded.org/g/openembedded-core/message/157308
>>>
>>>
>>>> Mute This Topic: https://lists.openembedded.org/mt/86541048/1686489
>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[
>>>> alex.kanavin@gmail.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>
>>>>

--000000000000f7ab1e05cf0b949c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace,monospace"><br></div></div><div><br></div><div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Oct 23,=
 2021 at 1:12 PM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>I&#39;m=
 not sure I understand. </div></div></blockquote><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><div class=3D"gmail_default" style=3D"font-family:monos=
pace,monospace">try MACHINE=3Dqemuriscv32 bitbake librsvg</div><div class=
=3D"gmail_default" style=3D"font-family:monospace,monospace">and try out yo=
ur=C2=A0suggestion=C2=A0and if it works then lets rework this patch.</div><=
br></div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr"><div dir=3D"auto">This is the snippet that you=
r patch is modifying:</div><div><br></div><div>=C2=A0 =C2=A0 if NO_ATOMIC_C=
AS.contains(&amp;&amp;*target) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 println!(&q=
uot;cargo:rustc-cfg=3Dcrossbeam_no_atomic_cas&quot;);<br>=C2=A0 =C2=A0 }<br=
>=C2=A0 =C2=A0 if NO_ATOMIC.contains(&amp;&amp;*target) {<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 println!(&quot;cargo:rustc-cfg=3Dcrossbeam_no_atomic&quot;);<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 println!(&quot;cargo:rustc-cfg=3Dcrossbeam_n=
o_atomic_64&quot;);<br>=C2=A0 =C2=A0 } else if NO_ATOMIC_64.contains(&amp;&=
amp;*target) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 println!(&quot;cargo:rustc-cf=
g=3Dcrossbeam_no_atomic_64&quot;);<br>=C2=A0 =C2=A0 } else {<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 // Otherwise, assuming `&quot;max-atomic-width&quot; =3D=
=3D 64`.<br>=C2=A0 =C2=A0 }</div><div><br></div><div>NO_ATOMIC_* lists all =
come from <a href=3D"http://no_atomic.rs" target=3D"_blank">no_atomic.rs</a=
>, so if the needed entry is absent, you should add it there.</div></div></=
blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r"><div><br></div><div>Alex<br></div><div><br></div><div><br></div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, =
23 Oct 2021 at 21:38, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div><br></div><div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Oct 23, 2021 at 11:=
55 AM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" targe=
t=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>... which might no=
t be very easy - maybe adjusting <a href=3D"http://no_atomic.rs" target=3D"=
_blank">no_atomic.rs</a> is easiest.</div><div></div></div></blockquote><di=
v dir=3D"auto"><br></div><div dir=3D"auto">The entries there are just fine =
if the build system does not use the build that utils package uses then it =
does not respect the entries in that file=C2=A0</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Perhaps librsvg might change how it builds this mod=
ule then we can inject the no_atomics feature via cargo toml file or rustc =
=E2=80=94cfg option=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div dir=3D"ltr"><div><br></div><div>Alex<br></div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 23 Oct 202=
1 at 20:40, Alexander Kanavin via <a href=3D"http://lists.openembedded.org"=
 target=3D"_blank">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D=
"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists=
.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"ltr"><div>Oh, and &#39;risc32gc&#39; is alread=
y there, so our rust&#39;s riscv target name should be adjusted to match th=
at (as that&#39;s what upstream is using, so we&#39;ll eliminate a mismatch=
).</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 23 Oct 2021 at 20:33, Ale=
xander Kanavin via <a href=3D"http://lists.openembedded.org" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.c=
om@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Sat, 23 Oct 2021 at 20:16, Khem Raj &lt;<a href=3D"mailto:raj.k=
hem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0println!(&quot;cargo:rustc-cfg=3Dcrossbeam_no_atomic_64&quot;)=
;<br>
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
</blockquote></div></div>
</div>

--000000000000f7ab1e05cf0b949c--

