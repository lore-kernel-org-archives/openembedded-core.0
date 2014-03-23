Return-Path: <joaohf@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id C94926FA92
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Mar 2014 02:25:36 +0000 (UTC)
Received: by mail-yk0-f173.google.com with SMTP id 10so10850137ykt.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Mar 2014 19:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=5u1s9Ydc9Jp8/vk1LuLBPGV5rohbc+eKGvtmV5BYG4k=;
	b=WOdmuzL2lQ1xiVyFVoTqbhvXVTfYukoOBqy3AmPGxqu3UE/Z7mowyVDOXKbmK7/6ZI
	yneKvpGbaYFaq//nRo5oyhZCf+LJPxVZc/DQArUM6M3uhuF4ob0dWiHijhDTOkytpbAI
	hwETrjYMfmqWqKuEz8g0actzDBkQszMU2WfJfdCER7qFV13OKE4g8UaI0gmMVmgm/fIC
	VwKejCudtWQ5lyd/YmdhkbnD82cePajx6pMNfNjXwAE1pnMweZqdcr9/vKZxkyqKwKzj
	ZWCcRrCl648I8Vd/5V6KgUnHvfPw7IdNCqZnz/K/Wq251lCxTcg74gyHviM4sKALEXgs
	unDQ==
X-Received: by 10.236.71.161 with SMTP id r21mr107405yhd.112.1395541536889;
	Sat, 22 Mar 2014 19:25:36 -0700 (PDT)
Received: from [192.168.1.3] ([187.106.6.19])
	by mx.google.com with ESMTPSA id m3sm16253682yhl.30.2014.03.22.19.25.34
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 22 Mar 2014 19:25:36 -0700 (PDT)
Message-ID: <532E461E.3090206@gmail.com>
Date: Sat, 22 Mar 2014 23:25:34 -0300
From: =?UTF-8?B?Sm/Do28gSGVucmlxdWUgRmVycmVpcmEgZGUgRnJlaXRhcw==?=
	<joaohf@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Tom Zanussi <tom.zanussi@linux.intel.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
	<1395417268.25867.74.camel@empanada>
In-Reply-To: <1395417268.25867.74.camel@empanada>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] wic: Add --rootfs option to --source param
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
X-List-Received-Date: Sun, 23 Mar 2014 02:25:38 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Tom,

I am working to enhance the patches with your comments.

Em 21-03-2014 12:54, Tom Zanussi escreveu:
> In any case, I think the connection between a command-line param and the
> line in the .wks file should be explicit, but I'm not sure about the
> best way do do that, maybe something like:
>
> wic create ... --rootfs-dir rootfs1=/some/rootfs/dir --rootfs-dir rootfs2=/some/other/rootfs/dir
>
>    part / --source rootfs --rootfs-dir="rootfs1" --ondisk sda --fstype=ext3 --label primary --align 1024
>
>    part /standby --source rootfs --rootfs-dir="rootfs2" \
>      --ondisk sda --fstype=ext3 --label secondary --align 1024
>
> In the above case, 'rootfs1' and 'rootfs2' provide the connection (and
> could be named anything, they're just strings).

What about to use '--label' or mountpoint as connection?

wic create ... --rootfs-dir primary=/some/rootfs/dir --rootfs-dir secondary=/some/other/rootfs/dir



> So I guess that's what make sense to me, but I'd be happy to hear other
> ideas.
>
> In any case, at minimum I think that you should change the syntax from
> --rootfs=<special rootfs directory> to --rootfs-dir=<special rootfs
> directory>, in keeping with current syntax.

Agree.

>
> Another thing missing is displaying the extra partitions in the output
> e.g.

Agree.

>   I created an image with the added /standby, and it worked but I
> didn't see it mentioned in the output, which it should be:
> [trz@empanada build]$ wic create directdisk-multi -e core-image-minimal
> Checking basic build environment...
> Done.
>
> Creating image(s)...
>
> Info: The new image(s) can be found here:
>    /var/tmp/wic/build/directdisk-multi-201403211050-sda.direct
>
> The following build artifacts were used to create the image(s):
>    ROOTFS_DIR:      /home/trz/yocto/master-cur/build/tmp/work/crownbay-poky-linux/core-image-minimal/1.0-r0/rootfs
>    BOOTIMG_DIR:     /home/trz/yocto/master-cur/build/tmp/sysroots/crownbay/usr/share
>    KERNEL_DIR:      /home/trz/yocto/master-cur/build/tmp/sysroots/crownbay/usr/src/kernel
>    NATIVE_SYSROOT:  /home/trz/yocto/master-cur/build/tmp/sysroots/x86_64-linux
>
>
> The image(s) were created using OE kickstart file:
>    /home/trz/yocto/master-cur/scripts/lib/image/canned-wks/directdisk-multi.wks
>
> Thanks,

Why BOOTIMG_DIR is pointing to 
/home/trz/yocto/master-cur/build/tmp/sysroots/crownbay/usr/share ? It 
could be /var/tmp/wic/build/hdd/boot?

And what do you thing about this output ?

Checking basic build environment...
Done.

Creating image(s)...

Info: The new image(s) can be found here:
   /var/tmp/wic/build/directdisk-multi-rootfs-201403222319-sda.direct

The following build artifacts were used to create the image(s):
   /boot                        /var/tmp/wic/build/hdd/boot
   / 
/srv/build/yocto/master/tmp/work/genericx86-poky-linux/core-image-minimal/1.0-r0/rootfs
   /standby 
/srv/build/yocto/master/tmp/work/genericx86-poky-linux/core-image-minimal-dev/1.0-r0/rootfs
   /root_test 
/srv/build/yocto/master/tmp/work/genericx86-poky-linux/core-image-minimal-dev/1.0-r0/rootfs
   KERNEL_DIR: 
/srv/build/yocto/master/tmp/sysroots/genericx86/usr/src/kernel
   NATIVE_SYSROOT:  /srv/build/yocto/master/tmp/sysroots/x86_64-linux


The image(s) were created using OE kickstart file:
/home/joaohf/jhf/opensource/poky/scripts/lib/image/canned-wks/directdisk-multi-rootfs.wks

Thanks.

-- 
João Henrique Ferreira de Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil


