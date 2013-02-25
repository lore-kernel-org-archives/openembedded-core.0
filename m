Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UA7zn-00056y-Cj
	for Openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 01:02:13 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 25 Feb 2013 15:45:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,736,1355126400"; d="scan'208";a="267504239"
Received: from unknown (HELO [10.255.12.143]) ([10.255.12.143])
	by orsmga001.jf.intel.com with ESMTP; 25 Feb 2013 15:45:47 -0800
Message-ID: <512BF7AB.70302@linux.intel.com>
Date: Mon, 25 Feb 2013 15:45:47 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Rich Dubielzig <rich.dubielzig@windriver.com>
References: <1361817899-22185-1-git-send-email-rich.dubielzig@windriver.com>
In-Reply-To: <1361817899-22185-1-git-send-email-rich.dubielzig@windriver.com>
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] nfs-utils: Add scratch directory for NFS upcall state storage
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2013 00:02:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/25/2013 10:44 AM, Rich Dubielzig wrote:
> When the /var/lib/nfs/v4recovery directory is not present, NFSD cannot
> record the upcall state and cannot end the 90-second grace period on
> startup.  This is true even when NFS4 is not being served according to
> nfsstat.
>
> More details and discussion here:
> https://lkml.org/lkml/2012/6/11/206
>
> Signed-off-by: Rich Dubielzig <rich.dubielzig@windriver.com>
> ---
>   .../nfs-utils/nfs-utils_1.2.3.bb                   |    5 ++++-
>   1 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
> index 84c4464..a0b2399 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
> @@ -12,7 +12,7 @@ DEPENDS = "libcap libnfsidmap libevent util-linux tcp-wrappers"
>   RDEPENDS_${PN} = "rpcbind"
>   RRECOMMENDS_${PN} = "kernel-module-nfsd"
>
> -PR = "r4"
> +PR = "r5"
>
>   SRC_URI = "${SOURCEFORGE_MIRROR}/nfs/nfs-utils-${PV}.tar.bz2 \
>              file://nfs-utils-1.0.6-uclibc.patch \
> @@ -58,4 +58,7 @@ do_install_append () {
>   	rm -f ${D}${sbindir}/rpcdebug
>   	rm -f ${D}${sbindir}/rpcgen
>   	rm -f ${D}${sbindir}/locktest
> +
> +	# needed to allow NFSD to end its grace period
> +	install -d ${D}/var/lib/nfs/v4recovery

This should really use ${localstatedir} instead of var, it would also be 
better to co-locate this with the other directory creations earlier in 
the do_install_append().

Sau!

>   }
>


