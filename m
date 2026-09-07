Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46E98C79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:29:00 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31770.1788776929657949461
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:28:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jCKhIB6T;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2533d83e3bso557191266b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 03:28:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788776928; cv=none;
        d=google.com; s=arc-20260327;
        b=Dc4u86ZOSlsHW5jx9K7wHSgD712yOGtcBONdvv8IAb+b60M2OOj+EvTGbVuvfDri7a
         4RzTfkuB01GbdI2ITrfQ+zsHaLfzMC/9uPbzt28XhS34pSaknrQwk/RTSTTOWIQP6+bv
         XsQqFli9fwjKuHhcImxGRj4uEca0fyRhqwPoYn6PrREil7hDz3661/lOT1F6oAkS0wsv
         V1h7IescgMNyW/YBb+2yyEIY4nICZIA0r2T/1IbeM4wxmKyIplqr73Z44M6d6h67A0/+
         0jbc6ryyQZphCw2rcKYjJ3LjvgipN4sxrwSZYqTgnngN5WXVrd4TaXORfQAXBSAVYZKp
         U3WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JR6LfXjyc+zsk+/tulJkKJD+0oe4qq9CK1Gm+lzRNAo=;
        fh=A5xWKNo3nsvxDj9/Ld9vhCIqE8TtZ2r83zO3+dev4EE=;
        b=QCXbpYwniNe3nkkZVovBhISe39GIOhRAoRY3Z2E6n2m8EiheTEQ4/afj0Y36mEY847
         EuYkFDTQXDFo7ST6Fm5mvVOmeMpxZ8JuZneHIHCush63YlcznItc38g6S2mDjztvmuQH
         koeEDz74UqDRjJHFappZ3vqM/0vc65KmJEaZDGooN1fvxQHTgV2NJaM+3GWmHR3DBJat
         LSYAscP+CDhb09C8Geu/w049v99FnES8UQAxlGDVF+KP7dYEDp5M9WoNfP++3MIYZc8B
         33LQxQxy2OvbIUa4HDkSGAywiTpWei4koRqMdxWWnK5fSdtR00NczXwi3DofCqiwWOG8
         lIow==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776928; x=1789381728; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JR6LfXjyc+zsk+/tulJkKJD+0oe4qq9CK1Gm+lzRNAo=;
        b=jCKhIB6Tf5Wny8Ib2vPSwgWfgyekMzaggojYtQniA60pC+o9LuPXCvtSwLRm8l0S4c
         57ECfywNa33gOv+qugCJ1m1YK2Ik4ncYFzWd1KwWlu9pU5krYpm+dg419W6cSJBOxy4O
         i3hxF+86t+xXIC+HLxrLBLLYKeDxYiurmlFo0nhoQi7yrXsqBOBmc1SlcdSwonfWWZjI
         SKPEnuSJoJD/uvmGkOnkkBESCC9rKvcl6Bixo66SPlnF1SMOjn7VN1e8mb4r3oviaCf5
         F6tD9MAay6tI1ipLF7NG1JpfKaRqrlOSwj6RbCaweJcPWpVnZO4xRjLY3Xve2CTKFABE
         OfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776928; x=1789381728;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JR6LfXjyc+zsk+/tulJkKJD+0oe4qq9CK1Gm+lzRNAo=;
        b=FQ+uMblIw1M0tXelo2W1pajxzx4TFFIm/sKRA8pvBeV3vhCwdjtpdYT/T09ds4qupm
         SlQGNzE/QWH/EGVkHuzZnm+L0j3RiJJxwBX2HT4uIMVt3OgmUNKHzJRxBKzBDSsUJmbn
         YOOpvhUzJHNNOpQHIIUzvrMp5efJIvYed+rbNjEKQwRh8AiphzOS/7ZpP+Jd9jbq+OLF
         djaDWqKdiH7UWdI7b/rQyIx6SgId+Jw2McYichxACUTqAkinPFm0hI7990t8lTS/kjuv
         BlF+IjwuB1pKfD8MkU+qNlH/l17SLxL+lonVUhgBn82s418VLw4lB7lZmizYO/xVPflN
         xlWA==
X-Gm-Message-State: AFuF++kBkdI+p+SyOht+X/TmINCxcKYSuudEExZUYF+fFOB+ZmMtCGcg
	47fxa+EL8xuqTEB6673LuiFReFPL7WupEYvBe/PVgMlIHcgmkN6BpvUbAgUpLyJGqarNyVA8S38
	TG0w597t1uXNdE6yxB4J+NGE0uouaEWZQfkSP
X-Gm-Gg: AYBFou35IifylLgkFSG6qYm2ADyb8NeMhiAGSwHW2O+y0tMaELm02smIY/ytAUU0W2o
	Bg5vjkdnZ6dERviehgJWjEEVvjCnHwoAJiPpk3L7vRlcD3IJpdtaeu4h6C6c8QDifxtsuBfYZa2
	dlVOdrw8glcjTQ+GDgjGV1A+j214aMToSTrb7D6DB0QDO2a6JI6E8YyO0O6XorUeRiXEIBnmwU8
	ZFNiOLkx1NmFUDjY97kXSdiSili0sdRbxU0LfTGarZvH5VawFPWm5elPZcnpCb3zrrqTzARKBeC
	HE0jbDRSYWTH95kg8KxiaGaqOOfMdpOCOcCD3zE6spVF1zhd4SxzybdabvFIHGtQrcFL3vMml+K
	no2tkQNMCpok6dZCYuqZfhPfXaqqgiSTin6sR3UmqUnO0M9jhMUpOXYevh9EKCUpJ
X-Received: by 2002:a17:907:3f24:b0:c25:58e:83ff with SMTP id
 a640c23a62f3a-c260c9f0348mr1451351566b.10.1788776927677; Mon, 07 Sep 2026
 03:28:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260826233416.37047-1-anis.bougrine10@gmail.com>
 <20260826233416.37047-3-anis.bougrine10@gmail.com> <7f5c5ec971adc08fc5e2ca6e4b0c30840880cb3f.camel@linuxfoundation.org>
In-Reply-To: <7f5c5ec971adc08fc5e2ca6e4b0c30840880cb3f.camel@linuxfoundation.org>
From: Bougrine Anis <anis.bougrine10@gmail.com>
Date: Mon, 7 Sep 2026 12:28:36 +0200
X-Gm-Features: AcwNN1VBNhArLPoNNiZe7HDSrnnXsa6XX5hfF0LS8cAAsItHjtnETb_RCmZpLks
Message-ID: <CAGgtUzYzD2RrBtRN6irANJX3L8qnsXjiB8LSWj_tR49J4T2GeA@mail.gmail.com>
Subject: Re: [OE-core][PATCH v7 2/5] kernel: re-sign kernel modules after
 package stripping process
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <ross.burton@arm.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000005b516b065ae215bc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 10:29:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245243

--0000000000005b516b065ae215bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Richard,

Sorry to hear that, and sorry for making you debug this for hours.

I just saw your patch, =E2=80=9Ckernel-module-split: Remove get_ext_mod=E2=
=80=9D. I=E2=80=99m OK
with that workaround.

On my side, I=E2=80=99ll think about a better solution to cover all out-of-=
tree
module use cases.

I=E2=80=99m rebuilding my PC for an upgrade, so it will take a while.

Thank you.

BR,
Anis

On Sat 5 Sep 2026 at 09:39, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2026-08-27 at 01:34 +0200, Anis Bougrine wrote:
> > Fixes [YOCTO #12927]
> >
> > Currently, signed kernel modules are not stripped in order to preserve
> > their valid signatures. See commit 4c47e5f.
> >
> > Therefore, this commit makes kernel modules stripped and correctly
> > signed. Two options are possible:
> >
> >     - Strip the kernel modules after installation and before signing.
> >     - Re-sign the kernel modules after stripping and before package
> splitting.
> >
> > The first option was rejected because debug symbols would be dropped
> early
> > in the build workflow, which may impact the SPDX process.
> >
> > The second option is adopted because it does not impact the build flow.
> >
> > Reported-by: Ross Burton <ross.burton@arm.com>
> > Signed-off-by: Anis Bougrine <anis.bougrine10@gmail.com>
> > ---
> >  .../kernel-module-split.bbclass               | 25 +++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git a/meta/classes-recipe/kernel-module-split.bbclass
> b/meta/classes-recipe/kernel-module-split.bbclass
> > index ab2f0d1c37..2b40437cc2 100644
> > --- a/meta/classes-recipe/kernel-module-split.bbclass
> > +++ b/meta/classes-recipe/kernel-module-split.bbclass
> > @@ -35,6 +35,11 @@ modprobedir ??=3D
> "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${nonarch_b
> >
> >  KERNEL_SPLIT_MODULES ?=3D "1"
> >  PACKAGESPLITFUNCS =3D+ "split_kernel_module_packages"
> > +# Order matters:
> > +# 1. Strip the modules
> > +# 2. Re-sign the modules (if enabled)
> > +# 3. Split the packages
> > +PACKAGESPLITFUNCS =3D+ "post_strip_kernel_modules_signing"
> >
> >  KERNEL_MODULES_META_PACKAGE ?=3D "${@ d.getVar("KERNEL_PACKAGE_NAME") =
or
> "kernel" }-modules"
> >
> > @@ -42,6 +47,26 @@ KERNEL_MODULE_PACKAGE_PREFIX ?=3D ""
> >  KERNEL_MODULE_PACKAGE_SUFFIX ?=3D "-${KERNEL_VERSION}"
> >  KERNEL_MODULE_PROVIDE_VIRTUAL ?=3D "1"
> >
> > +# This function supports both in-tree and out-of-tree modules.
> > +post_strip_kernel_modules_signing(){
> > +    # Read .config values to determine if module auto-signing is enabl=
ed
> > +    is_modules=3D"$(${STAGING_KERNEL_DIR}/scripts/config --file
> ${KBUILD_OUTPUT}/.config --state MODULES)"
> > +    is_module_sig=3D"$(${STAGING_KERNEL_DIR}/scripts/config --file
> ${KBUILD_OUTPUT}/.config --state MODULE_SIG)"
> > +    is_module_sig_all=3D"$(${STAGING_KERNEL_DIR}/scripts/config --file
> ${KBUILD_OUTPUT}/.config --state MODULE_SIG_ALL)"
> > +
> > +    if [ "$is_modules" =3D "y" ] && [ "$is_module_sig" =3D "y" ] && [
> "$is_module_sig_all" =3D "y" ]; then
> > +        # Sign modules under ${PKGD}, with M=3D if out-of-tree module.
> > +        # Out-of-tree module Makefiles invoke the kernel Makefile by
> appending M=3D (the module directory) to MAKEFLAGS.
> > +        # However, they usually do not provide a modules_sign target.
> Therefore, the kernel modules_sign target has to
> > +        # be invoked manually after retrieving M=3D variable from pack=
age
> source code Makefile.
> > +        oe_runmake \
> > +            -C ${KBUILD_OUTPUT}  \
> > +
> MODLIB=3D${PKGD}${nonarch_base_libdir}/modules/${KERNEL_VERSION} \
> > +            ${@'M=3D%s' % oe.kernel_module.get_ext_mod(d) if not
> "virtual/kernel" in d.getVar('PROVIDES') else ''} \
> > +            modules_sign
> > +    fi
> > +}
>
> This has merged and I'm really happy to see the signing code improved.
> There is a weird bug this as introduced though where the eSDK is
> breaking in kernel module compile tests.
>
> This is an example failure:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/4551
>
> In the bad environment, you can source the test eSDK environment:
>
> .
> /srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-lin=
ux/core-image-sato/1.0/testsdkext/environment-setup-core2-32-poky-linux
>
> Rerun the compile step:
>
>
> /srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-lin=
ux/core-image-sato/1.0/testsdkext/tmp/work/qemux86-poky-linux/kernel-module=
-hello-world/1.0+git/temp/run.do_compile
>
> where you see hello-world.ko get generated:
>
> make[2]: Entering directory
> '/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-li=
nux/core-image-sato/1.0/testsdkext/workspace/sources/kernel-module-hello-wo=
rld'
>   LD [M]  hello-world.ko
> make[2]: Leaving directory
> '/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-li=
nux/core-image-sato/1.0/testsdkext/workspace/sources/kernel-module-hello-wo=
rld'
>
> then watch:
>
> devtool build kernel-module-hello-world
>
> fail as above, noting that the hello-world.ko file disappears by the time
> it runs.
>
> To cut a long story short (hours of debugging), this happens during
> parsing of the kernel-module-hello-world recipe. If you add a
> bb.warn("Executing make") to oe.kernel_module.get_ext_mod() in
> meta/lib/oe/kernel_module.py, you will see it runs make during parsing
> and that make command deletes the .ko file.
>
> This raises a few questions:
>
> a) why is make being run during parsing?
>
> The shell function is being expanded to work out dependencies
> and that triggers the python function call. This should definitely not
> be happening during parsing so that is a bug.
>
> b) why does calling --dry-run on the kernel makefile delete files?
>
> We need to fix this somehow to avoid the failures/bad behaviour. I at
> least wanted to explain the issue now I'd found the underlying area of
> the problem. I've not really had a chance to think about solutions yet.
>
> Cheers,
>
> Richard
>
>
>
>
>

--0000000000005b516b065ae215bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"></div><div style=3D"font-size:inherit">
<div style=3D"font-size:inherit">
<p>Hello Richard,</p>
<p>Sorry to hear that, and sorry for making you debug this for hours.</p>
<p>I just saw your patch, =E2=80=9Ckernel-module-split: Remove get_ext_mod=
=E2=80=9D. I=E2=80=99m OK with that workaround.</p>
<p>On my side, I=E2=80=99ll think about a better solution to cover all out-=
of-tree module use cases.</p>
<p>I=E2=80=99m rebuilding my PC for an upgrade, so it will take a while.</p=
>
<p>Thank you.</p>
<p>BR,<br>
Anis</p>
</div>
</div><div dir=3D"auto"></div><div><br><div class=3D"gmail_quote gmail_quot=
e_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat 5 Sep 2026 at 09:=
39, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org=
">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px=
;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204=
)">On Thu, 2026-08-27 at 01:34 +0200, Anis Bougrine wrote:<br>
&gt; Fixes [YOCTO #12927]<br>
&gt; <br>
&gt; Currently, signed kernel modules are not stripped in order to preserve=
<br>
&gt; their valid signatures. See commit 4c47e5f.<br>
&gt; <br>
&gt; Therefore, this commit makes kernel modules stripped and correctly<br>
&gt; signed. Two options are possible:<br>
&gt; <br>
&gt; =C2=A0=C2=A0=C2=A0 - Strip the kernel modules after installation and b=
efore signing.<br>
&gt; =C2=A0=C2=A0=C2=A0 - Re-sign the kernel modules after stripping and be=
fore package splitting.<br>
&gt; <br>
&gt; The first option was rejected because debug symbols would be dropped e=
arly<br>
&gt; in the build workflow, which may impact the SPDX process.<br>
&gt; <br>
&gt; The second option is adopted because it does not impact the build flow=
.<br>
&gt; <br>
&gt; Reported-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" ta=
rget=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt; Signed-off-by: Anis Bougrine &lt;<a href=3D"mailto:anis.bougrine10@gma=
il.com" target=3D"_blank">anis.bougrine10@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0.../kernel-module-split.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 25 ++++++++++++++++++=
+<br>
&gt; =C2=A01 file changed, 25 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/cl=
asses-recipe/kernel-module-split.bbclass<br>
&gt; index ab2f0d1c37..2b40437cc2 100644<br>
&gt; --- a/meta/classes-recipe/kernel-module-split.bbclass<br>
&gt; +++ b/meta/classes-recipe/kernel-module-split.bbclass<br>
&gt; @@ -35,6 +35,11 @@ modprobedir ??=3D &quot;${@bb.utils.contains(&#39;D=
ISTRO_FEATURES&#39;, &#39;systemd&#39;, &#39;${nonarch_b<br>
&gt; =C2=A0<br>
&gt; =C2=A0KERNEL_SPLIT_MODULES ?=3D &quot;1&quot;<br>
&gt; =C2=A0PACKAGESPLITFUNCS =3D+ &quot;split_kernel_module_packages&quot;<=
br>
&gt; +# Order matters:<br>
&gt; +# 1. Strip the modules<br>
&gt; +# 2. Re-sign the modules (if enabled)<br>
&gt; +# 3. Split the packages<br>
&gt; +PACKAGESPLITFUNCS =3D+ &quot;post_strip_kernel_modules_signing&quot;<=
br>
&gt; =C2=A0<br>
&gt; =C2=A0KERNEL_MODULES_META_PACKAGE ?=3D &quot;${@ d.getVar(&quot;KERNEL=
_PACKAGE_NAME&quot;) or &quot;kernel&quot; }-modules&quot;<br>
&gt; =C2=A0<br>
&gt; @@ -42,6 +47,26 @@ KERNEL_MODULE_PACKAGE_PREFIX ?=3D &quot;&quot;<br>
&gt; =C2=A0KERNEL_MODULE_PACKAGE_SUFFIX ?=3D &quot;-${KERNEL_VERSION}&quot;=
<br>
&gt; =C2=A0KERNEL_MODULE_PROVIDE_VIRTUAL ?=3D &quot;1&quot;<br>
&gt; =C2=A0<br>
&gt; +# This function supports both in-tree and out-of-tree modules.<br>
&gt; +post_strip_kernel_modules_signing(){<br>
&gt; +=C2=A0=C2=A0=C2=A0 # Read .config values to determine if module auto-=
signing is enabled<br>
&gt; +=C2=A0=C2=A0=C2=A0 is_modules=3D&quot;$(${STAGING_KERNEL_DIR}/scripts=
/config --file ${KBUILD_OUTPUT}/.config --state MODULES)&quot;<br>
&gt; +=C2=A0=C2=A0=C2=A0 is_module_sig=3D&quot;$(${STAGING_KERNEL_DIR}/scri=
pts/config --file ${KBUILD_OUTPUT}/.config --state MODULE_SIG)&quot;<br>
&gt; +=C2=A0=C2=A0=C2=A0 is_module_sig_all=3D&quot;$(${STAGING_KERNEL_DIR}/=
scripts/config --file ${KBUILD_OUTPUT}/.config --state MODULE_SIG_ALL)&quot=
;<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0 if [ &quot;$is_modules&quot; =3D &quot;y&quot; ] &=
amp;&amp; [ &quot;$is_module_sig&quot; =3D &quot;y&quot; ] &amp;&amp; [ &qu=
ot;$is_module_sig_all&quot; =3D &quot;y&quot; ]; then<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Sign modules under ${PKG=
D}, with M=3D if out-of-tree module.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Out-of-tree module Makef=
iles invoke the kernel Makefile by appending M=3D (the module directory) to=
 MAKEFLAGS.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # However, they usually do=
 not provide a modules_sign target. Therefore, the kernel modules_sign targ=
et has to<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # be invoked manually afte=
r retrieving M=3D variable from package source code Makefile.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 oe_runmake \<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -C=
 ${KBUILD_OUTPUT}=C2=A0 \<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MO=
DLIB=3D${PKGD}${nonarch_base_libdir}/modules/${KERNEL_VERSION} \<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${=
@&#39;M=3D%s&#39; % oe.kernel_module.get_ext_mod(d) if not &quot;virtual/ke=
rnel&quot; in d.getVar(&#39;PROVIDES&#39;) else &#39;&#39;} \<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mo=
dules_sign<br>
&gt; +=C2=A0=C2=A0=C2=A0 fi<br>
&gt; +}<br>
<br>
This has merged and I&#39;m really happy to see the signing code improved.<=
br>
There is a weird bug this as introduced though where the eSDK is<br>
breaking in kernel module compile tests.<br>
<br>
This is an example failure:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/buil=
ds/4551" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/30/builds/4551</a><br>
<br>
In the bad environment, you can source the test eSDK environment:<br>
<br>
. /srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-lin=
ux/core-image-sato/1.0/testsdkext/environment-setup-core2-32-poky-linux<br>
<br>
Rerun the compile step:<br>
<br>
/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-linux=
/core-image-sato/1.0/testsdkext/tmp/work/qemux86-poky-linux/kernel-module-h=
ello-world/1.0+git/temp/run.do_compile<br>
<br>
where you see hello-world.ko get generated:<br>
<br>
make[2]: Entering directory &#39;/srv/pokybuild/yocto-worker/qemux86/build/=
build/tmp/work/qemux86-poky-linux/core-image-sato/1.0/testsdkext/workspace/=
sources/kernel-module-hello-world&#39;<br>
=C2=A0 LD [M]=C2=A0 hello-world.ko<br>
make[2]: Leaving directory &#39;/srv/pokybuild/yocto-worker/qemux86/build/b=
uild/tmp/work/qemux86-poky-linux/core-image-sato/1.0/testsdkext/workspace/s=
ources/kernel-module-hello-world&#39;<br>
<br>
then watch:<br>
<br>
devtool build kernel-module-hello-world<br>
<br>
fail as above, noting that the hello-world.ko file disappears by the time i=
t runs.<br>
<br>
To cut a long story short (hours of debugging), this happens during<br>
parsing of the kernel-module-hello-world recipe. If you add a<br>
bb.warn(&quot;Executing make&quot;) to oe.kernel_module.get_ext_mod() in<br=
>
meta/lib/oe/kernel_module.py, you will see it runs make during parsing<br>
and that make command deletes the .ko file.<br>
<br>
This raises a few questions:<br>
<br>
a) why is make being run during parsing?<br>
<br>
The shell function is being expanded to work out dependencies=C2=A0 <br>
and=C2=A0that triggers the python function call. This should definitely not=
<br>
be happening during parsing so that is a bug.<br>
<br>
b) why does calling --dry-run on the kernel makefile delete files?<br>
<br>
We need to fix this somehow to avoid the failures/bad behaviour. I at<br>
least wanted to explain the issue now I&#39;d found the underlying area of<=
br>
the problem. I&#39;ve not really had a chance to think about solutions yet.=
<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000005b516b065ae215bc--

