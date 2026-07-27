Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF68C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 08:11:44 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26735.1785139899035140428
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 01:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1+/FnFJN;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f6609c657so1038071f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 01:11:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785139897; cv=none;
        d=google.com; s=arc-20260327;
        b=LKUyUi6Gt8q4Wq6jed3sDKhWemTABg5URZeS23FVd8EPrrarsXD/e1G7+4nA2X/jzn
         s5E7UrI0g4q03FR2+bkFmnzPJboLtQJuA0i7F01RciciGJIcn3c8cm+hRykMjRLQcJYu
         dDrCXw67Gh11vP60dkRkK18TmmWhJlJWCAe9jkIRxnnGpf9uLcWrGt5o/subWCtOKsZ+
         PrVI+WAMwY3d5uhJFPMPlGBwOQQCvZLy3iDWMKEc79Hmhnkn91AoAdrBlLZTqcAdGwIi
         44r1zI6vbGYHDDG3RYwDXAvxFfiroQndvw+dGUR00ThtpihQE/WEqduJnSra38Rzlisn
         Q0Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AISxc+kmUZNMybw35iJQRHi81eRMejUKC2vLONKMpi8=;
        fh=i8apDbNb4a/lfMzeW6KeKO6CiKqptmqNPG1+ebOrmCc=;
        b=rHVtDpqr7jIzufvN6CodhWiWJuTq86uUG7l9MfFT6l+ozgVLjVLy5u4NEwW2bZgI/q
         Tb2iSaoeaaMqqHLG0w0SXbAj1eSNUEzhag/7TDUnN1ZX0kDhiVit4P+3mMkByPCCGctD
         ZWi7Y/I4XzNjsHuuWEcf+3m/dCvS9uGraprrMEcutkUGmLPpkXjTzGNPl4hzIAtJqc7i
         Lb9XDaMvgLpvmjsvT7xXypkVZ8XG91LGna6yNLH2R+EdkRrNEwhcI2uXLytR902cqvdT
         Srd4r/VBCg3GHAd74WFjxDiNjBzgzwKT/WLKd/QUYlnHU5r4e6Bb+zhivcYfHWax1+Hi
         8fcA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785139897; x=1785744697; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AISxc+kmUZNMybw35iJQRHi81eRMejUKC2vLONKMpi8=;
        b=1+/FnFJNUIXrnR4wC6l4NzhND1RnYGLTzDzaectm7MDNEcD0IEj/bf0KUii4Y5vNRX
         Y6SkKc7dYOt5V9A/vUtp9qBdPA5ii6DCCdbqbup38y7IY26/THI1uybNV3YB05agNYJw
         bocD97bLZweSJnbsZ6a1yc7P7p1zoGkzWakY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785139897; x=1785744697;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AISxc+kmUZNMybw35iJQRHi81eRMejUKC2vLONKMpi8=;
        b=OLWxW8TmhKKx9lYFTaDd2bz2bKfpW8emdWXfcltxb/ITnShMNe4f+V6Co7jLBH6rc9
         a27UmhlRXveHZMAnVNeb/AGJjeyA6Cw+Oi7a2vVpjhtHqIqDYVmhHLq+rXWlzCzJjidz
         nSVoMKQU4BKsx/S+e1UBs9KbpukfkFK0xKGSYvCM7/fnAQi1952x3w0t19UfQqwKD4qE
         rOQbqK8a2P/vgMHeZ4qxlhEOhSv85zOqZg0OD5HS/H6UPQpGf/DwovmFkZVmvH2K//mU
         HsKKU+WHJ/anubGLK3tGKBl6ft1ZQMp0DZzg2n6DqxSbIQukiH+Ya0LxHUMtT/Ay849k
         VwWQ==
X-Forwarded-Encrypted: i=1; AHgh+RquY/OrLcRUKXzc+eL1ruXvRaqCbeHzfzAyRM6oz89+vcOVuDX8O46lyZ+NsbiFUUn61qzdbhn8Ikyknsv8mCgUMA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyNlCXHW0rCPKfnm2HxNxjLOzAVTRyad0oSlGTWTS9bxS7VRy3K
	PtHezkjSstQplIEu8p4xwqHbdHdAoDCJ7IyzbpUnW44TAFgA0kYKDj8/8u9ZfjgItlNGsNihaCM
	Ua9kDLymJtOIN6FfKDUjWGhn5rPIP0R8e3mh284HMwQ==
X-Gm-Gg: AR+sD11NJvYDqdB6K0xwgvJ82H3ii+m7SEX7zvf6UoO6vv4lGdg+/95ukyE5Zi/PIkV
	vbYNtfiBXZQ2hzHQPY5gBp9OnfuBrfM+napRhEskKhe4OqFY1afG6A6uKwi03KiXbSGRYaPdXo5
	sMrF/xyCkfe0Y5EdxXFpbs1JjurgFWMaad1q0joAzHZwRDKrDxARnxIbVOpr27TvggMP6XrnbXY
	hSYADn6k3fFuxymMV2ll52Taji+Mv58tJkzqzY4DuaHOcSHl0X3gyR3BW+rkJ1e
X-Received: by 2002:a05:600c:6d15:b0:495:441a:39d2 with SMTP id
 5b1f17b1804b1-496b571a000mr56373825e9.21.1785139897042; Mon, 27 Jul 2026
 01:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260723124944.69070-1-nora.schiffer@ew.tq-group.com>
 <20260723124944.69070-3-nora.schiffer@ew.tq-group.com> <DK7O7LEQJGUL.2565TJL3V1PLS@bootlin.com>
 <69f7557723a0141ed957ffe24aba08cd3065f60f.camel@ew.tq-group.com>
In-Reply-To: <69f7557723a0141ed957ffe24aba08cd3065f60f.camel@ew.tq-group.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 27 Jul 2026 10:11:08 +0200
X-Gm-Features: AUfX_mxd0A8zdmCobP0tV1pyxqlIHjB3Lc6yUo8z1flgVVREJNW1Gi0ELAPLQgw
Message-ID: <CAMSfU+55jTUi+t1tSHJysfC1_snS8AHmdi=FsxHmGmHruxWeOQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] kernel-fit-image: reintroduce option to
 replace kernel image
To: nora.schiffer@ew.tq-group.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, oss@ew.tq-group.com, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000070195d0657934578"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 08:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242060

--00000000000070195d0657934578
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 27 juil. 2026 =C3=A0 10:03, Nora Schiffer via lists.openembedded.or=
g
<nora.schiffer=3Dew.tq-group.com@lists.openembedded.org> a =C3=A9crit :

> On Sat, 2026-07-25 at 15:02 +0200, Mathieu Dubois-Briand wrote:
> > On Thu Jul 23, 2026 at 2:49 PM CEST, Nora Schiffer via
> lists.openembedded.org wrote:
> > > A similar feature was added in commit 9c8ef2119949 ("kernel-fit-image=
:
> > > control kernel section with FIT_LINUX_BIN") and subsequently reverted
> in
> > > commit 6eae261b6f52 ("Revert "kernel-fit-image: control kernel sectio=
n
> > > with FIT_LINUX_BIN"") due to its incomplete implementation and lack o=
f
> > > tests. Reintroduce an improved version:
> > >
> > > - The FIT_LINUX_BIN variable (which had been left unused) is renamed =
to
> > >   FIT_KERNEL_FILENAME. It can now actually be used to select a
> different
> > >   file from DEPLOY_DIR_IMAGE. The file will be compressed using
> > >   FIT_KERNEL_COMP_ALG as part of the FIT image recipe, rather than th=
an
> > >   letting the kernel recipe handle this through
> > >   kernel-fit-extra-artifacts.bbclass.
> > > - Alternatively, FIT_KERNEL_FILENAME_COMPRESSED can be used to select=
 a
> > >   pre-compressed file from DEPLOY_DIR_IMAGE. In this case,
> > >   FIT_KERNEL_COMP_ALG only controls the "compression" field of the
> > >   generated FIT image.
> > > - To preserve backwards compatibility, FIT_KERNEL_FILENAME_COMPRESSED
> > >   defaults to "linux.bin". As a special case, the compression algorit=
hm
> > >   will be read from "linux_comp" for linux.bin. This behavior is
> > >   considered deprecated and relying on it results in a warning.
> > > - Add tests.
> > >
> > > To resolve the new deprecation warning, it is usually sufficient to s=
et
> > > KERNEL_IMAGETYPE to the desired type ("Image" on many archs) and set
> > > FIT_KERNEL_FILENAME to the same value.
> > >
> > > Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> > > ---
> >
> > Hi Nora,
> >
> > Thanks for your patch.
> >
> > It looks like the test_fit_image_kernel_filename selftest is failing on
> > arm hosts:
>
> Hi Mathieu,
>
> I believe I know how to fix this, but it is unclear to me what exact
> configuration is built here. Is there any way I can replicate the same
> autobuilder configuration, so I can run the tests myself before submittin=
g
> v2?
>

Hello,

You can find the generated config in the "Write Config" step just above the
failing step. In this case:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4420/ste=
ps/14/logs/stdio

Regards,


>
> Best,
> Nora
>
>
>
> >
> > 2026-07-24 21:31:27,684 - oe-selftest - INFO -
> fitimage.KernelFitImageRecipeTests.test_fit_image_kernel_filename
> (subunit.RemotedTestCase)
> > 2026-07-24 21:31:27,685 - oe-selftest - INFO -  ... FAIL
> > ...
> > ERROR: linux-yocto-fitimage-1.0-r0 do_compile: Error executing a python
> function in exec_func_python() autogenerated:
> >
> > The stack trace of python calls that resulted in this exception/failure
> was:
> > File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
> >      0001:
> >  *** 0002:do_compile(d)
> >      0003:
> > File:
> '/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openembedde=
d-core/meta/classes-recipe/kernel-fit-image.bbclass',
> lineno: 129, function: do_compile
> >      0125:
> >      0126:    elif kernel_compressed:
> >      0127:        kernel_path =3D os.path.join(kernel_deploydir,
> kernel_compressed)
> >      0128:        kernel_name =3D os.path.basename(kernel_compressed)
> >  *** 0129:        shutil.copyfile(kernel_path, kernel_name)
> >      0130:
> >      0131:    # FIT_KERNEL_FILENAME or FIT_KERNEL_FILENAME_COMPRESSED
> was set
> >      0132:    if kernel_name:
> >      0133:        root_node.fitimage_emit_section_kernel("kernel-1",
> kernel_name, kernel_comp_alg,
> > File: '/usr/lib/python3.14/shutil.py', lineno: 313, function: copyfile
> >      0309:
> >      0310:    if not follow_symlinks and _islink(src):
> >      0311:        os.symlink(os.readlink(src), dst)
> >      0312:    else:
> >  *** 0313:        with open(src, 'rb') as fsrc:
> >      0314:            try:
> >      0315:                with open(dst, 'wb') as fdst:
> >      0316:                    # macOS
> >      0317:                    if _HAS_FCOPYFILE:
> > Exception: FileNotFoundError: [Errno 2] No such file or directory:
> '/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1142023/t=
mp/deploy/images/qemuarm64/bzImage'
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4420
> >
> > Can you have a look at the issue?
> >
> > Thanks,
> > Mathieu
> >
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> https://www.tq-group.com/
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#242059):
> https://lists.openembedded.org/g/openembedded-core/message/242059
> Mute This Topic: https://lists.openembedded.org/mt/120409821/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--00000000000070195d0657934578
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 27=
 juil. 2026 =C3=A0=C2=A010:03, Nora Schiffer via <a href=3D"http://lists.op=
enembedded.org">lists.openembedded.org</a> &lt;nora.schiffer=3D<a href=3D"m=
ailto:ew.tq-group.com@lists.openembedded.org">ew.tq-group.com@lists.openemb=
edded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On Sat, 2026-07-25 at 15:02 +0200, Mathieu Dubois-Bri=
and wrote:<br>
&gt; On Thu Jul 23, 2026 at 2:49 PM CEST, Nora Schiffer via <a href=3D"http=
://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.opene=
mbedded.org</a> wrote:<br>
&gt; &gt; A similar feature was added in commit 9c8ef2119949 (&quot;kernel-=
fit-image:<br>
&gt; &gt; control kernel section with FIT_LINUX_BIN&quot;) and subsequently=
 reverted in<br>
&gt; &gt; commit 6eae261b6f52 (&quot;Revert &quot;kernel-fit-image: control=
 kernel section<br>
&gt; &gt; with FIT_LINUX_BIN&quot;&quot;) due to its incomplete implementat=
ion and lack of<br>
&gt; &gt; tests. Reintroduce an improved version:<br>
&gt; &gt; <br>
&gt; &gt; - The FIT_LINUX_BIN variable (which had been left unused) is rena=
med to<br>
&gt; &gt;=C2=A0 =C2=A0FIT_KERNEL_FILENAME. It can now actually be used to s=
elect a different<br>
&gt; &gt;=C2=A0 =C2=A0file from DEPLOY_DIR_IMAGE. The file will be compress=
ed using<br>
&gt; &gt;=C2=A0 =C2=A0FIT_KERNEL_COMP_ALG as part of the FIT image recipe, =
rather than than<br>
&gt; &gt;=C2=A0 =C2=A0letting the kernel recipe handle this through<br>
&gt; &gt;=C2=A0 =C2=A0kernel-fit-extra-artifacts.bbclass.<br>
&gt; &gt; - Alternatively, FIT_KERNEL_FILENAME_COMPRESSED can be used to se=
lect a<br>
&gt; &gt;=C2=A0 =C2=A0pre-compressed file from DEPLOY_DIR_IMAGE. In this ca=
se,<br>
&gt; &gt;=C2=A0 =C2=A0FIT_KERNEL_COMP_ALG only controls the &quot;compressi=
on&quot; field of the<br>
&gt; &gt;=C2=A0 =C2=A0generated FIT image.<br>
&gt; &gt; - To preserve backwards compatibility, FIT_KERNEL_FILENAME_COMPRE=
SSED<br>
&gt; &gt;=C2=A0 =C2=A0defaults to &quot;linux.bin&quot;. As a special case,=
 the compression algorithm<br>
&gt; &gt;=C2=A0 =C2=A0will be read from &quot;linux_comp&quot; for linux.bi=
n. This behavior is<br>
&gt; &gt;=C2=A0 =C2=A0considered deprecated and relying on it results in a =
warning.<br>
&gt; &gt; - Add tests.<br>
&gt; &gt; <br>
&gt; &gt; To resolve the new deprecation warning, it is usually sufficient =
to set<br>
&gt; &gt; KERNEL_IMAGETYPE to the desired type (&quot;Image&quot; on many a=
rchs) and set<br>
&gt; &gt; FIT_KERNEL_FILENAME to the same value.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Nora Schiffer &lt;<a href=3D"mailto:nora.schiffer@=
ew.tq-group.com" target=3D"_blank">nora.schiffer@ew.tq-group.com</a>&gt;<br=
>
&gt; &gt; ---<br>
&gt; <br>
&gt; Hi Nora,<br>
&gt; <br>
&gt; Thanks for your patch.<br>
&gt; <br>
&gt; It looks like the test_fit_image_kernel_filename selftest is failing o=
n<br>
&gt; arm hosts:<br>
<br>
Hi Mathieu,<br>
<br>
I believe I know how to fix this, but it is unclear to me what exact<br>
configuration is built here. Is there any way I can replicate the same<br>
autobuilder configuration, so I can run the tests myself before submitting =
v2?<br></blockquote><div><br></div><div>Hello,</div><div><br></div><div>You=
 can find the generated config in the &quot;Write Config&quot; step just ab=
ove the failing=C2=A0step. In this case:</div><div><a href=3D"https://autob=
uilder.yoctoproject.org/valkyrie/#/builders/23/builds/4420/steps/14/logs/st=
dio">https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/442=
0/steps/14/logs/stdio</a></div><div><br></div><div>Regards,</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Best,<br>
Nora<br>
<br>
<br>
<br>
&gt; <br>
&gt; 2026-07-24 21:31:27,684 - oe-selftest - INFO - fitimage.KernelFitImage=
RecipeTests.test_fit_image_kernel_filename (subunit.RemotedTestCase)<br>
&gt; 2026-07-24 21:31:27,685 - oe-selftest - INFO -=C2=A0 ... FAIL<br>
&gt; ...<br>
&gt; ERROR: linux-yocto-fitimage-1.0-r0 do_compile: Error executing a pytho=
n function in exec_func_python() autogenerated:<br>
&gt; <br>
&gt; The stack trace of python calls that resulted in this exception/failur=
e was:<br>
&gt; File: &#39;exec_func_python() autogenerated&#39;, lineno: 2, function:=
 &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0001:<br>
&gt;=C2=A0 *** 0002:do_compile(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0003:<br>
&gt; File: &#39;/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layer=
s/openembedded-core/meta/classes-recipe/kernel-fit-image.bbclass&#39;, line=
no: 129, function: do_compile<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0125:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0126:=C2=A0 =C2=A0 elif kernel_compressed:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0127:=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_path =3D o=
s.path.join(kernel_deploydir, kernel_compressed)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0128:=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_name =3D o=
s.path.basename(kernel_compressed)<br>
&gt;=C2=A0 *** 0129:=C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.copyfile(kernel_path=
, kernel_name)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0130:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0131:=C2=A0 =C2=A0 # FIT_KERNEL_FILENAME or FIT_KE=
RNEL_FILENAME_COMPRESSED was set<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0132:=C2=A0 =C2=A0 if kernel_name:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0133:=C2=A0 =C2=A0 =C2=A0 =C2=A0 root_node.fitimag=
e_emit_section_kernel(&quot;kernel-1&quot;, kernel_name, kernel_comp_alg,<b=
r>
&gt; File: &#39;/usr/lib/python3.14/shutil.py&#39;, lineno: 313, function: =
copyfile<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0309:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0310:=C2=A0 =C2=A0 if not follow_symlinks and _isl=
ink(src):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0311:=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.symlink(os.rea=
dlink(src), dst)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0312:=C2=A0 =C2=A0 else:<br>
&gt;=C2=A0 *** 0313:=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(src, &#39;rb&#39;=
) as fsrc:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0314:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0315:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 with open(dst, &#39;wb&#39;) as fdst:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0316:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 # macOS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0317:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if _HAS_FCOPYFILE:<br>
&gt; Exception: FileNotFoundError: [Errno 2] No such file or directory: &#3=
9;/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1142023/tm=
p/deploy/images/qemuarm64/bzImage&#39;<br>
&gt; <br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/23=
/builds/4420" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/valkyrie/#/builders/23/builds/4420</a><br>
&gt; <br>
&gt; Can you have a look at the issue?<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Mathieu<br>
&gt; <br>
<br>
-- <br>
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any<br>
Amtsgericht M=C3=BCnchen, HRB 105018<br>
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider<br>
<a href=3D"https://www.tq-group.com/" rel=3D"noreferrer" target=3D"_blank">=
https://www.tq-group.com/</a><br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#242059): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/242059" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/242059</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120409821/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120409821/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--00000000000070195d0657934578--

