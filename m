Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C86CCA1002
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 12:47:40 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.38232.1756990052311703824
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 05:47:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=Xw1eEvMu;
 spf=pass (domain: underview.tech, ip: 209.85.128.45, mailfrom: vince@underview.tech)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45b9a856dc2so6873535e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 05:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1756990050; x=1757594850; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kh/WFO5WdBE44cuzO4m1ipB3dVT033bJeQlIT5UcXJA=;
        b=Xw1eEvMuy+5XR8YagcLYvq/0XxBu3GjVv/mrvsUmm2YJAS5W07KNKM5EyXSROWHRaf
         JtggWD093rVxh/uTQOShI2FUpEb5U4sJW2uZRai1m/i9EM1I2PyDSzXMt5S09GC9ZFw4
         IR7r7rDpS94QLyqLL2g19X4QjsCZmiqEogQsMYRBsh8cyiwZynp/1b2mvRFcnGucAdYR
         LF8vCf3gNqRdSLaF5jBlHJpwXsaRyytJUnfI0IQD9dqfloY6iEtIuKl3R7GIb0FNgUIP
         OdZI6Xyctv0M2Z3fY6m9t/lB80kKZSXpug+7K3Gt5JatKRgy01CEQlkX2BlwWBVIbVgC
         B4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756990050; x=1757594850;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kh/WFO5WdBE44cuzO4m1ipB3dVT033bJeQlIT5UcXJA=;
        b=tnjsDJUwJQIY8C9aEqzsLCX66SFvnTJXVKvh9hMsvByLEiNtGsQtCyJeyPFOoYrojL
         VJrCb3vfirpN8VOS47qT5hWBBYonKgmC+9V11M935c7vnSP6cLo2XKTO/gGAXo+CXN1q
         fdLZT1g/wMq9GC1Rl4bDSJWzaM9cijVmA5/kAxV+NjcuVJhQpFcXM1Z8LgZfCl3bppGb
         m6KS3uq9CMOHmCgR5lv0EDUg8LlxcP4o9lZ9Tpc1v7JQgHVFO7CL7yWbwh2ditYm/PjP
         rmRZ7wU1hSBjvlSbn16yNVuE3wWTLoTYKzvhf+ie9aRL11HnPC4h0i5YDxOQ502HHqSj
         fUpQ==
X-Gm-Message-State: AOJu0Ywmk5AhgFt7/HIgMer0E6Vf7gKF9yS5ac7MNkOYs3geUJ8XJOY/
	4A6Us0zGC6bzMv4SofXVYC10n4CLE72v+txJXQw/OWgtFWe8ukWRyO8OIG9v4fGVm5SslB0EF+L
	7ikUEdLa1/CAo6NLkeuqRq3KSGK1enu1Z8cn4zmsgbA==
X-Gm-Gg: ASbGnctmTiuLbp4AYg3VtrTYHD5yhHTBwNwJu8SXi6nBQd7swCNrZPWomqy4AoQqlgI
	IVsAV0sNZrXqcjVKJAnURWlhbNWRwYBLerXgv1ERWyIicH2N6l1oA7PpLDt9v1yzNsJ3ulW24lf
	58l9vsQCxjvmdgECd1EuVZN208pBLMFVxbAuQH2T1cPVqRrUKLzXb4MSJQ2L58hEYyxvrm8Wd8h
	Q5fBCQ5GBvmgmQDH8NYK6bjo/apVacHMjTpq+BO
X-Google-Smtp-Source: AGHT+IGw+SVBIyBcwWTh0md4idC9j5O6d6FCCsLmYbsJvcjAQCCLV7UOzZVNgUA2QayVsqcGb33KvhsY1PQNJXRKLgU=
X-Received: by 2002:a05:6000:2283:b0:3e1:5c2b:29ba with SMTP id
 ffacd0b85a97d-3e15c2b2e68mr1340416f8f.30.1756990050272; Thu, 04 Sep 2025
 05:47:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250902015825.2785789-1-vince@underview.tech> <DCJS959WAB1Q.3S6VHMKD12CQ5@bootlin.com>
In-Reply-To: <DCJS959WAB1Q.3S6VHMKD12CQ5@bootlin.com>
From: Vincent Davis <vince@underview.tech>
Date: Thu, 4 Sep 2025 08:47:18 -0400
X-Gm-Features: Ac12FXwIoKtcVHZf8LUj8_zHHSKDy9HVImvGAuJ0ilsUDDFFhQ4IjCDCONLBtMg
Message-ID: <CAPQx_gNw6EmkMHDT3dPHM_QWqM3A+Lf8RyeZCWBNdX=KBgNxOA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/7] bootimg_pcbios: support grub hybrid boot
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d21d00063df91f96"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 12:47:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222923

--000000000000d21d00063df91f96
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

O Yeah,

Have a good idea of what the issue is..
Thought I had that fixed on my end.

Vincent

On Thu, Sep 4, 2025, 1:56=E2=80=AFAM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Tue Sep 2, 2025 at 3:58 AM CEST, Vincent Davis Jr wrote:
> > If caller wants to primarily leverage
> > grub as the primary boot loader current
> > oe-core doesn't support booting grub when
> > the boot firmware is legacy BIOS based and
> > the partition table format is GPT based.
> >
> > Issue GPT header reside where core.img
> > should be located (at byte 512).
> >
> > To navigate around issue core.img was
> > moved to a seperate partition.
> >
> > If disk is a GPT disk caller must specify
> > the file system type as none and set the
> > partition type as BIOS boot. No filesystem
> > will be created on partition. This also
> > allows wic plugin to know where to dd
> > core.img.
> >
> > Unfortunately No deep dive into grub-install
> > was perform to know the exact bytes changed
> > in hybrid boot case. To see the change in
> > bytes generated boot.img + core.img was compared
> > to boot.img + core.img after grub-install was
> > executed using the xxd command.
> >
> > Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> > ---
>
> Hi Vincent,
>
> It looks like this tends to fail some selftest. Autobuilder logs are not
> really verbose here, but I can relaunch a build and extract more log
> files if you now were you want to look.
>
> runqemu - INFO - Running
> /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-2799227/tmp=
/work/x86_64-linux/qemu-helper-native/1.0/recipe-sysroot-native/usr/bin/qem=
u-system-x86_64
> -device virtio-net-pci,netdev=3Dnet0,mac=3D52:54:00:12:34:02 -netdev
> tap,id=3Dnet0,ifname=3Dtap0,script=3Dno,downscript=3Dno -object
> rng-random,filename=3D/dev/urandom,id=3Drng0 -device virtio-rng-pci,rng=
=3Drng0
> -drive
> if=3Dnone,id=3Dhd,file=3D/home/pokybuild/tmp/core-image-minimal-qemux86-6=
4.rootfs.wic.510160,format=3Draw
> -device virtio-scsi-pci,id=3Dscsi -device scsi-hd,drive=3Dhd -usb -device
> usb-tablet -usb -device usb-kbd   -cpu Skylake-Client -machine
> q35,i8042=3Doff -smp 4 -enable-kvm -m 256 -serial tcp:127.0.0.1:42697,nod=
elay=3Don
> -serial tcp:127.0.0.1:54201,nodelay=3Don  -pidfile
> /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-2799227/pid=
file_2799227
> -S -qmp unix:./.6pnxdkdq,server,wait -qmp unix:./.p0gm_1m0,server,nowait
> -nographic
> ...
> Target didn't reach login banner in 1000 seconds (09/02/25 18:40:59)
> Last 25 lines of all logging (308):
> c[?7l[2J[0mSeaBIOS (version rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org)
>
>
> iPXE (http://ipxe.org) 00:02.0 CA00 PCI2.10 PnP PMM+0EFC6560+0EF26560 CA0=
0
> Press Ctrl-B to configure iPXE (PCI 00:02.0)...
>
>
>
> Booting from Hard Disk..
> ...
> RuntimeError: core-image-minimal - FAILED to start qemu - check the task
> log and the boot log
> ...
> 2025-09-03 00:41:04,380 - oe-selftest - INFO - ERROR:
> wic.Wic2.test_grub_install_biosplusefi_qemu (subunit.RemotedTestCase)
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2256
>
> Can you have a look at the issue please?
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

--000000000000d21d00063df91f96
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">O Yeah,=C2=A0<div dir=3D"auto"><br></div><div dir=3D"auto=
">Have a good idea of what the issue is..</div><div dir=3D"auto">Thought I =
had that fixed on my end.</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">Vincent</div></div><br><div class=3D"gmail_quote gmail_quote_container"><=
div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 4, 2025, 1:56=E2=80=AFAM M=
athieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-briand@bootlin.co=
m">mathieu.dubois-briand@bootlin.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">On Tue Sep 2, 2025 at 3:58 AM CEST, Vincent Davis Jr wrote=
:<br>
&gt; If caller wants to primarily leverage<br>
&gt; grub as the primary boot loader current<br>
&gt; oe-core doesn&#39;t support booting grub when<br>
&gt; the boot firmware is legacy BIOS based and<br>
&gt; the partition table format is GPT based.<br>
&gt;<br>
&gt; Issue GPT header reside where core.img<br>
&gt; should be located (at byte 512).<br>
&gt;<br>
&gt; To navigate around issue core.img was<br>
&gt; moved to a seperate partition.<br>
&gt;<br>
&gt; If disk is a GPT disk caller must specify<br>
&gt; the file system type as none and set the<br>
&gt; partition type as BIOS boot. No filesystem<br>
&gt; will be created on partition. This also<br>
&gt; allows wic plugin to know where to dd<br>
&gt; core.img.<br>
&gt;<br>
&gt; Unfortunately No deep dive into grub-install<br>
&gt; was perform to know the exact bytes changed<br>
&gt; in hybrid boot case. To see the change in<br>
&gt; bytes generated boot.img + core.img was compared<br>
&gt; to boot.img + core.img after grub-install was<br>
&gt; executed using the xxd command.<br>
&gt;<br>
&gt; Signed-off-by: Vincent Davis Jr &lt;vince@underview.tech&gt;<br>
&gt; ---<br>
<br>
Hi Vincent,<br>
<br>
It looks like this tends to fail some selftest. Autobuilder logs are not<br=
>
really verbose here, but I can relaunch a build and extract more log<br>
files if you now were you want to look.<br>
<br>
runqemu - INFO - Running /srv/pokybuild/yocto-worker/oe-selftest-debian/bui=
ld/build-st-2799227/tmp/work/x86_64-linux/qemu-helper-native/1.0/recipe-sys=
root-native/usr/bin/qemu-system-x86_64 -device virtio-net-pci,netdev=3Dnet0=
,mac=3D52:54:00:12:34:02 -netdev tap,id=3Dnet0,ifname=3Dtap0,script=3Dno,do=
wnscript=3Dno -object rng-random,filename=3D/dev/urandom,id=3Drng0 -device =
virtio-rng-pci,rng=3Drng0 -drive if=3Dnone,id=3Dhd,file=3D/home/pokybuild/t=
mp/core-image-minimal-qemux86-64.rootfs.wic.510160,format=3Draw -device vir=
tio-scsi-pci,id=3Dscsi -device scsi-hd,drive=3Dhd -usb -device usb-tablet -=
usb -device usb-kbd=C2=A0 =C2=A0-cpu Skylake-Client -machine q35,i8042=3Dof=
f -smp 4 -enable-kvm -m 256 -serial tcp:<a href=3D"http://127.0.0.1:42697" =
rel=3D"noreferrer noreferrer" target=3D"_blank">127.0.0.1:42697</a>,nodelay=
=3Don -serial tcp:<a href=3D"http://127.0.0.1:54201" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">127.0.0.1:54201</a>,nodelay=3Don=C2=A0 -pidfile /=
srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-2799227/pidfil=
e_2799227=C2=A0 -S -qmp unix:./.6pnxdkdq,server,wait -qmp unix:./.p0gm_1m0,=
server,nowait -nographic<br>
...<br>
Target didn&#39;t reach login banner in 1000 seconds (09/02/25 18:40:59)<br=
>
Last 25 lines of all logging (308):<br>
c[?7l[2J[0mSeaBIOS (version <a href=3D"http://rel-1.16.3-0-ga6ed6b701f0a-pr=
ebuilt.qemu.org" rel=3D"noreferrer noreferrer" target=3D"_blank">rel-1.16.3=
-0-ga6ed6b701f0a-prebuilt.qemu.org</a>)<br>
<br>
<br>
iPXE (<a href=3D"http://ipxe.org" rel=3D"noreferrer noreferrer" target=3D"_=
blank">http://ipxe.org</a>) 00:02.0 CA00 PCI2.10 PnP PMM+0EFC6560+0EF26560 =
CA00<br>
Press Ctrl-B to configure iPXE (PCI 00:02.0)...<br>
<br>
<br>
<br>
Booting from Hard Disk..<br>
...<br>
RuntimeError: core-image-minimal - FAILED to start qemu - check the task lo=
g and the boot log<br>
...<br>
2025-09-03 00:41:04,380 - oe-selftest - INFO - ERROR: wic.Wic2.test_grub_in=
stall_biosplusefi_qemu (subunit.RemotedTestCase)<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/buil=
ds/2256" rel=3D"noreferrer noreferrer" target=3D"_blank">https://autobuilde=
r.yoctoproject.org/valkyrie/#/builders/35/builds/2256</a><br>
<br>
Can you have a look at the issue please?<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
<br>
</blockquote></div>

--000000000000d21d00063df91f96--

