Return-Path: <joaohf@gmail.com>
Received: from mail-ve0-f177.google.com (mail-ve0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5294E60E79
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 03:24:01 +0000 (UTC)
Received: by mail-ve0-f177.google.com with SMTP id sa20so6439636veb.36
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 20:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=6rDtGS3b0N9Efs6vgxkGx7Wjy80Qw1oYiXNlYtuAyuk=;
	b=RnJbEFpDRkqBCD/YHhvhiYD9r3+3L8jMd32FXKODNhAnxSGuoXhfHh0cU4ynSM3HNC
	ecMURdohQ9PXYxkoc/iX55lFggrwWjvOD3dnSnwexyE6Q9oEEtYKU+Gi/IOHrOdSPkQW
	OTViPkYFS/Fzx2SzVSRZ51TMTWFmHumrMcYAl4fXz/2OrsqjpipHtcECQWSdgByKH+w8
	sBOYrUvuVj7BbkGbemD9yA4Pmfx4TdekmWOELF8JxBrfy8uCwBNG6amgkUZZPNO7p15P
	xmyIwl+7qGcJ7m2lNftVJcqC7J2mUIu/UqfFokfo9tfuctu9pNFfnkhsPKm/YMql2T1+
	fhZg==
X-Received: by 10.58.126.4 with SMTP id mu4mr10669143veb.0.1396063442195;
	Fri, 28 Mar 2014 20:24:02 -0700 (PDT)
Received: from [192.168.1.3] ([187.106.6.19])
	by mx.google.com with ESMTPSA id xr10sm7807393vec.2.2014.03.28.20.24.01
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Mar 2014 20:24:01 -0700 (PDT)
Message-ID: <53363CD0.7020507@gmail.com>
Date: Sat, 29 Mar 2014 00:24:00 -0300
From: =?UTF-8?B?Sm/Do28gSGVucmlxdWUgRmVycmVpcmEgZGUgRnJlaXRhcw==?=
	<joaohf@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Tom Zanussi <tom.zanussi@linux.intel.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>	
	<1395958078-5191-1-git-send-email-joaohf@gmail.com>
	<1396042703.10059.162.camel@empanada>
In-Reply-To: <1396042703.10059.162.camel@empanada>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 0/7] wic: Add --rootfs option to --source param
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
X-List-Received-Date: Sat, 29 Mar 2014 03:24:04 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Tom,

Em 28-03-2014 18:38, Tom Zanussi escreveu:
> On Thu, 2014-03-27 at 19:07 -0300, João Henrique Ferreira de Freitas
> wrote:
>
>
> When testing, I noticed a problem I introduced when adding the plugin
> support - I'll submit a patch for it, but the fix is here:
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=tzanussi/wic-bitbake-env-fix&id=222d52976466464a3ff184e07c0c884c8f821dbc

Do you have any automatic way to test wic? Like a tool to create 
valid/invalid command line combinations ?

>
> Moving on to the generic connection versions, however, I still ran into
> problems.  Here's the 'directdisk-multi-indirect-both.wks' file I used
> for that test:
>
> part /boot --source bootimg-pcbios --ondisk sda --fstype=msdos --label boot --active --align 1024
> part / --source rootfs --rootfs-dir="rootfs1" --ondisk sda --fstype=ext3 --label platform --align 1024
>
> part /standby --source rootfs --rootfs-dir="rootfs2" --ondisk sda --fstype=ext3 --label secondary --align 1024
>
> bootloader  --timeout=0  --append="rootwait rootfstype=ext3 video=vesafb vga=0x318 console=tty0"
>
>
> Both the -e and manual failed in the same way:
>
> [trz@empanada build]$ wic create directdisk-multi-indirect-both --rootfs-dir rootfs1=/home/trz/yocto/master-cur/build/tmp/work/crownbay-poky-linux/core-image-minimal/1.0-r0/rootfs/ --rootfs-dir rootfs2=/home/trz/yocto/master-cur/build/tmp/work/crownbay-poky-linux/core-image-minimal/1.0-r0/rootfs/ -e core-image-minimal
> Checking basic build environment...
> Done.
>
> Creating image(s)...
>
> Traceback (most recent call last):
>    File "/home/trz/yocto/master-cur/scripts/wic", line 254, in <module>
>      ret = main()
>    File "/home/trz/yocto/master-cur/scripts/wic", line 249, in main
>      invoke_subcommand(args, parser, wic_help_usage, subcommands)
>    File "/home/trz/yocto/master-cur/scripts/lib/image/help.py", line 73, in invoke_subcommand
>      subcommands.get(args[0], subcommand_error)[0](args[1:], usage)
>    File "/home/trz/yocto/master-cur/scripts/wic", line 199, in wic_create_subcommand
>      image_output_dir, options.debug, options.properties_file)
>    File "/home/trz/yocto/master-cur/scripts/lib/image/engine.py", line 246, in wic_create
>      cr.main(direct_args)
> KeyError: 'ROOTFS_DIR'
>
>
> [trz@empanada build]$ wic create directdisk-multi-indirect-both -b /home/trz/yocto/master-cur/build/tmp/sysroots/crownbay/usr/share -k /home/trz/yocto/master-cur/build/tmp/sysroots/crownbay/usr/src/kernel -n /home/trz/yocto/master-cur/build/tmp/sysroots/x86_64-linux --rootfs-dir rootfs1=/home/trz/yocto/master-cur/build/tmp/work/crownbay-poky-linux/core-image-minimal/1.0-r0/rootfs/ --rootfs-dir rootfs2=/home/trz/yocto/master-cur/build/tmp/work/crownbay-poky-linux/core-image-minimal/1.0-r0/rootfs/
> Creating image(s)...
>
> Traceback (most recent call last):
>    File "/home/trz/yocto/master-cur/scripts/wic", line 254, in <module>
>      ret = main()
>    File "/home/trz/yocto/master-cur/scripts/wic", line 249, in main
>      invoke_subcommand(args, parser, wic_help_usage, subcommands)
>    File "/home/trz/yocto/master-cur/scripts/lib/image/help.py", line 73, in invoke_subcommand
>      subcommands.get(args[0], subcommand_error)[0](args[1:], usage)
>    File "/home/trz/yocto/master-cur/scripts/wic", line 153, in wic_create_subcommand
>      rootfs_dir = options.rootfs_dir['ROOTFS_DIR']
> KeyError: 'ROOTFS_DIR'

Ok, the problem was that no --rootfs-dir (without a connect) was passed. 
Like this:

... --rootfs-dir /home/trz/yocto/master-cur/build/tmp/work/crownbay-poky-linux/core-image-minimal/1.0-r0/rootfs/ --rootfs-dir rootfs2=/home/trz/yocto/master-cur/build/tmp/work/crownbay-poky-linux/core-image-minimal/1.0-r0/rootfs/


I've fixed the code to get this situation.

Thanks.

-- 
João Henrique Ferreira de Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil


