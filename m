Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8E4AD608A6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 14:48:19 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Aug 2013 07:48:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,934,1367996400"; d="scan'208";a="391622491"
Received: from dvhart-mobl4.jf.intel.com (HELO [10.7.201.147]) ([10.7.201.147])
	by orsmga002.jf.intel.com with ESMTP; 22 Aug 2013 07:48:20 -0700
Message-ID: <1377182898.5259.1.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Thu, 22 Aug 2013 07:48:18 -0700
In-Reply-To: <2ee8dfb739c6ce3e08bdeb87875b6f054f23c005.1377175027.git.liezhi.yang@windriver.com>
References: <cover.1377175027.git.liezhi.yang@windriver.com>
	<2ee8dfb739c6ce3e08bdeb87875b6f054f23c005.1377175027.git.liezhi.yang@windriver.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/6] e2fsprogs: the max length of debugfs argument is too short
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
X-List-Received-Date: Thu, 22 Aug 2013 14:48:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-08-22 at 09:13 -0400, Robert Yang wrote:
> The max length of debugfs argument is 256 which is too short, the
> arguments are two paths, the PATH_MAX is 4096 according to
> /usr/include/linux/limits.h, so use BUFSIZ (which is 8192 on Linux
> systems), that's also what the ss library uses.
> 
> This patch has been reviewed by the linux-ext4 mailing list, but isn't
> merged atm.
> 
> [YOCTO #3848]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

Acked-by: Darren Hart <dvhart@linux.intel.com>

> ---
>  .../e2fsprogs-1.42.8/debugfs-too-short.patch       |   41 ++++++++++++++++++++
>  .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb |    1 +
>  2 files changed, 42 insertions(+)
>  create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-too-short.patch
> 
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-too-short.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-too-short.patch
> new file mode 100644
> index 0000000..607305b
> --- /dev/null
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-too-short.patch
> @@ -0,0 +1,41 @@
> +debugfs.c: the max length of debugfs argument is too short
> +
> +The max length of debugfs argument is 256 which is too short, the
> +arguments are two paths, the PATH_MAX is 4096 according to
> +/usr/include/linux/limits.h, so use BUFSIZ (which is 8192 on Linux
> +systems), that's also what the ss library uses.
> +
> +Upstream-Status: Submitted
> +
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +Acked-by: Darren Hart <dvhart@linux.intel.com>
> +---
> + debugfs/debugfs.c | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/debugfs/debugfs.c b/debugfs/debugfs.c
> +--- a/debugfs/debugfs.c
> ++++ b/debugfs/debugfs.c
> +@@ -37,6 +37,10 @@ extern char *optarg;
> + #include "../version.h"
> + #include "jfs_user.h"
> + 
> ++#ifndef BUFSIZ
> ++#define BUFSIZ 8192
> ++#endif
> ++
> + ss_request_table *extra_cmds;
> + const char *debug_prog_name;
> + int sci_idx;
> +@@ -2311,7 +2315,7 @@ void do_dump_mmp(int argc EXT2FS_ATTR((unused)), char *argv[])
> + static int source_file(const char *cmd_file, int ss_idx)
> + {
> + 	FILE		*f;
> +-	char		buf[256];
> ++	char		buf[BUFSIZ];
> + 	char		*cp;
> + 	int		exit_status = 0;
> + 	int		retval;
> +-- 
> +1.8.1.2
> +
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
> index d231268..f97de7f 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
> @@ -3,6 +3,7 @@ require e2fsprogs.inc
>  
>  SRC_URI += "file://acinclude.m4 \
>              file://remove.ldconfig.call.patch \
> +            file://debugfs-too-short.patch \
>  "
>  
>  SRC_URI[md5sum] = "8ef664b6eb698aa6b733df59b17b9ed4"

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



