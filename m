Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SIp3A-0007iy-40
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Apr 2012 00:33:04 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 13 Apr 2012 15:23:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="130741515"
Received: from unknown (HELO [10.255.12.25]) ([10.255.12.25])
	by azsmga001.ch.intel.com with ESMTP; 13 Apr 2012 15:23:40 -0700
Message-ID: <4F88A76C.2000308@linux.intel.com>
Date: Fri, 13 Apr 2012 15:23:40 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <36ED13F3654AE54CA763E6821D93A5711043A0E3@szxeml534-mbs.china.huawei.com>
In-Reply-To: <36ED13F3654AE54CA763E6821D93A5711043A0E3@szxeml534-mbs.china.huawei.com>
Cc: Sanil kumar <sanil.kumar@huawei.com>
Subject: Re: [PATCH] boost: fix re-execution of task
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
X-List-Received-Date: Fri, 13 Apr 2012 22:33:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/13/2012 04:42 AM, Venkata ramana gollamudi wrote:
> After building boost package, re-execution of boostconfig task followed by
> re-execution of compile task is giving following error
> "error: duplicate initialization of gcc with the following parameters" during compilation
> It is because multiple entries of gcc are being added during boostconfig re-execution
> there by failing the compilation.
>
> The patch fixes adding multiple "Using gcc" entries into /tools/build/v2/user-config.jam
>
> [Yocto #2194]
>
> Signed-off-by: Venkata Ramana Gollamudi<ramana.gollamudi@huawei.com>
> ---
>   meta/recipes-support/boost/boost.inc |    6 +++++-
>   1 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
> index d70a7e2..c9306df 100644
> --- a/meta/recipes-support/boost/boost.inc
> +++ b/meta/recipes-support/boost/boost.inc
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

Merged into OE-Core

Thanks
	Sau!


