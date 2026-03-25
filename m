Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61271109C036
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 16:27:29 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27075.1774456041513473134
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 09:27:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oszkq14d;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64eb84d1e37so43953d50.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 09:27:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774456040; cv=none;
        d=google.com; s=arc-20240605;
        b=DvqrT9aHZuxewOqCyp4fM0U5gtAecYQcK7JziyZjcSNvj6TabJLCAGoT6a6KCu3DBt
         emWmFM2Ii3koxln7Wlgz+ItEI0ic3T4Y0z4TYqhsdOqphPn13uJloMSYNsxAxmXEkkQ6
         PS5FdESIG5+uXgQoqp1EFPIbwhVmeC7CV0lXsxIIz6IXu+3yJLSRpVl2DRMxMqdPvsJE
         fRrPjBvLKnsyc/cSfwT7tMAkvZAplUD+0xLLCp2uMnldG23uKM8tlBxqhqyBpgOepARG
         xV286i/s5bmh6RpZDFCVTQAOMnM/NMzZ6axfURnJGzhbkY/p2F1H5eSWP4Mhm3ybDuA0
         K05g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1uqZ6+zPALNJDKHfOGZFcrlcbZbbuglzu5f4UZnAf+k=;
        fh=oRVqbEVkwxP+vm2heb7UxnU1cRzwZUzGU+oeKdpf2jA=;
        b=SJ9aM+ZUasFYFu9zfrE+qOAWftuX0dWcFLLo8T9K6eQE2vseLkqNhsKe40JvbkbHyo
         G3lTBexhwNAxPHteXYgZjtEAxjlYmbVPf4Weafkwr5UizJE3+ewPt1ZMY/R5UvqV4mWd
         /NTchZk3ReiKJkumE2jGh3ItF7HSgL+lKjRryYZ4HPfz93Z2kZ+WFQ+odNpz6aZWKKVY
         cu8w8TBq1VUk8xcdwshswBuPT0UTn2AAGWMItrG2uVqHgiDu5AZq0m6QFob+pJJ4Zt9B
         CvqMdTwvbqWgKF+OV8BYnJJ3+Pr7V0KunxB5qXQmxQRpbVHaZKqxdrLMeiJ37+4XQzxS
         9Sbg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774456040; x=1775060840; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1uqZ6+zPALNJDKHfOGZFcrlcbZbbuglzu5f4UZnAf+k=;
        b=oszkq14ddqhmwSM6Cp2bMnzB1NentcHfV1Fv+B0Y7pY0IAPi8u/Ec0xoSIsLy5CrQW
         M2H2Ty9wnQ3gxC0ZQwcQtThLhlnJtyZEPpGVU51AcaYmChQAKI1MaO/8BPdwRQl8jTi7
         LgziwHjbt6giSSUV72JsofpEeKMXSTANWqZiaHXLyWWq+cvM3XirM7Opi70g6H8Dcoo7
         9Sebm+EaOXWaowAqTTZ0ZgcnB2Mrj4MZ5U3ApaVdnxJWGsoBrwEei6PfAqZPkdnJjuH/
         YyrpJkfBPlavNSEwLi9X+M3YjKSp3+SuZ/lKd6UKRzQGABX8i/0c9TEkyywRDccKWnBd
         Q8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774456040; x=1775060840;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uqZ6+zPALNJDKHfOGZFcrlcbZbbuglzu5f4UZnAf+k=;
        b=D4fvMRJBpZfUFOtBgmUSp3yeosEMheZKLhgXsACybgU5NIRuxqqFgYKt1PS7oESuIe
         Bu6UBQInb4/WKrrxplAhH5g2q5HPc+vpHEYS3h2URUAu1ayWN0ItYP5+Yho7rKTmDazu
         Js1lsm/Otc1os6j44gECY9NYz0aMS51FBc7e790dRfSw9VefTlfr2n8Wia+i+UGXL7wA
         QG33UOdsVFPM+EWF1bY2IK2sNXpLuK2zxRuV+vty8fQghAvfpwQaAVo8e/DW/6WUfp6C
         OEj2DNkqhDAdlKQ5RNRZ9kDPHom50jl76+MGXz3npv/TagXboPVmRUL3uvDghZ3VX/yK
         nP4A==
X-Forwarded-Encrypted: i=1; AJvYcCUV+W1VuN84a+HP5MG4LgUiXhoNjCeQ7hhmNsaC2NrimXzyQaqIr2B/equ6TWUbBCRuRQDPIpDkVXTUlXDS+HALVA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwzDIy6NQTsn9laWuzuxO7ziXPfB6ThAMd6DunTgpBgcO17+WBc
	vk6aVqIcD71EscpCA38ElLBApnXzOWXmuGLMLcuCp6V/VQebImI+Xb3aNVEjJj0eRYrv+EVzpI2
	7wyjbb+S8bJswdHpF+NRazlJ/64hRX3g=
X-Gm-Gg: ATEYQzwRR4ykrzuyy8GZ+qaQe+b/WVlkkVv1tHGif3lKWUu/lfGvmnuNsA5La5FeAbY
	Nuf7gUiSVH5qAgxbIWukpX/ttDZqOpCfWa9+yWy6SqhDqM+4W8DyaaTnB4XNffD5XVqnAjxA9MN
	OADe/2dNgN1mf5iGJPokj1OdHKCNCiirS4ebiT5Q0eRnplLXX3gFrMsShQEmwxGbaaSIBmI23tE
	5oMG1apMwXrTClVFmtO2fH2tuM6tdK+hE3Vt42chvh/SUIoWHgMPDAt8unWJ93ia6fVhMk4AF+1
	ccweoTO/ks16CLeGu7SASb2K6OP78M/rrTe1Rb28a5abVnnkLcyprfi7TW7DkJYeGXgbsKcI3rQ
	LUyOLrQoSCYBE2jA24KPkb8Qc
X-Received: by 2002:a05:690e:12cc:b0:64e:f106:60ea with SMTP id
 956f58d0204a3-64ef106695fmr1683395d50.44.1774456040486; Wed, 25 Mar 2026
 09:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260325073954.1176537-1-khem.raj@oss.qualcomm.com>
 <CANNYZj9AkosvmmNePiALvwVkR2rsthvsGy3ARLTmWxKh=t7OaQ@mail.gmail.com>
 <CAMKF1soXSQxLU3eRCejvHH5HORG9xRMxObU+svnAdd10JAs37Q@mail.gmail.com> <2169b9ae-3e23-47b8-94cd-09f985f8c8e3@cherry.de>
In-Reply-To: <2169b9ae-3e23-47b8-94cd-09f985f8c8e3@cherry.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Mar 2026 09:26:53 -0700
X-Gm-Features: AaiRm53MapRlgsTPrTjFJyK07CdhrVZ15MHBC35ErFk7xELjLCa3V0zDN1wZhAg
Message-ID: <CAMKF1sr+ip+swiV7JMsFjX-Gk8qDji-MVhmjJTB+wCUrQD7Brw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa-tools-native: fix do_compile failure
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org, 
	Changqing Li <changqing.li@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000f67d18064ddbbd54"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 16:27:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233924

--000000000000f67d18064ddbbd54
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 7:53=E2=80=AFAM Quentin Schulz <quentin.schulz@cher=
ry.de>
wrote:

> Hi Khem,
>
> On 3/25/26 3:46 PM, Khem Raj via lists.openembedded.org wrote:
> > On Wed, Mar 25, 2026 at 5:52=E2=80=AFAM Alexander Kanavin <
> alex.kanavin@gmail.com>
> > wrote:
> >
> >> On Wed, 25 Mar 2026 at 08:40, Khem Raj via lists.openembedded.org
> >> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >>> Fix do_compile failure:
> >>> ../sources/mesa-26.0.1/src/panfrost/lib/kmod/pan_kmod.c:7:10: fatal
> >> error: xf86drm.h: No such file or directory
> >>
> >>> -DEPENDS +=3D "libclc-native spirv-tools-native
> >> spirv-llvm-translator-native"
> >>> +DEPENDS +=3D "libclc-native spirv-tools-native
> >> spirv-llvm-translator-native libdrm-native"
> >>
> >> Should this be in PACKAGECONFIG for panfrost?
> >>
> >
> > I have opengl-only image to build for odroid-c4 which does not have
> > panfrost.
> >
>
> It "has", due to building mesa-tools-native which enables building
> panfrost tools unconditionally.
>
> panfrost PACKAGECONFIG may enable building the gallium driver (if
> combined with gallium PACKAGECONFIG), the vulkan (panvk) driver (if
> combined with vulkan PACKAGECONFIG) and/or the panfrost tools (if
> combined with tools PACKAGECONFIG).
>
> So it's a missing dependency for the panfrost tools and should be added
> as dependency to the panfrost tools (see my other mail). I don't think
> you need it if you're not building the panfrost tools.
>

It uses mali binary driver not lima, and panfrost is not in distro features
or packageconfig for mesa-gl


>
> Cheers,
> Quentin
>

--000000000000f67d18064ddbbd54
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 25, 2026=
 at 7:53=E2=80=AFAM Quentin Schulz &lt;<a href=3D"mailto:quentin.schulz@che=
rry.de" target=3D"_blank">quentin.schulz@cherry.de</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hi Khem,<br>
<br>
On 3/25/26 3:46 PM, Khem Raj via <a href=3D"http://lists.openembedded.org" =
rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; On Wed, Mar 25, 2026 at 5:52=E2=80=AFAM Alexander Kanavin &lt;<a href=
=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com=
</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt;&gt; On Wed, 25 Mar 2026 at 08:40, Khem Raj via <a href=3D"http://lists=
.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.=
org</a><br>
&gt;&gt; &lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org"=
 target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;&gt;&gt; Fix do_compile failure:<br>
&gt;&gt;&gt; ../sources/mesa-26.0.1/src/panfrost/lib/kmod/pan_kmod.c:7:10: =
fatal<br>
&gt;&gt; error: xf86drm.h: No such file or directory<br>
&gt;&gt;<br>
&gt;&gt;&gt; -DEPENDS +=3D &quot;libclc-native spirv-tools-native<br>
&gt;&gt; spirv-llvm-translator-native&quot;<br>
&gt;&gt;&gt; +DEPENDS +=3D &quot;libclc-native spirv-tools-native<br>
&gt;&gt; spirv-llvm-translator-native libdrm-native&quot;<br>
&gt;&gt;<br>
&gt;&gt; Should this be in PACKAGECONFIG for panfrost?<br>
&gt;&gt;<br>
&gt; <br>
&gt; I have opengl-only image to build for odroid-c4 which does not have<br=
>
&gt; panfrost.<br>
&gt; <br>
<br>
It &quot;has&quot;, due to building mesa-tools-native which enables buildin=
g <br>
panfrost tools unconditionally.<br>
<br>
panfrost PACKAGECONFIG may enable building the gallium driver (if <br>
combined with gallium PACKAGECONFIG), the vulkan (panvk) driver (if <br>
combined with vulkan PACKAGECONFIG) and/or the panfrost tools (if <br>
combined with tools PACKAGECONFIG).<br>
<br>
So it&#39;s a missing dependency for the panfrost tools and should be added=
 <br>
as dependency to the panfrost tools (see my other mail). I don&#39;t think =
<br>
you need it if you&#39;re not building the panfrost tools.<br></blockquote>=
<div><br></div><div>It uses mali binary driver not lima, and panfrost is no=
t in distro features or packageconfig for mesa-gl</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
Quentin<br>
</blockquote></div></div>
</div>

--000000000000f67d18064ddbbd54--

