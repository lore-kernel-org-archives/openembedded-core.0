Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 65C667E6B6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 20:37:41 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id p11so11468261wre.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 13:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=17t3Mw2FXWBTOyAmigS85hcKlxsj+CWXpvwG6U6YKtk=;
	b=ZtsELVWsgESiZwe12foFsbzgqBLTp7G/d/15+Gc4KAtYEwmSBlFFRMsUx6/DuNGuIO
	zwZZw2N376riFqFSIErtEhAusGys+O4w1FY+ll43lXhSoNENY05DVSbphdJIZT19Sfse
	+gtGZlaJcztuWjy9t/Cz2E7U0RVJ7htStOMGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=17t3Mw2FXWBTOyAmigS85hcKlxsj+CWXpvwG6U6YKtk=;
	b=T7r+wOqmqeIsITqlQ4b1OrHJCBImyMoluIb83bfVwyU/T4qeL2Vmx+6LQc+bBemldU
	c4PxkADq3oOrVIXQM0q7eSBR45HVvxevz7/xgWEgPjiZw3F9BL7U76G8vNqcEfU0qJHx
	crCuQ4IgC6lj8b95DLzNDqVzDuqrO54ZY7j/9dabi/aT5bCgbJbb298dQrpleebAvTtk
	BX4yVOMI3J3wD7f+nj28O/I4B6SOfSLV/m3LNww0/4hXTlCGFnirmd7ZdzevX4Y2cu0J
	yAHHAnblXTBlQqGC7WhWKJTYbZgff1gz+xViG3FPrF4kcPN7WCiXorOAaZRo5FoUbY/P
	Tleg==
X-Gm-Message-State: APjAAAUkgo6wgsONefybpj60l8bFiW6n6tZTDGdDuPJ3fGmrm5lbCWY5
	IkN0sDqI1R6HXvMwTeBuEQUeZw==
X-Google-Smtp-Source: APXvYqzUmaHypgBKekFi5sVMmj6Y7jfDo7eEaDw9EIt4+PYIpxTs5VJnQHskK8mYCtqVMCtuT8S/0w==
X-Received: by 2002:a5d:5510:: with SMTP id b16mr43349497wrv.267.1560803862162;
	Mon, 17 Jun 2019 13:37:42 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h17sm8369951wrq.79.2019.06.17.13.37.41
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 17 Jun 2019 13:37:41 -0700 (PDT)
Message-ID: <7072c0e9642b064ad4444e1033506ae292af0fc4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: chee.yang.lee@intel.com, openembedded-core@lists.openembedded.org
Date: Mon, 17 Jun 2019 21:37:40 +0100
In-Reply-To: <1560406896-37282-1-git-send-email-chee.yang.lee@intel.com>
References: <1560406896-37282-1-git-send-email-chee.yang.lee@intel.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] wic/bootimg-efi: allow multiple initrd
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
X-List-Received-Date: Mon, 17 Jun 2019 20:37:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-06-13 at 14:21 +0800, chee.yang.lee@intel.com wrote:
> From: Chee Yang Lee <chee.yang.lee@intel.com>
> 
> Allow plugin bootimg-efi to configure with multiple initrd
> through source parameter.
> 
> Uses ; to separate each initrd.
> 
> e.g:
> --sourceparams="loader=${EFI_PROVIDER},initrd=initrd1;initrd2"
> 
> Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> ---
>  scripts/lib/wic/plugins/source/bootimg-efi.py | 24 ++++++++++++++++-
> -------
>  1 file changed, 16 insertions(+), 8 deletions(-)


How was this tested? It broke the autobuilder build:

| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_image_wic
| INFO: Creating image(s)...
| 
| Traceback (most recent call last):
|   File "/home/pokybuild/yocto-worker/genericx86/build/scripts/wic", line 525, in <module>
|     sys.exit(main(sys.argv[1:]))
|   File "/home/pokybuild/yocto-worker/genericx86/build/scripts/wic", line 520, in main
|     return hlp.invoke_subcommand(args, parser, hlp.wic_help_usage, subcommands)
|   File "/home/pokybuild/yocto-worker/genericx86/build/scripts/lib/wic/help.py", line 83, in invoke_subcommand
|     subcmd[0](args, usage)
|   File "/home/pokybuild/yocto-worker/genericx86/build/scripts/wic", line 220, in wic_create_subcommand
|     native_sysroot, options)
|   File "/home/pokybuild/yocto-worker/genericx86/build/scripts/lib/wic/engine.py", line 189, in wic_create
|     plugin.do_create()
|   File "/home/pokybuild/yocto-worker/genericx86/build/scripts/lib/wic/plugins/imager/direct.py", line 86, in do_create
|     self.create()
|   File "/home/pokybuild/yocto-worker/genericx86/build/scripts/lib/wic/plugins/imager/direct.py", line 196, in create
|     self._image.prepare(self)
|   File "/home/pokybuild/yocto-worker/genericx86/build/scripts/lib/wic/plugins/imager/direct.py", line 362, in prepare
|     imager.kernel_dir, imager.native_sysroot)
|   File "/home/pokybuild/yocto-worker/genericx86/build/scripts/lib/wic/partition.py", line 167, in prepare
|     kernel_dir, native_sysroot)
|   File "/home/pokybuild/yocto-worker/genericx86/build/scripts/lib/wic/plugins/source/bootimg-efi.py", line 198, in do_configure_partition
|     cls.do_configure_grubefi(hdddir, creator, cr_workdir, source_params)
|   File "/home/pokybuild/yocto-worker/genericx86/build/scripts/lib/wic/plugins/source/bootimg-efi.py", line 88, in do_configure_grubefi
|     if initrds:
| UnboundLocalError: local variable 'initrds' referenced before assignment
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_image_wic (log file is located at /home/pokybuild/yocto-worker/genericx86/build/build/tmp/work/genericx86-poky-linux/core-image-minimal-initramfs/1.0-r0/temp/log.do_image_wic.23700)


https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/712
https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/717
https://autobuilder.yoctoproject.org/typhoon/#/builders/43/builds/712
https://autobuilder.yoctoproject.org/typhoon/#/builders/49/builds/711
https://autobuilder.yoctoproject.org/typhoon/#/builders/58/builds/699

wic selftests don't even work:
https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/526


Richard


