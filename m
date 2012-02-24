Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0mgs-0003nn-Kw
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 05:23:30 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Feb 2012 20:15:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128886213"
Received: from unknown (HELO [10.255.15.58]) ([10.255.15.58])
	by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2012 20:15:07 -0800
Message-ID: <4F470ECB.3020104@linux.intel.com>
Date: Thu, 23 Feb 2012 20:15:07 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1329833078-4502-1-git-send-email-yauhen.kharuzhy@promwad.com>
In-Reply-To: <1329833078-4502-1-git-send-email-yauhen.kharuzhy@promwad.com>
Cc: denx@promwad.com
Subject: Re: [PATCH] ppp: Fix rp-pppoe plugin compilation
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
X-List-Received-Date: Fri, 24 Feb 2012 04:23:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/21/2012 06:04 AM, Yauhen Kharuzhy wrote:
> rp-pppoe plugin was broken due linux headers changes: pppd has own copy of
> if_pppol2tp.h file which is included from<linux/if_pppox.h>.
>
> Add patch from Debian for struct pppol2tpv3_addr definition.
>
> Signed-off-by: Yauhen Kharuzhy<yauhen.kharuzhy@promwad.com>
> ---
>   .../ppp/ppp-2.4.5/update_if_pppol2tp.patch         |   54 ++++++++++++++++++++
>   meta/recipes-connectivity/ppp/ppp_2.4.5.bb         |    3 +-
>   2 files changed, 56 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-connectivity/ppp/ppp-2.4.5/update_if_pppol2tp.patch
>
> diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/update_if_pppol2tp.patch b/meta/recipes-connectivity/ppp/ppp-2.4.5/update_if_pppol2tp.patch
> new file mode 100644
> index 0000000..e034f19
> --- /dev/null
> +++ b/meta/recipes-connectivity/ppp/ppp-2.4.5/update_if_pppol2tp.patch
> @@ -0,0 +1,54 @@
> +Upstream-Status: Pending
> +diff --git a/include/linux/if_pppol2tp.h b/include/linux/if_pppol2tp.h
> +index 4113d6a..7ee86b2 100644
> +--- a/include/linux/if_pppol2tp.h
> ++++ b/include/linux/if_pppol2tp.h
> +@@ -2,7 +2,7 @@
> +  * Linux PPP over L2TP (PPPoL2TP) Socket Implementation (RFC 2661)
> +  *
> +  * This file supplies definitions required by the PPP over L2TP driver
> +- * (pppol2tp.c).  All version information wrt this file is located in pppol2tp.c
> ++ * (l2tp_ppp.c).  All version information wrt this file is located in l2tp_ppp.c
> +  *
> +  * License:
> +  *		This program is free software; you can redistribute it and/or
> +@@ -15,14 +15,14 @@
> + #ifndef __LINUX_IF_PPPOL2TP_H
> + #define __LINUX_IF_PPPOL2TP_H
> +
> +-#include<asm/types.h>
> ++#include<linux/types.h>
> ++
> +
> + /* Structure used to connect() the socket to a particular tunnel UDP
> +  * socket.
> +  */
> +-struct pppol2tp_addr
> +-{
> +-	pid_t	pid;			/* pid that owns the fd.
> ++struct pppol2tp_addr {
> ++	__kernel_pid_t	pid;		/* pid that owns the fd.
> + 					 * 0 =>  current */
> + 	int	fd;			/* FD of UDP socket to use */
> +
> +@@ -32,6 +32,20 @@ struct pppol2tp_addr
> + 	__u16 d_tunnel, d_session;	/* For sending outgoing packets */
> + };
> +
> ++/* The L2TPv3 protocol changes tunnel and session ids from 16 to 32
> ++ * bits. So we need a different sockaddr structure.
> ++ */
> ++struct pppol2tpv3_addr {
> ++	pid_t	pid;			/* pid that owns the fd.
> ++					 * 0 =>  current */
> ++	int	fd;			/* FD of UDP or IP socket to use */
> ++
> ++	struct sockaddr_in addr;	/* IP address and port to send to */
> ++
> ++	__u32 s_tunnel, s_session;	/* For matching incoming packets */
> ++	__u32 d_tunnel, d_session;	/* For sending outgoing packets */
> ++};
> ++
> + /* Socket options:
> +  * DEBUG	- bitmask of debug message categories
> +  * SENDSEQ	- 0 =>  don't send packets with sequence numbers
> diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
> index 72464bf..80f91e6 100644
> --- a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
> +++ b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=e2c43fe6e81ff77
>                       file://pppd/plugins/passprompt.c;beginline=1;endline=10;md5=3bcbcdbf0e369c9a3e0b8c8275b065d8 \
>                       file://pppd/tdb.c;beginline=1;endline=27;md5=4ca3a9991b011038d085d6675ae7c4e6 \
>                       file://chat/chat.c;beginline=1;endline=15;md5=0d374b8545ee5c62d7aff1acbd38add2"
> -PR = "r2"
> +PR = "r3"
>
>   SRC_URI = "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar.gz \
>              file://makefile.patch \
> @@ -18,6 +18,7 @@ SRC_URI = "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar.gz \
>              file://pppd-resolv-varrun.patch \
>              file://enable-ipv6.patch \
>              file://makefile-remove-hard-usr-reference.patch \
> +           file://update_if_pppol2tp.patch \
>              file://pon \
>              file://poff \
>              file://init \

Merged into OE-core

Thanks
	Sau!


