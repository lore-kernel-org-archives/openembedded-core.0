Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEBEBC61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 09:56:17 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9044.1787738168594584026
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 02:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Wxddm9gL;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c16794450aeso79730566b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 02:56:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787738167; cv=none;
        d=google.com; s=arc-20260327;
        b=l80kvROCALp2hEE+cGDwyVgxM71AG5JgPpj82i2sAzfsET6L7FHblzAUYIXeSE3sew
         7NDtzWjLBScA/ADA5/uqDxD3GFpEO3C/H4FnfsJHrRdbLE5ykCjxuxT/mF5g+hEiHfWG
         ziVqs6a+eidJfzO/M3Z4y3OLHZm5rXiMaidv6mTuFwI7zv+ZHLp2J7JRXErTDSXHaQDP
         gCBJ+1Djpw7Tl/03DeuBXO9dG4eDvS50GPH7qgO8L1Chszd2myqdMsVmROY5z7Pkfsw2
         8PJ/G7VU0gtYcHPF8l6NRxQANEke8DbqrnyuhcUwiiBmFVoK30FNNkYIpXNbmpgaIRkU
         jkmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1oZGG8XAKfOMWvDqfpSheUInu+DAa0SP7/4Xa3iFLjg=;
        fh=0eHbBMYN4d9ygsufdCiXujxzE8pTWhrPpExyuuMehK8=;
        b=WG0EtoxWRlGBFPUKLaKGJXNP+cEOW9yhzZeQleKmmQLvIw5w85hYQgmwQ+8ceIAFpq
         LMRG49lAsgF3Pssthmq8JgsIcbtjSMEMJKZ4ozCTWuDHODe+8KKS4IZ9WkC5I9dddnaL
         VHGIM72xTXLAVZwTCWgu4bClzrFLq7YBQAf8VUeI1/F3JfExGaW1QI4HnLLwn2HeN0M5
         nE8i+YFij5tLCSE/P5NY9UHfKnitbtV0FajpYjQdp45J3Wg9/sPfYWCUgIL+Azmoq78E
         o7upVhaqXD+bpKUtgXzRd7w3p4m6g1MmDSKGDYk1Dg7SsaExjrfJGKpyin9jwLfZb80A
         qzYw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787738167; x=1788342967; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1oZGG8XAKfOMWvDqfpSheUInu+DAa0SP7/4Xa3iFLjg=;
        b=Wxddm9gLlkpY0/C4XPJe+z46jD3fp/JZw0Z6wJ2Zoa5N7f2SEudIc8aaTM3Aq15Ez/
         5ljJf4Vc8GUV4YYQRR0u17oJbK6JNktnGbkRqJFjbDpCCBcTcUruY2vPeQo1ncPCb40D
         wsz8k7hybLKk6EwXzH35UoydUWz6ezKy894KVlCoWA5C9RXWz7tZIv0WWslwCQ23yDU2
         PQ50kLXTzyUg7XyaSarwVQ9Z2ok1B/S6uW8dFBKewHmkey6XXawiON4J6Oq2NEzXi3yg
         ClsFKW3tigU6FIt3aYRukFRgxXJwA6uIGndTeEUdj+InhmlotRvvH8YEJyflyudyZXoa
         eshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787738167; x=1788342967;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1oZGG8XAKfOMWvDqfpSheUInu+DAa0SP7/4Xa3iFLjg=;
        b=XI6IBaGRadNCYf+yaeiECZ/vgWXbI4NgWpMlxISgdAnxP9NcItzd62/vh3mJZLOfiT
         yaAv65DhtF4cSWQlxLKzfXzVB9g/zdUH02S9+o7ltG0kFpHGOoUjWgeFfwbhjSUpNs8y
         6sqnNTVGIbhfBJ4S2xBf0QFsDeGLnweGpsivNu4d1QulznKeIdFC8BjZKwip/hy8Qaz+
         xbQWmDQ59RFmh9ckdHpTQJ9ZFZt2NcxTr4ht8d6I8SBsI/cnKK7C2+9VDRRbfdiEFDtK
         8DbRyjonRfmIJupF3/J1pATKwfZEy7GB6FCKk2iVFnrs5yLxvBSgxpEBSdVB8XxxGYp/
         SKAA==
X-Gm-Message-State: AFuF++mssJHV5lbPsTe59+z+of7KiLTiCwGRtN11rZwwfwbJo7xxaa08
	FbsCxwH2g2RzSrabdBEDcPyKDuDGvwI4UPuo+IyTGf8bcFp8yq/aoACnH/CsF4L4NaVj0u4CAM3
	4tfszzU0E2sgg0KF5xcEQv2DdBflrXN8=
X-Gm-Gg: AR+sD10QVRNtf85E8PJShAIMyClE1vz13J+LQ9q1yjlWMqvb/d5yX2Cj0HHUnlVxStS
	8MZrrUuhhjXOIyBN63jjeuZSka0+e95FNDx8NKlTMOUIvDTTQ8pCH3HECtPpAuQgu8XXCxfu3Mq
	GLCFLZ1SjJYaxRCzw9PrmVHuS/iGWlNQRiWNnRwTjywgKP3UgSQcExsqx+BG7w7yDuelM4q/0XL
	zHaJLIO+F/3iyABkqnkzOW0//HWrYwSc6qvd1EDfArRbHaPnX69rfzsrxrnlj5x3rsoF3mUkQYD
	3rEUN32jrODpyX1kyO79n2ocqmGdQku8iEo8izLoq4tjipf2GNPKW/2weoIgIw0gEwrJOiA2BvW
	7bsJ4mCvEBLPsbX4dtpGQ36XJWYQb40GmfYj9bUtNI+SMuooHiJl78G4Wvth0NbZTEVWx8E+6n+
	8=
X-Received: by 2002:a17:907:998d:b0:c1a:5d49:f99d with SMTP id
 a640c23a62f3a-c250baffb5bmr767962766b.7.1787738166533; Wed, 26 Aug 2026
 02:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260825204931.17628-1-anis.bougrine10@gmail.com>
 <20260825204931.17628-2-anis.bougrine10@gmail.com> <6511319d17498eae1dba2a199f07123ca8488454.camel@linuxfoundation.org>
In-Reply-To: <6511319d17498eae1dba2a199f07123ca8488454.camel@linuxfoundation.org>
From: Bougrine Anis <anis.bougrine10@gmail.com>
Date: Wed, 26 Aug 2026 11:55:54 +0200
X-Gm-Features: AcwNN1XczJ_8S_zQ6H_5vol6XD4WqVZHE9RZIt9dFXeXTJLQhxBf886zLMnrON8
Message-ID: <CAGgtUzZYP0S0N-cg4NC6EHs3xhjCjZrhb4mSQbi3k2NswYAqEw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v5 1/5] kernel-module-split.bbclass: add
 get_ext_mod function for module signing
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com, peter.kjellerstedt@axis.com, 
	Ross Burton <ross.burton@arm.com>
Content-Type: multipart/alternative; boundary="0000000000005e1fbf0659f03ae5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 09:56:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244390

--0000000000005e1fbf0659f03ae5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Richard,

Thank you for your precious feedback.
In fact, "makefile-getvar" script is minimalistic and it reads only
variables defined directly in the Makefile and does not retrieve the
complete Make variable database.
For example, in "cryptodev-module" out-of-tree module Makefile, "M" was
defined through "KERNEL_MAKE_OPTS" variable:

In Makefile:
...
KERNEL_MAKE_OPTS :=3D -C $(KERNEL_DIR) M=3D$(CURDIR)
...
modules_install:
$(MAKE) $(KERNEL_MAKE_OPTS) modules_install
...

In this case, "cryptodev-module" can read the "KERNEL_MAKE_OPTS" variable
but can not read the "M" variable.
Therefore, I think it's a good idea to follow your suggestion and move the
Python function to "meta/lib/oe".

BR,
Anis

On Wed, Aug 26, 2026 at 10:34=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2026-08-25 at 22:49 +0200, Anis Bougrine wrote:
> > Fixes [YOCTO #12927]
> >
> > Out-of-tree module Makefiles invoke the kernel Makefile by appending
> > the M=3D (the module directory) variable to the MAKEFLAGS.
> > However, they usually do not provide a modules_sign target. Therefore,
> > the kernel modules_sign target has to be invoked manually after
> retrieving
> > M=3D variable from package source code Makefile.
> >
> > This function retrieves the M=3D variable from an external module Makef=
ile.
> >
> > Reported-by: Ross Burton <ross.burton@arm.com>
> > Signed-off-by: Anis Bougrine <anis.bougrine10@gmail.com>
> > ---
> >  .../kernel-module-split.bbclass               | 21 +++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >
> > diff --git a/meta/classes-recipe/kernel-module-split.bbclass
> b/meta/classes-recipe/kernel-module-split.bbclass
> > index ab2f0d1c37..bde7cd02dd 100644
> > --- a/meta/classes-recipe/kernel-module-split.bbclass
> > +++ b/meta/classes-recipe/kernel-module-split.bbclass
> > @@ -42,6 +42,27 @@ KERNEL_MODULE_PACKAGE_PREFIX ?=3D ""
> >  KERNEL_MODULE_PACKAGE_SUFFIX ?=3D "-${KERNEL_VERSION}"
> >  KERNEL_MODULE_PROVIDE_VIRTUAL ?=3D "1"
> >
> > +def get_ext_mod(d):
> > +    """
> > +    Extract the resolved Kbuild M=3D variable from an out of tree modu=
le
> Makefile variable database.
> > +    """
> > +    import re
> > +    import bb.process
> > +
> > +    try:
> > +        output =3D bb.process.run(
> > +            "make -C %s --dry-run --print-data-base" % d.getVar("B")
> > +        )[0]
> > +    except bb.process.ExecutionError:
> > +        return d.getVar("S")
> > +
> > +    for line in output.splitlines():
> > +        m =3D re.match(r'^M\s*=3D\s*(.*)$', line)
> > +        if m:
> > +            return m.group(1).strip()
> > +
> > +    return d.getVar("S")
> > +
> >  python split_kernel_module_packages () {
> >      import re
> >
>
> Sorry, a couple of more things. I'm not sure if it helps but there is a
> scripts/makefile-getvar which may be a simpler way to do this? It was
> created for this kind of usage.
>
> Also, we're aiming to move python functions into meta/lib/oe, probably
> kernel.py in this case so new functions should really go in there.
>
> Cheers,
>
> Richard
>

--0000000000005e1fbf0659f03ae5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Richard,<div><br></div><div>Thank you for your preci=
ous feedback.</div><div>In fact, &quot;<span style=3D"background-color:tran=
sparent">makefile-getvar&quot; script is minimalistic and=C2=A0</span><span=
 style=3D"background-color:transparent">it reads only variables defined dir=
ectly in the Makefile and does not retrieve the complete Make variable data=
base.</span></div><div>For example, in &quot;cryptodev-module&quot; out-of-=
tree module Makefile, &quot;M&quot; was defined through &quot;KERNEL_MAKE_O=
PTS&quot; variable:</div><div><br></div><div>In Makefile:</div><div>...</di=
v><div>KERNEL_MAKE_OPTS :=3D -C $(KERNEL_DIR) M=3D$(CURDIR)</div><div>...</=
div><div>modules_install:<br>	$(MAKE) $(KERNEL_MAKE_OPTS) modules_install</=
div><div>...</div><div><br></div><div>In this case,=C2=A0<span style=3D"bac=
kground-color:transparent">&quot;cryptodev-module&quot;</span><span style=
=3D"background-color:transparent">=C2=A0can read the &quot;</span><span sty=
le=3D"background-color:transparent">KERNEL_MAKE_OPTS&quot; variable but can=
 not read the &quot;M&quot; variable.</span></div><div>Therefore, I think i=
t&#39;s a good idea to follow your suggestion and move the Python function =
to &quot;meta/lib/oe&quot;.</div><div><br></div><div><span style=3D"backgro=
und-color:transparent">BR,</span></div><div><span style=3D"background-color=
:transparent">Anis</span></div></div><br><div class=3D"gmail_quote gmail_qu=
ote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 26, 2026 a=
t 10:34=E2=80=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linu=
xfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 2026-08-25 at 22=
:49 +0200, Anis Bougrine wrote:<br>
&gt; Fixes [YOCTO #12927]<br>
&gt; <br>
&gt; Out-of-tree module Makefiles invoke the kernel Makefile by appending<b=
r>
&gt; the M=3D (the module directory) variable to the MAKEFLAGS.<br>
&gt; However, they usually do not provide a modules_sign target. Therefore,=
<br>
&gt; the kernel modules_sign target has to be invoked manually after retrie=
ving<br>
&gt; M=3D variable from package source code Makefile.<br>
&gt; <br>
&gt; This function retrieves the M=3D variable from an external module Make=
file.<br>
&gt; <br>
&gt; Reported-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" ta=
rget=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt; Signed-off-by: Anis Bougrine &lt;<a href=3D"mailto:anis.bougrine10@gma=
il.com" target=3D"_blank">anis.bougrine10@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0.../kernel-module-split.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 21 ++++++++++++++++++=
+<br>
&gt; =C2=A01 file changed, 21 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/cl=
asses-recipe/kernel-module-split.bbclass<br>
&gt; index ab2f0d1c37..bde7cd02dd 100644<br>
&gt; --- a/meta/classes-recipe/kernel-module-split.bbclass<br>
&gt; +++ b/meta/classes-recipe/kernel-module-split.bbclass<br>
&gt; @@ -42,6 +42,27 @@ KERNEL_MODULE_PACKAGE_PREFIX ?=3D &quot;&quot;<br>
&gt; =C2=A0KERNEL_MODULE_PACKAGE_SUFFIX ?=3D &quot;-${KERNEL_VERSION}&quot;=
<br>
&gt; =C2=A0KERNEL_MODULE_PROVIDE_VIRTUAL ?=3D &quot;1&quot;<br>
&gt; =C2=A0<br>
&gt; +def get_ext_mod(d):<br>
&gt; +=C2=A0=C2=A0=C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0=C2=A0=C2=A0 Extract the resolved Kbuild M=3D variable from an =
out of tree module Makefile variable database.<br>
&gt; +=C2=A0=C2=A0=C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0=C2=A0=C2=A0 import re<br>
&gt; +=C2=A0=C2=A0=C2=A0 import bb.process<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0 try:<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 output =3D bb.process.run(=
<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &q=
uot;make -C %s --dry-run --print-data-base&quot; % d.getVar(&quot;B&quot;)<=
br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )[0]<br>
&gt; +=C2=A0=C2=A0=C2=A0 except bb.process.ExecutionError:<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return d.getVar(&quot;S&qu=
ot;)<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0 for line in output.splitlines():<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 m =3D re.match(r&#39;^M\s*=
=3D\s*(.*)$&#39;, line)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if m:<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn m.group(1).strip()<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0 return d.getVar(&quot;S&quot;)<br>
&gt; +<br>
&gt; =C2=A0python split_kernel_module_packages () {<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 import re<br>
&gt; <br>
<br>
Sorry, a couple of more things. I&#39;m not sure if it helps but there is a=
<br>
scripts/makefile-getvar which may be a simpler way to do this? It was<br>
created for this kind of usage.<br>
<br>
Also, we&#39;re aiming to move python functions into meta/lib/oe, probably<=
br>
kernel.py in this case so new functions should really go in there.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>

--0000000000005e1fbf0659f03ae5--

