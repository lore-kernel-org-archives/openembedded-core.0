Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 931EEC83F2E
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 16:57:16 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.99.1693501025875845170
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 09:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ToaaMl/o;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2b9d07a8d84so18210091fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 09:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693501024; x=1694105824; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cubDSgw9d1P5LFTSnH/v0LCefKJc/39znQ2xmKn98O0=;
        b=ToaaMl/osQm2Jzp8Ub/LWZKnDx0lHijnKOni5HwBGM3Xo+R4u+IC/Ol/SWcuDVAM8c
         dhbfViGHjO3ZT8ufMhJjsJhFwu+Bv2+ogZSEMBT4F2s29sX04y1lYqPuFzr7sdD07kVT
         +eMBzDaIs0GvlZhleXJmLxjqQAyhBTZrmKC6FVULb8Uul0VSZ3OThB4MPzGHOQLihyrm
         nTtgM2HV71z3AWtOGio5DpvqfsSNJgbXh/j0A9RlX1Hf/6UsRMDWkoU/5+tMF+Jfq4cE
         20dW+QF46dD+RloOEdauTqJ5sdkhJV4Wd966iGO9W6yIDpq4acdUJGOChDXZ1KB2ZeY4
         o3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693501024; x=1694105824;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cubDSgw9d1P5LFTSnH/v0LCefKJc/39znQ2xmKn98O0=;
        b=BO0QrC6imdv5ZXl+FB8sxeZdJC30AQa1jHLvplnXdA2E2IAXKPS6jBSVQFxgTM/IDV
         GhE4DG12uH1mCI/9e7Qfr0eeXsJUe2dXCbqmNV/4eZ1rt/bupI8K07SGrlEH6cOJr8yg
         rAoBcf5F9yOEZpLvfdgizeu5KVcVh9wUEC1OASc1awBVkNhjBQz+vfF6c1/0snY9cGUW
         4tVAMpPRReG43Wpwt8OvHWvgPsOH7z+nnXKMaSkOLclWR0xPDEd355zk8P2Lg+dCY6yK
         CDQ0kawuySvA9PLkr6UuokQObpY8YgJDnuquDVxgngohpNZ/fMth9QYBxbx4zRt4U86W
         IK6w==
X-Gm-Message-State: AOJu0YwRQFC33qzbkUxj1IWCYNOhtDKu0xgVOLGlK4QszGHFw3FcKRx2
	iSaBDHOuwYZINS9Na4wbFJiY4EmeWkCsjwVKFuHg9e0AmuY=
X-Google-Smtp-Source: AGHT+IHawhSN2zcS6HU94IGtkKHe25qpGchJk9ukZDGYef1O3+2PQsPS63tlpADuYyugQr6fXbk68VMvz0N5q+AIVmw=
X-Received: by 2002:a2e:9cce:0:b0:2bd:a5e:2255 with SMTP id
 g14-20020a2e9cce000000b002bd0a5e2255mr4683073ljj.28.1693501023674; Thu, 31
 Aug 2023 09:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230831133803.30556-1-reatmon@ti.com> <CA+cAkep_j4sfhHUW_GRoO0O+3Qb_TTrULcyznVW2w+ATYTjApQ@mail.gmail.com>
 <41f4cfe3-d84b-a97e-3f9a-bf944cace5b2@ti.com>
In-Reply-To: <41f4cfe3-d84b-a97e-3f9a-bf944cace5b2@ti.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Thu, 31 Aug 2023 18:56:51 +0200
Message-ID: <CA+cAkepOV1bPKLJUh_TVVMHtCa7qkiwiFM6DYKw+zktjngmbwQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] kernel.bbclass: Add file exist checks around removes
To: Ryan Eatmon <reatmon@ti.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f1676a06043aee32"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 16:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186983

--000000000000f1676a06043aee32
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 31 Aug 2023 at 15:49, Ryan Eatmon <reatmon@ti.com> wrote:

>
>
> On 8/31/2023 8:47 AM, Fr=C3=A9d=C3=A9ric Martinsons wrote:
> > Hello,
> >
> > On Thu, 31 Aug 2023 at 15:38, Ryan Eatmon via lists.openembedded.org
> > <http://lists.openembedded.org> <reatmon=3Dti.com@lists.openembedded.or=
g
> > <mailto:ti.com@lists.openembedded.org>> wrote:
> >
> >     The latest 6.5 kernels do not appear to create the source file in
> >     ${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source so the
> >     recipe errors out when trying to remove it.  Simple fix is to add a=
n
> >     exists check around the call.
> >
> >     Signed-off-by: Ryan Eatmon <reatmon@ti.com <mailto:reatmon@ti.com>>
> >     ---
> >       meta/classes-recipe/kernel.bbclass | 8 ++++++--
> >       1 file changed, 6 insertions(+), 2 deletions(-)
> >
> >     diff --git a/meta/classes-recipe/kernel.bbclass
> >     b/meta/classes-recipe/kernel.bbclass
> >     index acb43bd4d5..4df052061b 100644
> >     --- a/meta/classes-recipe/kernel.bbclass
> >     +++ b/meta/classes-recipe/kernel.bbclass
> >     @@ -454,8 +454,12 @@ kernel_do_install() {
> >              unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> >              if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
> >                      oe_runmake DEPMOD=3Decho
> >     MODLIB=3D${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}
> >     INSTALL_FW_PATH=3D${D}${nonarch_base_libdir}/firmware modules_insta=
ll
> >     -               rm
> >     "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
> >     -               rm
> >     "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
> >     +               if [ -e
> >     "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build" ]; the=
n
> >     +                       rm
> >     "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
> >     +               fi
> >     +               if [ -e
> >     "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source" ]; th=
en
> >     +                       rm
> >     "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
> >     +               fi
> >                      # Remove empty module directories to prevent QA
> issues
> >                      find
> >     "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" -type
> >     d -empty -delete
> >              else
> >     --
> >     2.17.1
> >
> >
> > My 2 cents: the "-f" switch makes rm ignore nonexistent files , and it
> > will make a shorter patch ;)
>
> If that is the group consensus I can submit a v2.  Anyone else feel that
> way?
>
> Don't know if a "group consensus" can exist here. (it is a public list
where anyone can raise remarks) and there is no "vote".

Mine was not a "cons" for you patch, what you did is completely valid,
I just wanted to say that there was a more concise way of doing it.

Feel free to send a v2 if you think my remark is relevant.


> >
> >     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >     Links: You receive all messages sent to this group.
> >     View/Reply Online (#186974):
> >     https://lists.openembedded.org/g/openembedded-core/message/186974
> >     <https://lists.openembedded.org/g/openembedded-core/message/186974>
> >     Mute This Topic: https://lists.openembedded.org/mt/101073782/621338=
8
> >     <https://lists.openembedded.org/mt/101073782/6213388>
> >     Group Owner: openembedded-core+owner@lists.openembedded.org
> >     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
> >     Unsubscribe:
> >     https://lists.openembedded.org/g/openembedded-core/unsub
> >     <https://lists.openembedded.org/g/openembedded-core/unsub>
> >     [frederic.martinsons@gmail.com <mailto:frederic.martinsons@gmail.co=
m
> >]
> >     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
>

--000000000000f1676a06043aee32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, 31 Aug 2023 at 15:49, Ryan Ea=
tmon &lt;<a href=3D"mailto:reatmon@ti.com">reatmon@ti.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 8/31/2023 8:47 AM, Fr=C3=A9d=C3=A9ric Martinsons wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; On Thu, 31 Aug 2023 at 15:38, Ryan Eatmon via <a href=3D"http://lists.=
openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.o=
rg</a> <br>
&gt; &lt;<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targe=
t=3D"_blank">http://lists.openembedded.org</a>&gt; &lt;reatmon=3D<a href=3D=
"mailto:ti.com@lists.openembedded.org" target=3D"_blank">ti.com@lists.opene=
mbedded.org</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:ti.com@lists.openembedded.org" target=3D"=
_blank">ti.com@lists.openembedded.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The latest 6.5 kernels do not appear to create the =
source file in<br>
&gt;=C2=A0 =C2=A0 =C2=A0${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION=
}/source so the<br>
&gt;=C2=A0 =C2=A0 =C2=A0recipe errors out when trying to remove it.=C2=A0 S=
imple fix is to add an<br>
&gt;=C2=A0 =C2=A0 =C2=A0exists check around the call.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Ryan Eatmon &lt;<a href=3D"mailto:re=
atmon@ti.com" target=3D"_blank">reatmon@ti.com</a> &lt;mailto:<a href=3D"ma=
ilto:reatmon@ti.com" target=3D"_blank">reatmon@ti.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0meta/classes-recipe/kernel.bbclass | 8 +++++=
+--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01 file changed, 6 insertions(+), 2 deletions=
(-)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta/classes-recipe/kernel.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/classes-recipe/kernel.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0index acb43bd4d5..4df052061b 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta/classes-recipe/kernel.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta/classes-recipe/kernel.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -454,8 +454,12 @@ kernel_do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unset CFLAGS CPPFLAGS =
CXXFLAGS LDFLAGS MACHINE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grep -q -i -e &#39=
;^CONFIG_MODULES=3Dy$&#39; .config); then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 oe_runmake DEPMOD=3Decho<br>
&gt;=C2=A0 =C2=A0 =C2=A0MODLIB=3D${D}${nonarch_base_libdir}/modules/${KERNE=
L_VERSION}<br>
&gt;=C2=A0 =C2=A0 =C2=A0INSTALL_FW_PATH=3D${D}${nonarch_base_libdir}/firmwa=
re modules_install<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0rm<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;${D}${nonarch_base_libdir}/modules/${KERNEL_V=
ERSION}/build&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0rm<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;${D}${nonarch_base_libdir}/modules/${KERNEL_V=
ERSION}/source&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if [ -e<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;${D}${nonarch_base_libdir}/modules/${KERNEL_V=
ERSION}/build&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;${D}${nonarch_base_libdir}/modules/${KERNEL_V=
ERSION}/build&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if [ -e<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;${D}${nonarch_base_libdir}/modules/${KERNEL_V=
ERSION}/source&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;${D}${nonarch_base_libdir}/modules/${KERNEL_V=
ERSION}/source&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 # Remove empty module directories to prevent QA issues<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 find<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;${D}${nonarch_base_libdir}/modules/${KERNEL_V=
ERSION}/kernel&quot; -type<br>
&gt;=C2=A0 =C2=A0 =C2=A0d -empty -delete<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.17.1<br>
&gt; <br>
&gt; <br>
&gt; My 2 cents: the &quot;-f&quot; switch makes=C2=A0rm=C2=A0ignore=C2=A0n=
onexistent files , and it <br>
&gt; will make a shorter patch ;)<br>
<br>
If that is the group consensus I can submit a v2.=C2=A0 Anyone else feel th=
at <br>
way?<br>
<br></blockquote><div>Don&#39;t know if a &quot;group consensus&quot; can e=
xist here. (it is a public list</div><div>where anyone can raise remarks) a=
nd there is no &quot;vote&quot;.</div><div><br></div><div>Mine was not a &q=
uot;cons&quot; for you patch, what you did is completely valid,</div><div>I=
 just wanted to say that there was a more concise way of doing it.</div><di=
v><br></div><div>Feel free to send a v2 if you think my remark=C2=A0is rele=
vant.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;=C2=A0 =C2=A0 =C2=A0Links: You receive all messages sent to this group.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0View/Reply Online (#186974):<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openemb=
edded-core/message/186974" rel=3D"noreferrer" target=3D"_blank">https://lis=
ts.openembedded.org/g/openembedded-core/message/186974</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.openembedded.org/g/ope=
nembedded-core/message/186974" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-core/message/186974</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Mute This Topic: <a href=3D"https://lists.openembed=
ded.org/mt/101073782/6213388" rel=3D"noreferrer" target=3D"_blank">https://=
lists.openembedded.org/mt/101073782/6213388</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.openembedded.org/mt/10=
1073782/6213388" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/101073782/6213388</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Group Owner: <a href=3D"mailto:openembedded-core%2B=
owner@lists.openembedded.org" target=3D"_blank">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openembedded-core%252B=
owner@lists.openembedded.org" target=3D"_blank">openembedded-core%2Bowner@l=
ists.openembedded.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Unsubscribe:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openemb=
edded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.openembedded.org/g/ope=
nembedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/g/openembedded-core/unsub</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"mailto:frederic.martinsons@gmail.com" t=
arget=3D"_blank">frederic.martinsons@gmail.com</a> &lt;mailto:<a href=3D"ma=
ilto:frederic.martinsons@gmail.com" target=3D"_blank">frederic.martinsons@g=
mail.com</a>&gt;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
-- <br>
Ryan Eatmon=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=
=3D"mailto:reatmon@ti.com" target=3D"_blank">reatmon@ti.com</a><br>
-----------------------------------------<br>
Texas Instruments, Inc.=C2=A0 -=C2=A0 LCPD=C2=A0 -=C2=A0 MGTS<br>
</blockquote></div></div>

--000000000000f1676a06043aee32--

