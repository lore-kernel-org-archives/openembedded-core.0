Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C2ED572120
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 May 2015 14:33:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t44EXhh4017457
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 May 2015 07:33:43 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 4 May 2015 07:33:42 -0700
Message-ID: <55478346.706@windriver.com>
Date: Mon, 4 May 2015 10:33:42 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Ed Bartosh <ed.bartosh@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1430490525.18360.14.camel@linuxfoundation.org>
	<1430748689-7217-1-git-send-email-ed.bartosh@linux.intel.com>
In-Reply-To: <1430748689-7217-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: Re: [PATCH] kernel.bbclass: Fix race condition
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
X-List-Received-Date: Mon, 04 May 2015 14:33:55 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-05-04 10:11 AM, Ed Bartosh wrote:
> Race condition between do_compile_kernelmodules and do_shared_workdir
> tasks occurs when do_compilemodules changes files in include/generated/*
> while do_shared_workdir tries to copy them to shared working directory.
>
> Functionality of do_shared_workdir has been moved to separate function
> mk_shared_workdir and called from do_kernel_compile. do_shared_workdir
> left in the code as it may be used in many recipes.

Looks good. Thanks for the respin of the patch! I'll put my
variant in the attic, since this looks like it will solve
the issue.

Cheers,

Bruce

>
> [YOCTO #7321]
>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>   meta/classes/kernel.bbclass | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 125ed88..13c0180 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -192,6 +192,8 @@ kernel_do_compile() {
>   	if test "${KERNEL_IMAGETYPE_FOR_MAKE}.gz" = "${KERNEL_IMAGETYPE}"; then
>   		gzip -9c < "${KERNEL_IMAGETYPE_FOR_MAKE}" > "${KERNEL_OUTPUT}"
>   	fi
> +
> +	mk_shared_workdir
>   }
>
>   do_compile_kernelmodules() {
> @@ -245,7 +247,7 @@ emit_depmod_pkgdata() {
>
>   PACKAGEFUNCS += "emit_depmod_pkgdata"
>
> -do_shared_workdir () {
> +mk_shared_workdir () {
>   	cd ${B}
>
>   	kerneldir=${STAGING_KERNEL_BUILDDIR}
> @@ -289,6 +291,14 @@ do_shared_workdir () {
>   	fi
>   }
>
> +# NOTE!!! Functionality of do_shared_workdir has been moved to mk_shared_workdir
> +# and called from kernel_do_compile.
> +# It caused race condition with do_compile_kernelmodules when it runs
> +# in parallel with do_compile_kernelmodules
> +do_shared_workdir () {
> +	:
> +}
> +
>   # We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
>   sysroot_stage_all () {
>   	:
>


