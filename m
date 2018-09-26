Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C99C7745ED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 22:30:31 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w8QMUUFh009348
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 26 Sep 2018 23:30:31 +0100
Message-ID: <5ec7d09ee0d304331280e1ad45a95f136beccbf8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrej Valek <andrej.valek@siemens.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 26 Sep 2018 23:30:30 +0100
In-Reply-To: <20180926132848.6632-2-andrej.valek@siemens.com>
References: <20180926132848.6632-1-andrej.valek@siemens.com>
	<20180926132848.6632-2-andrej.valek@siemens.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/1] kernel-devsrc: fix searching for non-existing manifest files
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
X-List-Received-Date: Wed, 26 Sep 2018 22:30:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-09-26 at 15:28 +0200, Andrej Valek wrote:
> Even if the do_populate_sysroot have had set-up noexec flag,
> populate_sdk's
> tasks were trying to find .populate_sysroot manifest file. Change
> noexec
> flag settings to delete appreciated tasks.
> 
> WARNING: core-image-minimal-1.0-r0 do_sdk_depends: Manifest
> build/tmp/sstate-control/manifest-x86_64_x86_64-nativesdk-kernel-
> devsrc.populate_sysroot
> not found in qemuarm armv5te armv5e armv5t armv5 armv4t armv4 arm
> allarch x86_64_x86_64-nativesdk (variant '')?
> 
> WARNING: core-image-minimal-1.0-r0 do_populate_sdk_ext: Manifest
> build/tmp/sstate-control/manifest-x86_64_x86_64-nativesdk-kernel-
> devsrc.populate_sysroot
> not found in qemuarm armv5te armv5e armv5t armv5 armv4t armv4 arm
> allarch x86_64_x86_64-nativesdk (variant '')?
> 
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb
> b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index 463305e89a..716e908af8 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -20,12 +20,12 @@ do_install[depends] +=
> "virtual/kernel:do_shared_workdir"
>  do_install[depends] += "virtual/kernel:do_install"
>  
>  # There's nothing to do here, except install the source where we can
> package it
> -do_fetch[noexec] = "1"
> -do_unpack[noexec] = "1"
> -do_patch[noexec] = "1"
> -do_configure[noexec] = "1"
> -do_compile[noexec] = "1"
> -do_populate_sysroot[noexec] = "1"
> +deltask do_fetch
> +deltask do_unpack
> +deltask do_patch
> +deltask do_configure
> +deltask do_compile
> +deltask do_populate_sysroot
>  

This triggered some failures in the autobuilder tests:

https://autobuilder.yoctoproject.org/typhoon/#/builders/8/builds/78/steps/7/logs/step1b
https://autobuilder.yoctoproject.org/typhoon/#/builders/19/builds/70/steps/7/logs/step1c
https://autobuilder.yoctoproject.org/typhoon/#/builders/27/builds/77/steps/7/logs/step1c

(https://wiki.yoctoproject.org/wiki/BuildLog#2578 if that is clearer,
the stdio log shows which following log(s) have the errors)

why, I'm not sure...

Cheers,

Richard


