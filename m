Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SnJHu-0001co-1N
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jul 2012 02:54:18 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Jul 2012 17:43:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="189425828"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by fmsmga002.fm.intel.com with ESMTP; 06 Jul 2012 17:43:10 -0700
Message-ID: <4FF7861E.6040702@linux.intel.com>
Date: Fri, 06 Jul 2012 17:43:10 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Kang Kai <kai.kang@windriver.com>
References: <cover.1340873279.git.kai.kang@windriver.com>
	<e6f7a20a5b94c037c1f234180751ecceba8d2d41.1340873279.git.kai.kang@windriver.com>
In-Reply-To: <e6f7a20a5b94c037c1f234180751ecceba8d2d41.1340873279.git.kai.kang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] lsbinitscripts: Add a linking for functions.lsbinitscripts
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
X-List-Received-Date: Sat, 07 Jul 2012 00:54:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/28/2012 02:35 AM, Kang Kai wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>
> Increase ALTERNATIVE_PRIORITY of functions to be higher than the
> value of package initscript. When lsbinitscripts installed, file
> functions provided by lsbinitscripts will be used.
>
> [YOCTO #2133]
>
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
>   meta/recipes-extended/lsb/lsbinitscripts_9.03.bb |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
> index dd92a92..f324994 100644
> --- a/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
> +++ b/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "SysV init scripts which only is used in an LSB image"
>   SECTION = "base"
>   LICENSE = "GPLv2"
>   DEPENDS = "popt"
> -PR = "r0"
> +PR = "r1"
>
>   LIC_FILES_CHKSUM = "file://COPYING;md5=ebf4e8b49780ab187d51bd26aaa022c6"
>
> @@ -15,7 +15,7 @@ SRC_URI[md5sum] = "668fa2762b57ef75436303857847bba3"
>   SRC_URI[sha256sum] = "d56547a68ce223a7413b2676650b042125f047c8d6d139c5b970e118b3dc958a"
>   inherit update-alternatives
>
> -ALTERNATIVE_PRIORITY = "10"
> +ALTERNATIVE_PRIORITY = "100"
>   ALTERNATIVE_${PN} = "functions"
>   ALTERNATIVE_LINK_NAME[functions] = "${sysconfdir}/init.d/functions"
>
> @@ -23,5 +23,5 @@ do_configure[noexec] = "1"
>
>   do_install(){
>   	install -d ${D}/etc/init.d/
> -	install -m 0755 ${S}/rc.d/init.d/functions ${D}/etc/init.d/functions
> +	install -m 0755 ${S}/rc.d/init.d/functions ${D}/etc/init.d/functions.${BPN}
>   }
>
As Richard already pointed out, this rename during install is not 
needed, it happens automagically via the update-alternatives bbclass, 
this is true with the initscripts recipe also, please fix these two 
issues and we can move forward with this patch.

Thanks
	Sau!



