Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16059CCF9E3
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 19:50:44 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4836.1762285837194204682
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 11:50:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kwnKs7+H;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-429c19b5de4so859850f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 11:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1762285835; x=1762890635; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5UVOM4PZ8UKm5Ereb/+g0l1eSRtCJXWrufrct45gYNs=;
        b=kwnKs7+HJkTQG1IWpv6nmcxDvcryuD/TO/2UqkcPhHhuoqxNGYKkqAblmo+7gjnPZJ
         fgrdujmYpk8TcOWvbQB5S8eMYTjTONDa2iDegHanntLmpAzQAbTvOqiwimkn2mlVY7tA
         z4PdUQDwxzWjC+PpuYGJLq/c8T1FW46fYWQR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762285835; x=1762890635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5UVOM4PZ8UKm5Ereb/+g0l1eSRtCJXWrufrct45gYNs=;
        b=VoGrUfpcup/X9oWfN9GP2Wh1AT2lwpY2QMx1nMLTlM8CqHW0hf2U6deyLnWkfvaCtP
         AW+QWLUVYBiQ+9WmgVyrPcGffXBarAOHLcMCxPsFpUqS2F18pXVYk6+c23Eg/c/TjUrE
         abuDs+7BCObVCb28yGSqV4r8Bg7vQY9RDRqCKAVs0jFxSLKLUde/M6OH1/CcrpQceJ2r
         d5bI5g833ccC4EkRvv4hQZ9xTgEbioL+LPVRDc9OyFwLMzf19R1xoxJS/AjsjEhbzBH5
         3W1ra1X1cPCmInkOfQ/nuYOrMKzF5WG4P3Gj2f7RfU7vCkSMnxe1B9DPsJKaIZI4oMbB
         biwA==
X-Forwarded-Encrypted: i=1; AJvYcCUsFcJVri4fMWRO3G9WudlEJx5jJQK/k7rY1PeD+m9El33XxxJ4o4CvOKTdJtmldxC6N5gdOE7uVcTa8qTINvP6xA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwGZUEdo31jgAu7Rg5qbUpN+CRXnGiNqRMGhU3pmyb/kExALFr7
	S0SzycRiBWsomTomm7wWZolxCW/00Srx7X7g0Brk598clhUo8GmrON2WIQmCHtNfKHx9CQUJ9YG
	1ett3MLY8na5efZ6JQyADMPUZCD9j8Ti7ovfz+PoqEQ==
X-Gm-Gg: ASbGnctoum54O5VW8EMJlFZsIxTs1Gn+PoxIcfOdpztQhgzOGY0XpyefwtgcBETBWTn
	1Js0YZSv3+vZjhhy1yKFq45W204Gbtog5FnMInPoSV3Tk86O1bYa5MUa3ZwUCf8xbOMcExcDO9K
	CDgfchFW1vVfHbzom3j4zNsqC6wHLjaQVgfTaIEGKxLu+hMLqPyYLkw5CNbSLLQj+bqQHcnI72M
	qcIXdqupmAR02AM45/d5maK8HLy9e/2PxfisfT9mxmNIxV6tUHsq/MzxLxSSt6aiXh9jD7+hPcd
	YLjG+bb8a2AND3Q5Mwc=
X-Google-Smtp-Source: AGHT+IHmM6T9O7WjG601ayuJY0lgeUOb0K6dqNQlnQ93Raa4VsvcsGT/jkgn1fOJbGrYEkpnH1vN4fqCROc0Ddlpty8=
X-Received: by 2002:a05:6000:230e:b0:429:d170:b3ac with SMTP id
 ffacd0b85a97d-429e32dd82cmr532340f8f.13.1762285835340; Tue, 04 Nov 2025
 11:50:35 -0800 (PST)
MIME-Version: 1.0
References: <20251023112547.4044904-1-Harish.Sadineni@windriver.com> <DDSVLCVN8K5F.RVYE5VTH4FQY@bootlin.com>
In-Reply-To: <DDSVLCVN8K5F.RVYE5VTH4FQY@bootlin.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 4 Nov 2025 20:50:08 +0100
X-Gm-Features: AWmQ_bmZ1sl_2GD48cHufD6EGI0oRfSrfnpfDABj3oFs36dRpGNJC9snGnC0AvU
Message-ID: <CAMSfU+6cQ8SU0s4+SO6=nE+7HS8naP3qKThEWZ8Y97yVVF9+4Q@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 0/7] Enable rust support for linux kernel
To: mathieu.dubois-briand@bootlin.com
Cc: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org, 
	Sundeep.Kokkonda@windriver.com
Content-Type: multipart/alternative; boundary="0000000000003561f80642ca256f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 19:50:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225742

--0000000000003561f80642ca256f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

FYI, Mehdi just sent his series (also as an RFC)
[RFC PATCH 0/4] Add rust-for-linux option for linux-yocto
https://lists.openembedded.org/g/openembedded-core/topic/rfc_patch_0_4_add/=
116120514
[RFC PATCH 1/4] kernel-yocto.bbclass: Add integrated support for
Rust-for-Linux
https://lists.openembedded.org/g/openembedded-core/topic/rfc_patch_1_4/1161=
20516
[RFC PATCH 2/4] linux-yocto.inc: Conditionally add rust.scc kernel feature
https://lists.openembedded.org/g/openembedded-core/topic/rfc_patch_2_4/1161=
20517
[RFC PATCH 3/4] rust-native: Conditionally install sources for kernel
builds
https://lists.openembedded.org/g/openembedded-core/topic/rfc_patch_3_4_rust=
_native/116120518
[RFC PATCH 4/4] linux-yocto-dev: Add temporary Rust kernel feature
https://lists.openembedded.org/g/openembedded-core/topic/rfc_patch_4_4/1161=
20519

He worked basically at the same time on this and also got it working, I've
asked him to send his series to help.

Le lun. 27 oct. 2025 =C3=A0 07:03, Mathieu Dubois-Briand via
lists.openembedded.org <mathieu.dubois-briand=3D
bootlin.com@lists.openembedded.org> a =C3=A9crit :

> On Thu Oct 23, 2025 at 1:25 PM CEST, Harish via lists.openembedded.org
> Sadineni wrote:
> > From: Harish Sadineni <Harish.Sadineni@windriver.com>
> >
> > This patch series introduces Rust support into the linux-yocto kernel
> recipe
> > and related build infrastructure in the Yocto Project. The goal is to
> enable
> > building the Linux kernel with Rust components and provide support for
> > building kernel module which is written in rust inside sdk.
> >
> > Summary of changes:
> >
> > - Patch 1: Extend 'bindgen-cli' to support 'nativesdk', allowing it to
> be available in the SDK environment.
> > - Patch 2: Add required dependencies ('clang-native',
> 'bindgen-cli-native') to the kernel to support Rust binding generation.
> > - Patch 3: Install the Rust standard library source ('library/') into
> `work-shared` and which will be later copied to
> >            linux-yocto recipe-sysroot-native.
> > - Patch 4: Stage the Rust sources into `recipe-sysroot-native` for
> kernel build compatibility, making them visible during native builds.
> > - Patch 5: Update `kernel-yocto.bbclass` to invoke `make rustavailable`
> during 'do_kernel_configme', ensuring Rust readiness.
> > - Patch 6: Add kernel configuration support for Rust (via 'rust.cfg' an=
d
> 'rust.scc'), enabling the Rust build options in kernel config.
> > - patch 7: Copy Rust kernel sources into kernel-devsrc build directory
> which will be required while runnig 'make prepare' in sdk.
> >
> > WIP - need inputs:
> > 1. In patch-3, rust sources are copied from ${RUSTSRC} to
> ${TMPDIR}/work-shared, which is redundant and improving it in
> >  more optimized way by extracting rust directly into
> ${TMPDIR}/work-shared and then use it for both rust & linux-yocto recipes=
.
> >
> > 2. In patch-6, We've suppressed a few build path QA issues with
> INSANE_SKIP.
> > We have tried fixing those using DEBUG_PREFIX_MAP & --remap-path-prefix
> but unable to resolve it.
> > Are there any flags for kernel or any other inputs?
> >
> > 3. If rust.cfg & rust.scc changes are ok, we will send kernel
> configuration fragment to yocto-kernel-cache.
> >
> > With above considerations, We did a successful build of Enabling rust i=
n
> linux kernel and
> > Tested a rust-out-of-tree kernel module in sdk for x86-64 & arm64
> architectures.
> >
> > Harish Sadineni (7):
> >   bindgen-cli: extend BBCLASSEXTEND to include nativesdk
> >   linux-yocto: add clang-native and bindgen-cli-native to DEPENDS
> >   rust: install Rust standard library sources for make rustavailable
> >     support
> >   rust: stage rustlib sources for linux-yocto make rustavailable suppor=
t
> >   kernel-yocto: add rust support via make rustavailable in
> >     do_kernel_configme
> >   linux-yocto: enable Rust support in kernel configuration
> >   kernel-devsrc: copying rust-kernel soucre  to $kerneldir/build
> >
> >  meta/classes-recipe/kernel-yocto.bbclass      |  4 ++++
> >  .../bindgen-cli/bindgen-cli_0.72.1.bb         |  2 +-
> >  meta/recipes-devtools/rust/rust_1.90.0.bb     | 13 +++++++++++-
> >  meta/recipes-kernel/linux/files/rust.cfg      | 20 +++++++++++++++++++
> >  meta/recipes-kernel/linux/files/rust.scc      |  1 +
> >  meta/recipes-kernel/linux/kernel-devsrc.bb    |  1 +
> >  meta/recipes-kernel/linux/linux-yocto.inc     |  7 +++++++
> >  meta/recipes-kernel/linux/linux-yocto_6.16.bb |  4 ++++
> >  8 files changed, 50 insertions(+), 2 deletions(-)
> >  create mode 100644 meta/recipes-kernel/linux/files/rust.cfg
> >  create mode 100644 meta/recipes-kernel/linux/files/rust.scc
>
> Hi Harish,
>
> I know this is still an RFC, but I ran it on the autobuilder to check
> how it goes. We had a some error with kernel build:
>
> ERROR: linux-yocto-6.12.52+git-r0 do_patch: Execution of
> '/srv/pokybuild/yocto-worker/qemux86-alt/build/build/tmp/work/qemux86-pok=
y-linux/linux-yocto/6.12.52+git/temp/run.do_patch.410367'
> failed with exit code 1
> ...
> | cp: cannot stat
> '/srv/pokybuild/yocto-worker/qemux86-alt/build/build/tmp/work-shared/rust=
':
> No such file or directory
>
> This happened in almost all builds as far as I can tell:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/2614
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/2623
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/2650
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2638
>
> Thanks,
> Mathieu
>
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225320):
> https://lists.openembedded.org/g/openembedded-core/message/225320
> Mute This Topic: https://lists.openembedded.org/mt/115908706/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--0000000000003561f80642ca256f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hello,</div><div><b=
r></div><div>FYI, Mehdi just sent his series (also as an RFC)<br>[RFC PATCH=
 0/4] Add rust-for-linux option for linux-yocto=C2=A0<a href=3D"https://lis=
ts.openembedded.org/g/openembedded-core/topic/rfc_patch_0_4_add/116120514" =
target=3D"_blank">https://lists.openembedded.org/g/openembedded-core/topic/=
rfc_patch_0_4_add/116120514</a><br>[RFC PATCH 1/4] kernel-yocto.bbclass: Ad=
d integrated support for Rust-for-Linux=C2=A0<a href=3D"https://lists.opene=
mbedded.org/g/openembedded-core/topic/rfc_patch_1_4/116120516" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-core/topic/rfc_patch_1_=
4/116120516</a><br>[RFC PATCH 2/4] linux-yocto.inc: Conditionally add rust.=
scc kernel feature=C2=A0<a href=3D"https://lists.openembedded.org/g/openemb=
edded-core/topic/rfc_patch_2_4/116120517" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/topic/rfc_patch_2_4/116120517</a><br>[R=
FC PATCH 3/4] rust-native: Conditionally install sources for kernel builds=
=C2=A0<a href=3D"https://lists.openembedded.org/g/openembedded-core/topic/r=
fc_patch_3_4_rust_native/116120518" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-core/topic/rfc_patch_3_4_rust_native/116120518</a>=
<br>[RFC PATCH 4/4] linux-yocto-dev: Add temporary Rust kernel feature=C2=
=A0<a href=3D"https://lists.openembedded.org/g/openembedded-core/topic/rfc_=
patch_4_4/116120519" target=3D"_blank">https://lists.openembedded.org/g/ope=
nembedded-core/topic/rfc_patch_4_4/116120519</a></div><div><br></div><div>H=
e worked basically at the same time on this and also got it working, I&#39;=
ve asked him to send his series to help.=C2=A0</div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 27 oct. 2025 =C3=
=A0=C2=A007:03, Mathieu Dubois-Briand via <a href=3D"http://lists.openembed=
ded.org" target=3D"_blank">lists.openembedded.org</a> &lt;mathieu.dubois-br=
iand=3D<a href=3D"mailto:bootlin.com@lists.openembedded.org" target=3D"_bla=
nk">bootlin.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu Oct 23, 2025 at 1=
:25 PM CEST, Harish via <a href=3D"http://lists.openembedded.org" rel=3D"no=
referrer" target=3D"_blank">lists.openembedded.org</a> Sadineni wrote:<br>
&gt; From: Harish Sadineni &lt;<a href=3D"mailto:Harish.Sadineni@windriver.=
com" target=3D"_blank">Harish.Sadineni@windriver.com</a>&gt;<br>
&gt;<br>
&gt; This patch series introduces Rust support into the linux-yocto kernel =
recipe<br>
&gt; and related build infrastructure in the Yocto Project. The goal is to =
enable<br>
&gt; building the Linux kernel with Rust components and provide support for=
<br>
&gt; building kernel module which is written in rust inside sdk. <br>
&gt;<br>
&gt; Summary of changes:<br>
&gt;<br>
&gt; - Patch 1: Extend &#39;bindgen-cli&#39; to support &#39;nativesdk&#39;=
, allowing it to be available in the SDK environment.<br>
&gt; - Patch 2: Add required dependencies (&#39;clang-native&#39;, &#39;bin=
dgen-cli-native&#39;) to the kernel to support Rust binding generation.<br>
&gt; - Patch 3: Install the Rust standard library source (&#39;library/&#39=
;) into `work-shared` and which will be later copied to <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linux-yocto recipe-sysroot-na=
tive.<br>
&gt; - Patch 4: Stage the Rust sources into `recipe-sysroot-native` for ker=
nel build compatibility, making them visible during native builds.<br>
&gt; - Patch 5: Update `kernel-yocto.bbclass` to invoke `make rustavailable=
` during &#39;do_kernel_configme&#39;, ensuring Rust readiness.<br>
&gt; - Patch 6: Add kernel configuration support for Rust (via &#39;rust.cf=
g&#39; and &#39;rust.scc&#39;), enabling the Rust build options in kernel c=
onfig.<br>
&gt; - patch 7: Copy Rust kernel sources into kernel-devsrc build directory=
 which will be required while runnig &#39;make prepare&#39; in sdk.<br>
&gt;<br>
&gt; WIP - need inputs:<br>
&gt; 1. In patch-3, rust sources are copied from ${RUSTSRC} to ${TMPDIR}/wo=
rk-shared, which is redundant and improving it in<br>
&gt;=C2=A0 more optimized way by extracting rust directly into ${TMPDIR}/wo=
rk-shared and then use it for both rust &amp; linux-yocto recipes.<br>
&gt;=C2=A0 <br>
&gt; 2. In patch-6, We&#39;ve suppressed a few build path QA issues with IN=
SANE_SKIP.<br>
&gt; We have tried fixing those using DEBUG_PREFIX_MAP &amp; --remap-path-p=
refix but unable to resolve it.<br>
&gt; Are there any flags for kernel or any other inputs?<br>
&gt;=C2=A0 <br>
&gt; 3. If rust.cfg &amp; rust.scc changes are ok, we will send kernel conf=
iguration fragment to yocto-kernel-cache.<br>
&gt;<br>
&gt; With above considerations, We did a successful build of Enabling rust =
in linux kernel and <br>
&gt; Tested a rust-out-of-tree kernel module in sdk for x86-64 &amp; arm64 =
architectures.<br>
&gt;<br>
&gt; Harish Sadineni (7):<br>
&gt;=C2=A0 =C2=A0bindgen-cli: extend BBCLASSEXTEND to include nativesdk<br>
&gt;=C2=A0 =C2=A0linux-yocto: add clang-native and bindgen-cli-native to DE=
PENDS<br>
&gt;=C2=A0 =C2=A0rust: install Rust standard library sources for make rusta=
vailable<br>
&gt;=C2=A0 =C2=A0 =C2=A0support<br>
&gt;=C2=A0 =C2=A0rust: stage rustlib sources for linux-yocto make rustavail=
able support<br>
&gt;=C2=A0 =C2=A0kernel-yocto: add rust support via make rustavailable in<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0do_kernel_configme<br>
&gt;=C2=A0 =C2=A0linux-yocto: enable Rust support in kernel configuration<b=
r>
&gt;=C2=A0 =C2=A0kernel-devsrc: copying rust-kernel soucre=C2=A0 to $kernel=
dir/build<br>
&gt;<br>
&gt;=C2=A0 meta/classes-recipe/kernel-yocto.bbclass=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 4 ++++<br>
&gt;=C2=A0 .../bindgen-cli/<a href=3D"http://bindgen-cli_0.72.1.bb" rel=3D"=
noreferrer" target=3D"_blank">bindgen-cli_0.72.1.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 meta/recipes-devtools/rust/<a href=3D"http://rust_1.90.0.bb" rel=
=3D"noreferrer" target=3D"_blank">rust_1.90.0.bb</a>=C2=A0 =C2=A0 =C2=A0| 1=
3 +++++++++++-<br>
&gt;=C2=A0 meta/recipes-kernel/linux/files/rust.cfg=C2=A0 =C2=A0 =C2=A0 | 2=
0 +++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-kernel/linux/files/rust.scc=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
&gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" re=
l=3D"noreferrer" target=3D"_blank">kernel-devsrc.bb</a>=C2=A0 =C2=A0 |=C2=
=A0 1 +<br>
&gt;=C2=A0 meta/recipes-kernel/linux/linux-yocto.inc=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 7 +++++++<br>
&gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.16.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto_6.16.bb</a> |=C2=A0 4 +++=
+<br>
&gt;=C2=A0 8 files changed, 50 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-kernel/linux/files/rust.cfg<br>
&gt;=C2=A0 create mode 100644 meta/recipes-kernel/linux/files/rust.scc<br>
<br>
Hi Harish,<br>
<br>
I know this is still an RFC, but I ran it on the autobuilder to check<br>
how it goes. We had a some error with kernel build:<br>
<br>
ERROR: linux-yocto-6.12.52+git-r0 do_patch: Execution of &#39;/srv/pokybuil=
d/yocto-worker/qemux86-alt/build/build/tmp/work/qemux86-poky-linux/linux-yo=
cto/6.12.52+git/temp/run.do_patch.410367&#39; failed with exit code 1<br>
...<br>
| cp: cannot stat &#39;/srv/pokybuild/yocto-worker/qemux86-alt/build/build/=
tmp/work-shared/rust&#39;: No such file or directory<br>
<br>
This happened in almost all builds as far as I can tell:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/buil=
ds/2614" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/20/builds/2614</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/build=
s/2623" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/9/builds/2623</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/build=
s/2650" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/2/builds/2650</a><br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/buil=
ds/2638" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/29/builds/2638</a><br>
<br>
Thanks,<br>
Mathieu<br>
<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#225320): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/225320" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/225320</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115908706/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115908706/4316185</a><br>
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
</div>
</div>

--0000000000003561f80642ca256f--

