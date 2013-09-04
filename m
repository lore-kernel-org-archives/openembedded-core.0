Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id B40CF6B005
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 22:02:11 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r84MF89a018250; Wed, 4 Sep 2013 23:15:08 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 96TiLjHs8Mkb; Wed,  4 Sep 2013 23:15:08 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r84MF5Vp018244
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 4 Sep 2013 23:15:07 +0100
Message-ID: <1378332114.1059.260.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>
Date: Wed, 04 Sep 2013 23:01:54 +0100
In-Reply-To: <1378311722-17752-1-git-send-email-ross.burton@intel.com>
References: <1378311722-17752-1-git-send-email-ross.burton@intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qemu: add recommend of kernel-modules for all qemu machines
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
X-List-Received-Date: Wed, 04 Sep 2013 22:02:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-09-04 at 17:22 +0100, Ross Burton wrote:
> Only qemumips was recommending kernel-modules which meant that the other qemu
> machines were missing some kernel modules, for example binfmt-misc.
> 
> Move the recommends to qemu.inc so that all qemu machines pull in the kernel
> modules that have been built.
> 
> [ YOCTO #4863 ]
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/conf/machine/include/qemu.inc |    2 ++
>  meta/conf/machine/qemumips.conf    |    2 --
>  meta/conf/machine/qemumips64.conf  |    2 --
>  3 files changed, 2 insertions(+), 4 deletions(-)

How many modules are built for the qemu machines? Are they all useful?
I'm just trying to get a feel for how much we're adding here and whether
this is the right thing to be doing...

Cheers,

Richard



> 
> diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
> index 545f8d1..7baf13e 100644
> --- a/meta/conf/machine/include/qemu.inc
> +++ b/meta/conf/machine/include/qemu.inc
> @@ -27,3 +27,5 @@ EXTRA_IMAGEDEPENDS += "qemu-native qemu-helper-native"
>  
>  # Provide the nfs server kernel module for all qemu images
>  KERNEL_FEATURES_append_pn-linux-yocto = " features/nfsd/nfsd-enable.scc"
> +
> +MACHINE_EXTRA_RRECOMMENDS = "kernel-modules"
> diff --git a/meta/conf/machine/qemumips.conf b/meta/conf/machine/qemumips.conf
> index ce1c419..89721a6 100644
> --- a/meta/conf/machine/qemumips.conf
> +++ b/meta/conf/machine/qemumips.conf
> @@ -9,5 +9,3 @@ KERNEL_IMAGETYPE = "vmlinux"
>  KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
>  
>  SERIAL_CONSOLE = "115200 ttyS0"
> -
> -MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
> diff --git a/meta/conf/machine/qemumips64.conf b/meta/conf/machine/qemumips64.conf
> index b2c7998..7ba98cb 100644
> --- a/meta/conf/machine/qemumips64.conf
> +++ b/meta/conf/machine/qemumips64.conf
> @@ -9,5 +9,3 @@ KERNEL_IMAGETYPE = "vmlinux"
>  KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
>  
>  SERIAL_CONSOLE = "115200 ttyS0"
> -
> -MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"



