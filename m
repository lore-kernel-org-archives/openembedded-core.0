Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0B2196D39D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 23:16:18 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Nov 2013 15:12:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="431593609"
Received: from unknown (HELO [10.255.15.29]) ([10.255.15.29])
	by orsmga002.jf.intel.com with ESMTP; 07 Nov 2013 15:16:19 -0800
Message-ID: <527C1F43.2080105@linux.intel.com>
Date: Thu, 07 Nov 2013 15:16:19 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Konrad Scherer <konrad.scherer@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <1383849386-7680-1-git-send-email-konrad.scherer@windriver.com>
	<1383849386-7680-2-git-send-email-konrad.scherer@windriver.com>
In-Reply-To: <1383849386-7680-2-git-send-email-konrad.scherer@windriver.com>
Subject: Re: [PATCH] perf: Disable warnings as errors for kernels 3.1+
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
X-List-Received-Date: Thu, 07 Nov 2013 23:16:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/07/2013 10:36 AM, Konrad Scherer wrote:
> From: Konrad Scherer <Konrad.Scherer@windriver.com>
>
> Turns out the sed command has not been working as intended since
> kernel 3.1 due to the trailing space. Adding the WERROR=0 environment
> variable is the correct way to disable warnings as errors.
>
So, I recently saw this failure:

ERROR: Logfile of failure stored in: 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/genericx86_64-poky-linux/perf/1.0-r8/temp/log.do_configure.12897
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: Executing shell function do_configure
| sed: can't read 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/sysroots/genericx86-64/usr/src/kernel/tools/perf/Makefile: 
No such file or directory
| WARNING: 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/genericx86_64-poky-linux/perf/1.0-r8/temp/run.do_configure.12897:1 
exit 2 from
|   sed -i 's,-Werror ,,' 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/sysroots/genericx86-64/usr/src/kernel/tools/perf/Makefile
| ERROR: Function failed: do_configure (log file is located at 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/genericx86_64-poky-linux/perf/1.0-r8/temp/log.do_configure.12897)
NOTE: recipe perf-1.0-r8: task do_configure: Failed
ERROR: Task 3469 
(/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/meta/recipes-kernel/perf/perf.bb, 
do_configure) failed with exit code '1'

I am not sure that your patch will completely address this failure.

Sau!


> Signed-off-by: Konrad Scherer <Konrad.Scherer@windriver.com>
> ---
>   meta/recipes-kernel/perf/perf.bb | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index 903ffa6..6258cbb 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -41,6 +41,9 @@ export STAGING_LIBDIR
>   export BUILD_SYS
>   export HOST_SYS
>
> +#kernel 3.1+ supports WERROR to disable warnings as errors
> +export WERROR = "0"
> +
>   do_populate_lic[depends] += "virtual/kernel:do_populate_sysroot"
>
>   # needed for building the tools/perf Perl binding
> @@ -115,6 +118,7 @@ do_install() {
>   }
>
>   do_configure_prepend () {
> +    #kernels before 3.1 do not support WERROR env variable
>       sed -i 's,-Werror ,,' ${S}/tools/perf/Makefile
>   }
>
>

