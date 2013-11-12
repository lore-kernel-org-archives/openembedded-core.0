Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7A5B46D75A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 15:01:06 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Nov 2013 06:57:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="433938571"
Received: from unknown (HELO [10.255.15.132]) ([10.255.15.132])
	by orsmga002.jf.intel.com with ESMTP; 12 Nov 2013 07:01:07 -0800
Message-ID: <528242B3.3060500@linux.intel.com>
Date: Tue, 12 Nov 2013 07:01:07 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Lei Liu <layliu@gmail.com>, openembedded-core@lists.openembedded.org
References: <52805D73.4050306@gmail.com>
In-Reply-To: <52805D73.4050306@gmail.com>
Subject: Re: [PATCH] Disable building libgcc with -O0
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
X-List-Received-Date: Tue, 12 Nov 2013 15:01:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



Please fix up the comment to follow the guildlines on this patch and 
your other one.

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Sau!


On 11/10/2013 08:30 PM, Lei Liu wrote:
> Link error happens for valgrind when linking unoptimized libgcc.
> Libgcc requires symbol _Unwind_Resume defined in libgcc_eh which
> in turn requires pulling in entire glibc.  We can't make valgrind
> link with glibc due to its design.  So don't build libgcc without
> optimizations, so that calls to _Unwind_Resume get eliminated.
>
> Signed-off-by: Lei Liu <lei.liu2@windriver.com>
> ---
>   meta/recipes-devtools/gcc/gcc-cross.inc | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
> index 25a3142..cf03c08 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> @@ -25,6 +25,15 @@ EXTRA_OECONF_PATHS = " \
>
>   ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
>
> +def get_optimization(d):
> +    selected_optimization = d.getVar("SELECTED_OPTIMIZATION", True)
> +    if base_contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
> +        bb.note("libgcc can't be built with -O0, -O2 will be used instead.")
> +        return selected_optimization.replace("-O0", "-O2")
> +    return selected_optimization
> +
> +SELECTED_OPTIMIZATION := "${@get_optimization(d)}"
> +
>   do_configure_prepend () {
>   	sed -i 's/BUILD_INFO=info/BUILD_INFO=/' ${S}/gcc/configure
>   }
> --
> 1.8.2.1
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

