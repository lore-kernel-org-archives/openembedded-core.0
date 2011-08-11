Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QrOxL-00064I-Ha
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 08:41:28 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 10 Aug 2011 23:36:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,355,1309762800"; 
   d="scan'208";a="6062736"
Received: from kyu3-desk.ccr.corp.intel.com (HELO [10.238.154.176])
	([10.238.154.176])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Aug 2011 23:36:52 -0700
Message-ID: <4E437883.90406@intel.com>
Date: Thu, 11 Aug 2011 14:36:51 +0800
From: Yu Ke <ke.yu@intel.com>
User-Agent: Mozilla/5.0 (Windows NT 5.1; rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1312484099-29314-1-git-send-email-galak@kernel.crashing.org>
In-Reply-To: <1312484099-29314-1-git-send-email-galak@kernel.crashing.org>
Subject: Re: [PATCH] gcc: use ${base_lib} to match gcc default configuration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Aug 2011 06:41:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Kumar,

I just found this patch breaks the qemux86-64 lib64 multilib build.

the error log is as below:

| mv: cannot stat 
`/home/kyu3/sdb/multilib2/tmp/work/x86_64-pokymllib64-linux/lib64-gcc-cross-intermediate-4.6.1+svnr175454-r4/image/home/kyu3/sdb/multilib2/tmp/sysroots/x86_64-linux/usr/x86_64-pokymllib64-linux/lib64/*': 
No such file or directory
NOTE: package lib64-gcc-cross-intermediate-4.6.1+svnr175454-r4: task 
do_install: Failed
ERROR: Task 1557 
(virtual:multilib:lib64:/home/kyu3/src/poky/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.6.bb, 
do_install) failed with exit code

the error is caused by command in gcc-cross-intermediate.inc: 
do_install(): "mv ${D}${exec_prefix}/${TARGET_SYS}/${baselib}/* 
${D}${target_base_libdir}/"

and the reason is that: ${baselib} is lib64 in multilib case, while the 
files to be moved is still in ${D}${exec_prefix}/${TARGET_SYS}/lib/*, 
so mv will fail.

The fix may be either reverting this commit, or putting the file to 
${baselib} instead of lib. I'd like to get your input before going further.

Regards
Ke

on 2011-8-5 2:54, Kumar Gala wrote:
> Rather than tweaking MULTILIB_DIRNAMES&  MULTILIB_OSDIRNAMES like is
> done for x86-64 via 64bithack.patch.  We can just go with gcc defaults
> and utilize ${base_lib} for where to find gcc libs.
>
> Signed-off-by: Kumar Gala<galak@kernel.crashing.org>
> ---
>   .../gcc/gcc-cross-intermediate.inc                 |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
> index df5958a..7b1bb38 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
> @@ -34,7 +34,7 @@ do_compile () {
>   do_install () {
>   	oe_runmake 'DESTDIR=${D}' install
>   	install -d ${D}${target_base_libdir}/
> -	mv ${D}${exec_prefix}/${TARGET_SYS}/lib/* ${D}${target_base_libdir}/
> +	mv ${D}${exec_prefix}/${TARGET_SYS}/${baselib}/* ${D}${target_base_libdir}/
>
>   	# We don't really need this (here shares/ contains man/, info/, locale/).
>   	rm -rf ${D}${datadir}/



