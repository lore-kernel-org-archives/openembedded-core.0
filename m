Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 276E9756A4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 22:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t55MrOg3013360; Fri, 5 Jun 2015 23:53:24 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WYk_89ipZmx8; Fri,  5 Jun 2015 23:53:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t55Mr7Ok013333
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 5 Jun 2015 23:53:19 +0100
Message-ID: <1433544787.28975.48.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Amy Fong <amy.fong@windriver.com>
Date: Fri, 05 Jun 2015 23:53:07 +0100
In-Reply-To: <20150605171815.GA20636@windriver.com>
References: <20150605171815.GA20636@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] External modules fail to load due to unknown symbols
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
X-List-Received-Date: Fri, 05 Jun 2015 22:53:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-06-05 at 13:18 -0400, Amy Fong wrote:
> From da12fa5e6daca0c0b7bb15df030b1c79fbefa089 Mon Sep 17 00:00:00 2001
> From: Amy Fong <amy.fong@windriver.com>
> Date: Mon, 1 Jun 2015 13:16:20 -0400
> Subject: [PATCH] External modules fail to load due to unknown symbols
> 
> When building external kernel modules, a failure can happen
> when the module has dependencies on other kernel modules.
> In such cases, the build looks at Module.symvers to do
> symbol lookups of the other kernel modules that it depends on.
> 
> Module.symvers gets copied by do_shared_workdir
> after do_compile and Module.symvers gets updated during
> do_compile_kernelmodules.
> 
> do_compile_kernelmodules is modified to explicitly copy Module.symvers
> to the shared workdir.
> 
> Signed-off-by: Amy Fong <amy.fong@windriver.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/classes/kernel.bbclass | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 4f22cde..4a177b1 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -215,6 +215,14 @@ do_compile_kernelmodules() {
>  	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>  	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
>  		oe_runmake ${PARALLEL_MAKE} modules CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
> +
> +		# Module.symvers gets updated during the 
> +		# building of the kernel modules. We need to
> +		# update this in the shared workdir since some
> +		# external kernel modules has a dependency on
> +		# other kernel modules and will look at this
> +		# file to do symbol lookups
> +		cp Module.symvers ${STAGING_KERNEL_BUILDDIR}
>  	else
>  		bbnote "no modules to compile"
>  	fi

Sadly this will give rise to a race. shared_workdir is defined as:

addtask shared_workdir after do_compile before do_compile_kernelmodule

and other modules depend on the shared_workdir task. Your other modules
could therefore compile before the code in compile_kernelmodule has run.

At a guess you will next suggest we change shared_workdir to be after
compile_kernelmodules. The problem there is one of performance. We had
bug reports from the community and Wind River people about the fact that
shared_workdir executes when building kernel modules and doesn't come
from sstate. Forcing shared_workdir to run more tasks every time isn't
going to make people happy either :(

So I'm not sure how we solve this but it is going to need more thought
and the above patch isn't right.

Cheers,

Richard




