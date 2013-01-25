Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TykNm-0007Ud-Nh for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 15:36:40 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0PEOSIw031027; Fri, 25 Jan 2013 14:24:28 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KU5JykXZegI2; Fri, 25 Jan 2013 14:24:28 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0PEOMvi030869
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 25 Jan 2013 14:24:25 GMT
Message-ID: <1359123600.13917.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Jan 2013 14:20:00 +0000
In-Reply-To: <42bd84e2dd6a8f88e8e8433ccf0d0c4d4866cc6e.1359061155.git.raj.khem@gmail.com>
References: <2ba0f6007c1a72e2ee249a47610003031f6c1079.1359061155.git.raj.khem@gmail.com>
	<42bd84e2dd6a8f88e8e8433ccf0d0c4d4866cc6e.1359061155.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/11] rpcbind: Dont use nss with uclibc
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
X-List-Received-Date: Fri, 25 Jan 2013 14:37:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-01-24 at 13:07 -0800, Khem Raj wrote:
> Add defines which otherwise are missing in uclibc nss
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../rpcbind/rpcbind/0001-uclibc-nss.patch          |   30 ++++++++++
>  .../rpcbind/0002-uclibc-rpcsvc-defines.patch       |   60 ++++++++++++++++++++
>  meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb     |    8 +++
>  3 files changed, 98 insertions(+)
>  create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-uclibc-nss.patch
>  create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0002-uclibc-rpcsvc-defines.patch
> 
> diff --git a/meta/recipes-extended/rpcbind/rpcbind/0001-uclibc-nss.patch b/meta/recipes-extended/rpcbind/rpcbind/0001-uclibc-nss.patch
> new file mode 100644
> index 0000000..afa55f3
> --- /dev/null
> +++ b/meta/recipes-extended/rpcbind/rpcbind/0001-uclibc-nss.patch
> @@ -0,0 +1,30 @@
> +Upstream-Status: Pending
> +
> +From b8f0d7b7318ba344c25785d6f5cf3f8de98012d4 Mon Sep 17 00:00:00 2001
> +From: Natanael Copa <ncopa@alpinelinux.org>
> +Date: Tue, 2 Feb 2010 09:36:03 +0000
> +Subject: [PATCH 1/2] uclibc-nss
> +
> +---
> + src/rpcbind.c |    4 ++++
> + 1 files changed, 4 insertions(+), 0 deletions(-)
> +
> +diff --git a/src/rpcbind.c b/src/rpcbind.c
> +index 525ffba..1fe1a60 100644
> +--- a/src/rpcbind.c
> ++++ b/src/rpcbind.c
> +@@ -67,7 +67,11 @@
> + #include <pwd.h>
> + #include <string.h>
> + #include <errno.h>
> ++#if defined(__UCLIBC__)
> ++#define __nss_configure_lookup(x,y)
> ++#else
> + #include <nss.h>
> ++#endif
> + #include "config.h"
> + #include "rpcbind.h"
> + 
> +-- 
> +1.6.6.1
> +
> diff --git a/meta/recipes-extended/rpcbind/rpcbind/0002-uclibc-rpcsvc-defines.patch b/meta/recipes-extended/rpcbind/rpcbind/0002-uclibc-rpcsvc-defines.patch
> new file mode 100644
> index 0000000..c54fc96
> --- /dev/null
> +++ b/meta/recipes-extended/rpcbind/rpcbind/0002-uclibc-rpcsvc-defines.patch
> @@ -0,0 +1,60 @@
> +Upstream-Status: Pending
> +
> +From 077add040c2e30d3ac507362f4afe350f47be027 Mon Sep 17 00:00:00 2001
> +From: Natanael Copa <ncopa@alpinelinux.org>
> +Date: Tue, 2 Feb 2010 09:47:57 +0000
> +Subject: [PATCH 2/2] uclibc-rpcsvc-defines
> +
> +---
> + src/security.c |   28 ++++++++++++++++++++++++++++
> + 1 files changed, 28 insertions(+), 0 deletions(-)
> +
> +diff --git a/src/security.c b/src/security.c
> +index 0edeac6..e9fed55 100644
> +--- a/src/security.c
> ++++ b/src/security.c
> +@@ -20,6 +20,32 @@
> + /*
> +  * XXX for special case checks in check_callit.
> +  */
> ++#if defined(__UCLIBC__)
> ++
> ++#define MOUNTPROC_MNT 1
> ++#define MOUNTPROC_UMNT 3
> ++
> ++#define NFS_PROGRAM	100003
> ++#define YPPROG		100004
> ++#define MOUNTPROG	100005
> ++#define YPBINDPROG	100007
> ++#define YPPASSWDPROG	100009
> ++#define RQUOTAPROG	100011
> ++
> ++#define YPPROC_NULL	0
> ++#define YPPROC_DOMAIN 	1
> ++#define YPPROC_DOMAIN_NONACK 2
> ++#define YPPROC_MATCH	3
> ++#define YPPROC_FIRST	4
> ++#define YPPROC_NEXT	5
> ++#define YPPROC_XFR	6
> ++#define YPPROC_CLEAR	7
> ++#define YPPROC_ALL	8
> ++
> ++#define YPBINDPROC_SETDOM	2
> ++
> ++#else
> ++
> + #include <rpcsvc/mount.h>
> + #include <rpcsvc/rquota.h>
> + #include <rpcsvc/nfs_prot.h>
> +@@ -27,6 +53,8 @@
> + #include <rpcsvc/ypclnt.h>
> + #include <rpcsvc/yppasswd.h>
> + 
> ++#endif
> ++
> + #include "rpcbind.h"
> + 
> + #ifdef LIBWRAP
> +-- 
> +1.6.6.1
> +
> diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
> index 9fb4f51..7b723df 100644
> --- a/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
> +++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
> @@ -13,8 +13,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b46486e4c4a416602693a711bb5bfa39 \
>  SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
>             file://init.d \
>             file://fix_host_path.patch \
> +           ${UCLIBCPATCHES} \
>            "
>  
> +UCLIBCPATCHES_libc-uclibc = "file://0001-uclibc-nss.patch \
> +                             file://0002-uclibc-rpcsvc-defines.patch \
> +                            "
> +UCLIBCPATCHES ?= ""
> +
> +LDFLAGS += "-lssl"

The LDFLAGS change should really be marked as ublibc too...

Cheers,

Richard




