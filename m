Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sjvf0-0001MO-LN
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 19:04:10 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Jun 2012 09:53:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="163520252"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by orsmga002.jf.intel.com with ESMTP; 27 Jun 2012 09:53:15 -0700
Message-ID: <4FEB3A7B.2030605@linux.intel.com>
Date: Wed, 27 Jun 2012 09:53:15 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1340776826.git.kai.kang@windriver.com>
	<70f42c05e9e15f403cccc16c92fb14d0675c0c7d.1340776826.git.kai.kang@windriver.com>
In-Reply-To: <70f42c05e9e15f403cccc16c92fb14d0675c0c7d.1340776826.git.kai.kang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] lsbinitscripts: Add a linking for functions.lsbinitscripts
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
X-List-Received-Date: Wed, 27 Jun 2012 17:04:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/26/2012 11:04 PM, Kang Kai wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> The linking will fail when an original file "functions" exists.
> So using the new linking replace the previous "functions".
>
> [YOCTO #2133]
>
> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>   meta/recipes-extended/lsb/lsbinitscripts_9.03.bb |   11 ++++-------
>   1 files changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
> index dd92a92..990da2e 100644
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
> @@ -13,15 +13,12 @@ SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-${PV}
>
>   SRC_URI[md5sum] = "668fa2762b57ef75436303857847bba3"
>   SRC_URI[sha256sum] = "d56547a68ce223a7413b2676650b042125f047c8d6d139c5b970e118b3dc958a"
> -inherit update-alternatives
> -
> -ALTERNATIVE_PRIORITY = "10"
> -ALTERNATIVE_${PN} = "functions"
> -ALTERNATIVE_LINK_NAME[functions] = "${sysconfdir}/init.d/functions"
>
>   do_configure[noexec] = "1"
>
>   do_install(){
>   	install -d ${D}/etc/init.d/
> -	install -m 0755 ${S}/rc.d/init.d/functions ${D}/etc/init.d/functions
> +	install -m 0755 ${S}/rc.d/init.d/functions ${D}/etc/init.d/functions.lsbinitscripts
> +        cd ${D}/etc/init.d/
> +        ln -sf functions.lsbinitscripts functions
>   }

This is still not correct, you are disabling the usage update 
ALTERNATIVE here.  What you should really be doing is adding that 
support to the original initscripts_1.0.bb recipes for the function file 
and give this a higher ALTERNATIVE_PRIORITY, so that when it is 
installed it will do the right thing (tm) via the update alternative 
functionality.

Sau!


