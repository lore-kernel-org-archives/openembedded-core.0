Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web11.12909.1631886896038474241
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Sep 2021 06:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C/jd0MTf;
 spf=pass (domain: gmail.com, ip: 209.85.217.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id az15so8285057vsb.8
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Sep 2021 06:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lERITDHuNXeKDE2Gd5Qa9LBsrONYyNm0qtCzKEKLJnU=;
        b=C/jd0MTfa7oXBxzUZn09KN9cLa5OYumuy0xGPVniUQASiBFJLpuyIX785/esWKEXrp
         bJLRKbRdrX2DeHt5Ij5AOEivmI+IFAXTs3ehCq0t/go8O+v0E6ObX7xZT67ofXuuSB+j
         d8oxc7o2ha0ajPHaLwDlXcylv1hSkagPD0Y36O8gLSjK3tmJjCggq2oF7dPZbOb50CzA
         mTp7fStztZM9hTlPX8h735TB84knVDNEvIYGxpqyK3uW6k/nLQI/8x+oRriW9/5t3rAH
         6fkxnmHt2kSfAzAPrm2q9LRNswH+YMrgK3TVYIszqliiD35q+tJvIcVp++inqEamR4cP
         aCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lERITDHuNXeKDE2Gd5Qa9LBsrONYyNm0qtCzKEKLJnU=;
        b=6ly94Fse5Q2HStjWn5yMzDV1SNEOgR/g3uiD2deKWNexjzIZ7AMPM/Vmv2YRBuazNs
         b26lIJjdvNjePYeRYFWRFTPuEKMmRNWnT5x1gHWlB84ujaFLVAimRkguA0p9mlJRmtaS
         f2TkV02zTuG2CSOP0W8QBPilXUOIoMXObuGGjGdPOcdsG5p9LGlzfDhv0LHHfZFJfNC6
         L69wVHkNjY3QydT5LwrBTUAJrSpStxX5vhJVJjUf4YdKhTS15GLMkDJyRD755fMPZF+I
         /Mj2KGQF6zehXJfFTK8ji22DUKNPPhuwXo0pG1d6BNwrV4MSCXeB4jEivyHhDVtU26C2
         oKuA==
X-Gm-Message-State: AOAM531buvm1TSYlG29vac4Ce9IAXAmY0nRBXYZJgM03WyUXQqChXcv9
	obgKAXUGvaARGuWf5noqheroFekRdUO2jzcbkjo=
X-Google-Smtp-Source: ABdhPJzITbJfUIup3HaaYAJt9CG99hVWLX91vB0st2tWvf5LGC3bMi5XLorsobRLEfI9mn1ecMwaFuOedQvqR+DlRdw=
X-Received: by 2002:a05:6102:3195:: with SMTP id c21mr8210340vsh.13.1631886893627;
 Fri, 17 Sep 2021 06:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210916222006.18189-1-jdmason@kudzu.us>
In-Reply-To: <20210916222006.18189-1-jdmason@kudzu.us>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 17 Sep 2021 15:54:42 +0200
Message-ID: <CANNYZj8i4y3Wm-r6P=GiW0=3NDZRCMbJcjFfdvQ6tMgG9yw5DQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] machine/qemuarm*: use virtio graphics
To: Jon Mason <jdmason@kudzu.us>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009bbf1f05cc3146ec"

--0000000000009bbf1f05cc3146ec
Content-Type: text/plain; charset="UTF-8"

Have you investigated (optionally) enabling virgl as well on ARM hosts? On
x86, currently -vga virtio is used
and will be switched to -device virtio-vga-gl with qemu 6.1, according to
https://www.kraxel.org/blog/2021/05/virtio-gpu-qemu-graphics-update/

On ARM... I don't know, as I do not have an ARM host with a GPU.

Alex

On Fri, 17 Sept 2021 at 00:20, Jon Mason <jdmason@kudzu.us> wrote:

> Switch to using virtio graphics for the Arm QEMU machines.  You will
> noticed the difference in the dmesg by seeing:
> [    2.693337] [drm] pci: virtio-gpu-pci detected at 0000:00:10.0
>
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>  meta/conf/machine/qemuarm.conf   | 2 +-
>  meta/conf/machine/qemuarm64.conf | 2 +-
>  meta/conf/machine/qemuarmv5.conf | 3 ++-
>  3 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/machine/qemuarm.conf
> b/meta/conf/machine/qemuarm.conf
> index 93d855b6e1e2..d71a793edf05 100644
> --- a/meta/conf/machine/qemuarm.conf
> +++ b/meta/conf/machine/qemuarm.conf
> @@ -20,7 +20,7 @@ QB_SMP = "-smp 4"
>  # Standard Serial console
>  QB_KERNEL_CMDLINE_APPEND = "vmalloc=256"
>  # For graphics to work we need to define the VGA device as well as the
> necessary USB devices
> -QB_GRAPHICS = "-device VGA,edid=on"
> +QB_GRAPHICS = "-device virtio-gpu-pci"
>  QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
>  # Virtio Networking support
>  QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
> diff --git a/meta/conf/machine/qemuarm64.conf
> b/meta/conf/machine/qemuarm64.conf
> index ea7fae2722a0..3b08dedddc86 100644
> --- a/meta/conf/machine/qemuarm64.conf
> +++ b/meta/conf/machine/qemuarm64.conf
> @@ -19,7 +19,7 @@ QB_CPU = "-cpu cortex-a57"
>  QB_SMP = "-smp 4"
>  QB_CPU_KVM = "-cpu host -machine gic-version=3"
>  # For graphics to work we need to define the VGA device as well as the
> necessary USB devices
> -QB_GRAPHICS = "-device VGA,edid=on"
> +QB_GRAPHICS = "-device virtio-gpu-pci"
>  QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
>  # Virtio Networking support
>  QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
> diff --git a/meta/conf/machine/qemuarmv5.conf
> b/meta/conf/machine/qemuarmv5.conf
> index 6c99a5296589..252d6286d8ec 100644
> --- a/meta/conf/machine/qemuarmv5.conf
> +++ b/meta/conf/machine/qemuarmv5.conf
> @@ -13,7 +13,8 @@ SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;ttyAMA1"
>  QB_SYSTEM_NAME = "qemu-system-arm"
>  QB_MACHINE = "-machine versatilepb"
>  QB_KERNEL_CMDLINE_APPEND = "vmalloc=256"
> -QB_OPT_APPEND = "-usb -device usb-tablet"
> +QB_GRAPHICS = "-device virtio-gpu-pci"
> +QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
>  PREFERRED_VERSION_linux-yocto ??= "5.13%"
>  QB_DTB =
> "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7',
> '', 'zImage-versatile-pb.dtb', d)}"
>
> --
> 2.20.1
>
>
> 
>
>

--0000000000009bbf1f05cc3146ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Have you investigated (optionally) enabling virgl as =
well on ARM hosts? On x86, currently -vga virtio is used</div><div>and will=
 be switched to -device virtio-vga-gl with qemu 6.1, according to <br></div=
><div><a href=3D"https://www.kraxel.org/blog/2021/05/virtio-gpu-qemu-graphi=
cs-update/">https://www.kraxel.org/blog/2021/05/virtio-gpu-qemu-graphics-up=
date/</a></div><div><br></div><div>On ARM... I don&#39;t know, as I do not =
have an ARM host with a GPU.<br></div><div><br></div><div>Alex<br></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Fri, 17 Sept 2021 at 00:20, Jon Mason &lt;<a href=3D"mailto:jdmason@kudzu.u=
s">jdmason@kudzu.us</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Switch to using virtio graphics for the Arm QEMU machine=
s.=C2=A0 You will<br>
noticed the difference in the dmesg by seeing:<br>
[=C2=A0 =C2=A0 2.693337] [drm] pci: virtio-gpu-pci detected at 0000:00:10.0=
<br>
<br>
Signed-off-by: Jon Mason &lt;<a href=3D"mailto:jdmason@kudzu.us" target=3D"=
_blank">jdmason@kudzu.us</a>&gt;<br>
---<br>
=C2=A0meta/conf/machine/qemuarm.conf=C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta/conf/machine/qemuarm64.conf | 2 +-<br>
=C2=A0meta/conf/machine/qemuarmv5.conf | 3 ++-<br>
=C2=A03 files changed, 4 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.con=
f<br>
index 93d855b6e1e2..d71a793edf05 100644<br>
--- a/meta/conf/machine/qemuarm.conf<br>
+++ b/meta/conf/machine/qemuarm.conf<br>
@@ -20,7 +20,7 @@ QB_SMP =3D &quot;-smp 4&quot;<br>
=C2=A0# Standard Serial console<br>
=C2=A0QB_KERNEL_CMDLINE_APPEND =3D &quot;vmalloc=3D256&quot;<br>
=C2=A0# For graphics to work we need to define the VGA device as well as th=
e necessary USB devices<br>
-QB_GRAPHICS =3D &quot;-device VGA,edid=3Don&quot;<br>
+QB_GRAPHICS =3D &quot;-device virtio-gpu-pci&quot;<br>
=C2=A0QB_OPT_APPEND =3D &quot;-device qemu-xhci -device usb-tablet -device =
usb-kbd&quot;<br>
=C2=A0# Virtio Networking support<br>
=C2=A0QB_TAP_OPT =3D &quot;-netdev tap,id=3Dnet0,ifname=3D@TAP@,script=3Dno=
,downscript=3Dno&quot;<br>
diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64=
.conf<br>
index ea7fae2722a0..3b08dedddc86 100644<br>
--- a/meta/conf/machine/qemuarm64.conf<br>
+++ b/meta/conf/machine/qemuarm64.conf<br>
@@ -19,7 +19,7 @@ QB_CPU =3D &quot;-cpu cortex-a57&quot;<br>
=C2=A0QB_SMP =3D &quot;-smp 4&quot;<br>
=C2=A0QB_CPU_KVM =3D &quot;-cpu host -machine gic-version=3D3&quot;<br>
=C2=A0# For graphics to work we need to define the VGA device as well as th=
e necessary USB devices<br>
-QB_GRAPHICS =3D &quot;-device VGA,edid=3Don&quot;<br>
+QB_GRAPHICS =3D &quot;-device virtio-gpu-pci&quot;<br>
=C2=A0QB_OPT_APPEND =3D &quot;-device qemu-xhci -device usb-tablet -device =
usb-kbd&quot;<br>
=C2=A0# Virtio Networking support<br>
=C2=A0QB_TAP_OPT =3D &quot;-netdev tap,id=3Dnet0,ifname=3D@TAP@,script=3Dno=
,downscript=3Dno&quot;<br>
diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5=
.conf<br>
index 6c99a5296589..252d6286d8ec 100644<br>
--- a/meta/conf/machine/qemuarmv5.conf<br>
+++ b/meta/conf/machine/qemuarmv5.conf<br>
@@ -13,7 +13,8 @@ SERIAL_CONSOLES ?=3D &quot;115200;ttyAMA0 115200;ttyAMA1&=
quot;<br>
=C2=A0QB_SYSTEM_NAME =3D &quot;qemu-system-arm&quot;<br>
=C2=A0QB_MACHINE =3D &quot;-machine versatilepb&quot;<br>
=C2=A0QB_KERNEL_CMDLINE_APPEND =3D &quot;vmalloc=3D256&quot;<br>
-QB_OPT_APPEND =3D &quot;-usb -device usb-tablet&quot;<br>
+QB_GRAPHICS =3D &quot;-device virtio-gpu-pci&quot;<br>
+QB_OPT_APPEND =3D &quot;-device qemu-xhci -device usb-tablet -device usb-k=
bd&quot;<br>
=C2=A0PREFERRED_VERSION_linux-yocto ??=3D &quot;5.13%&quot;<br>
=C2=A0QB_DTB =3D &quot;${@oe.utils.version_less_or_equal(&#39;PREFERRED_VER=
SION_linux-yocto&#39;, &#39;4.7&#39;, &#39;&#39;, &#39;zImage-versatile-pb.=
dtb&#39;, d)}&quot;<br>
<br>
-- <br>
2.20.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000009bbf1f05cc3146ec--
