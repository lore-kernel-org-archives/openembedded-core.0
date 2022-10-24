Return-Path: <wltu@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E58BFECAAA1
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 16:05:08 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web08.21070.1666627504727653563
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 09:05:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=fGCGUOL8;
 spf=pass (domain: google.com, ip: 209.85.219.51, mailfrom: wltu@google.com)
Received: by mail-qv1-f51.google.com with SMTP id c8so6071599qvn.10
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 09:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9Y68KkM1dy95IeqeJTr4M+x1JPjjah9AXhRIONzm/DI=;
        b=fGCGUOL8lbwFg8sRVJsQ9KwGR4Wt/5uvJG2WUm9ZnLJVcS36fA7lrW/3wO+oDYu2nt
         9hZ+YoDNEqTkP416Fis+h9o3z31rD3R/1ZQUxcQffp6YTPNzfwOFK9h83Y5orEYFhUX6
         Mt0HLgzikHVfPcX/VDFuTwyiet8h/U++OvWzhjdZ86C/dGPO4CfWhlQOtSxgRGkNJ5T5
         tHEqa0R1971AIy/BgwWugTcO46Xnr2E80zmX7Vrd2OlS/zFLdA93UK8izeCoi+ASuVHx
         8lHbvL7/GvBmEktL+cznFh1KqaXFHKAPaCIkR7G3wndXFmO8Z6cFlJyOEuwWhuWck3p+
         8v5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Y68KkM1dy95IeqeJTr4M+x1JPjjah9AXhRIONzm/DI=;
        b=q2DbY9caYkku1Ql0KmL0YE4Qbvrah4LKKUOpWq+odiz9Gb7ruLtlVp8FTJ6rpqo66R
         UetQgx/ykbAyEV66+PSt2vQU1DFbFZE3hu3JN+P3k/LUO9BiSKwXXU1yZmPx2Ywmystq
         tVcHMHyDITmiWdMWXjoVnHIRYRmPePKiomkEb+PONU7aMYcmu/M388yyhm9yBYB1wBu0
         CvYY1Ye+EgqB+/izaNNL6mw2127KjO07jovcnRA98vX07x1awe5MLr+SepwMFHvT71+y
         lgIzIijDqp7hN/DwWs0giYeSOVSyuJOSFJXCj9om0fWLn0nCLpNkwx55ni7wtrd+sNUc
         xTLw==
X-Gm-Message-State: ACrzQf1GWEPEUOaacjODK7OotmHJBPIuqlfjxINYEU/MfYPNO6bxW7e4
	xTCCt7QCdYqAihIkTEM0LUzgE2lVNpX1K7bvISt2pg==
X-Google-Smtp-Source: AMsMyM4BDOkfDpyc19rm3WRCxH2vKV5WBWqA4u+vBmw2S3CHnN8sN/s0q4P6p7OZkhX8qjibCq0ssVf6k6euc3bSN0o=
X-Received: by 2002:a05:6214:20a9:b0:4bb:614c:da6c with SMTP id
 9-20020a05621420a900b004bb614cda6cmr9159569qvd.56.1666627498828; Mon, 24 Oct
 2022 09:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <IAS2.1666358226748943797.wkAx@lists.openembedded.org>
 <CAHwn2Xni=DChyNRGfrQ=qVgrEK3b=0AhRMx+MAONYcWW9-V_=A@mail.gmail.com>
 <C7082AE8-28B1-4277-BEC3-F7C6C14E7100@arm.com> <CAHwn2Xkgw-fAmy92oLWOUG8=K0-3dVwYXsLKEqR-WtGoHHdc1g@mail.gmail.com>
 <CABC0sH3LFm48+buev6gFFAAoDT2SLqR-r-rndSjx+eU54H5=1w@mail.gmail.com>
In-Reply-To: <CABC0sH3LFm48+buev6gFFAAoDT2SLqR-r-rndSjx+eU54H5=1w@mail.gmail.com>
From: Willy Tu <wltu@google.com>
Date: Mon, 24 Oct 2022 09:04:47 -0700
Message-ID: <CAHwn2X=cbxMhD3rZ5s+1e85sCbjfX3hb0r=dQiKyZLqw4AkM2g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: Install internal header/lib files
To: Tristan Lelong <tlelong@google.com>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000000aae2b05ebc9f4e4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 16:05:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172110

--0000000000000aae2b05ebc9f4e4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am testing it out again and it seems like it does install to the target .

```
$ find -name libssh.a
./tmp/sysroots-components/armv7a/openssh/usr/lib/libssh.a
./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/image/usr/lib/libs=
sh.a
./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/sysroot-destdir/us=
r/lib/libssh.a
./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/packages-split/ope=
nssh-staticdev/usr/lib/libssh.a
./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/openssh-9.0p1/libs=
sh.a
./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/package/usr/lib/li=
bssh.a
./tmp/work/armv7a-openbmc-linux-gnueabi/hiba/1.0+gitAUTOINC+3199239c6a-r0/r=
ecipe-sysroot/usr/lib/libssh.a
```
We don't want this, right?

I'll have to try to figure it out and fix it.

Willy Tu

On Mon, Oct 24, 2022 at 7:57 AM Tristan Lelong <tlelong@google.com> wrote:

>
>
> On Fri, Oct 21, 2022 at 6:22 PM Willy Tu <wltu@google.com> wrote:
>
>> Hi Ross,
>>
>> Thanks for the feedback.
>>
>> Can you point to the right repo to update? Just to make sure that I
>> understand the concern, you are not referring to
>> https://github.com/openembedded/meta-openembedded/pull/597, right? I am
>> making changes to
>> http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-connect=
ivity/openssh/openssh_9.0p1.bb which
>> I thought is part of oe-core.
>>
>> @Tristan Lelong <tlelong@google.com> is the maintainer for hiba and is
>> okay with the change. Do you have any suggestions on installing it to ju=
st
>> the sysroot in openssh while using it from the hiba recipe? I was not ab=
le
>> to do that when I tried it.
>>
>
> This was indeed discussed previously in another version of the patch, it
> seemed the best way to expose OpenSSH's internal files was via the devel
> package (not installed on the target), rather than hook into another
> package's syroot.
>
> The OpenSSH static libraries and header files are currently not made
> officially available because the API is not considered stable enough, but
> exporting them in OE for HIBA (gated by a PACKAGECONFIG) in order to
> support HIBA is fine.
>
>
>>
>> Thanks,
>>
>> Willy Tu
>>
>>
>>
>>
>> On Fri, Oct 21, 2022 at 7:59 AM Ross Burton <Ross.Burton@arm.com> wrote:
>>
>>> Hi,
>>>
>>> oe-core doesn=E2=80=99t accept merge requests on the github mirrors, an=
d you
>>> pushed to meta-oe, which is a different repository.
>>>
>>> >> + if ${@bb.utils.contains('DISTRO_FEATURES', 'opensshinternals',
>>> 'true', 'false', d)}; then
>>>
>>> This should be a PACKAGECONFIG, as it=E2=80=99s not a distro-wide setti=
ng.
>>>
>>> >> + install -d ${D}${includedir}/ssh
>>> >> + install -d ${D}${includedir}/ssh/openbsd-compat
>>> >> + install -m0644 ${S}/*.h ${D}${includedir}/ssh
>>> >> + install -m0644 ${S}/openbsd-compat/*.h
>>> ${D}${includedir}/ssh/openbsd-compat
>>> >> +
>>> >> + install -d ${D}${libdir}
>>> >> + install -m0644 ${S}/libssh.a ${D}${libdir}
>>> >> + install -m0644 ${S}/openbsd-compat/libopenbsd-compat.a ${D}${libdi=
r}
>>> >> + fi
>>>
>>> So you=E2=80=99re installing bits of the SSH source into the *target* p=
ackages
>>> because one piece of software needs the build tree. This is clearly an
>>> unsupported use of openssh, as the hiba build instructions literally sa=
y
>>> =E2=80=9Cbuild openssh, then point hiba=E2=80=99s configure at that bui=
ld tree=E2=80=9D.  If
>>>
>>> I suggest a better approach would be to have a bbappend in your layer
>>> which adds the files you need to *just the sysroot*, so the target pack=
ages
>>> are unaltered.
>>>
>>> Ross
>>
>>
>
> --
> Tristan Lelong | SRE | tlelong@google.com |
>

--0000000000000aae2b05ebc9f4e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am testing it out again and it seems like it does instal=
l to the target .<div><br></div><div>```</div><div>$ find -name libssh.a<br=
>./tmp/sysroots-components/armv7a/openssh/usr/lib/libssh.a<br>./tmp/work/ar=
mv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/image/usr/lib/libssh.a<br>./tmp=
/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/sysroot-destdir/usr/lib=
/libssh.a<br>./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/packa=
ges-split/openssh-staticdev/usr/lib/libssh.a<br>./tmp/work/armv7a-openbmc-l=
inux-gnueabi/openssh/9.0p1-r0/openssh-9.0p1/libssh.a<br>./tmp/work/armv7a-o=
penbmc-linux-gnueabi/openssh/9.0p1-r0/package/usr/lib/libssh.a<br>./tmp/wor=
k/armv7a-openbmc-linux-gnueabi/hiba/1.0+gitAUTOINC+3199239c6a-r0/recipe-sys=
root/usr/lib/libssh.a<br></div><div>```</div><div>We don&#39;t want this, r=
ight?</div><div><br></div><div>I&#39;ll have to try to figure it out and fi=
x it.</div><div><br></div><div>Willy Tu</div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 24, 2022 at 7:57 A=
M Tristan Lelong &lt;<a href=3D"mailto:tlelong@google.com">tlelong@google.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 21, 2022 at 6:22 PM Wil=
ly Tu &lt;<a href=3D"mailto:wltu@google.com" target=3D"_blank">wltu@google.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr">Hi Ross,<div><br></div><div>Thanks for the feedback.=C2=
=A0</div><div><br></div><div>Can you point to the right repo to update? Jus=
t to make sure that I understand the concern, you are not referring to=C2=
=A0<a href=3D"https://github.com/openembedded/meta-openembedded/pull/597" t=
arget=3D"_blank">https://github.com/openembedded/meta-openembedded/pull/597=
</a>, right? I am making=C2=A0changes=C2=A0to=C2=A0<a href=3D"http://cgit.o=
penembedded.org/openembedded-core/tree/meta/recipes-connectivity/openssh/op=
enssh_9.0p1.bb" target=3D"_blank">http://cgit.openembedded.org/openembedded=
-core/tree/meta/recipes-connectivity/openssh/openssh_9.0p1.bb</a>=C2=A0whic=
h I thought is part of oe-core.</div><div><br></div><div><a class=3D"gmail_=
plusreply" id=3D"m_-1448650543004561091m_7860125911750327824plusReplyChip-0=
" href=3D"mailto:tlelong@google.com" target=3D"_blank">@Tristan Lelong</a>=
=C2=A0is the maintainer for hiba and is okay with the change. Do you have a=
ny suggestions on installing it to just the sysroot in openssh while using =
it from the hiba recipe? I was not able to do that when I tried it.<br></di=
v></div></blockquote><div><br></div><div>This was indeed discussed previous=
ly in another version of the patch, it seemed the best way to expose OpenSS=
H&#39;s internal files was via the devel package (not installed on the targ=
et), rather than hook into another package&#39;s syroot.</div><div><br></di=
v><div>The OpenSSH static libraries and header files are currently not made=
 officially available because the API is not considered stable enough, but =
exporting them in OE for HIBA (gated by a PACKAGECONFIG) in order to suppor=
t HIBA is fine.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr"><div></div><div><br></div><div>Thanks,</div><=
div><br></div><div>Willy Tu</div><div><br></div><div><br></div></div><br><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, =
Oct 21, 2022 at 7:59 AM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.c=
om" target=3D"_blank">Ross.Burton@arm.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
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

--0000000000000aae2b05ebc9f4e4--

