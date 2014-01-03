Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id ECCC36BCEF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 21:23:43 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Jan 2014 13:23:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,599,1384329600"; d="scan'208";a="461382339"
Received: from unknown (HELO [10.255.12.77]) ([10.255.12.77])
	by orsmga002.jf.intel.com with ESMTP; 03 Jan 2014 13:23:44 -0800
Message-ID: <52C72A60.9010702@linux.intel.com>
Date: Fri, 03 Jan 2014 13:23:44 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
References: <cover.1388629298.git.Qi.Chen@windriver.com>
	<7ddc616565a80346dd323664d0c36490a698fb89.1388629298.git.Qi.Chen@windriver.com>
In-Reply-To: <7ddc616565a80346dd323664d0c36490a698fb89.1388629298.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH V2 1/2] initscripts: split the functions script into a separate package
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
X-List-Received-Date: Fri, 03 Jan 2014 21:23:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/01/2014 06:25 PM, Chen Qi wrote:
> Many SysV init scripts need the /etc/init.d/functions script. But
> this script is part of the initscripts package. As a result, the
> initscripts package should always be installed into the system to
> avoid errors when starting daemons. However, it makes no sense to
> install the initscripts package into a systemd based image, because
> what the init scripts provide has already been provided by the systemd.
> On the other hand, the functions script might be still needed in a
> systemd based image because other init scripts such as distcc might need
> it.
>
> The above situation leads to a natural separation of the functions script
> from the initscripts package. And this patch does so. It separates the
> functions script into initscripts-functions packages.
>

There seems to be a problem with the multi-lib build, please check this 
logfile for errors.

http://autobuilder.yoctoproject.org/main/builders/nightly-multilib/builds/71/steps/Building%20Images/logs/stdio

Thanks	
	Sau!


> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-core/initscripts/initscripts_1.0.bb |    8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
> index 5951e0c..ea28672 100644
> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
> @@ -42,8 +42,12 @@ KERNEL_VERSION = ""
>   inherit update-alternatives
>   DEPENDS_append = " update-rc.d-native"
>
> -ALTERNATIVE_PRIORITY = "90"
> -ALTERNATIVE_${PN} = "functions"
> +PACKAGES =+ "${PN}-functions"
> +RDEPENDS_${PN} = "${PN}-functions"
> +FILES_${PN}-functions = "${sysconfdir}/init.d/functions.${PN}"
> +
> +ALTERNATIVE_PRIORITY_${PN}-functions = "90"
> +ALTERNATIVE_${PN}-functions = "functions"
>   ALTERNATIVE_LINK_NAME[functions] = "${sysconfdir}/init.d/functions"
>
>   HALTARGS ?= "-d -f"
>

