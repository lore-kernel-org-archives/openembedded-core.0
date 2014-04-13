Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7B5D165EA9
	for <Openembedded-core@lists.openembedded.org>;
	Sun, 13 Apr 2014 15:38:57 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s3DFcUEw012720; Sun, 13 Apr 2014 16:38:31 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WofBkB8nqw_C; Sun, 13 Apr 2014 16:38:29 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s3DFcIbQ012716
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sun, 13 Apr 2014 16:38:23 +0100
Message-ID: <1397403492.15843.52.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: nitin.a.kamble@intel.com
Date: Sun, 13 Apr 2014 16:38:12 +0100
In-Reply-To: <12b191e0f58ed7954477dab64bb89d7e94b95039.1397238371.git.nitin.a.kamble@intel.com>
References: <cover.1397238371.git.nitin.a.kamble@intel.com>
	<12b191e0f58ed7954477dab64bb89d7e94b95039.1397238371.git.nitin.a.kamble@intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: darren.hart@intel.com, Openembedded-core@lists.openembedded.org
Subject: Re: [Patch v2 1/1] meta-skeleton: linux-yocto-custom.bb: use machine overrides
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
X-List-Received-Date: Sun, 13 Apr 2014 15:38:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-04-11 at 10:59 -0700, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> Use machine overrides for variables for this skeleton kernel recipe
> so that people following skeleton do it right at the beginning.
> 
> The machine overrides for the variables reduces  variable name-space
> pollution and avoids unintentional influences on other layers.
> 
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> index c329106..16db4a3 100644
> --- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> +++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> @@ -44,21 +44,23 @@
>  inherit kernel
>  require recipes-kernel/linux/linux-yocto.inc
>  
> +#Note: Replace the yourmachine string with your actual machine name here
> +
>  # Override SRC_URI in a bbappend file to point at a different source
>  # tree if you do not want to build from Linus' tree.
> -SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protocol=git;nocheckout=1;name=machine"
> +SRC_URI_yourmachine = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protocol=git;nocheckout=1;name=yourmachine"
>  
> -LINUX_VERSION ?= "3.4"
> -LINUX_VERSION_EXTENSION ?= "-custom"
> +LINUX_VERSION_yourmachine ?= "3.4"
> +LINUX_VERSION_EXTENSION_yourmachine ?= "-custom"
>  
>  # Override SRCREV to point to a different commit in a bbappend file to
>  # build a different release of the Linux kernel.
>  # tag: v3.4 76e10d158efb6d4516018846f60c2ab5501900bc
> -SRCREV_machine="76e10d158efb6d4516018846f60c2ab5501900bc"
> +SRCREV_yourmachine="76e10d158efb6d4516018846f60c2ab5501900bc"
>  
>  PR = "r1"
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>  
> -# Override COMPATIBLE_MACHINE to include your machine in a bbappend
> -# file. Leaving it empty here ensures an early explicit build failure.
> -COMPATIBLE_MACHINE = "(^$)"
> +# Override COMPATIBLE_MACHINE to include your yourmachine in a bbappend
> +# file.
> +COMPATIBLE_MACHINE_yourmachine = "yourmachine"

This breaks the autobuilder:

http://autobuilder.yoctoproject.org/main/builders/nightly-qa-skeleton/builds/43/steps/BuildImages/logs/stdio

Cheers,

Richard


