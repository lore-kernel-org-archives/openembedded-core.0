Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9F5626ACED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 17:49:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Jul 2014 10:49:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,659,1400050800"; d="scan'208";a="572966348"
Received: from unknown (HELO [10.255.13.46]) ([10.255.13.46])
	by orsmga002.jf.intel.com with ESMTP; 14 Jul 2014 10:49:27 -0700
Message-ID: <53C41827.7060002@linux.intel.com>
Date: Mon, 14 Jul 2014 10:49:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Roxana Ciobanu <roxana.ciobanu@intel.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1405335436.git.roxana.ciobanu@intel.com>
	<bdbcbfeed06623ac20632e04036ff5eb15e53258.1405335436.git.roxana.ciobanu@intel.com>
In-Reply-To: <bdbcbfeed06623ac20632e04036ff5eb15e53258.1405335436.git.roxana.ciobanu@intel.com>
Subject: Re: [PATCH v3 1/1] latencytop: fix mount error
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
X-List-Received-Date: Mon, 14 Jul 2014 17:49:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/14/2014 03:58 AM, Roxana Ciobanu wrote:
> Added a check to ensure debugfs is not mounted before trying
> to mount it, because sysfs.sh already mounts it.
>
> [ YOCTO #6498 ]
>
> Signed-off-by: Roxana Ciobanu <roxana.ciobanu@intel.com>
> ---
>   .../latencytop-0.5/latencytop-fsync-mount.patch    | 37 ++++++++++++++++++++++
>   meta/recipes-kernel/latencytop/latencytop_0.5.bb   |  3 +-
>   2 files changed, 39 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-fsync-mount.patch
>
> diff --git a/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-fsync-mount.patch b/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-fsync-mount.patch
> new file mode 100644
> index 0000000..9f2e120
> --- /dev/null
> +++ b/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-fsync-mount.patch

This patch file needs Signed-off-by and Upstream-Status tags.  Also have 
you submitted this change to the upstream community?

Sau!

> @@ -0,0 +1,37 @@
> +Index: latencytop-0.5/fsync.c
> +===================================================================
> +--- latencytop-0.5.orig/fsync.c	2014-07-14 13:25:27.657187985 +0300
> ++++ latencytop-0.5/fsync.c	2014-07-14 13:26:12.033187979 +0300
> +@@ -32,6 +32,7 @@
> + #include <time.h>
> + #include <wchar.h>
> + #include <ctype.h>
> ++#include <sys/stat.h>
> +
> + #include <glib.h>
> +
> +@@ -142,16 +143,23 @@
> + int enable_fsync_tracer(void)
> + {
> + 	int ret;
> ++    struct stat s_debug, s_mount_point;
> ++
> + /*
> +  * Steps to do:
> +  *
> ++ * check if /sys/kernel/debug is mounted
> +  * mount -t debugfs none /sys/kernel/debug/
> +  * cd /sys/kernel/debug/tracing
> +  * echo fsync > current_tracer
> +  * echo ftrace_printk > iter_ctrl
> +  * echo 1 > tracing_on
> +  */
> +-	ret = system("/bin/mount -t debugfs none /sys/kernel/debug/");
> ++
> ++    stat("/sys/kernel/debug/..", &s_debug);
> ++    if (stat("/sys/kernel/debug", &s_mount_point) != 0 ||
Why do two stats here?  Can't you stat an entry inside of the 
/sys/kernel/debug directory?

Sau!
> ++        (s_debug.st_dev == s_mount_point.st_dev))
> ++        ret = system("/bin/mount -t debugfs none /sys/kernel/debug/");
> + 	if (!ret)
> + 		return -1;
> + 	write_to_file("/sys/kernel/debug/tracing/current_tracer", "fsync");	
> diff --git a/meta/recipes-kernel/latencytop/latencytop_0.5.bb b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
> index 516e2c5..243f3d9 100644
> --- a/meta/recipes-kernel/latencytop/latencytop_0.5.bb
> +++ b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
> @@ -10,7 +10,8 @@ PR = "r3"
>
>   SRC_URI = "http://www.latencytop.org/download/latencytop-${PV}.tar.gz \
>               file://latencytop-makefile.patch \
> -            file://latencytop-fsync.patch"
> +            file://latencytop-fsync.patch \
> +            file://latencytop-fsync-mount.patch"
>
>   SRC_URI[md5sum] = "73bb3371c6ee0b0e68e25289027e865c"
>   SRC_URI[sha256sum] = "9e7f72fbea7bd918e71212a1eabaad8488d2c602205d2e3c95d62cd57e9203ef"
>

