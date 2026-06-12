Return-Path: <sivakumar.bs@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE3FCD4F2C
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 09:03:42 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66387.1781255016290567554
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 02:03:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LUd92+tJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: sivakumar.bs@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51776b4de37so6132981cf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 02:03:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781255015; cv=none;
        d=google.com; s=arc-20240605;
        b=B9165TdVnLXk2hEUa5q+JwOXZv6EaPDkiySNFsnGs0UY3O+4jTmbqa5M//owgYarKw
         5DKM6Q7hpLJut8xWPiOCpSIkUyK8In5FynsvquZlaImGhcqby/y/KIqQlbNiL6AYxpWw
         tVs0EWcedO/Ieq7iNKwAgFlMIWbhanoi2E96nV36JKu1zqKrNUe4+zcJvakfMJU/YU7O
         jiI3bwagbMfomcIQfLFhqRii6W59l2KwNiciDYIhdu2fbSudMKgbm+G9OmGSQEZIMAVo
         f6P79kxkjaIsIUwLg2RVVZRpYeXJ0RvNJbA88NiUoV+yLSsjNAGA3Y2yajcpjLBo5WFz
         EArw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0Y2p/ahlmOvUwEJAfUvydaPA/SRBGp/qDm9uUvDDVzQ=;
        fh=TGF7TVa5Eshw5M6K2XLmjdIMKFhrsPaliuC+tv7wzuY=;
        b=SCP2uWs5mJeKoMQ8KfvnShyirYpzcHlBLYuMDhsJ8tiVftkJNmNYC+uvQfnEHcub/B
         21m6P4bkZ1jnc/qA4CGC/AyrRovwdKfzU7kBQ78msjimAvGgtkrJl7absDt/MnI9Z3HD
         I2WxFGZ7zIxt2m5muKMtpOdO1Jm9HZw4JHWowCtN+C1Qy5vIMCxUC5qJ5imcJOz1J+Dh
         5On2GZB4FzPJ+75zo1JBL+mZvl3/a3SKVtdABLtAJlwZz92tKA8gRZluFkBV9dvBrUsz
         JCMLTojAtTlvuunSNLg9mJNvPk5Yi8BX0WD9QRGilQYNf7wOuvFVJXAjKBC4EGmxmqcQ
         Gp9w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781255015; x=1781859815; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0Y2p/ahlmOvUwEJAfUvydaPA/SRBGp/qDm9uUvDDVzQ=;
        b=LUd92+tJdqQEOibjAY4LDhv8ybSNSQx58aR41e6Mqso2EgvkI65liJsRntIKLB61nE
         HudvHKINH72ce9FqbgrVWiGSSpbzq5HtMurrXVM0bOeTmrB7DFnza9HYu5nF8QOf7aVi
         pl0+D/B6kqakQAHG/ZOtmknUMJoQdEm0zC89nQ33fn0xzWZhf3j8H8c3LUAgogVEW4i/
         QqMhMzZmb0IW9gX9aq/0f9uOphUX6UoXJZU8IMs15qEHZb45FV81Q1RcAnkTOKxxmX4v
         09WZR0KnV9usteYqCMQ569MMhfLd0F5AJDKXMpeEvbCA7w4mB4J0XMaXo5AWBMxGNpZg
         MQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781255015; x=1781859815;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Y2p/ahlmOvUwEJAfUvydaPA/SRBGp/qDm9uUvDDVzQ=;
        b=rNsielV+cTU3fOy+AYxM0Q43JNSNpJRbwZRJIsg+aCDxU949+UKnfbG32sHpJFB5sJ
         naAc237Qp4fa8Kr5W8I95zvC74DjSJFEcVhD4AnafiOQoU87LEYu7SbdOpReeE1VC2KY
         GzJnyY8qyJa4kqU2l2fKde55vBN9WJLuMmFtEzLEF7kOL3HI+rMX2lo7AtFVEDjZR7cC
         W8pgj+J8LI6DrMI3JCNBZwgOhptNZ6BYVawHjlW6Iunp3+9wRe6Hu0aFDn8u+ldPDk6u
         a68CpykdCRxxuMW4AKbnd0B75AjdYp1qDoO1IyS3zb+6D6OlJWqX8lB50V+1bfPeBF/I
         vkRQ==
X-Gm-Message-State: AOJu0YzU/XGiDDoKspjRDpJDkyGBe2B4LGZTGfDDFSxryXr3dDE3N+1h
	os4tm9DlVX300cykGqtGHxFc78EcMwXdojtd1DWY80e4t1CBLqrssTbFOnv8Xj+RcKZzMNLvrnn
	JkMMUXWDO8FKX1QCjQClV0rNoripNyus=
X-Gm-Gg: Acq92OF6byX0h32munyFgju9PikZQn+1AuEJvqO90ZugknvzWu1+BwxT89gCQggD7k7
	mQtkiEGuLmMW5w61zVPmpcW3bal0mSc6Ttzum4XNNQ0yIsxdO0Mm0DA8xWi9Kfsuj5INsHQQTVi
	duapcFhCGboaHQGZVfCKNG2U+cQpo6r3z7hydPmU6K3l7LYCnmiwd8gmjpVZXh/5mjSguUfjKKU
	C5770UocsbGiBTXu5kYEwLXDqJRyRpVuKFJsLcPiSbEX9YFxZRVbnXFu845xpijrKeD0nyooWBT
	FMI/mmq+kNsmngWIH7voG8iXTnTAqDewFMnJlE7gNCXKzQeEpLg=
X-Received: by 2002:ac8:5750:0:b0:517:8e3c:efc6 with SMTP id
 d75a77b69052e-517fe46d2b4mr23085981cf.24.1781255014987; Fri, 12 Jun 2026
 02:03:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260602114204.1646653-1-sivakumar.bs@gmail.com>
 <DIZF18MG982K.1Y7D5ETMYWTR6@bootlin.com> <CACFV95JePfPmV7VnR8-bpJpSFLrgU8Bmtq7mdWpDYnP2LTJboQ@mail.gmail.com>
In-Reply-To: <CACFV95JePfPmV7VnR8-bpJpSFLrgU8Bmtq7mdWpDYnP2LTJboQ@mail.gmail.com>
From: Siva Kumar Balasubramanian <sivakumar.bs@gmail.com>
Date: Fri, 12 Jun 2026 14:33:08 +0530
X-Gm-Features: AVVi8CcnMLo6s-qmzYfkRqIESnZwDEE4clnNzcLCStFTsijKeckEAHDk2NLdCqY
Message-ID: <CACFV95Jie0tFsS=PRsW-0MS88sWEUsdDsC7pCbsAZV3UJA6yiw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] qemuboot.bbclass: add missing task
 dependency on kernel deploy
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006c41d606540ac0a2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 09:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238596

--0000000000006c41d606540ac0a2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

The circular dependency occurs because when INITRAMFS_IMAGE_BUNDLE=3D1,
linux-yocto:do_deploy depends on the initramfs image completing first,
so adding an unconditional kernel deploy dependency on
do_write_qemuboot_conf created a cycle back into the initramfs image.

v4 fixes this by skipping the kernel deploy dependency when
INITRAMFS_IMAGE_BUNDLE=3D1:

  do_write_qemuboot_conf[depends] +=3D "${@ '' if
bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE')) else
(d.getVar('KERNEL_DEPLOY_DEPEND') or '')}"

Tested with INITRAMFS_IMAGE_BUNDLE=3D1 using bitbake -g =E2=80=94 no circul=
ar
dependency detected.

https://lists.openembedded.org/g/openembedded-core/topic/patch_v4_qemuboot_=
bbclass/119770767

Thanks,
Siva

On Wed, Jun 3, 2026 at 7:19=E2=80=AFPM Siva Kumar Balasubramanian <
sivakumar.bs@gmail.com> wrote:

> Hi Mathieu,
>
> I will look into this and get back to you.
>
> Thanks,
> Siva
>
> On Wed, Jun 3, 2026 at 6:03=E2=80=AFPM Mathieu Dubois-Briand <
> mathieu.dubois-briand@bootlin.com> wrote:
>
>> On Tue Jun 2, 2026 at 1:42 PM CEST, Siva Balasubramanian via
>> lists.openembedded.org wrote:
>> > do_write_qemuboot_conf had no dependency on the kernel deploy task,
>> > so if the kernel was rebuilt without invalidating the rootfs sstate,
>> > the task was skipped and .qemuboot.conf was left stale while new
>> > image artifacts were deployed with a new timestamp suffix.
>> >
>> > Add do_write_qemuboot_conf[depends] on KERNEL_DEPLOY_DEPEND using a
>> > Python expression to guard against the empty case, since baremetal
>> > images (which inherit qemuboot via baremetal-image.bbclass) do not
>> > set KERNEL_DEPLOY_DEPEND.
>> >
>> > KERNEL_DEPLOY_DEPEND is defined with ?=3D in image.bbclass and is
>> > already used by do_build[depends] for the same reason.
>> >
>> > Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14520
>> > Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
>> > ---
>>
>> Hi Siva,
>>
>> Thanks for the new version.
>>
>> It looks like we still have a failing selftest:
>>
>> 2026-06-02 20:22:55,502 - oe-selftest - INFO -
>> fitimage.KernelFitImageRecipeTests.test_fit_image_sign_initramfs_bundle
>> (subunit.RemotedTestCase)
>> 2026-06-02 20:22:55,503 - oe-selftest - INFO -  ... FAIL
>> ...
>> Initialising tasks...ERROR: 4014 unbuildable tasks were found.
>> These are usually caused by circular dependencies and any circular
>> dependency chains found will be printed below. Increase the debug level =
to
>> see a list of unbuildable tasks.
>>
>> Identifying dependency loops (this may take a short while)...
>>
>> ERROR:
>> Dependency loop #1 found:
>>   Task
>> /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openembedde=
d-core/meta/recipes-core/images/core-image-minimal-initramfs.bb:do_image
>> (dependent Tasks ['core-image-minimal-initramfs.bb:do_flush_pseudodb',
>> 'core-image-minimal-initramfs.bb:do_image_qa',
>> 'core-image-minimal-initramfs.bb:do_write_qemuboot_conf',
>> 'core-image-minimal-initramfs.bb:do_rootfs',
>> 'core-image-minimal-initramfs.bb:do_create_rootfs_spdx'])
>>   Task
>> /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openembedde=
d-core/meta/recipes-core/images/core-image-minimal-initramfs.bb:do_image_cp=
io
>> (dependent Tasks ['cpio_2.15.bb:do_populate_sysroot',
>> 'core-image-minimal-initramfs.bb:do_image'])
>>   Task
>> /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openembedde=
d-core/meta/recipes-core/images/core-image-minimal-initramfs.bb:do_image_co=
mplete
>> (dependent Tasks ['u-boot_2026.04.bb:do_populate_sysroot',
>> 'core-image-minimal-initramfs.bb:do_image_cpio',
>> 'qemu-helper-native_1.0.bb:do_addto_recipe_sysroot',
>> 'core-image-minimal-initramfs.bb:do_image', 'qemu-helper-native_1.0.bb:d=
o_populate_sysroot',
>> 'qemu-native_10.2.0.bb:do_populate_sysroot', '
>> qemu-system-native_10.2.0.bb:do_populate_sysroot'])
>>   Task
>> /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openembedde=
d-core/meta/recipes-kernel/linux/linux-yocto_6.18.bb:do_bundle_initramfs
>> (dependent Tasks ['linux-yocto_6.18.bb:do_install',
>> 'core-image-minimal-initramfs.bb:do_image_complete'])
>>   Task
>> /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openembedde=
d-core/meta/recipes-kernel/linux/linux-yocto_6.18.bb:do_transform_bundled_i=
nitramfs
>> (dependent Tasks ['linux-yocto_6.18.bb:do_bundle_initramfs'])
>>   Task
>> /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openembedde=
d-core/meta/recipes-kernel/linux/linux-yocto_6.18.bb:do_deploy
>> (dependent Tasks ['pigz_2.8.bb:do_populate_sysroot',
>> 'linux-yocto_6.18.bb:do_bundle_initramfs', 'linux-yocto_6.18.bb:do_trans=
form_bundled_initramfs',
>> 'linux-yocto_6.18.bb:do_install', 'depmodwrapper-cross_1.0.bb:do_populat=
e_sysroot',
>> 'linux-yocto_6.18.bb:do_packagedata', 'linux-yocto_6.18.bb:
>> do_populate_sysroot'])
>>   Task
>> /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openembedde=
d-core/meta/recipes-core/images/core-image-minimal-initramfs.bb:do_write_qe=
muboot_conf
>> (dependent Tasks ['core-image-minimal-initramfs.bb:do_rootfs',
>> 'linux-yocto_6.18.bb:do_deploy'])
>> ...
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4039
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3951
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3809
>>
>> Can you have a look at the issue?
>> The configuration used to reproduce can be found in the "OE Selftest:
>> Add layers" and "OE Selftest: Write config" steps.
>>
>> Thanks,
>> Mathieu
>>
>> --
>> Mathieu Dubois-Briand, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>>
>
> --
>
> Sivakumar B
>


--=20

Sivakumar B

--0000000000006c41d606540ac0a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:arial,helvetica,sans-serif">Hi=C2=A0Mathieu,</div><div class=3D"gm=
ail_default" style=3D"font-family:arial,helvetica,sans-serif"><br></div><di=
v class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">=
The circular dependency occurs because when INITRAMFS_IMAGE_BUNDLE=3D1,<br>=
linux-yocto:do_deploy depends on the initramfs image completing first,<br>s=
o adding an unconditional kernel deploy dependency on<br>do_write_qemuboot_=
conf created a cycle back into the initramfs image.<br><br>v4 fixes this by=
 skipping the kernel deploy dependency when<br>INITRAMFS_IMAGE_BUNDLE=3D1:<=
br><br>=C2=A0 do_write_qemuboot_conf[depends] +=3D &quot;${@ &#39;&#39; if =
bb.utils.to_boolean(d.getVar(&#39;INITRAMFS_IMAGE_BUNDLE&#39;)) else (d.get=
Var(&#39;KERNEL_DEPLOY_DEPEND&#39;) or &#39;&#39;)}&quot;<br><br>Tested wit=
h INITRAMFS_IMAGE_BUNDLE=3D1 using bitbake -g =E2=80=94 no circular<br>depe=
ndency detected.</div><div class=3D"gmail_default" style=3D"font-family:ari=
al,helvetica,sans-serif"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-family:arial,helvetica,sans-serif"><a href=3D"https://lists.openembedded=
.org/g/openembedded-core/topic/patch_v4_qemuboot_bbclass/119770767">https:/=
/lists.openembedded.org/g/openembedded-core/topic/patch_v4_qemuboot_bbclass=
/119770767</a></div><div class=3D"gmail_default" style=3D"font-family:arial=
,helvetica,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font=
-family:arial,helvetica,sans-serif">Thanks,</div><div class=3D"gmail_defaul=
t" style=3D"font-family:arial,helvetica,sans-serif">Siva</div></div><br><di=
v class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gma=
il_attr">On Wed, Jun 3, 2026 at 7:19=E2=80=AFPM Siva Kumar Balasubramanian =
&lt;<a href=3D"mailto:sivakumar.bs@gmail.com">sivakumar.bs@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr"><div style=3D"font-family:arial,helvetica,sans-serif">Hi Mathieu,=
</div><div style=3D"font-family:arial,helvetica,sans-serif"><br></div><div =
style=3D"font-family:arial,helvetica,sans-serif">I will look into this=C2=
=A0and get back to you.</div><div style=3D"font-family:arial,helvetica,sans=
-serif"><br></div><div style=3D"font-family:arial,helvetica,sans-serif">Tha=
nks,</div><div style=3D"font-family:arial,helvetica,sans-serif">Siva</div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Wed, Jun 3, 2026 at 6:03=E2=80=AFPM Mathieu Dubois-Briand &lt;<a href=3D"=
mailto:mathieu.dubois-briand@bootlin.com" target=3D"_blank">mathieu.dubois-=
briand@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Tue Jun 2, 2026 at 1:42 PM CEST, Siva Balasubramanian =
via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"=
_blank">lists.openembedded.org</a> wrote:<br>
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
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><br></div>Sivakumar B=
<span></span><span></span></div></div></div></div></div>

--0000000000006c41d606540ac0a2--

