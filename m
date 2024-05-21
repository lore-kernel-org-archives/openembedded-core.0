Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E1EC25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 09:47:03 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.15690.1716284820521842810
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 02:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UGr4agIc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 860A2E000B;
	Tue, 21 May 2024 09:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716284818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2hg2BZFnyAzd6ZkuV0skZ596kJ0bf0LTWWPVJZyz4TE=;
	b=UGr4agIcwCp65p/Rt/ZCTDwFGVkw0gY7qmJCImW+h4CVuLkmL2Fp9PrkumDjiVf9AWrL+O
	sEFta3LE5s61U/NZADixLNlHcWbBiLPA7m+PaWQ8GjTeBVh/D+35pH5e0T/W+sBb0uBQll
	uBVoJCdE46A6pNjS2F0+UTM13rLZmiiO4mwTpyqvRIyrNK1yDB981qB+Oaxd9qOy4PiCyj
	N3pN+/WyPqFhfsyK3L14NYpYYS6z5UiqseHTDXCUZlhTF+/pSL1HBcpnhQYnK+W5kLBbnC
	ScrpICGezX/+Mn23PpmzXubyLIgmLk8vm0RdnCWQmVP7lRYWbQvPq5o/NcqFHg==
Date: Tue, 21 May 2024 11:46:58 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 5/6] meson: correct the host machine definition
 in SDKs
Message-ID: <202405210946585c4dc6df@mail.local>
References: <20240520101833.1798907-1-ross.burton@arm.com>
 <20240520101833.1798907-5-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240520101833.1798907-5-ross.burton@arm.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 09:47:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199607

I believe this causes the following failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/146/builds/1733/steps/12/logs/stdio

On 20/05/2024 10:18:32+0000, Ross Burton wrote:
> The SDK_ARCH is not the correct definiton for the host machine definition
> inside the SDK, but because a nativesdk recipe doesn't know what the
> final target will be these values should be set up at SDK installation
> time via the environment script.
> 
> Put placeholders in the installed meson.cross file instead, and replace
> them at SDK installation time with the correct values.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../meson/meson/meson-setup.py                | 37 +++++++++++++++++++
>  meta/recipes-devtools/meson/meson_1.3.1.bb    | 16 ++------
>  2 files changed, 41 insertions(+), 12 deletions(-)
> 
> diff --git a/meta/recipes-devtools/meson/meson/meson-setup.py b/meta/recipes-devtools/meson/meson/meson-setup.py
> index daaa551de2d..74579ecca6b 100755
> --- a/meta/recipes-devtools/meson/meson/meson-setup.py
> +++ b/meta/recipes-devtools/meson/meson/meson-setup.py
> @@ -1,9 +1,42 @@
>  #!/usr/bin/env python3
>  
>  import os
> +import re
>  import string
>  import sys
>  
> +# Keep these in sync with the logic in meson-routines.bbclass
> +def meson_cpu_family():
> +    arch = os.environ["OECORE_TARGET_ARCH"]
> +    if arch == 'powerpc':
> +        return 'ppc'
> +    elif arch == 'powerpc64' or arch == 'powerpc64le':
> +        return 'ppc64'
> +    elif arch == 'armeb':
> +        return 'arm'
> +    elif arch == 'aarch64_be':
> +        return 'aarch64'
> +    elif arch == 'mipsel':
> +        return 'mips'
> +    elif arch == 'mips64el':
> +        return 'mips64'
> +    elif re.match(r"i[3-6]86", arch):
> +        return "x86"
> +    elif arch == "microblazeel":
> +        return "microblaze"
> +    else:
> +        return arch
> +
> +def meson_operating_system():
> +    opersys = os.environ["OECORE_TARGET_ARCH"]
> +    if "mingw" in opersys:
> +        return "windows"
> +    # avoid e.g 'linux-gnueabi'
> +    elif "linux" in opersys:
> +        return "linux"
> +    else:
> +        return opersys
> +
>  class Template(string.Template):
>      delimiter = "@"
>  
> @@ -30,6 +63,10 @@ cross_file = os.path.join(sysroot, 'usr/share/meson/%smeson.cross' % os.environ[
>  native_template_file = os.path.join(sysroot, 'usr/share/meson/meson.native.template')
>  native_file = os.path.join(sysroot, 'usr/share/meson/meson.native')
>  
> +# Inject transformed values
> +os.environ["OECORE_MESON_TARGET_FAMILY"] = meson_cpu_family()
> +os.environ["OECORE_MESON_TARGET_OS"] = meson_operating_system()
> +
>  with open(template_file) as in_file:
>      template = in_file.read()
>      output = Template(template).substitute(Environ())
> diff --git a/meta/recipes-devtools/meson/meson_1.3.1.bb b/meta/recipes-devtools/meson/meson_1.3.1.bb
> index 5b0d82fe9f5..f8085f369bf 100644
> --- a/meta/recipes-devtools/meson/meson_1.3.1.bb
> +++ b/meta/recipes-devtools/meson/meson_1.3.1.bb
> @@ -117,18 +117,14 @@ needs_exe_wrapper = true
>  sys_root = @OECORE_TARGET_SYSROOT
>  
>  [host_machine]
> -system = '$host_system'
> -cpu_family = '$host_cpu_family'
> -cpu = '$host_cpu'
> -endian = '$host_endian'
> +system = @OECORE_MESON_TARGET_OS
> +cpu_family = @OECORE_MESON_TARGET_FAMILY
> +cpu = @OECORE_TARGET_ARCH
> +endian = @OECORE_TARGET_ENDIAN
>  EOF
>  }
>  
>  do_install:append:class-nativesdk() {
> -    host_system=${SDK_OS}
> -    host_cpu_family=${@meson_cpu_family("SDK_ARCH", d)}
> -    host_cpu=${SDK_ARCH}
> -    host_endian=${@meson_endian("SDK", d)}
>      install_templates
>  
>      install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d
> @@ -142,10 +138,6 @@ do_install:append:class-nativesdk() {
>  FILES:${PN}:append:class-nativesdk = "${datadir}/meson ${SDKPATHNATIVE}"
>  
>  do_install:append:class-native() {
> -    host_system=${HOST_OS}
> -    host_cpu_family=${@meson_cpu_family("HOST_ARCH", d)}
> -    host_cpu=${HOST_ARCH}
> -    host_endian=${@meson_endian("HOST", d)}
>      install_templates
>  
>      install -d ${D}${datadir}/post-relocate-setup.d
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199567): https://lists.openembedded.org/g/openembedded-core/message/199567
> Mute This Topic: https://lists.openembedded.org/mt/106200491/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

