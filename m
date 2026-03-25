Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45759106B538
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 13:17:46 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22358.1774444661751781552
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 06:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HUOyv5BJ;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64e9d72d5f4so2229512d50.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 06:17:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774444661; cv=none;
        d=google.com; s=arc-20240605;
        b=LUmo7E8omOwWFQoiEsNxvDVjOM1SttzLgaaK20WCqZGnx2b6GLlmqjPwJKOBge7Wyc
         fGT8VFVAXLv4hTzJ5xmlXNRoNY0KV1hvSymmy//XHCc+Qet7L1D4ZItFYzh0MOUINSiP
         op/o/03nd4+tb70Rxsoe+SsuDdmeIhdxGmsHRGVilHdNA6RKUb6iWKqisnYb2xFewyA0
         i1Y3zIJUI1Qx7vEA/eZmuxYnbxgD8khgp0SVwCD3g+dX5DCVVyRZE4C08fbQf7qvVgHo
         pdEJDiR2BvhZ8DXB+cldZ0Aai6nqPlsmnOKzmluU6GSYbICIlruYgFSxwYMFyvxlbeZw
         L2nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=D1JFSN3XBzRt5l8c/OyXEroiQGbnwYvfAxJ9uC3jWZA=;
        fh=UM/Gx49N6thVAMMNWfJLfqejhmgNNAYw2CK+Ob0parM=;
        b=BkC2qxSUSfSV+lJTYAQSCX23caxRfgT/FFB7yWE0VAxNM+fsBYs2kv2KQLlzGDfu+C
         w7kmAq7yEULDZr8UdTDiB2s9pF76jbsonuRYb11VmrV6ihPq2hJQpXrkqGlVRXbvlU9j
         oXA+QYbRxn7H7ccpjnGDEVG4/Y9Tt/rnB/Z6plh9CYjXKYK1gQcKW/g+ok13kT/I2hoh
         9LXSj6lW8UYAPDinGoZJqN/gSaYP4DOTONS9LZHzMobtb43Fwtolmor3cIwenUdjjP1W
         x0kE32OO6L4Czb+dT1ypRM9ryIIRnD9qj1fOl3yZ+aEA6pg9mT2bYXUMgS7VbtqfFKHr
         70QQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774444661; x=1775049461; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D1JFSN3XBzRt5l8c/OyXEroiQGbnwYvfAxJ9uC3jWZA=;
        b=HUOyv5BJf+MEBSkFE66ZP3x6B48Duo9TyBV+4IcxMadKQ3iPFXSzQf8akOrZioAYv9
         GjTHhXkHZvzbIJ4mWfb5vRZ425ayhpVbX0FFFaHkMNYd0tq79F7vfUYBoeIxujkctLOE
         GaZRgZXTafNAGO7aBmVsfd6cXgC88u5uIMyWlnkKQsENQfud90LHqsNGCwanboR5N+4Z
         pSx5k16dgnjRjFw25LLQhJmeNFsAIxdb0zxEywKTcfg486nv+MODSu9uR2buP8D1h97H
         NPIWLmNLk3uTugSvQ40kH/RIBmDHzd4vtutdskqTtPWpVALGsg5ApjwpvHtJA+QqwTsI
         Gpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774444661; x=1775049461;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1JFSN3XBzRt5l8c/OyXEroiQGbnwYvfAxJ9uC3jWZA=;
        b=Dtugg9+pLOJlnUkrdtjx1N6rrKpr1e8yQh3DseHB5cLCBQqsRwCF2Cx617st6vVtDS
         3sPOxGVEZDY6aVzDELar2kDeJKAzpf/jIXIT7IIkRyiYa71RJ0/sZvSEHAi8P/PpHY+P
         nzS1COgjJIc67d2HrJ/eVYz7EJyAxSVL8DZDK/QuNto8iuQX1w+Ums0dBCbwoJGKS43G
         kKNozAwQPfMDTohhP7gascai40GmPvODkB2cAhuR4ICsGKiC1AXpPH8ER38xH5SNWt4A
         YqxZurTfJlwH9RYlA+8ja93yTkp44bM0Pecz2M7S8v8DCFu16B5vxE2wtIWZqLrGeOZE
         VwXQ==
X-Gm-Message-State: AOJu0YwLys2fHGKman7xmxnFLhDrVaY8dpiMUSJoCJnwXh13RfqQ3fFi
	RDVipcx/Urg81xzHGTNRHOG98K7PFxk+1tyccZh625KIzhxe9D84N5Xeyu3RHa3x3bftz8dHyj9
	azdogMDOht+0D4VNT/D79eferppKJxNY=
X-Gm-Gg: ATEYQzxGGG9vcT3y63zotO52nozRhhnnZE2Y7z8ACt0ZYolxqc+UGayN/B1H6BHQPOQ
	PyB5GOy7jwjBXCo0ljl1utcqVbrrQhUJXi2E2eNn0oLz/GKuIDRNxpBlT/mA9eoauhuadp4S7Ls
	s3tEmaoyS6s5PG51BdxmupggpAZtt29GDKS6IGgckdrHt/syn893xnI5lf3Dh0EzF9zp8Jk/0w1
	sr0oGpJJTAT5HCFp9itIQFgILPTyQyDlyPAI0sUc3U3pVU2rV96GBCOER5zQXqSkklvrW19Ge36
	gpqTKxDhA3OWe0uPJMYlNukBJHpCZh3onBMnjwQo
X-Received: by 2002:a05:690e:13cf:b0:64a:d74f:258c with SMTP id
 956f58d0204a3-64ee607614cmr3184949d50.5.1774444660736; Wed, 25 Mar 2026
 06:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260325113112.1163632-1-zboszor@gmail.com> <CADkTA4OXFgvu2rsU8XTHQrDMj+6SUj1M5GG+9hzdtK3htHvzqw@mail.gmail.com>
 <5bc1065a-005c-4219-bc69-e191e6be3f78@gmail.com>
In-Reply-To: <5bc1065a-005c-4219-bc69-e191e6be3f78@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 25 Mar 2026 09:17:27 -0400
X-Gm-Features: AQROBzB2jpKwZShkA0Oa__NBaUWgM057-6oxvJ1Bdtm0rwcKSY5qS1u8Kkp42Xk
Message-ID: <CADkTA4MOXYq1xQaGgGnREmgQUTQaEDTskv1aWRyM9zqiXxAuJA@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCH 00/14] Support Python freethreading
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Trevor Gamblin <tgamblin@baylibre.com>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000ad4640064dd91794"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 13:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233911

--000000000000ad4640064dd91794
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 9:13=E2=80=AFAM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=
=A1n <zboszor@gmail.com>
wrote:

> 2026. 03. 25. 14:01 keltez=C3=A9ssel, Bruce Ashfield =C3=ADrta:
> >
> >
> > On Wed, Mar 25, 2026 at 7:31=E2=80=AFAM Zoltan Boszormenyi via
> lists.openembedded.org
> > <http://lists.openembedded.org> <zboszor=3D
> gmail.com@lists.openembedded.org> wrote:
> >
> >     This patchset allows turning on Python freethreading by using
> >     a new DISTRO_FEATURES setting:
> >
> >     DISTRO_FEATURES +=3D "python_freethreading"
> >
> >     and optionally:
> >
> >     DISTRO_FEATURES_NATIVE +=3D "python_freethreading"
> >
> >     The change to python3-dir.bbclass is crucial, as all python module
> >     build helper classes rely on it.
> >
> >     I also added native variants of some settings because another
> >     series against meta-openembedded is needed to complete this one.
> >     In that, the change to the fontforge recipe relies on the native
> >     setting for setting BUILD_LDFLAGS.
> >
> >
> > Looking at those other patches in the series, they don't seem to
> > be conditional on the distro feature.
> >
> > Are those changes valid for a build with and without freethreading ?
>
> Yes!
>
> The main change is in python3-dir.bbclass, and the recipe tweaks
> are just adaptations to the fact that only ${PYTHON_DIR} is needed,
> not ${PYTHON_DIR}${PYTHON_ABI} from that point.
>
> I was thinking that the introductory mail stressed this enough.


Obviously not :)

I didn't get that impression at all from reading the introductory
message or looking at the patches themselves.

You have the overview knowledge of the feature, why it is
useful, how it impacts existing recipes, how the migration would
work, what is the compatibility, etc.

The patch reader doesn't, so that all needs to be clearly
supplied.

Bruce



>
>
> FWIW, less than 30 recipes was spelling the latter out in
> openembedded-core and meta-openembedded combined.
>
> > That's the type of information, along with the benefits of enabling
> > this would be information expected in a 0/N introductory patch.
> >
> > Cheers,
> >
> > Bruce
> >
> >
> >     All of the changes included here were successfully build tested,
> >     except for the gdb-cross-canadian change. That one failed, but
> >     it's included for completeness.
> >
> >     Quite a few of python modules were build tested for native and
> >     target builds, including python3-pytorch from my meta-python-ai
> >     with reduced RDEPENDS because e.g. python3-onnx there failed
> >     to build with freethreading enabled.
> >
> >     All in all, this series at least allows to get things going.
> >     Though maybe not for Yocto 6.0, as it's quite late.
> >
> >     Best regards,
> >     Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
> >
> >     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >     Links: You receive all messages sent to this group.
> >     View/Reply Online (#233874):
> >     https://lists.openembedded.org/g/openembedded-core/message/233874
> >     Mute This Topic: https://lists.openembedded.org/mt/118499141/105081=
0
> >     Group Owner: openembedded-core+owner@lists.openembedded.org
> >     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
> >     Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub
> >     [bruce.ashfield@gmail.com]
> >     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000ad4640064dd91794
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 25, 2026 at 9:13=
=E2=80=AFAM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n &lt;<a href=3D"mailto:zb=
oszor@gmail.com">zboszor@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">2026. 03. 25. 14:01 keltez=C3=A9ssel, Bru=
ce Ashfield =C3=ADrta:<br>
&gt;<br>
&gt;<br>
&gt; On Wed, Mar 25, 2026 at 7:31=E2=80=AFAM Zoltan Boszormenyi via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.openembedded.org</a> <br>
&gt; &lt;<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targe=
t=3D"_blank">http://lists.openembedded.org</a>&gt; &lt;zboszor=3D<a href=3D=
"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists=
.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0This patchset allows turning on Python freethreadin=
g by using<br>
&gt;=C2=A0 =C2=A0 =C2=A0a new DISTRO_FEATURES setting:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0DISTRO_FEATURES +=3D &quot;python_freethreading&quo=
t;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0and optionally:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0DISTRO_FEATURES_NATIVE +=3D &quot;python_freethread=
ing&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0The change to python3-dir.bbclass is crucial, as al=
l python module<br>
&gt;=C2=A0 =C2=A0 =C2=A0build helper classes rely on it.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0I also added native variants of some settings becau=
se another<br>
&gt;=C2=A0 =C2=A0 =C2=A0series against meta-openembedded is needed to compl=
ete this one.<br>
&gt;=C2=A0 =C2=A0 =C2=A0In that, the change to the fontforge recipe relies =
on the native<br>
&gt;=C2=A0 =C2=A0 =C2=A0setting for setting BUILD_LDFLAGS.<br>
&gt;<br>
&gt;<br>
&gt; Looking at those other patches in the series, they don&#39;t seem to<b=
r>
&gt; be conditional=C2=A0on the distro feature.<br>
&gt;<br>
&gt; Are those changes valid for a build with and without freethreading ?<b=
r>
<br>
Yes!<br>
<br>
The main change is in python3-dir.bbclass, and the recipe tweaks<br>
are just adaptations to the fact that only ${PYTHON_DIR} is needed,<br>
not ${PYTHON_DIR}${PYTHON_ABI} from that point.<br>
<br>
I was thinking that the introductory mail stressed this enough.<span class=
=3D"gmail_default" style=3D"font-size:small"></span></blockquote><div><br><=
/div><div><div class=3D"gmail_default" style=3D"font-size:small">Obviously =
not :)</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">I didn&#39;t get t=
hat impression at all from reading the introductory</div><div class=3D"gmai=
l_default" style=3D"font-size:small">message or looking at the patches them=
selves.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">You have the over=
view knowledge of the feature, why it is</div><div class=3D"gmail_default" =
style=3D"font-size:small">useful, how it impacts existing recipes, how the =
migration would</div><div class=3D"gmail_default" style=3D"font-size:small"=
>work, what is the compatibility, etc.=C2=A0</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">The patch reader doesn&#39;t, so that all needs to be =
clearly</div><div class=3D"gmail_default" style=3D"font-size:small">supplie=
d.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><d=
iv class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
FWIW, less than 30 recipes was spelling the latter out in<br>
openembedded-core and meta-openembedded combined.<br>
<br>
&gt; That&#39;s the type of information, along with the benefits of enablin=
g<br>
&gt; this would be information expected in a 0/N introductory patch.<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0All of the changes included here were successfully =
build tested,<br>
&gt;=C2=A0 =C2=A0 =C2=A0except for the gdb-cross-canadian change. That one =
failed, but<br>
&gt;=C2=A0 =C2=A0 =C2=A0it&#39;s included for completeness.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Quite a few of python modules were build tested for=
 native and<br>
&gt;=C2=A0 =C2=A0 =C2=A0target builds, including python3-pytorch from my me=
ta-python-ai<br>
&gt;=C2=A0 =C2=A0 =C2=A0with reduced RDEPENDS because e.g. python3-onnx the=
re failed<br>
&gt;=C2=A0 =C2=A0 =C2=A0to build with freethreading enabled.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0All in all, this series at least allows to get thin=
gs going.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Though maybe not for Yocto 6.0, as it&#39;s quite l=
ate.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Best regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;=C2=A0 =C2=A0 =C2=A0Links: You receive all messages sent to this group.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0View/Reply Online (#233874):<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openemb=
edded-core/message/233874" rel=3D"noreferrer" target=3D"_blank">https://lis=
ts.openembedded.org/g/openembedded-core/message/233874</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0Mute This Topic: <a href=3D"https://lists.openembed=
ded.org/mt/118499141/1050810" rel=3D"noreferrer" target=3D"_blank">https://=
lists.openembedded.org/mt/118499141/1050810</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0Group Owner: <a href=3D"mailto:openembedded-core%2B=
owner@lists.openembedded.org" target=3D"_blank">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openembedded-core%252B=
owner@lists.openembedded.org" target=3D"_blank">openembedded-core%2Bowner@l=
ists.openembedded.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Unsubscribe: <a href=3D"https://lists.openembedded.=
org/g/openembedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-core/unsub</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"mailto:bruce.ashfield@gmail.com" target=
=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; -- <br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await =
thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt;<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000ad4640064dd91794--

