Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C0A1C43458
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 21:38:25 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3720.1783892301853794105
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 14:38:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=Q54+qJud;
 spf=pass (domain: underview.tech, ip: 209.85.221.44, mailfrom: vince@underview.tech)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47df6a5202bso1423412f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 14:38:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783892300; cv=none;
        d=google.com; s=arc-20260327;
        b=HpwdmEtp4cAdAYSU0JYTncDU1OUPxqLNeJ9TZULLBnwXFFPRr4V2F2e++HL2duI2m2
         iJNOiE8QHoshthHl1LPo9P2+M1DblJHLI0IeDc0mjgyLe7EUqHPpSPLQ2Pc4opqk+Zi8
         7LJM74veoZugHN7J8cjHRiCedxAHzoT4q2SFLa7ZTxpxEY/KQjaiUoAjAa6PTyAoIHMd
         1LDCq1PI6B7g6EHbKLLadMWZq6eAjat6v09FPk3EtrxsJc+GOcpM9ghjXU9XAWI0En62
         m0sB5UJUHOQA9zFiNSynC5ts5uZGhy7WkFWwX0h3d1UbQoDqlhImhXIlZ+U5f0WV+/QP
         v1HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=i7/KbBk54YYgoYe8N3vHgD5/ulXGdkmBJPm+JZmvpnc=;
        fh=AWggaWrKTgWJTc+6FkvE3V8kb5xAoFX50Iwj1AleN1U=;
        b=EVhwBIW9hyJqSJdCwyJSrvsPQIiKxh/hYZkR95iIXQc67z+RyxjMN53P0AmhzO+HW3
         sDCZs9Z5bUtSoYdshsTwKDfxsh+sSpkOaNfviIdXqIBvVd640zAB2Dug3bqmw4ePGgwf
         p2Pra5+LkHfyOglSkXgM69NuxQVkgdKZKsBf76ibbHB52rU7dOQYWcOqEr0LEKd8DzWu
         BkP9Z4vOyQRa6l07V6wTzVUF9peCFJzv+nzd4HVyERIrWiNfD1SwwLq8vJVq+Kfiau27
         I5X/uniIMEolUOHEp4l5XH5fHEODX/r79U6TMWBYQtw4U+iMYN9HGQkZDc/LvYrkJs4P
         wFuA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783892300; x=1784497100; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i7/KbBk54YYgoYe8N3vHgD5/ulXGdkmBJPm+JZmvpnc=;
        b=Q54+qJudBYLIZWO8IMq2OSXKYve1cUmp0BRZMYlSEjTEh8lqihTkrINmQ1wF/EAxE3
         eMpXX6sQoYY0Jf8/qaRchy1jUFPJs+IOMX+AhnwrQ3u11gewjajDWk88Il65EcxBoI/l
         smURy1ZT5Ht+6/TH7BVvN1AK/1d/mC7ZLO317H7fg5XWMTyTcWM3i5TROHalvrMVYsiF
         KZ9ly64CsFZlHFMB25ev3uhN4xxm3c16fXFHSXGiwNHtto/Sj7Sxq7NrTxPpTiouthU9
         tVIaQDqyhogHxUjHwwt2chxfwiS0pz9zmFtv75BEdKD3eOSjEmOXFtBpKU85f83r6KXL
         J+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783892300; x=1784497100;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i7/KbBk54YYgoYe8N3vHgD5/ulXGdkmBJPm+JZmvpnc=;
        b=Mqom/siuO7IfUWlwKqSpVci//ObSgC1o8JYrjNbnPrrvTY+4sOKVAZYW6NOhfotreB
         9w0baDl3/R19HaCcdewVx3uHMi0fmt5/rH4bknWFRcNtQ0NjIV8yCe0pLoo04HCN6VYd
         koG+rpSVKZwjwy0/mlhjv0zItw9rQ2vU/yMjOGBNRBnfYasPyB2hJKE2DrVcnEbHkqji
         eeJih/1TYit22DNrcopyiAmf9MjS64MiOk9RL1NaB0SsgkZdMhjgzrZo+LYse7eEya3l
         PM36Bn8pIltCVqKUldb1ao41SNFk58R2IJg0u478U4tAYco7i4X1RKjaeinwQT3HBSoL
         AW3g==
X-Gm-Message-State: AOJu0YzysesqTPTeUkgjAr6U3q8RwRrUzkiaZ7dxa6zRGRQUnQfZkPbw
	E3+9Q1lyrCWuBkuhgcqcJf2NxLbyLTY5PbDFZduxh7FbJPmsQYOkfJn2M969CgHUY/OmIkT2ney
	WECzI19UEyc29TqLVtRhB43fQq3oXNxWlYU9WHyR61w==
X-Gm-Gg: AfdE7ckmNMuT7XRAi3kIpptFYzJUXsqAj7eN5kbEYpOHPf9ni050b7XjUWWr5GhyyWj
	eHN9TU+3jIU60+yUlbVCZfD23+aDx9KQdep/B9G/o2F4RebSVVCVkfVJ/c6/GboXWB7/5GgziHU
	Y74NBjI+ebzzkzzRt9jL9iQ7mq0jyOAQP+h9NT4gcLdzswaDA4aA8ftgquhjSpwqGWnId4yGEmh
	sBoWxLduiSrhlLrWHt95UJGRa8Hapmnfz6LxG2NxvjyXhG+d3mLNv+NQCrTGszzb39Z83jiyPRU
	YqJN
X-Received: by 2002:a05:6000:400a:b0:46f:7d90:8114 with SMTP id
 ffacd0b85a97d-47f2dcb50e7mr7431971f8f.14.1783892299906; Sun, 12 Jul 2026
 14:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260712184307.3259642-1-vince@underview.tech> <CADkTA4NiK9hp-12OrhOVMPfVZG3paH8bCqc8SwAtzXVX=tDWjA@mail.gmail.com>
In-Reply-To: <CADkTA4NiK9hp-12OrhOVMPfVZG3paH8bCqc8SwAtzXVX=tDWjA@mail.gmail.com>
From: Vincent Davis <vince@underview.tech>
Date: Sun, 12 Jul 2026 17:38:07 -0400
X-Gm-Features: AUfX_mwt-xAT-wXQ_Hbjfm4NwRcfTYiM2BihgIeCDeRbT3wyNGq2FVpOQBDJu2E
Message-ID: <CAPQx_gO9bVGSO4CXDqoOOX5JWu9YLKzMroMMWyyDmup9jmgrkg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 01/27] bitbake: globally define KERNEL_PACKAGE_NAME
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000da8e97065670ca98"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 21:38:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240819

--000000000000da8e97065670ca98
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey,

There are 2 use cases the first being if the caller simply wants to change
KERNEL_PACKAGE_NAME in their distro. They'll run into the runtime error
described in patch description. This can be tested by just changing the
name in the kernel.bbclass.

The second being if you want to build 2 or more kernels with different
initramfs contained in each kernel using one DISTRO.

You'd have to define

1. Multiple kernel recipes with variables bellow so not to name mangle

INITRAMFS_IMAGE_BUNDLE =3D "1"

INITRAMFS_IMAGE =3D "<recipe name>"
INITRAMFS_IMAGE_NAME =3D "<recipe image name>"

KERNEL_PACKAGE_NAME =3D "<pkn>"
KERNEL_ARTIFACT_NAME =3D "<artifact name>"

2. Multiple multiconfigs that have different

PREFFERRED_PROVIDER_virtual/kernel

Of course assigned to the different kernels.

3. Wic image or image recipes that pull in all the kernels

do_rootfs[depends] +=3D "\
virtual/kernel:do_bundle_initramfs \
virtual/kernel:do_deploy"

do_rootfs[mcdepends] +=3D "\
mc:from_distro:to_distro:virtual/kernel:do_bundle_initramfs \
mc:from_distro:to_distro:virtual/kernel:do_deploy"

This patch series gives us the best opportunity for the cases above without
brittle special cases. If you don't replace each kernel- prefix with a
variable you end up with build time errors.

Can update the description to explain use cases and why this change is
needed, but are the above statements okay with you before I submit more
patches? Or do we need to work out more of a justification for the patch
series?

On Sun, Jul 12, 2026, 4:40=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmail.=
com>
wrote:

> On Sun, Jul 12, 2026 at 2:43=E2=80=AFPM Vincent Davis Jr via
> lists.openembedded.org <vince=3Dunderview.tech@lists.openembedded.org>
> wrote:
> >
> > A number of recipes rely on hard coded
> > kernel prefix set by KERNEL_PACKAGE_NAME
> > when including modules. This leads to build
> > time failures such as.
> >
> > ERROR: Nothing RPROVIDES 'kernel-module-*'
> >
> > Commit globally defines variable so that
> > recipes aren't reliant on hardcoded 'kernel'
> > prefix.
> >
> > Commit also updates variables
> >
> > STAGING_KERNEL_DIR
> > STAGING_KERNEL_BUILDDIR
> >
> > STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR get
> > changed from default defined in bitbake.conf in
> > the kernel.bbclass. The reason was to set these
> > variables to directories under WORKDIR in alternate
> > kernel recipes (I.e. where KERNEL_PACKAGE_NAME !=3D kernel)
> > so that they may build in parallel with the default
> > kernel without clobbering. The issue is that the variables
> > only get changed in kernel recipes. So, other recipes
> > such as perf and make-mod-scripts don't know the
> > location of virtual/kernel WORKDIR.
> >
> > Solution is to include KERNEL_PACKAGE_NAME in
> > STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR
> > so recipes like perf and make-mod-scripts can
> > find virtual/kernel source and solve the
> > clobbering of build artifacts issue.
>
> These descriptions cover what you've changed, and
> how they are cooredinated .. but you haven't explained *why*
>
> What problem does this solve? This introduces
> complexity throughout the code base, so there has to be an
> appropriately significant use case to justify it.
>
> and "We are changing the kernel package name" is not a sufficient
> justification.
> a reason, that is obviously something you are doing.
>
> Bruce
>
> >
> > Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> > ---
> >  meta/conf/bitbake.conf | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index bdf37d0da2..569b83a138 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -479,6 +479,9 @@ SDKPATHINSTALL =3D
> "/usr/local/${SDK_NAME_PREFIX}-${SDK_ARCH}"
> >  # Kernel info.
> >  ##################################################################
> >
> > +# Globally define base string for kernel packages
> > +KERNEL_PACKAGE_NAME ??=3D "kernel"
> > +
> >  OLDEST_KERNEL =3D "5.15"
> >
> >  # SDK_OLDEST_KERNEL can't be set using overrides since there are
> > @@ -490,8 +493,8 @@ SDK_OLDEST_KERNEL =3D "3.2.0"
> >  # they are staged.
> >  KERNEL_SRC_PATH =3D "/usr/src/kernel"
> >
> > -STAGING_KERNEL_DIR =3D "${TMPDIR}/work-shared/${MACHINE}/kernel-source=
"
> > -STAGING_KERNEL_BUILDDIR =3D
> "${TMPDIR}/work-shared/${MACHINE}/kernel-build-artifacts"
> > +STAGING_KERNEL_DIR =3D
> "${TMPDIR}/work-shared/${MACHINE}/${KERNEL_PACKAGE_NAME}/kernel-source"
> > +STAGING_KERNEL_BUILDDIR =3D
> "${TMPDIR}/work-shared/${MACHINE}/${KERNEL_PACKAGE_NAME}/kernel-build-art=
ifacts"
> >
> >  ##################################################################
> >  # Specific image creation and rootfs population info.
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#240791):
> https://lists.openembedded.org/g/openembedded-core/message/240791
> > Mute This Topic: https://lists.openembedded.org/mt/120238087/1050810
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--000000000000da8e97065670ca98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hey,<div dir=3D"auto"><br></div><div dir=3D"auto">There a=
re 2 use cases the first being if the caller simply wants to change KERNEL_=
PACKAGE_NAME in their distro. They&#39;ll run into the runtime error descri=
bed in patch description. This can be tested by just changing the name in t=
he kernel.bbclass.</div><div dir=3D"auto"><br></div><div dir=3D"auto">The s=
econd being if you want to build 2 or more kernels with different initramfs=
 contained in each kernel using one DISTRO.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">You&#39;d have to define</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">1. Multiple kernel recipes with variables bellow so no=
t to name mangle</div><div dir=3D"auto"><br></div><div dir=3D"auto">INITRAM=
FS_IMAGE_BUNDLE =3D &quot;1&quot;</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">INITRAMFS_IMAGE =3D &quot;&lt;recipe name&gt;&quot;</div><div dir=
=3D"auto">INITRAMFS_IMAGE_NAME =3D &quot;&lt;recipe image name&gt;&quot;</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">KERNEL_PACKAGE_NAME =3D &q=
uot;&lt;pkn&gt;&quot;</div><div dir=3D"auto">KERNEL_ARTIFACT_NAME =3D &quot=
;&lt;artifact name&gt;&quot;</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">2. Multiple multiconfigs that have different</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">PREFFERRED_PROVIDER_virtual/kernel</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Of course assigned to the different k=
ernels.</div><div dir=3D"auto"><br></div><div dir=3D"auto">3. Wic image or =
image recipes that pull in all the kernels</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">do_rootfs[depends] +=3D &quot;\</div><div dir=3D"auto">v=
irtual/kernel:do_bundle_initramfs \</div><div dir=3D"auto">virtual/kernel:d=
o_deploy&quot;</div><div dir=3D"auto"><br></div><div dir=3D"auto">do_rootfs=
[mcdepends] +=3D &quot;\</div><div dir=3D"auto">mc:from_distro:to_distro:vi=
rtual/kernel:do_bundle_initramfs \</div><div dir=3D"auto">mc:from_distro:to=
_distro:virtual/kernel:do_deploy&quot;</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">This patch series gives us the best opportunity for the case=
s above without brittle special cases. If you don&#39;t replace each kernel=
- prefix with a variable you end up with build time errors.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Can update the description to explain=
 use cases and why this change is needed, but are the above statements okay=
 with you before I submit more patches? Or do we need to work out more of a=
 justification for the patch series?</div></div><br><div class=3D"gmail_quo=
te gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jul=
 12, 2026, 4:40=E2=80=AFPM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfi=
eld@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">On Sun, Jul 12, 2026 at 2:43=E2=80=AFPM Vincent Davis J=
r via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">lists.openembedded.org</a> &lt;vince=3D<a href=3D"mailto:und=
erview.tech@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">un=
derview.tech@lists.openembedded.org</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; A number of recipes rely on hard coded<br>
&gt; kernel prefix set by KERNEL_PACKAGE_NAME<br>
&gt; when including modules. This leads to build<br>
&gt; time failures such as.<br>
&gt;<br>
&gt; ERROR: Nothing RPROVIDES &#39;kernel-module-*&#39;<br>
&gt;<br>
&gt; Commit globally defines variable so that<br>
&gt; recipes aren&#39;t reliant on hardcoded &#39;kernel&#39;<br>
&gt; prefix.<br>
&gt;<br>
&gt; Commit also updates variables<br>
&gt;<br>
&gt; STAGING_KERNEL_DIR<br>
&gt; STAGING_KERNEL_BUILDDIR<br>
&gt;<br>
&gt; STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR get<br>
&gt; changed from default defined in bitbake.conf in<br>
&gt; the kernel.bbclass. The reason was to set these<br>
&gt; variables to directories under WORKDIR in alternate<br>
&gt; kernel recipes (I.e. where KERNEL_PACKAGE_NAME !=3D kernel)<br>
&gt; so that they may build in parallel with the default<br>
&gt; kernel without clobbering. The issue is that the variables<br>
&gt; only get changed in kernel recipes. So, other recipes<br>
&gt; such as perf and make-mod-scripts don&#39;t know the<br>
&gt; location of virtual/kernel WORKDIR.<br>
&gt;<br>
&gt; Solution is to include KERNEL_PACKAGE_NAME in<br>
&gt; STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR<br>
&gt; so recipes like perf and make-mod-scripts can<br>
&gt; find virtual/kernel source and solve the<br>
&gt; clobbering of build artifacts issue.<br>
<br>
These descriptions cover what you&#39;ve changed, and<br>
how they are cooredinated .. but you haven&#39;t explained *why*<br>
<br>
What problem does this solve? This introduces<br>
complexity throughout the code base, so there has to be an<br>
appropriately significant use case to justify it.<br>
<br>
and &quot;We are changing the kernel package name&quot; is not a sufficient=
 justification.<br>
a reason, that is obviously something you are doing.<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt; Signed-off-by: Vincent Davis Jr &lt;vince@underview.tech&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/bitbake.conf | 7 +++++--<br>
&gt;=C2=A0 1 file changed, 5 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; index bdf37d0da2..569b83a138 100644<br>
&gt; --- a/meta/conf/bitbake.conf<br>
&gt; +++ b/meta/conf/bitbake.conf<br>
&gt; @@ -479,6 +479,9 @@ SDKPATHINSTALL =3D &quot;/usr/local/${SDK_NAME_PRE=
FIX}-${SDK_ARCH}&quot;<br>
&gt;=C2=A0 # Kernel info.<br>
&gt;=C2=A0 ################################################################=
##<br>
&gt;<br>
&gt; +# Globally define base string for kernel packages<br>
&gt; +KERNEL_PACKAGE_NAME ??=3D &quot;kernel&quot;<br>
&gt; +<br>
&gt;=C2=A0 OLDEST_KERNEL =3D &quot;5.15&quot;<br>
&gt;<br>
&gt;=C2=A0 # SDK_OLDEST_KERNEL can&#39;t be set using overrides since there=
 are<br>
&gt; @@ -490,8 +493,8 @@ SDK_OLDEST_KERNEL =3D &quot;3.2.0&quot;<br>
&gt;=C2=A0 # they are staged.<br>
&gt;=C2=A0 KERNEL_SRC_PATH =3D &quot;/usr/src/kernel&quot;<br>
&gt;<br>
&gt; -STAGING_KERNEL_DIR =3D &quot;${TMPDIR}/work-shared/${MACHINE}/kernel-=
source&quot;<br>
&gt; -STAGING_KERNEL_BUILDDIR =3D &quot;${TMPDIR}/work-shared/${MACHINE}/ke=
rnel-build-artifacts&quot;<br>
&gt; +STAGING_KERNEL_DIR =3D &quot;${TMPDIR}/work-shared/${MACHINE}/${KERNE=
L_PACKAGE_NAME}/kernel-source&quot;<br>
&gt; +STAGING_KERNEL_BUILDDIR =3D &quot;${TMPDIR}/work-shared/${MACHINE}/${=
KERNEL_PACKAGE_NAME}/kernel-build-artifacts&quot;<br>
&gt;<br>
&gt;=C2=A0 ################################################################=
##<br>
&gt;=C2=A0 # Specific image creation and rootfs population info.<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#240791): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/240791" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/2407=
91</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/12023808=
7/1050810" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/mt/120238087/1050810</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashf=
ield@gmail.com" target=3D"_blank" rel=3D"noreferrer">bruce.ashfield@gmail.c=
om</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>

--000000000000da8e97065670ca98--

