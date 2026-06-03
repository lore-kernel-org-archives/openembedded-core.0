Return-Path: <sivakumar.bs@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECBDDCD6E57
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 13:49:59 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20765.1780494590963683225
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2026 06:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LoqKen3U;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: sivakumar.bs@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51758478240so16749511cf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 06:49:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780494590; cv=none;
        d=google.com; s=arc-20240605;
        b=RgsYOxXvWeF4cY9rYXIhJVqJItXYoOvSi3HeVaPi2Gg19EGlLMohPYJiNKdTgaS4hl
         UqXfoyvAOnMockwgHFewMyBRhZSqjB6+h9N0pWA2XAkf6lXhnYSUK9Jd2mY7Ug90Zgfu
         fCtqW0jMNm5W2lJyu/adTYeOfB5yIURwFReh9lJDJ1aNXrqL/Mc642A7s8RdUG0BNf2L
         RCb+0r6m0poXu8KXM9UThNRa5KcB0cYiZSwpJu0bI/UdjQ8J5RMqcFBqehCAWh9Mt+JZ
         FGLxk5GOlrXPj150Y3WojQ37dItwVJmOlddW4RG06mDS8+r+AzMTcMw6W98MD7Pr4TmR
         dCcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zWDTtoiOZ/bNUIlaqgNfrRdkn4umXihKCdd0UQ7RF3o=;
        fh=TGF7TVa5Eshw5M6K2XLmjdIMKFhrsPaliuC+tv7wzuY=;
        b=iRjklNgmcZU55qGowO0kbImRL0RItDVknycfgZEhHp+GTcs2kdKeewgfwfvJMggjbm
         72MgoekLdiRKWYGFMTmhI8M8lGN6a0tJRLsyRKCjrCZ97MpIeghtnx+eDyoZ3bvzWXQd
         ReXdqikPoAeKIlbl0s+rfCjdAG9CGQNUOrRLuvL11KZL3LwwpdAy61CpHZ3d7Pw6F+M5
         UzBHiELwBTygktPQAKGGXIedxvFKZVizNPdwuMviX5ZB2FOgFx5/t3DHLc/o/tIHFwJz
         BGOSSov/KHtdpCbMsa5GrL3LM1uZFNvIhVwtRVhVYY139NMtgN3LqEkhdahSmWrRuRqP
         MkzQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780494590; x=1781099390; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zWDTtoiOZ/bNUIlaqgNfrRdkn4umXihKCdd0UQ7RF3o=;
        b=LoqKen3UBWquzPQWL6n8sYpF3+EqlMXEVWNt+ScCFDCIICeD38bi8TcBD9kNAUEDjS
         rB3c7VznCh1OFdFdkKwXicZN8gmwNXMHrCxYmfW/cYloHT9GJvwTViySWbH+vwrAOTD3
         50s5Ei3vLo09OeA8yLPd2AOZeRs787qzNDlfYIBmOxBvln5tC6NLo5r6jcq5ffHMLS4L
         Njt5CkIvaYZaABXJX82d4s8VSnXPR9j5IuegeqUgQCYxMa2wb3Ahq+wyNWVlWECIvDhE
         TzU/nzyfAzI4oR2A5V1PyGG71zcc4WOr8nBHi0pBMVRwIK0+EwBAqmP8Z2hwVAYxboBM
         rA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780494590; x=1781099390;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWDTtoiOZ/bNUIlaqgNfrRdkn4umXihKCdd0UQ7RF3o=;
        b=DCWW9HMVavzkWmOjvut7bblO+fcjlKuQOpy/FEa3oZX3u2Vs1JoELSLjU57ZtCXiCu
         iykH0kyC1lFskCfNCDEdDHeLScH9Ruip7kQC0dKmnWwMgscN91zYni75vwyCDwiJ6Y2t
         +z1EXVnWZLpIO59axOswdK1EbREGwbFxlmo0qBMbV/P0Udn1RX4vR4SiGNRp387K1Qdp
         70QNGO8dnGDn3GVLtTcuxDS+2DUZ5kDKVY8pSyrEGchkYnmfRrlH0ePtZNLEExoxhk+3
         L1Qz3ic4okvV2BSwoXavBRsdUJ58D3OyKTez7fH9B7AOUP1JNU5LqCH1R0ZW1VYs5beM
         lRSg==
X-Gm-Message-State: AOJu0YzuYVgkrmPMtdc+xaVpWnSwl3InKQe4D+7qRQn4VpgmtvuF+WGp
	qwlzHbTUACLNRB1SV9lgGVQKvZZ9OF3DB2qyQfdHgtgENQXPp4oM9NJnflyCpkv/Rsb1GRSoK1h
	wJIx5kadyhAHFuZaYWwrNVP81C0ro7g0VecM402o=
X-Gm-Gg: Acq92OHBggzMQTqLM/aXCKF2QqDBlhdLuvda16afhVfxtjASAHCmlrjn+JlJw06gbzX
	mUso9JwjHD8ybfZFUDvFTqIqvpAwo+81TiLbp1pToVvrtDXxqEseB4BASGC1ubjCsaqyfcFJvwL
	BoDFQMDMC1nHM9rvbZqCBNFEWkKxJH87iu8G6TXS3cv2vL6pZsTSuHVBpVj95kPWZKrteCsdsbX
	Ugf6WtBrIPwd9BIvYBBOpn7c795BOHef5RuoNvXpiCLnvqZjafmP3abSqV4EEP+9bYDy45vgY9k
	o+3GwK0EXndiio/JFIKNYThIxw4DkuEWWgFdalG82ZPoyi6EjBscZHeWWo24f9AA69qSB59H0PX
	GAaCcMVH+kVFxz6J5
X-Received: by 2002:a05:622a:1b8f:b0:517:675f:3ee8 with SMTP id
 d75a77b69052e-51778579d07mr56111621cf.12.1780494589748; Wed, 03 Jun 2026
 06:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260602114204.1646653-1-sivakumar.bs@gmail.com> <DIZF18MG982K.1Y7D5ETMYWTR6@bootlin.com>
In-Reply-To: <DIZF18MG982K.1Y7D5ETMYWTR6@bootlin.com>
From: Siva Kumar Balasubramanian <sivakumar.bs@gmail.com>
Date: Wed, 3 Jun 2026 19:19:21 +0530
X-Gm-Features: AVHnY4JRYsoGqj6df6krRTZe2S337MA8bprEON0a1dWwvK3VIYEa073E9BUf3Jk
Message-ID: <CACFV95JePfPmV7VnR8-bpJpSFLrgU8Bmtq7mdWpDYnP2LTJboQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] qemuboot.bbclass: add missing task
 dependency on kernel deploy
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008be87b065359b3e2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 13:49:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238098

--0000000000008be87b065359b3e2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

I will look into this and get back to you.

Thanks,
Siva

On Wed, Jun 3, 2026 at 6:03=E2=80=AFPM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Tue Jun 2, 2026 at 1:42 PM CEST, Siva Balasubramanian via
> lists.openembedded.org wrote:
> > do_write_qemuboot_conf had no dependency on the kernel deploy task,
> > so if the kernel was rebuilt without invalidating the rootfs sstate,
> > the task was skipped and .qemuboot.conf was left stale while new
> > image artifacts were deployed with a new timestamp suffix.
> >
> > Add do_write_qemuboot_conf[depends] on KERNEL_DEPLOY_DEPEND using a
> > Python expression to guard against the empty case, since baremetal
> > images (which inherit qemuboot via baremetal-image.bbclass) do not
> > set KERNEL_DEPLOY_DEPEND.
> >
> > KERNEL_DEPLOY_DEPEND is defined with ?=3D in image.bbclass and is
> > already used by do_build[depends] for the same reason.
> >
> > Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14520
> > Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
> > ---
>
> Hi Siva,
>
> Thanks for the new version.
>
> It looks like we still have a failing selftest:
>
> 2026-06-02 20:22:55,502 - oe-selftest - INFO -
> fitimage.KernelFitImageRecipeTests.test_fit_image_sign_initramfs_bundle
> (subunit.RemotedTestCase)
> 2026-06-02 20:22:55,503 - oe-selftest - INFO -  ... FAIL
> ...
> Initialising tasks...ERROR: 4014 unbuildable tasks were found.
> These are usually caused by circular dependencies and any circular
> dependency chains found will be printed below. Increase the debug level t=
o
> see a list of unbuildable tasks.
>
> Identifying dependency loops (this may take a short while)...
>
> ERROR:
> Dependency loop #1 found:
>   Task
> /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openembedded=
-core/meta/recipes-core/images/core-image-minimal-initramfs.bb:do_image
> (dependent Tasks ['core-image-minimal-initramfs.bb:do_flush_pseudodb',
> 'core-image-minimal-initramfs.bb:do_image_qa',
> 'core-image-minimal-initramfs.bb:do_write_qemuboot_conf',
> 'core-image-minimal-initramfs.bb:do_rootfs',
> 'core-image-minimal-initramfs.bb:do_create_rootfs_spdx'])
>   Task
> /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openembedded=
-core/meta/recipes-core/images/core-image-minimal-initramfs.bb:do_image_cpi=
o
> (dependent Tasks ['cpio_2.15.bb:do_populate_sysroot',
> 'core-image-minimal-initramfs.bb:do_image'])
>   Task
> /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openembedded=
-core/meta/recipes-core/images/core-image-minimal-initramfs.bb:do_image_com=
plete
> (dependent Tasks ['u-boot_2026.04.bb:do_populate_sysroot',
> 'core-image-minimal-initramfs.bb:do_image_cpio',
> 'qemu-helper-native_1.0.bb:do_addto_recipe_sysroot',
> 'core-image-minimal-initramfs.bb:do_image', 'qemu-helper-native_1.0.bb:do=
_populate_sysroot',
> 'qemu-native_10.2.0.bb:do_populate_sysroot', 'qemu-system-native_10.2.0.b=
b
> :do_populate_sysroot'])
>   Task
> /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openembedded=
-core/meta/recipes-kernel/linux/linux-yocto_6.18.bb:do_bundle_initramfs
> (dependent Tasks ['linux-yocto_6.18.bb:do_install',
> 'core-image-minimal-initramfs.bb:do_image_complete'])
>   Task
> /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openembedded=
-core/meta/recipes-kernel/linux/linux-yocto_6.18.bb:do_transform_bundled_in=
itramfs
> (dependent Tasks ['linux-yocto_6.18.bb:do_bundle_initramfs'])
>   Task
> /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openembedded=
-core/meta/recipes-kernel/linux/linux-yocto_6.18.bb:do_deploy
> (dependent Tasks ['pigz_2.8.bb:do_populate_sysroot', 'linux-yocto_6.18.bb=
:do_bundle_initramfs',
> 'linux-yocto_6.18.bb:do_transform_bundled_initramfs',
> 'linux-yocto_6.18.bb:do_install', 'depmodwrapper-cross_1.0.bb:do_populate=
_sysroot',
> 'linux-yocto_6.18.bb:do_packagedata', 'linux-yocto_6.18.bb:
> do_populate_sysroot'])
>   Task
> /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openembedded=
-core/meta/recipes-core/images/core-image-minimal-initramfs.bb:do_write_qem=
uboot_conf
> (dependent Tasks ['core-image-minimal-initramfs.bb:do_rootfs',
> 'linux-yocto_6.18.bb:do_deploy'])
> ...
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4039
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3951
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3809
>
> Can you have a look at the issue?
> The configuration used to reproduce can be found in the "OE Selftest:
> Add layers" and "OE Selftest: Write config" steps.
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--=20

Sivakumar B

--0000000000008be87b065359b3e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Hi Mathieu,</div><div class=3D"gmail_default" style=3D"=
font-family:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_defau=
lt" style=3D"font-family:arial,helvetica,sans-serif">I will look into this=
=C2=A0and get back to you.</div><div class=3D"gmail_default" style=3D"font-=
family:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_default" s=
tyle=3D"font-family:arial,helvetica,sans-serif">Thanks,</div><div class=3D"=
gmail_default" style=3D"font-family:arial,helvetica,sans-serif">Siva</div><=
/div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Jun 3, 2026 at 6:03=E2=80=AFPM Mathieu Dubois-=
Briand &lt;<a href=3D"mailto:mathieu.dubois-briand@bootlin.com">mathieu.dub=
ois-briand@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On Tue Jun 2, 2026 at 1:42 PM CEST, Siva Balasubraman=
ian via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=
=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; do_write_qemuboot_conf had no dependency on the kernel deploy task,<br=
>
&gt; so if the kernel was rebuilt without invalidating the rootfs sstate,<b=
r>
&gt; the task was skipped and .qemuboot.conf was left stale while new<br>
&gt; image artifacts were deployed with a new timestamp suffix.<br>
&gt;<br>
&gt; Add do_write_qemuboot_conf[depends] on KERNEL_DEPLOY_DEPEND using a<br=
>
&gt; Python expression to guard against the empty case, since baremetal<br>
&gt; images (which inherit qemuboot via baremetal-image.bbclass) do not<br>
&gt; set KERNEL_DEPLOY_DEPEND.<br>
&gt;<br>
&gt; KERNEL_DEPLOY_DEPEND is defined with ?=3D in image.bbclass and is<br>
&gt; already used by do_build[depends] for the same reason.<br>
&gt;<br>
&gt; Fixes: <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D=
14520" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.o=
rg/show_bug.cgi?id=3D14520</a><br>
&gt; Signed-off-by: Siva Balasubramanian &lt;<a href=3D"mailto:sivakumar.bs=
@gmail.com" target=3D"_blank">sivakumar.bs@gmail.com</a>&gt;<br>
&gt; ---<br>
<br>
Hi Siva,<br>
<br>
Thanks for the new version.<br>
<br>
It looks like we still have a failing selftest:<br>
<br>
2026-06-02 20:22:55,502 - oe-selftest - INFO - fitimage.KernelFitImageRecip=
eTests.test_fit_image_sign_initramfs_bundle (subunit.RemotedTestCase)<br>
2026-06-02 20:22:55,503 - oe-selftest - INFO -=C2=A0 ... FAIL<br>
...<br>
Initialising tasks...ERROR: 4014 unbuildable tasks were found.<br>
These are usually caused by circular dependencies and any circular dependen=
cy chains found will be printed below. Increase the debug level to see a li=
st of unbuildable tasks.<br>
<br>
Identifying dependency loops (this may take a short while)...<br>
<br>
ERROR:<br>
Dependency loop #1 found:<br>
=C2=A0 Task /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/op=
enembedded-core/meta/recipes-core/images/core-image-minimal-initramfs.bb:do=
_image (dependent Tasks [&#39;core-image-minimal-initramfs.bb:do_flush_pseu=
dodb&#39;, &#39;core-image-minimal-initramfs.bb:do_image_qa&#39;, &#39;core=
-image-minimal-initramfs.bb:do_write_qemuboot_conf&#39;, &#39;core-image-mi=
nimal-initramfs.bb:do_rootfs&#39;, &#39;core-image-minimal-initramfs.bb:do_=
create_rootfs_spdx&#39;])<br>
=C2=A0 Task /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/op=
enembedded-core/meta/recipes-core/images/core-image-minimal-initramfs.bb:do=
_image_cpio (dependent Tasks [&#39;cpio_2.15.bb:do_populate_sysroot&#39;, &=
#39;core-image-minimal-initramfs.bb:do_image&#39;])<br>
=C2=A0 Task /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/op=
enembedded-core/meta/recipes-core/images/core-image-minimal-initramfs.bb:do=
_image_complete (dependent Tasks [&#39;u-boot_2026.04.bb:do_populate_sysroo=
t&#39;, &#39;core-image-minimal-initramfs.bb:do_image_cpio&#39;, &#39;qemu-=
helper-native_1.0.bb:do_addto_recipe_sysroot&#39;, &#39;core-image-minimal-=
initramfs.bb:do_image&#39;, &#39;qemu-helper-native_1.0.bb:do_populate_sysr=
oot&#39;, &#39;qemu-native_10.2.0.bb:do_populate_sysroot&#39;, &#39;<a href=
=3D"http://qemu-system-native_10.2.0.bb" target=3D"_blank">qemu-system-nati=
ve_10.2.0.bb</a>:do_populate_sysroot&#39;])<br>
=C2=A0 Task /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/op=
enembedded-core/meta/recipes-kernel/linux/linux-yocto_6.18.bb:do_bundle_ini=
tramfs (dependent Tasks [&#39;linux-yocto_6.18.bb:do_install&#39;, &#39;cor=
e-image-minimal-initramfs.bb:do_image_complete&#39;])<br>
=C2=A0 Task /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/op=
enembedded-core/meta/recipes-kernel/linux/linux-yocto_6.18.bb:do_transform_=
bundled_initramfs (dependent Tasks [&#39;linux-yocto_6.18.bb:do_bundle_init=
ramfs&#39;])<br>
=C2=A0 Task /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/op=
enembedded-core/meta/recipes-kernel/linux/linux-yocto_6.18.bb:do_deploy (de=
pendent Tasks [&#39;pigz_2.8.bb:do_populate_sysroot&#39;, &#39;linux-yocto_=
6.18.bb:do_bundle_initramfs&#39;, &#39;linux-yocto_6.18.bb:do_transform_bun=
dled_initramfs&#39;, &#39;linux-yocto_6.18.bb:do_install&#39;, &#39;depmodw=
rapper-cross_1.0.bb:do_populate_sysroot&#39;, &#39;linux-yocto_6.18.bb:do_p=
ackagedata&#39;, &#39;linux-yocto_6.18.bb:do_populate_sysroot&#39;])<br>
=C2=A0 Task /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/op=
enembedded-core/meta/recipes-core/images/core-image-minimal-initramfs.bb:do=
_write_qemuboot_conf (dependent Tasks [&#39;core-image-minimal-initramfs.bb=
:do_rootfs&#39;, &#39;linux-yocto_6.18.bb:do_deploy&#39;])<br>
...<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/buil=
ds/4039" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/23/builds/4039</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/buil=
ds/3951" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/35/builds/3951</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/buil=
ds/3809" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/48/builds/3809</a><br>
<br>
Can you have a look at the issue?<br>
The configuration used to reproduce can be found in the &quot;OE Selftest:<=
br>
Add layers&quot; and &quot;OE Selftest: Write config&quot; steps.<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><br></div>Sivakumar B=
<span></span><span></span></div></div></div></div>

--0000000000008be87b065359b3e2--

