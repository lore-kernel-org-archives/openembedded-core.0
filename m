Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 761A5761CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 15:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6NFtONd030403; Thu, 23 Jul 2015 16:55:24 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CxG6jJMASUYB; Thu, 23 Jul 2015 16:55:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6NFtBQK030385
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 23 Jul 2015 16:55:23 +0100
Message-ID: <1437666911.821.126.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: zhe.he@windriver.com
Date: Thu, 23 Jul 2015 16:55:11 +0100
In-Reply-To: <81b6a1d0e88aa6e5f616e77b136972541bbdc7bd.1437461993.git.zhe.he@windriver.com>
References: <cover.1437461993.git.zhe.he@windriver.com>
	<81b6a1d0e88aa6e5f616e77b136972541bbdc7bd.1437461993.git.zhe.he@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: bruce.ashfield@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/2] kernel: Pass sysroot mkimage to kernel makefile
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
X-List-Received-Date: Thu, 23 Jul 2015 15:55:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-07-21 at 15:23 +0800, zhe.he@windriver.com wrote:
> From: He Zhe <zhe.he@windriver.com>
> 
> Pass mkimage in sysroot to kernel makefile by NATIVE_MKIMAGE to avoid
> depending on build machine's when KEEPUIMAGE is "yes".
> 
> Fixes [YOCTO #6945].
> 
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 86ed28f..1d7fa48 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -141,7 +141,7 @@ UBOOT_ENTRYPOINT ?= "20008000"
>  UBOOT_LOADADDRESS ?= "${UBOOT_ENTRYPOINT}"
>  
>  # Some Linux kernel configurations need additional parameters on the command line
> -KERNEL_EXTRA_ARGS ?= ""
> +KERNEL_EXTRA_ARGS ?= "NATIVE_MKIMAGE=${STAGING_BINDIR_NATIVE}/mkimage"
>  
>  # For the kernel, we don't want the '-e MAKEFLAGS=' in EXTRA_OEMAKE.
>  # We don't want to override kernel Makefile variables from the environment

${STAGING_BINDIR_NATIVE} should be in PATH ahead of the usual system
paths. Why therefore is this necessary? Is something resetting PATH?

Cheers,

Richard


