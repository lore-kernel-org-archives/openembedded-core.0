Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1E618745EF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 02:01:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9U20EG0029001
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 29 Oct 2018 19:01:19 -0700
Received: from [128.224.162.232] (128.224.162.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 29 Oct 2018 19:00:53 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
References: <1540562395-6506-1-git-send-email-hongxu.jia@windriver.com>
Message-ID: <4cc3bd59-184c-12aa-97bb-f9f24cd93f42@windriver.com>
Date: Tue, 30 Oct 2018 10:00:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1540562395-6506-1-git-send-email-hongxu.jia@windriver.com>
Subject: Re: [PATCH] machine/qemu*: fix kernel finish crng init more and more slowly
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
X-List-Received-Date: Tue, 30 Oct 2018 02:01:45 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018/10/26 下午9:59, Hongxu Jia wrote:
> --- a/meta/conf/machine/include/qemuboot-x86.inc
> +++ b/meta/conf/machine/include/qemuboot-x86.inc
> @@ -11,7 +11,8 @@ QB_CPU_KVM_x86-64 = "-cpu core2duo"
>   QB_AUDIO_DRV = "alsa"
>   QB_AUDIO_OPT = "-soundhw ac97,es1370"
>   QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=${UVESA_MODE} oprofile.timer=1 uvesafb.task_timeout=-1"
> +QB_OPT_APPEND = "-vga vmware -show-cursor -usb -device usb-tablet -device"

Hi RP,

Sorry there is an extra `-device' should be remove which caused the 
issue you mentioned.

[snip]

runqemu - INFO - Running 
/home/pokybuild/yocto-worker/nightly-deb-non-deb/build/build/tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/qemu-system-i386 
-device virtio-net-pci,netdev=net0,mac=52:54:00:12:34:04 -netdev 
tap,id=net0,ifname=tap1,script=no,downscript=no -drive 
file=/home/pokybuild/yocto-worker/nightly-deb-non-deb/build/build/tmp/deploy/images/qemux86/core-image-sato-qemux86.ext4,if=virtio,format=raw 
-vga vmware -show-cursor -usb -device usb-tablet -device -object 
rng-random,filename=/dev/urandom,id=rng0 -device 
virtio-rng-pci,rng=rng0  -serial tcp:127.0.0.1:56531 -pidfile 
pidfile_43632  -cpu pentium2 -enable-kvm -m 256 -serial 
tcp:127.0.0.1:46573 -snapshot -kernel 
/home/pokybuild/yocto-worker/nightly-deb-non-deb/build/build/tmp/deploy/images/qemux86/bzImage--4.18.14+git0+bf98e195a4_33859b3077-r0.2-qemux86-20181019214032.bin 
-append 'root=/dev/vda rw highres=off  clocksource=kvm-clock 
hpet=disable noapic nolapic mem=256M 
ip=192.168.7.4::192.168.7.3:255.255.255.0 vga=0 
uvesafb.mode_option=640x480-32 oprofile.timer=1 uvesafb.task_timeout=-1 
console=tty1 console=ttyS0,115200n8 printk.time=1'

runqemu - ERROR - Failed to run qemu: qemu-system-i386: -device -object: 
Could not open 'rng-random,filename=/dev/urandom,id=rng0': No such file 
or directory

[snip]

After I do a runqemu build on qemux86/qemux86-64, then V2 incoming

//Hongxu

>   # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
> -QB_OPT_APPEND = "-vga vmware -show-cursor -usb -device usb-tablet -device virtio-rng-pci"
> +QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
>   



