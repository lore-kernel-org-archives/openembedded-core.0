Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SIN3h-0001ml-Sh
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 18:39:46 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Apr 2012 09:30:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="128468003"
Received: from unknown (HELO [10.255.12.89]) ([10.255.12.89])
	by orsmga001.jf.intel.com with ESMTP; 12 Apr 2012 09:30:24 -0700
Message-ID: <4F870320.4020308@linux.intel.com>
Date: Thu, 12 Apr 2012 09:30:24 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <36ED13F3654AE54CA763E6821D93A57110438EED@szxeml534-mbs.china.huawei.com>
	<36ED13F3654AE54CA763E6821D93A57110438F4B@szxeml534-mbs.china.huawei.com>
In-Reply-To: <36ED13F3654AE54CA763E6821D93A57110438F4B@szxeml534-mbs.china.huawei.com>
Cc: Sanil kumar <sanil.kumar@huawei.com>,
	"'openembedded-core@lists.openembedded.org'"
	<'openembedded-core@lists.openembedded.org'>
Subject: Re: [Patch 1/1]:Package Boost: Reexecution of task is giving error.
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
X-List-Received-Date: Thu, 12 Apr 2012 16:39:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/12/2012 06:06 AM, Venkata ramana gollamudi wrote:
> Failure:
> "error: duplicate initialization of gcc with the following parameters" during compilation.
>
> Steps to reproduce:
> 1>  bitbake -c cleansstate boost
> 2>  bitbake boost
> 3>  bitbake -c boostconfig boost -f
> 4>  bitbake -c compile boost -f
>
> Defect:
> 	https://bugzilla.yoctoproject.org/show_bug.cgi?id=2194
>
Venkata,

This set of patches that you sent do not follow the conventions for 
patch submissions.  There are a couple of items missing here.

1) Subject should be more like
boost: fix re-execution of task

2) No Signed-off-by: Read Name <username@example.com>

3) When fixing bugs, please include the following formatted info:
[YOCTO #2194]

More details about the commit messages and patches are available at:

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Also, for sending multiple patches, please look at the 
create-pull-request and send-pull-request scripts that are part of the 
Yocto Project in scripts, they can help.

Sau!


> Fix details:
> Boost package task do_boostconfigure is appending content to
> build/tmp/work/i586-poky-linux/boost-1.49.0-r2.0/boost_1_49_0/tools/build/v2/user-config.jam file
> without checking if the content is already present in that file.
> So check is added for the same.
>
> Please find the below patch :
> --------------------------------------------------------------
>
> diff -Nupr prev/meta/recipes-support/boost/boost.inc new/meta/recipes-support/boost/boost.inc
> --- prev/meta/recipes-support/boost/boost.inc	2012-04-12 11:12:49.916786261 +0530
> +++ new/meta/recipes-support/boost/boost.inc	2012-04-12 11:30:32.535786134 +0530
> @@ -135,7 +135,11 @@ BJAM_OPTS    = '${BJAM_TOOLS} \
>   do_boostconfig() {
>   	cp -f boost/config/platform/linux.hpp boost/config/platform/linux-gnueabi.hpp
>
> -	echo 'using gcc : 4.3.1 : ${CXX} : compileflags -DBOOST_SP_USE_PTHREADS -I${includedir} linkflags -L${libdir} ;'>>  ${S}/tools/build/v2/user-config.jam
> +	# D2194:Fixing the failure of "error: duplicate initialization of gcc with the following parameters" during compilation.
> +	if ! grep -qe "^using gcc : 4.3.1" ${S}/tools/build/v2/user-config.jam
> +	then
> +		echo 'using gcc : 4.3.1 : ${CXX} : compileflags -DBOOST_SP_USE_PTHREADS -I${includedir} linkflags -L${libdir} ;'>>  ${S}/tools/build/v2/user-config.jam
> +	fi	
>   }
>
>   addtask do_boostconfig after do_patch before do_configure
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


