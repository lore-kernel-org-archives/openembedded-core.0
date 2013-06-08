Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 778536A936
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jun 2013 07:31:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r587VtME026002
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 8 Jun 2013 00:31:55 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Sat, 8 Jun 2013 00:31:53 -0700
Message-ID: <51B2DDE9.20504@windriver.com>
Date: Sat, 8 Jun 2013 15:31:53 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1370676050.git.rongqing.li@windriver.com>
	<56f17a5de4a429a9b038ffc7f6ece798a6803cd3.1370676050.git.rongqing.li@windriver.com>
In-Reply-To: <56f17a5de4a429a9b038ffc7f6ece798a6803cd3.1370676050.git.rongqing.li@windriver.com>
Subject: Re: [PATCH 1/1] latencytop: Deprecate tracing_enabled for tracing_on
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
X-List-Received-Date: Sat, 08 Jun 2013 07:31:53 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

I would like to send this patch to upstream, but the homelink of
latencytop seems deprecated, and I can not access.

These kernel commits can prove this patch is valid.

     Commit 6752ab4a9c30 "tracing: Deprecate tracing_enabled for tracing_on"
     Commit 0fb9656d "tracing: Make tracing_enabled be equal to tracing_on"
     Commit 02404baf1b47 "tracing: Remove deprecated tracing_enabled file"

Thanks.

-Roy


On 06/08/2013 03:22 PM, rongqing.li@windriver.com wrote:
> From: "Roy.Li" <rongqing.li@windriver.com>
>
> tracing_enabled should not be used, it is heavy weight and does not
> do much in helping lower the overhead. see commmit (Deprecate
> tracing_enabled for tracing_on 6752ab4a9c30d5411b2dfdb251a3f1cb18aae48)
> in kernel
>
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>   .../latencytop-0.5/latencytop-fsync.patch          |   49 ++++++++++++++++++++
>   meta/recipes-kernel/latencytop/latencytop_0.5.bb   |    3 +-
>   2 files changed, 51 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-fsync.patch
>
> diff --git a/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-fsync.patch b/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-fsync.patch
> new file mode 100644
> index 0000000..9720cdb
> --- /dev/null
> +++ b/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-fsync.patch
> @@ -0,0 +1,49 @@
> +linux: sysfs: use tracing_on as tracing_enabled is deprecated
> +
> +tracing_enabled use in the kernel is being deprecated as per commit
> +6752ab4a9c30 [tracing: Deprecate tracing_enabled for tracing_on] in
> +the linux mainline kernel. tracing_enabled use will generate a warning
> +and may no longer function as expected, therefore move to use tracing_on.
> +
> +Upstream-status: Pending
> +
> +Signed-off-by: Dennis Hall <dennis.hall@windriver.com>
> +
> +Index: latencytop-0.5/fsync.c
> +===================================================================
> +--- latencytop-0.5.orig/fsync.c	2012-08-03 10:45:49.000000000 -0400
> ++++ latencytop-0.5/fsync.c	2012-08-03 10:48:39.000000000 -0400
> +@@ -149,19 +149,19 @@
> +  * cd /sys/kernel/debug/tracing
> +  * echo fsync > current_tracer
> +  * echo ftrace_printk > iter_ctrl
> +- * echo 1 > tracing_enabled
> ++ * echo 1 > tracing_on
> +  */
> + 	ret = system("/bin/mount -t debugfs none /sys/kernel/debug/");
> + 	if (!ret)
> + 		return -1;
> + 	write_to_file("/sys/kernel/debug/tracing/current_tracer", "fsync");	
> + 	write_to_file("/sys/kernel/debug/tracing/iter_ctrl", "ftrace_printk");	
> +-	write_to_file("/sys/kernel/debug/tracing/tracing_enabled", "1");
> ++	write_to_file("/sys/kernel/debug/tracing/tracing_on", "1");
> + }
> +
> + int disable_fsync_tracer(void)
> + {
> +-	write_to_file("/sys/kernel/debug/tracing/tracing_enabled", "0");
> ++	write_to_file("/sys/kernel/debug/tracing/tracing_on", "0");
> + }
> +
> +
> +@@ -339,8 +339,8 @@
> + 		if (curduration > 5)
> + 			curduration = 5;
> + 		/* clear the ftrace buffer */
> +-		write_to_file("/sys/kernel/debug/tracing/tracing_enabled", "0");
> +-		write_to_file("/sys/kernel/debug/tracing/tracing_enabled", "1");
> ++		write_to_file("/sys/kernel/debug/tracing/tracing_on", "0");
> ++		write_to_file("/sys/kernel/debug/tracing/tracing_on", "1");
> + 		key = select(1, &rfds, NULL, NULL, &end);
> + 		parse_ftrace();
> + 		print_global_list();
> diff --git a/meta/recipes-kernel/latencytop/latencytop_0.5.bb b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
> index 3e35bf9..dad0588 100644
> --- a/meta/recipes-kernel/latencytop/latencytop_0.5.bb
> +++ b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
> @@ -10,7 +10,8 @@ DEPENDS = "virtual/libintl ncurses glib-2.0  ${@base_contains('DISTRO_FEATURES',
>   PR = "r3"
>
>   SRC_URI = "http://www.latencytop.org/download/latencytop-${PV}.tar.gz \
> -            file://latencytop-makefile.patch"
> +            file://latencytop-makefile.patch \
> +            file://latencytop-fsync.patch"
>
>   SRC_URI[md5sum] = "73bb3371c6ee0b0e68e25289027e865c"
>   SRC_URI[sha256sum] = "9e7f72fbea7bd918e71212a1eabaad8488d2c602205d2e3c95d62cd57e9203ef"
>

-- 
Best Reagrds,
Roy | RongQing Li

