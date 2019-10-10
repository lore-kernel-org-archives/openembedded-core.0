Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7D4D979AE7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 06:16:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9A6GMSj004126
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Oct 2019 23:16:22 -0700 (PDT)
Received: from [128.224.158.194] (128.224.158.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Wed, 9 Oct 2019 23:16:21 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	<openembedded-core@lists.openembedded.org>, "Burton, Ross"
	<ross.burton@intel.com>
References: <cover.1567169002.git.alex.kanavin@gmail.com>
	<874b5e653ac604a410f2290e0b97ad7acb4a0d39.1567169002.git.alex.kanavin@gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <3625c508-3380-25b3-aacd-63543d3782b1@windriver.com>
Date: Thu, 10 Oct 2019 14:16:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <874b5e653ac604a410f2290e0b97ad7acb4a0d39.1567169002.git.alex.kanavin@gmail.com>
X-Originating-IP: [128.224.158.194]
Subject: Re: [PATCH 03/13] qemu: switch to '-vga std' emulated hardware from vmware/cirrus for x86/mips
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Oct 2019 06:16:27 -0000
Content-Type: multipart/alternative;
	boundary="------------02B6AA0BC9DC56648BC21D55"
Content-Language: en-US

--------------02B6AA0BC9DC56648BC21D55
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

After switch from -vga vmware to -vga std (use qemux86-64), start image 
by "runqemu nographic",

Memory used by process Xorg raised a lot,   for my image,   from ~%7 to 
~%34 (check by ps aux --sort -rss)

also check memory by command "systemctl status xserver-nodm", raised 
from ~60M to ~120M.

with the high raise of memory usage of Xorg, when run oe-test on the 
target,  OOM is happened like:

[ 1038.221438]*Out of memory*: Killed process 180 (Xorg) 
total-vm:335368kB, anon-rss:68824kB, file-rss:0kB, shmem-rss:140kB


Also test with poky distro,  and image core-image-sato, also installed 
procps.

1. "ps aux --sort -rss":  Xorg from  ~3.6%  to ~ 17.4%

2. "systemctl status xserver-nodm":  from ~65M to ~131M


Any idea about how to resolve this problem?  do we really need unify all 
boards to -vga=std? Thanks.


On 8/30/19 8:49 PM, Alexander Kanavin wrote:
> This is the qemu default since qemu 2.2, is generally supported better,
> and is recommended by upstream. It also has already been in use for arm/risc
> and ovmf.
>
> Additional information:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13466
> https://www.kraxel.org/blog/2014/10/qemu-using-cirrus-considered-harmful/
>
> '-vga virtio' emulated hardware remains in use when virgl is enabled via a runqemu override.
>
> Also, adjust the error whitelist, as there is a number of new messages
> coming from the drivers that are not actual errors.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>   meta/conf/machine/include/qemuboot-mips.inc | 2 +-
>   meta/conf/machine/include/qemuboot-x86.inc  | 2 +-
>   meta/conf/machine/qemux86-64.conf           | 1 +
>   meta/conf/machine/qemux86.conf              | 1 +
>   meta/lib/oeqa/runtime/cases/parselogs.py    | 4 ++++
>   scripts/runqemu                             | 6 ------
>   6 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/meta/conf/machine/include/qemuboot-mips.inc b/meta/conf/machine/include/qemuboot-mips.inc
> index 1c2b532b482..978820a2e0b 100644
> --- a/meta/conf/machine/include/qemuboot-mips.inc
> +++ b/meta/conf/machine/include/qemuboot-mips.inc
> @@ -2,6 +2,6 @@
>   IMAGE_CLASSES += "qemuboot"
>   QB_MACHINE = "-machine malta"
>   QB_KERNEL_CMDLINE_APPEND = "console=ttyS0 console=tty"
> -QB_OPT_APPEND = "-vga cirrus -show-cursor -usb -device usb-tablet"
> +QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet"
>   # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
>   QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
> diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
> index 3931b0f0fb3..495418fa04b 100644
> --- a/meta/conf/machine/include/qemuboot-x86.inc
> +++ b/meta/conf/machine/include/qemuboot-x86.inc
> @@ -9,7 +9,7 @@ QB_CPU_KVM_x86-64 = "-cpu core2duo"
>   QB_AUDIO_DRV = "alsa"
>   QB_AUDIO_OPT = "-soundhw ac97,es1370"
>   QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=${UVESA_MODE} oprofile.timer=1 uvesafb.task_timeout=-1"
> -QB_OPT_APPEND = "-vga vmware -show-cursor -usb -device usb-tablet"
> +QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet"
>   # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
>   QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
>   
> diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
> index 4b50e664e42..7c70dbddf52 100644
> --- a/meta/conf/machine/qemux86-64.conf
> +++ b/meta/conf/machine/qemux86-64.conf
> @@ -24,6 +24,7 @@ XSERVER = "xserver-xorg \
>              xf86-video-fbdev \
>              xf86-video-vmware \
>              xf86-video-modesetting \
> +           xf86-video-vesa \
>              xserver-xorg-module-libint10 \
>              "
>   
> diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
> index 3832302f07b..8e0da820761 100644
> --- a/meta/conf/machine/qemux86.conf
> +++ b/meta/conf/machine/qemux86.conf
> @@ -24,6 +24,7 @@ XSERVER = "xserver-xorg \
>              xf86-video-fbdev \
>              xf86-video-vmware \
>              xf86-video-modesetting \
> +           xf86-video-vesa \
>              xserver-xorg-module-libint10 \
>              "
>   
> diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
> index 19c9c52a0a9..15343d7abbe 100644
> --- a/meta/lib/oeqa/runtime/cases/parselogs.py
> +++ b/meta/lib/oeqa/runtime/cases/parselogs.py
> @@ -83,6 +83,10 @@ qemux86_common = [
>       'amd_nb: Cannot enumerate AMD northbridges',
>       'uvesafb: 5000 ms task timeout, infinitely waiting',
>       'tsc: HPET/PMTIMER calibration failed',
> +    "modeset(0): Failed to initialize the DRI2 extension",
> +    "uvesafb: cannot reserve video memory at",
> +    "uvesafb: probe of uvesafb.0 failed with error",
> +    "glamor initialization failed",
>   ] + common_errors
>   
>   ignore_errors = {
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 7705b2b60e3..b5200106244 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -145,8 +145,6 @@ class BaseConfig(object):
>           # to be added with -drive if=pflash.
>           # Found in the same places as the rootfs, with or without one of
>           # these suffices: qcow2, bin.
> -        # Setting one also adds "-vga std" because that is all that
> -        # OVMF supports.
>           self.ovmf_bios = []
>           # When enrolling default Secure Boot keys, the hypervisor
>           # must provide the Platform Key and the first Key Exchange Key
> @@ -1283,10 +1281,6 @@ class BaseConfig(object):
>           for ovmf in self.ovmf_bios:
>               format = ovmf.rsplit('.', 1)[-1]
>               self.qemu_opt += ' -drive if=pflash,format=%s,file=%s' % (format, ovmf)
> -        if self.ovmf_bios:
> -            # OVMF only supports normal VGA, i.e. we need to override a -vga vmware
> -            # that gets added for example for normal qemux86.
> -            self.qemu_opt += ' -vga std'
>   
>           self.qemu_opt += ' ' + self.qemu_opt_script
>   

--------------02B6AA0BC9DC56648BC21D55
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi, <br>
    </p>
    <p>After switch from -vga vmware to -vga std (use qemux86-64), 
      start image by "runqemu nographic", <br>
    </p>
    <p>Memory used by process Xorg raised a lot,   for my image,   from
      ~%7 to ~%34 (check by ps aux --sort -rss)<br>
    </p>
    <p>also check memory by command "systemctl status xserver-nodm", 
      raised from ~60M to ~120M.</p>
    <p>with the high raise of memory usage of Xorg, when run oe-test on
      the target,  OOM is happened like:</p>
    <p><span style="color: rgb(51, 51, 51); font-family: Arial,
        sans-serif; font-size: 14px; font-style: normal;
        font-variant-ligatures: normal; font-variant-caps: normal;
        font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: start; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(245, 245,
        245); text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;">[
        1038.221438]<span> </span></span><b style="color: rgb(51, 51,
        51); font-family: Arial, sans-serif; font-size: 14px;
        font-style: normal; font-variant-ligatures: normal;
        font-variant-caps: normal; letter-spacing: normal; orphans: 2;
        text-align: start; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(245, 245,
        245); text-decoration-style: initial; text-decoration-color:
        initial;">Out of memory</b><span style="color: rgb(51, 51, 51);
        font-family: Arial, sans-serif; font-size: 14px; font-style:
        normal; font-variant-ligatures: normal; font-variant-caps:
        normal; font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: start; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(245, 245,
        245); text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;">: Killed
        process 180 (Xorg) total-vm:335368kB, anon-rss:68824kB,
        file-rss:0kB, shmem-rss:140kB</span></p>
    <p><br>
    </p>
    <p>Also test with poky distro,  and image core-image-sato, also
      installed procps.<br>
    </p>
    <p>1. "ps aux --sort -rss":  Xorg from  ~3.6%  to ~ 17.4%</p>
    <p>2. "systemctl status xserver-nodm":  from ~65M to ~131M</p>
    <p><br>
    </p>
    <p>Any idea about how to resolve this problem?  do we really need
      unify all boards to -vga=std? Thanks.</p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/30/19 8:49 PM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:874b5e653ac604a410f2290e0b97ad7acb4a0d39.1567169002.git.alex.kanavin@gmail.com">
      <pre class="moz-quote-pre" wrap="">This is the qemu default since qemu 2.2, is generally supported better,
and is recommended by upstream. It also has already been in use for arm/risc
and ovmf.

Additional information:
<a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=13466">https://bugzilla.yoctoproject.org/show_bug.cgi?id=13466</a>
<a class="moz-txt-link-freetext" href="https://www.kraxel.org/blog/2014/10/qemu-using-cirrus-considered-harmful/">https://www.kraxel.org/blog/2014/10/qemu-using-cirrus-considered-harmful/</a>

'-vga virtio' emulated hardware remains in use when virgl is enabled via a runqemu override.

Also, adjust the error whitelist, as there is a number of new messages
coming from the drivers that are not actual errors.

Signed-off-by: Alexander Kanavin <a class="moz-txt-link-rfc2396E" href="mailto:alex.kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a>
---
 meta/conf/machine/include/qemuboot-mips.inc | 2 +-
 meta/conf/machine/include/qemuboot-x86.inc  | 2 +-
 meta/conf/machine/qemux86-64.conf           | 1 +
 meta/conf/machine/qemux86.conf              | 1 +
 meta/lib/oeqa/runtime/cases/parselogs.py    | 4 ++++
 scripts/runqemu                             | 6 ------
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/conf/machine/include/qemuboot-mips.inc b/meta/conf/machine/include/qemuboot-mips.inc
index 1c2b532b482..978820a2e0b 100644
--- a/meta/conf/machine/include/qemuboot-mips.inc
+++ b/meta/conf/machine/include/qemuboot-mips.inc
@@ -2,6 +2,6 @@
 IMAGE_CLASSES += "qemuboot"
 QB_MACHINE = "-machine malta"
 QB_KERNEL_CMDLINE_APPEND = "console=ttyS0 console=tty"
-QB_OPT_APPEND = "-vga cirrus -show-cursor -usb -device usb-tablet"
+QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
index 3931b0f0fb3..495418fa04b 100644
--- a/meta/conf/machine/include/qemuboot-x86.inc
+++ b/meta/conf/machine/include/qemuboot-x86.inc
@@ -9,7 +9,7 @@ QB_CPU_KVM_x86-64 = "-cpu core2duo"
 QB_AUDIO_DRV = "alsa"
 QB_AUDIO_OPT = "-soundhw ac97,es1370"
 QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=${UVESA_MODE} oprofile.timer=1 uvesafb.task_timeout=-1"
-QB_OPT_APPEND = "-vga vmware -show-cursor -usb -device usb-tablet"
+QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
 
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 4b50e664e42..7c70dbddf52 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -24,6 +24,7 @@ XSERVER = "xserver-xorg \
            xf86-video-fbdev \
            xf86-video-vmware \
            xf86-video-modesetting \
+           xf86-video-vesa \
            xserver-xorg-module-libint10 \
            "
 
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 3832302f07b..8e0da820761 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -24,6 +24,7 @@ XSERVER = "xserver-xorg \
            xf86-video-fbdev \
            xf86-video-vmware \
            xf86-video-modesetting \
+           xf86-video-vesa \
            xserver-xorg-module-libint10 \
            "
 
diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 19c9c52a0a9..15343d7abbe 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -83,6 +83,10 @@ qemux86_common = [
     'amd_nb: Cannot enumerate AMD northbridges',
     'uvesafb: 5000 ms task timeout, infinitely waiting',
     'tsc: HPET/PMTIMER calibration failed',
+    "modeset(0): Failed to initialize the DRI2 extension",
+    "uvesafb: cannot reserve video memory at",
+    "uvesafb: probe of uvesafb.0 failed with error",
+    "glamor initialization failed",
 ] + common_errors
 
 ignore_errors = {
diff --git a/scripts/runqemu b/scripts/runqemu
index 7705b2b60e3..b5200106244 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -145,8 +145,6 @@ class BaseConfig(object):
         # to be added with -drive if=pflash.
         # Found in the same places as the rootfs, with or without one of
         # these suffices: qcow2, bin.
-        # Setting one also adds "-vga std" because that is all that
-        # OVMF supports.
         self.ovmf_bios = []
         # When enrolling default Secure Boot keys, the hypervisor
         # must provide the Platform Key and the first Key Exchange Key
@@ -1283,10 +1281,6 @@ class BaseConfig(object):
         for ovmf in self.ovmf_bios:
             format = ovmf.rsplit('.', 1)[-1]
             self.qemu_opt += ' -drive if=pflash,format=%s,file=%s' % (format, ovmf)
-        if self.ovmf_bios:
-            # OVMF only supports normal VGA, i.e. we need to override a -vga vmware
-            # that gets added for example for normal qemux86.
-            self.qemu_opt += ' -vga std'
 
         self.qemu_opt += ' ' + self.qemu_opt_script
 
</pre>
    </blockquote>
  </body>
</html>

--------------02B6AA0BC9DC56648BC21D55--
