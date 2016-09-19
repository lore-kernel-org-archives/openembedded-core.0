Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id ADE0B731C2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 15:04:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8JF4KiL015637
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 19 Sep 2016 08:04:20 -0700
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 19 Sep 2016 08:04:19 -0700
To: California Sullivan <california.l.sullivan@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1474069704-24428-1-git-send-email-california.l.sullivan@intel.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <2c06b548-62b4-5766-4ac4-6a18972be549@windriver.com>
Date: Mon, 19 Sep 2016 11:04:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1474069704-24428-1-git-send-email-california.l.sullivan@intel.com>
Subject: Re: [PATCH V2 1/1] kernel.bbclass: Add kernel_version_sanity_check function
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
X-List-Received-Date: Mon, 19 Sep 2016 15:04:26 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-09-16 07:48 PM, California Sullivan wrote:
> The kernel being built should match what the recipe claims it is
> building. This function ensures that happens by comparing the version
> information in the kernel's Makefile to the PV the recipe is using.
>
> v2 changes:
> * Match against PV instead of LINUX_VERSION
> * Match against EXTRAVERSION as well (e.g., -rc4)
> * Cleaned up version string building
>
> Fixes [YOCTO #6767].
>
> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
> ---
>  meta/classes/kernel.bbclass               | 30 ++++++++++++++++++++++++++++++
>  meta/recipes-kernel/linux/linux-yocto.inc |  1 +
>  2 files changed, 31 insertions(+)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index a6112e8..f894795 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -327,6 +327,36 @@ kernel_do_install() {
>  }
>  do_install[prefuncs] += "package_get_auto_pr"
>
> +# Must be ran no earlier than after do_kernel_checkout or else Makefile won't be in ${S}/Makefile
> +do_kernel_version_sanity_check() {
> +	# The Makefile determines the kernel version shown at runtime
> +	# Don't use KERNEL_VERSION because the headers it grabs the version from aren't generated until do_compile
> +	VERSION=$(grep "^VERSION =" ${S}/Makefile | sed s/.*=\ *//)
> +	PATCHLEVEL=$(grep "^PATCHLEVEL =" ${S}/Makefile | sed s/.*=\ *//)
> +	SUBLEVEL=$(grep "^SUBLEVEL =" ${S}/Makefile | sed s/.*=\ *//)
> +	EXTRAVERSION=$(grep "^EXTRAVERSION =" ${S}/Makefile | sed s/.*=\ *//)
> +
> +	# Build a string for regex and a plain version string
> +	reg="^${VERSION}\.${PATCHLEVEL}"
> +	vers="${VERSION}.${PATCHLEVEL}"
> +	if [ -n "${SUBLEVEL}" ]; then
> +		# Ignoring a SUBLEVEL of zero is fine
> +		if [ "${SUBLEVEL}" = "0" ]; then
> +			reg="${reg}(\.${SUBLEVEL})?"
> +		else
> +			reg="${reg}\.${SUBLEVEL}"
> +			vers="${vers}.${SUBLEVEL}"
> +		fi
> +	fi
> +	vers="${vers}${EXTRAVERSION}"
> +	reg="${reg}${EXTRAVERSION}"
> +
> +	if [ -z `echo ${PV} | grep -E "${reg}"` ]; then
> +		bbfatal "Package Version (${PV}) does not match of kernel being built (${vers}). Please update the PV variable to match the kernel source."

My only 'nit is that this is a fairly long line. Would it be worth
splitting it into two ?

Otherwise, I don't see anything obviously wrong (I looked at the regexs
but didn't study them in detail) .. and it looks sane to me. A good
balance between checking and not needing the entire kernel to be built
and exported to work-shared.

Cheers,

Bruce

> +	fi
> +	exit 0
> +}
> +
>  addtask shared_workdir after do_compile before do_compile_kernelmodules
>  addtask shared_workdir_setscene
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
> index 98a48ec..d979662 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -55,6 +55,7 @@ do_install_append(){
>  }
>
>  # extra tasks
> +addtask kernel_version_sanity_check after do_kernel_checkout before do_compile
>  addtask kernel_link_images after do_compile before do_install
>  addtask validate_branches before do_patch after do_kernel_checkout
>  addtask kernel_configcheck after do_configure before do_compile
>


