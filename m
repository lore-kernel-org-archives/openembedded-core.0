Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UBRVO-0006Jc-3y for Openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 16:04:14 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r21EtJRJ021875; Fri, 1 Mar 2013 14:55:19 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id isBhvVnY3mi6; Fri,  1 Mar 2013 14:55:18 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r21EtEqj021871
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 1 Mar 2013 14:55:17 GMT
Message-ID: <1362149257.1055.58.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rich Dubielzig <rich.dubielzig@windriver.com>
Date: Fri, 01 Mar 2013 14:47:37 +0000
In-Reply-To: <1362077027-25696-1-git-send-email-rich.dubielzig@windriver.com>
References: <1362077027-25696-1-git-send-email-rich.dubielzig@windriver.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] Add scratch directory for NFS upcall state storage
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
X-List-Received-Date: Fri, 01 Mar 2013 15:04:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-02-28 at 10:43 -0800, Rich Dubielzig wrote:
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
>  .../nfs-utils/nfs-utils_1.2.3.bb                   |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)

The subject line is missing the prefix ("nfs-utils: ") and this patch
doesn't apply against master which has nfs-utils 1.2.7?

Cheers,

Richard

> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
> index 84c4464..138791b 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
> @@ -12,7 +12,7 @@ DEPENDS = "libcap libnfsidmap libevent util-linux tcp-wrappers"
>  RDEPENDS_${PN} = "rpcbind"
>  RRECOMMENDS_${PN} = "kernel-module-nfsd"
>  
> -PR = "r4"
> +PR = "r5"
>  
>  SRC_URI = "${SOURCEFORGE_MIRROR}/nfs/nfs-utils-${PV}.tar.bz2 \
>             file://nfs-utils-1.0.6-uclibc.patch \
> @@ -53,6 +53,8 @@ RDEPENDS_${PN}-stats = "python"
>  do_install_append () {
>  	install -d ${D}${sysconfdir}/init.d
>  	install -m 0755 ${WORKDIR}/nfsserver ${D}${sysconfdir}/init.d/nfsserver
> +	# kernel code as of 3.8 hard-codes this path as a default
> +	install -d ${D}/var/lib/nfs/v4recovery
>  
>  	# the following are built by CC_FOR_BUILD
>  	rm -f ${D}${sbindir}/rpcdebug




