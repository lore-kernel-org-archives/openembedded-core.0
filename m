Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2348E6AC15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 06:01:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4K60xZ4009874
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 May 2015 23:00:59 -0700 (PDT)
Received: from [128.224.163.153] (128.224.163.153) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 19 May 2015 23:00:59 -0700
Message-ID: <555C2326.90207@windriver.com>
Date: Wed, 20 May 2015 14:01:10 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
References: <1431595911.30971.189.camel@linuxfoundation.org>
In-Reply-To: <1431595911.30971.189.camel@linuxfoundation.org>
X-Originating-IP: [128.224.163.153]
Subject: Re: [PATCH] kernel/rm_work: Improve interaction
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
X-List-Received-Date: Wed, 20 May 2015 06:01:01 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Richard,

I've observed a side effect of this patch.
The problem is sstate reuse.

Steps to reproduce:
1) bitbake core-image-minimal
2) Change TMPDIR in local.conf
      TMPDIR = "${TOPDIR}/tmp-test"
3) bitbake core-image-minimal

In theory, sstate objects are all reused in step 3. But currently the 
do_populate_sysroot sstate object of the kernel is not reused. In 
addition, other kernel tasks like do_fetch, do_patch, do_compile, etc, 
are rerun.

Best Regards,
Chen Qi

On 05/14/2015 05:31 PM, Richard Purdie wrote:
> The do_shared_workdir task does leave behind the necessary information in
> shared-work after it completes. We don't make this a "full" sstate task
> however since that means tarring up and copying what is usually a large
> amount of data which would be better extracted straight from the original
> SCM.
>
> The issue with rm_work occurs since it removes the do_shared_workdir stamp
> meaning subsequent builds will add it back if they need to touch any kernel
> modules for example. This ends up triggering a near enough complete kernerl
> rebuild since if configure reruns, populate_sysroot has to rerun.
>
> This change promotes the task to have a "setscene" variant but it doesn't use
> any of the sstate class lifting to generate the sstate file. The sstate function
> will therefore never get called since the sstate object will never exist.
>
> We can add the task to the list of tasks rm_work promotes to a setscene variant
> and unwanted rebuilds of the kernel should be avoided.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 74092e9..54725ba 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -235,6 +235,11 @@ kernel_do_install() {
>   do_install[prefuncs] += "package_get_auto_pr"
>   
>   addtask shared_workdir after do_compile before do_compile_kernelmodules
> +addtask shared_workdir_setscene
> +
> +do_shared_workdir_setscene () {
> +	exit 1
> +}
>   
>   emit_depmod_pkgdata() {
>   	# Stash data for depmod
> diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
> index e68d02a..5e9efc1 100644
> --- a/meta/classes/rm_work.bbclass
> +++ b/meta/classes/rm_work.bbclass
> @@ -49,7 +49,7 @@ do_rm_work () {
>       cd `dirname ${STAMP}`
>       for i in `basename ${STAMP}`*
>       do
> -        for j in ${SSTATETASKS}
> +        for j in ${SSTATETASKS} do_shared_workdir
>           do
>               case $i in
>               *do_setscene*)
>
>


