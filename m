Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UavOt-0007at-GA
	for openembedded-core@lists.openembedded.org;
	Sat, 11 May 2013 00:02:51 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 10 May 2013 14:42:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,651,1363158000"; d="scan'208";a="332195585"
Received: from unknown (HELO envy2.home) ([10.255.12.170])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2013 14:44:44 -0700
Message-ID: <518D6A4B.40409@linux.intel.com>
Date: Fri, 10 May 2013 14:44:43 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <cover.1367919920.git.liezhi.yang@windriver.com>
	<19419be97c26c48879d4b148e01922e39088327d.1367919920.git.liezhi.yang@windriver.com>
In-Reply-To: <19419be97c26c48879d4b148e01922e39088327d.1367919920.git.liezhi.yang@windriver.com>
X-Enigmail-Version: 1.5.1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] e2fsprogs: the max length of debugfs argument is too short
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
X-List-Received-Date: Fri, 10 May 2013 22:02:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

This one looks reasonable to me. Be sure to add your patch header to the
patch itself, add your Signed-off-by, and submit upstream for feedback
before merging with oe-core.

--
Darren

On 05/07/2013 02:48 AM, Robert Yang wrote:
> The max length of debugfs argument is 256 which is too short, the
> arguments are two paths, the PATH_MAX is 4096 according to
> /usr/include/linux/limits.h, use 2048 (4096 / 2) is a reasonable value.
> 
> [YOCTO #3848]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../e2fsprogs-1.42.7/debugfs-too-short.patch       |   28 ++++++++++++++++++++
>  .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb |    1 +
>  2 files changed, 29 insertions(+)
>  create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/debugfs-too-short.patch
> 
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/debugfs-too-short.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/debugfs-too-short.patch
> new file mode 100644
> index 0000000..db6814d
> --- /dev/null
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/debugfs-too-short.patch
> @@ -0,0 +1,28 @@
> +debugfs.c: the max length of debugfs argument is too short
> +
> +The max length of debugfs argument is 256 which is too short, the
> +arguments are two paths, the PATH_MAX is 4096 according to
> +/usr/include/linux/limits.h, use 2048 (4096 / 2) is a reasonable value.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +---
> + debugfs/debugfs.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/debugfs/debugfs.c b/debugfs/debugfs.c
> +--- a/debugfs/debugfs.c
> ++++ b/debugfs/debugfs.c
> +@@ -2282,7 +2282,7 @@ void do_dump_mmp(int argc EXT2FS_ATTR((unused)), char *argv[])
> + static int source_file(const char *cmd_file, int ss_idx)
> + {
> + 	FILE		*f;
> +-	char		buf[256];
> ++	char		buf[2048];
> + 	char		*cp;
> + 	int		exit_status = 0;
> + 	int		retval;
> +-- 
> +1.7.11.2
> +
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb
> index 3a4f5a8..898ee88 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb
> @@ -4,6 +4,7 @@ PR = "r0"
>  
>  SRC_URI += "file://acinclude.m4 \
>              file://remove.ldconfig.call.patch \
> +            file://debugfs-too-short.patch \
>  "
>  
>  SRC_URI[md5sum] = "a1ec22ef003688dae9f76c74881b22b9"
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


