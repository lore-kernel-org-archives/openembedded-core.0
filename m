Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E63C64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 14:25:41 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.14530.1678371931144173063
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 06:25:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TDLoe0q9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D1E2824000E;
	Thu,  9 Mar 2023 14:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678371928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s9nIJTivqpxpy2ryNKTioAlDOo3XzYgS3gNZLEuU6IQ=;
	b=TDLoe0q94dDVsyamXpMBGEUdiHy7X+RAeKjhYpnl7X2sBlI4Q97vtGwHcXWYqUyXh7YkhI
	vIznkti7rWDgQ+Ff+MOlAKnv6QW0hHKFFfLopVgAVuS0MlCHCNA1Pi6iFCA1KadW9voPrc
	7d9MIhdFaGcpqf3fv8BwJD8kwUn55/h4p0psF8mv+ruouAktRIBvXuXODF2qBwYps8LFp6
	1y1fPDBFiynhTskccItFmJ/QUz6WNIEay6PrseriUZUmiyt4fxJaJA/M/vuMaPi6oN46qk
	732rXuwPwh0P1xpsltEXbN9GdVUGYHfLMk/BJjF7sz2EXRBXALzTJa5pqtam5Q==
Date: Thu, 9 Mar 2023 15:25:27 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Kareem Zarka <zarkakareem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Stefan Schmidt <stefan.schmidt@huawei.com>,
	Kareem Zarka <kareem.zarka@huawei.com>
Subject: Re: [OE-core] [PATCH] wic/plugins/source/bootimg-efi: Configure
 installation of kernel image into boot partition.
Message-ID: <202303091425271c41e2b9@mail.local>
References: <20230308103448.2134894-1-kareem.zarka@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308103448.2134894-1-kareem.zarka@huawei.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 14:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178224

Hello,

This still fails on the autobuilders, please fix before submitting a new
version (and please mark it as a new version):

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/4853/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/4933/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/4906/steps/14/logs/stdio

2023-03-09 09:58:24,299 - oe-selftest - INFO - wic.Wic.test_kernel_install (subunit.RemotedTestCase)
2023-03-09 09:58:24,299 - oe-selftest - INFO -  ... FAIL

2023-03-09 09:58:24,299 - oe-selftest - INFO - 6: 47/60 506/526 (23.54s) (0 failed) (wic.Wic.test_kernel_install)
2023-03-09 09:58:24,300 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/selftest/cases/wic.py", line 207, in test_kernel_install
    runCmd(cmd)
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
AssertionError: Command 'wic cp /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-1380163/wic-tmp/tmpw4s70lpy-202303090958-sda.direct:1 /tmp/tmpbww7gjoy' returned non-zero exit status 1:
ERROR: Can't find executable 'mcopy'



On 08/03/2023 11:34:47+0100, Kareem Zarka wrote:
> The issue with installing the kernel image to both rootfs
> and boot partition is that some systems rely on the kernel image in
> rootfs and not in the boot partition.
> This leads to duplication of the kernel image, which can cause
> unnecessary storage usage.
> This patch provides a solution to the problem by adding a new parameter
> "install-kernel-into-boot-dir" to the wic kickstart file.
> If this parameter is set to 'true', the plugin will install the
> kernel image to the boot partition. If the parameter is set to 'false',
> the plugin will skip installing the kernel image, avoiding duplication.
> Tests for this functionality will be added in the next patch.
> 
> Signed-off-by: Kareem Zarka <kareem.zarka@huawei.com>
> ---
>  scripts/lib/wic/plugins/source/bootimg-efi.py | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
> index d6aeab2aad..09e9d6417c 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-efi.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
> @@ -363,9 +363,10 @@ class BootimgEFIPlugin(SourcePlugin):
>                  objcopy_cmd += " %s %s/EFI/Linux/linux.efi" % (efi_stub, hdddir)
>                  exec_native_cmd(objcopy_cmd, native_sysroot)
>          else:
> -            install_cmd = "install -m 0644 %s/%s %s/%s" % \
> -                (staging_kernel_dir, kernel, hdddir, kernel)
> -            exec_cmd(install_cmd)
> +            if source_params.get('install-kernel-into-boot-dir') != 'false':
> +                install_cmd = "install -m 0644 %s/%s %s/%s" % \
> +                    (staging_kernel_dir, kernel, hdddir, kernel)
> +                exec_cmd(install_cmd)
>  
>          if get_bitbake_var("IMAGE_EFI_BOOT_FILES"):
>              for src_path, dst_path in cls.install_task:
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178164): https://lists.openembedded.org/g/openembedded-core/message/178164
> Mute This Topic: https://lists.openembedded.org/mt/97469748/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

