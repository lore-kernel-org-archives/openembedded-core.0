Return-Path: <wltu@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEEEEECAAA1
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 17:07:28 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web09.691.1666631245252244284
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 10:07:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=c2x7jgTN;
 spf=pass (domain: google.com, ip: 209.85.160.180, mailfrom: wltu@google.com)
Received: by mail-qt1-f180.google.com with SMTP id l28so5983670qtv.4
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 10:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zuOKIQQ7t8PSa0fjY3gwLB8lnsF03FQxeUsEb0aGu6I=;
        b=c2x7jgTNhwFx7xMPya1PlwEMxz63Ji93eKTK60Acb//nMJbFFqWVjwQpfl2I3uSelo
         TyrdcG0wh3YBqckqx2BjkGcOy6HtH75PAaII8a37SC8B3XokPrbyR4ZgjqwDwWzT89k4
         1lDyAjahPX5r7wGER/qv5L1tCcpq6hEWg73JLs8BunzoXzyQpyYouVHbLiX1e6kAuflM
         y8N+x+8ekP9p0xrKGiZBHj+Zy7XuYOEPIPuR9fhXUDKNvZkVuQAMVuwDOFs8Q9KEsGat
         qCg6kytkVjHZ/N1LlcMH0CtFJGSKv8VFCQI9vhwbEeRFli6SXMOsH3LR7tZPKHDyGxXy
         Nbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zuOKIQQ7t8PSa0fjY3gwLB8lnsF03FQxeUsEb0aGu6I=;
        b=aPTCzxUQv+LHsxzMBi4smN4M+grNAu5YmqdxKrzqoyMXRfQ1Z88hNckm++lOrYGywx
         NTA3hxG/MRAm8nnSjlE/VgiHozbl4RVNkaKoQlMrty/n7S3g//XgnYyVOYvVcV40FIT0
         JmZc4q4HbFxGuu98fcSnGPnSO9tJKx/I7FUJWjdFQmoGhCBPG5w3wAYcUZK2dEy4j8AE
         4uacEMP9scZy6Nx7mck+0TM9MZjo1dAiObZO+B7S36xxjU+IWO6u6bsOCOuvd9zS7fmd
         PpG1Ii2kjMmuCe1pPImLd6RSdqOGEclB2fp35gQ4M9XFsqnaU9hjNgYN6Sp7T6KRYN+b
         3Qvg==
X-Gm-Message-State: ACrzQf3PscAx2H6A2eOxN/Nx06P26bEFI55mSga1vQFogUyajsbV9/Tj
	xcoyCV9C4gl5ph87yYDrqXNPw8ltDodynyDg5l9b0Q==
X-Google-Smtp-Source: AMsMyM7KRYysVt/bLdDJToGKR0b3N9AHIuxSUzZgKl/WMlfiiq9gl5eLuMxPERB25q2r3PHx799fOUohDu59+GFGQO4=
X-Received: by 2002:a05:622a:15d1:b0:39c:f1da:fe0e with SMTP id
 d17-20020a05622a15d100b0039cf1dafe0emr28111080qty.662.1666631244209; Mon, 24
 Oct 2022 10:07:24 -0700 (PDT)
MIME-Version: 1.0
References: <IAS2.1666358226748943797.wkAx@lists.openembedded.org>
 <CAHwn2Xni=DChyNRGfrQ=qVgrEK3b=0AhRMx+MAONYcWW9-V_=A@mail.gmail.com>
 <C7082AE8-28B1-4277-BEC3-F7C6C14E7100@arm.com> <CAHwn2Xkgw-fAmy92oLWOUG8=K0-3dVwYXsLKEqR-WtGoHHdc1g@mail.gmail.com>
 <CABC0sH3LFm48+buev6gFFAAoDT2SLqR-r-rndSjx+eU54H5=1w@mail.gmail.com> <17210CE2C7C78501.808@lists.openembedded.org>
In-Reply-To: <17210CE2C7C78501.808@lists.openembedded.org>
From: Willy Tu <wltu@google.com>
Date: Mon, 24 Oct 2022 10:07:13 -0700
Message-ID: <CAHwn2XnCcQSZJY8qts8Nne5Mc5HYqVaM3um3mq2pyp7w8CB5hA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: Install internal header/lib files
To: wltu@google.com
Cc: Tristan Lelong <tlelong@google.com>, Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000048c52505ebcad3db"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 17:07:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172111

--00000000000048c52505ebcad3db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Testing it out more and it seems like the current change is fine in that
regard.

I was building it against an OpenBMC image which include the change and the
header and libssh.a files doesn't show up in the image itself

```
./tmp/work/izumi-openbmc-linux-gnueabi/obmc-phosphor-image
```
doesn't have those files. I believe that's what we are looking for?

Willy Tu

On Mon, Oct 24, 2022 at 9:05 AM Willy Tu via lists.openembedded.org <wltu=
=3D
google.com@lists.openembedded.org> wrote:

> I am testing it out again and it seems like it does install to the target=
 .
>
> ```
> $ find -name libssh.a
> ./tmp/sysroots-components/armv7a/openssh/usr/lib/libssh.a
>
> ./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/image/usr/lib/li=
bssh.a
>
> ./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/sysroot-destdir/=
usr/lib/libssh.a
>
> ./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/packages-split/o=
penssh-staticdev/usr/lib/libssh.a
>
> ./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/openssh-9.0p1/li=
bssh.a
>
> ./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/package/usr/lib/=
libssh.a
>
> ./tmp/work/armv7a-openbmc-linux-gnueabi/hiba/1.0+gitAUTOINC+3199239c6a-r0=
/recipe-sysroot/usr/lib/libssh.a
> ```
> We don't want this, right?
>
> I'll have to try to figure it out and fix it.
>
> Willy Tu
>
> On Mon, Oct 24, 2022 at 7:57 AM Tristan Lelong <tlelong@google.com> wrote=
:
>
>>
>>
>> On Fri, Oct 21, 2022 at 6:22 PM Willy Tu <wltu@google.com> wrote:
>>
>>> Hi Ross,
>>>
>>> Thanks for the feedback.
>>>
>>> Can you point to the right repo to update? Just to make sure that I
>>> understand the concern, you are not referring to
>>> https://github.com/openembedded/meta-openembedded/pull/597, right? I am
>>> making changes to
>>> http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-connec=
tivity/openssh/openssh_9.0p1.bb which
>>> I thought is part of oe-core.
>>>
>>> @Tristan Lelong <tlelong@google.com> is the maintainer for hiba and is
>>> okay with the change. Do you have any suggestions on installing it to j=
ust
>>> the sysroot in openssh while using it from the hiba recipe? I was not a=
ble
>>> to do that when I tried it.
>>>
>>
>> This was indeed discussed previously in another version of the patch, it
>> seemed the best way to expose OpenSSH's internal files was via the devel
>> package (not installed on the target), rather than hook into another
>> package's syroot.
>>
>> The OpenSSH static libraries and header files are currently not made
>> officially available because the API is not considered stable enough, bu=
t
>> exporting them in OE for HIBA (gated by a PACKAGECONFIG) in order to
>> support HIBA is fine.
>>
>>
>>>
>>> Thanks,
>>>
>>> Willy Tu
>>>
>>>
>>>
>>>
>>> On Fri, Oct 21, 2022 at 7:59 AM Ross Burton <Ross.Burton@arm.com> wrote=
:
>>>
>>>> Hi,
>>>>
>>>> oe-core doesn=E2=80=99t accept merge requests on the github mirrors, a=
nd you
>>>> pushed to meta-oe, which is a different repository.
>>>>
>>>> >> + if ${@bb.utils.contains('DISTRO_FEATURES', 'opensshinternals',
>>>> 'true', 'false', d)}; then
>>>>
>>>> This should be a PACKAGECONFIG, as it=E2=80=99s not a distro-wide sett=
ing.
>>>>
>>>> >> + install -d ${D}${includedir}/ssh
>>>> >> + install -d ${D}${includedir}/ssh/openbsd-compat
>>>> >> + install -m0644 ${S}/*.h ${D}${includedir}/ssh
>>>> >> + install -m0644 ${S}/openbsd-compat/*.h
>>>> ${D}${includedir}/ssh/openbsd-compat
>>>> >> +
>>>> >> + install -d ${D}${libdir}
>>>> >> + install -m0644 ${S}/libssh.a ${D}${libdir}
>>>> >> + install -m0644 ${S}/openbsd-compat/libopenbsd-compat.a
>>>> ${D}${libdir}
>>>> >> + fi
>>>>
>>>> So you=E2=80=99re installing bits of the SSH source into the *target* =
packages
>>>> because one piece of software needs the build tree. This is clearly an
>>>> unsupported use of openssh, as the hiba build instructions literally s=
ay
>>>> =E2=80=9Cbuild openssh, then point hiba=E2=80=99s configure at that bu=
ild tree=E2=80=9D.  If
>>>>
>>>> I suggest a better approach would be to have a bbappend in your layer
>>>> which adds the files you need to *just the sysroot*, so the target pac=
kages
>>>> are unaltered.
>>>>
>>>> Ross
>>>
>>>
>>
>> --
>> Tristan Lelong | SRE | tlelong@google.com |
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172110):
> https://lists.openembedded.org/g/openembedded-core/message/172110
> Mute This Topic: https://lists.openembedded.org/mt/94475279/6858837
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> wltu@google.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000048c52505ebcad3db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Testing it out more and it seems like the current change i=
s fine in that regard.<div><br></div><div>I was building it against an Open=
BMC image which include=C2=A0the change and the header and libssh.a files d=
oesn&#39;t show up in the image itself</div><div><br></div><div>```</div><d=
iv>./tmp/work/izumi-openbmc-linux-gnueabi/obmc-phosphor-image<br></div><div=
>```</div><div>doesn&#39;t have those files. I believe that&#39;s what we a=
re looking for?</div><div><br></div><div>Willy Tu</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 24, 2022=
 at 9:05 AM Willy Tu via <a href=3D"http://lists.openembedded.org">lists.op=
enembedded.org</a> &lt;wltu=3D<a href=3D"mailto:google.com@lists.openembedd=
ed.org">google.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">I am testing it o=
ut again and it seems like it does install to the target .<div><br></div><d=
iv>```</div><div>$ find -name libssh.a<br>./tmp/sysroots-components/armv7a/=
openssh/usr/lib/libssh.a<br>./tmp/work/armv7a-openbmc-linux-gnueabi/openssh=
/9.0p1-r0/image/usr/lib/libssh.a<br>./tmp/work/armv7a-openbmc-linux-gnueabi=
/openssh/9.0p1-r0/sysroot-destdir/usr/lib/libssh.a<br>./tmp/work/armv7a-ope=
nbmc-linux-gnueabi/openssh/9.0p1-r0/packages-split/openssh-staticdev/usr/li=
b/libssh.a<br>./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/open=
ssh-9.0p1/libssh.a<br>./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1=
-r0/package/usr/lib/libssh.a<br>./tmp/work/armv7a-openbmc-linux-gnueabi/hib=
a/1.0+gitAUTOINC+3199239c6a-r0/recipe-sysroot/usr/lib/libssh.a<br></div><di=
v>```</div><div>We don&#39;t want this, right?</div><div><br></div><div>I&#=
39;ll have to try to figure it out and fix it.</div><div><br></div><div>Wil=
ly Tu</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Mon, Oct 24, 2022 at 7:57 AM Tristan Lelong &lt;<a href=3D"ma=
ilto:tlelong@google.com" target=3D"_blank">tlelong@google.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Oct 21, 2022 at 6:22 PM Willy Tu &lt;<a hre=
f=3D"mailto:wltu@google.com" target=3D"_blank">wltu@google.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr">Hi Ross,<div><br></div><div>Thanks for the feedback.=C2=A0</div><div><b=
r></div><div>Can you point to the right repo to update? Just to make sure t=
hat I understand the concern, you are not referring to=C2=A0<a href=3D"http=
s://github.com/openembedded/meta-openembedded/pull/597" target=3D"_blank">h=
ttps://github.com/openembedded/meta-openembedded/pull/597</a>, right? I am =
making=C2=A0changes=C2=A0to=C2=A0<a href=3D"http://cgit.openembedded.org/op=
enembedded-core/tree/meta/recipes-connectivity/openssh/openssh_9.0p1.bb" ta=
rget=3D"_blank">http://cgit.openembedded.org/openembedded-core/tree/meta/re=
cipes-connectivity/openssh/openssh_9.0p1.bb</a>=C2=A0which I thought is par=
t of oe-core.</div><div><br></div><div><a class=3D"gmail_plusreply" id=3D"m=
_105228145854463339m_-1448650543004561091m_7860125911750327824plusReplyChip=
-0" href=3D"mailto:tlelong@google.com" target=3D"_blank">@Tristan Lelong</a=
>=C2=A0is the maintainer for hiba and is okay with the change. Do you have =
any suggestions on installing it to just the sysroot in openssh while using=
 it from the hiba recipe? I was not able to do that when I tried it.<br></d=
iv></div></blockquote><div><br></div><div>This was indeed discussed previou=
sly in another version of the patch, it seemed the best way to expose OpenS=
SH&#39;s internal files was via the devel package (not installed on the tar=
get), rather than hook into another package&#39;s syroot.</div><div><br></d=
iv><div>The OpenSSH static libraries and header files are currently not mad=
e officially available because the API is not considered stable enough, but=
 exporting them in OE for HIBA (gated by a PACKAGECONFIG) in order to suppo=
rt HIBA is fine.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div dir=3D"ltr"><div></div><div><br></div><div>Thanks,</div>=
<div><br></div><div>Willy Tu</div><div><br></div><div><br></div></div><br><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri,=
 Oct 21, 2022 at 7:59 AM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.=
com" target=3D"_blank">Ross.Burton@arm.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
oe-core doesn=E2=80=99t accept merge requests on the github mirrors, and yo=
u pushed to meta-oe, which is a different repository.<br>
<br>
&gt;&gt; + if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;opensshi=
nternals&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
<br>
This should be a PACKAGECONFIG, as it=E2=80=99s not a distro-wide setting.<=
br>
<br>
&gt;&gt; + install -d ${D}${includedir}/ssh<br>
&gt;&gt; + install -d ${D}${includedir}/ssh/openbsd-compat<br>
&gt;&gt; + install -m0644 ${S}/*.h ${D}${includedir}/ssh<br>
&gt;&gt; + install -m0644 ${S}/openbsd-compat/*.h ${D}${includedir}/ssh/ope=
nbsd-compat<br>
&gt;&gt; +<br>
&gt;&gt; + install -d ${D}${libdir}<br>
&gt;&gt; + install -m0644 ${S}/libssh.a ${D}${libdir}<br>
&gt;&gt; + install -m0644 ${S}/openbsd-compat/libopenbsd-compat.a ${D}${lib=
dir}<br>
&gt;&gt; + fi<br>
<br>
So you=E2=80=99re installing bits of the SSH source into the *target* packa=
ges because one piece of software needs the build tree. This is clearly an =
unsupported use of openssh, as the hiba build instructions literally say =
=E2=80=9Cbuild openssh, then point hiba=E2=80=99s configure at that build t=
ree=E2=80=9D.=C2=A0 If <br>
<br>
I suggest a better approach would be to have a bbappend in your layer which=
 adds the files you need to *just the sysroot*, so the target packages are =
unaltered.<br>
<br>
Ross</blockquote></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div style=3D"line-height:1.5em;padding-top:10px;margin-t=
op:10px;color:rgb(85,85,85);font-family:sans-serif;font-size:small"><span s=
tyle=3D"border-width:2px 0px 0px;border-style:solid;border-color:rgb(213,15=
,37);padding-top:2px;margin-top:2px">Tristan Lelong=C2=A0|</span><span styl=
e=3D"border-width:2px 0px 0px;border-style:solid;border-color:rgb(51,105,23=
2);padding-top:2px;margin-top:2px">=C2=A0SRE=C2=A0|</span><span style=3D"bo=
rder-width:2px 0px 0px;border-style:solid;border-color:rgb(0,153,57);paddin=
g-top:2px;margin-top:2px">=C2=A0<a href=3D"mailto:tlelong@google.com" targe=
t=3D"_blank">tlelong@google.com</a>=C2=A0|</span><span style=3D"border-widt=
h:2px 0px 0px;border-style:solid;border-color:rgb(238,178,17);padding-top:2=
px;margin-top:2px">=C2=A0</span></div></div></div></div>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#172110): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/172110" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/172110</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94475279/6858=
837" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94475279/6858837</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:wltu@google.com" target=3D=
"_blank">wltu@google.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000048c52505ebcad3db--

