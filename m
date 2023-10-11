Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B89CD6E64
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 12:38:01 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.web10.15374.1697027877520537596
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 05:37:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dZa0WaG/;
 spf=pass (domain: gmail.com, ip: 209.85.217.44, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4527d7f7305so2698625137.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 05:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697027876; x=1697632676; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ieJ4du1aj5oGUU75++A1YS3MPeud6E89WUU+iiAE+1k=;
        b=dZa0WaG/+/NdiV7ci2DaW1aqJKuG4xBn/rKDsJzq/QgLCl05VBpbWTtxkqs/MqNbxe
         r19dGeXM/iQVJ+YwkHRgXq/PkRMbwC/tF2yIFqyQQZVrgxrDG+5CSz8j/7KneTGMGM0J
         x7kjnSBfN9RgIpttDXNK7nkVRXtFd79U6obwggW0+mpRYJ3203OQN2Z39VV2AZ+7Z+tk
         r7cXIDc7JEsN8CId/tousYnBLHCkI9efm62ry6WDQzJdffHj+oU+jyi1A8GEZqL6kfM0
         PlQvPmmXSbhVyo1vJZQePAjbgzlZlJzQ9tjo1+4VehtlTlpgC4ZHeqCKioUEOyPL91Fo
         mzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697027876; x=1697632676;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ieJ4du1aj5oGUU75++A1YS3MPeud6E89WUU+iiAE+1k=;
        b=cDuSUMjyiZ3z5HjGNLC5OOqnBJfgC2D8BuguvynAP7j9wvNNIqmNZCzW3uZZsEhNge
         PbMnlUl1ozxC6bRIdms4zHkPHTt3bCVypHCjr9SU+EXyBLr7KsyWOFscRwuECRsk1oGg
         jv8CVOv4Rq9xWocuKytG2lws2kNXopmVND60cqX5whf3HpjSH1nmPmiYUqeukxptbtkG
         0mpkof9Wqw0yfYTl92OVNDNra7zF/dSwPd81PCMVeRDsDv0N3FBXfLA3BrGbsuG4wznA
         hKJOxb2Jj7xLkZRK4stR7Tk9zC1VTkhCxjiwudgG3DxTK2oWo2+tSeiQ5HTWNABL8Y9/
         kpDA==
X-Gm-Message-State: AOJu0YzQYmH+SZv/wwGbIN8NpGsSeB2mWb1Ip3zqBWtg/oRMNj4Ys453
	Vj05M4w2EvHGDTMfY0RB+sbrS1q2bGNQ383032uJFG3E4tJUbw==
X-Google-Smtp-Source: AGHT+IF13kOPB5yTt6AZGn+o4j1IfS/LOOy6DtFqXzm3Jmh6Cf9lfHQU3JExfNggqx2NYEdlx6OatrVjq6LXdQAZiCg=
X-Received: by 2002:a67:e248:0:b0:452:61c4:2bf2 with SMTP id
 w8-20020a67e248000000b0045261c42bf2mr20499481vse.29.1697027876379; Wed, 11
 Oct 2023 05:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <20231011040550.1392831-1-sundeep.kokkonda@windriver.com>
 <CAO5Uq5TK5W8SH5qO=Dc_GtVs+rL1RZNFokdkCaRxEa3nopjHjA@mail.gmail.com> <178D0D506C537908.9719@lists.openembedded.org>
In-Reply-To: <178D0D506C537908.9719@lists.openembedded.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Wed, 11 Oct 2023 14:37:44 +0200
Message-ID: <CA+cAkeqMcsqrRDLTar=XE7mGinWQ7bAnCM5ErCecQoooya8nAQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: reproducibility issue fix
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: Alex Kiernan <alex.kiernan@gmail.com>, sundeep.kokkonda@windriver.com, 
	openembedded-core@lists.openembedded.org, randy.macleod@windriver.com, 
	naveen.gowda@windriver.com, shivaprasad.moodalappa@windriver.com, 
	yash.shinde@windriver.com, deepthi.hemraj@windriver.com, 
	umesh.kallapa@windriver.com
Content-Type: multipart/alternative; boundary="000000000000bee5a10607701724"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 12:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188957

--000000000000bee5a10607701724
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 11 Oct 2023 at 14:27, Frederic Martinsons via lists.openembedded.or=
g
<frederic.martinsons=3Dgmail.com@lists.openembedded.org> wrote:

> very great news to read !
>
>
> On Wed, 11 Oct 2023 at 13:03, Alex Kiernan <alex.kiernan@gmail.com> wrote=
:
>
>> On Wed, Oct 11, 2023 at 5:06=E2=80=AFAM Sundeep KOKKONDA via
>> lists.openembedded.org
>> <sundeep.kokkonda=3Dwindriver.com@lists.openembedded.org> wrote:
>> >
>> > [Yocto#14875]
>> > The '--remap-path-prefix' option removes all references to build
>> directory structure in the debug information within the compiled output =
for
>> Cargo dependencies and the project's binary.
>> > However, some references to build directories remains in the final
>> binary in .rustc section in the form of compressed metadata and this mak=
es
>> the build output dependent on the folder structure of the computer it's
>> compiled on.
>> > So, for reproducible builds, use the configuration option
>> 'remap-debuginfo =3D true' along with the '--remap-path-prefix'.
>> >
>> > Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
>> > ---
>> >  meta/lib/oeqa/selftest/cases/reproducible.py | 2 --
>> >  meta/recipes-devtools/rust/rust_1.70.0.bb    | 1 +
>> >  2 files changed, 1 insertion(+), 2 deletions(-)
>> >
>>
>> Blimey, well done!
>>
>> --
>> Alex Kiernan
>>
>>
>>
We may want to remove the  EXCLUDE_FROM_WORLD in zvariant recipe
<https://git.openembedded.org/openembedded-core/tree/meta-selftest/recipes-=
extended/zvariant/zvariant_3.12.0.bb>
since
it was introduced for reproducibility issue (#15090 which had been marked
as a duplicate of the main rust issue #14875).
What do you think sundeep ?


>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188956):
> https://lists.openembedded.org/g/openembedded-core/message/188956
> Mute This Topic: https://lists.openembedded.org/mt/101890610/6213388
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> frederic.martinsons@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000bee5a10607701724
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 11 Oct 2023 at 14:27, Frederi=
c Martinsons via <a href=3D"http://lists.openembedded.org">lists.openembedd=
ed.org</a> &lt;frederic.martinsons=3D<a href=3D"mailto:gmail.com@lists.open=
embedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">very great n=
ews to read !<div><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, 11 Oct 2023 at 13:03, Alex Kiernan &l=
t;<a href=3D"mailto:alex.kiernan@gmail.com" target=3D"_blank">alex.kiernan@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Wed, Oct 11, 2023 at 5:06=E2=80=AFAM Sundeep KOKKONDA via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;sundeep.kokkonda=3D<a href=3D"mailto:windriver.com@lists.openembedded.o=
rg" target=3D"_blank">windriver.com@lists.openembedded.org</a>&gt; wrote:<b=
r>
&gt;<br>
&gt; [Yocto#14875]<br>
&gt; The &#39;--remap-path-prefix&#39; option removes all references to bui=
ld directory structure in the debug information within the compiled output =
for Cargo dependencies and the project&#39;s binary.<br>
&gt; However, some references to build directories remains in the final bin=
ary in .rustc section in the form of compressed metadata and this makes the=
 build output dependent on the folder structure of the computer it&#39;s co=
mpiled on.<br>
&gt; So, for reproducible builds, use the configuration option &#39;remap-d=
ebuginfo =3D true&#39; along with the &#39;--remap-path-prefix&#39;.<br>
&gt;<br>
&gt; Signed-off-by: Sundeep KOKKONDA &lt;<a href=3D"mailto:sundeep.kokkonda=
@windriver.com" target=3D"_blank">sundeep.kokkonda@windriver.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 meta/lib/oeqa/selftest/cases/reproducible.py | 2 --<br>
&gt;=C2=A0 meta/recipes-devtools/rust/<a href=3D"http://rust_1.70.0.bb" rel=
=3D"noreferrer" target=3D"_blank">rust_1.70.0.bb</a>=C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 2 files changed, 1 insertion(+), 2 deletions(-)<br>
&gt;<br>
<br>
Blimey, well done!<br>
<br>
-- <br>
Alex Kiernan<br>
<br>
<br></blockquote></div></blockquote><div><br></div><div>We may want to remo=
ve the=C2=A0 EXCLUDE_FROM_WORLD in <a href=3D"https://git.openembedded.org/=
openembedded-core/tree/meta-selftest/recipes-extended/zvariant/zvariant_3.1=
2.0.bb">zvariant recipe</a>=C2=A0since it was introduced for reproducibilit=
y issue (#15090 which had been marked as a duplicate of the main rust issue=
 #14875).</div><div>What do you think sundeep ?</div><div><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div class=3D"gmail_quote"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#188956): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/188956" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/188956</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101890610/621=
3388" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101890610/6213388</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:frederic.martinsons@gmail.=
com" target=3D"_blank">frederic.martinsons@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000bee5a10607701724--

