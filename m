Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 0D30D6E6FA
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Feb 2014 12:06:46 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s19C6fJ9001752; Sun, 9 Feb 2014 12:06:42 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id W79PMSTLQ04L; Sun,  9 Feb 2014 12:06:41 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s19C6beY001742
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sun, 9 Feb 2014 12:06:39 GMT
Message-ID: <1391947592.7120.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Sun, 09 Feb 2014 12:06:32 +0000
In-Reply-To: <8a4a98cc53998f6bbf08763359e1b560b2da3e54.1391534980.git.bruce.ashfield@windriver.com>
References: <cover.1391534980.git.bruce.ashfield@windriver.com>
	<8a4a98cc53998f6bbf08763359e1b560b2da3e54.1391534980.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] kernel: stop using -exec rm for deleting files
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
X-List-Received-Date: Sun, 09 Feb 2014 12:06:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-02-04 at 12:34 -0500, Bruce Ashfield wrote:
> Removing files from the source tree via find, exec and rm is not the
> most efficient operation, due to (among other things) the many forked
> processes.
> 
> If we use -delete, it saves a significant amount of time. But -delete
> does not work with -prune (since it forces -depth). To maintain the
> lib, tools and scripts source files, we can hide them temporarily,
> skip their hidden directories and then finally restore them.
> 
> Time for install before this change:
> 
>  real    2m48.563s
>  user    0m35.220s
>  sys     0m33.036s
> 
> Time for install after this change:
> 
>  real    1m21.301s
>  user    0m33.160s
>  sys     0m28.388s
> 
> We could further speed this up by using inline perl to delete the files,
> but that complexity is avoided for now.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/classes/kernel.bbclass | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 51626b03f824..b76a65699755 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -260,9 +260,21 @@ kernel_do_install() {
>  	# we clean the scripts dir while leaving the generated config
>  	# and include files.
>  	#
> -	oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean
> -	make -C $kerneldir _mrproper_scripts
> -	find $kerneldir -path $kerneldir/lib -prune -o -path $kerneldir/tools -prune -o -path $kerneldir/scripts -prune -o -name "*.[csS]" -exec rm '{}' \;
> +	oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean _mrproper_scripts 
> +
> +	# hide directories that shouldn't have their .c, s and S files deleted
> +	for d in tools scripts lib; do
> +		mv $kerneldir/$d $kerneldir/.$d
> +	done
> +
> +	# delete .c, .s and .S files, unless we hid a directory as .<dir>. This technique is 
> +	# much faster than find -prune and -exec
> +	find . -not -path '*/\.*' -type f -name "*.[csS]" -delete
> +
> +	# put the hidden dirs back
> +	for d in tools scripts lib; do
> +		mv $kerneldir/.$d $kerneldir/$d
> +	done
>  
>  	# As of Linux kernel version 3.0.1, the clean target removes
>  	# arch/powerpc/lib/crtsavres.o which is present in


I think this patch is resulting in:

http://autobuilder.yoctoproject.org/main/builders/nightly-fsl-ppc-lsb/builds/22/steps/BuildImages/logs/stdio

Cheers,

Richard




