Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TQMKf-0005k6-9O
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 20:02:33 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Oct 2012 10:49:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,631,1344236400"; d="scan'208";a="207583395"
Received: from unknown (HELO [10.255.14.142]) ([10.255.14.142])
	by azsmga001.ch.intel.com with ESMTP; 22 Oct 2012 10:49:06 -0700
Message-ID: <1350928144.1581.31.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Christopher Larson <kergoth@gmail.com>
Date: Mon, 22 Oct 2012 12:49:04 -0500
In-Reply-To: <1350919703-6105-1-git-send-email-kergoth@gmail.com>
References: <1350919703-6105-1-git-send-email-kergoth@gmail.com>
X-Mailer: Evolution 3.4.1 (3.4.1-2.fc17) 
Mime-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][for-danny] lttng-2.0: fix srcrev/pv to match the recipe filenames
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
X-List-Received-Date: Mon, 22 Oct 2012 18:02:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-10-22 at 08:28 -0700, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> Somehow the recipe names got bumped, but the SRCREV and PVs in the recipes
> didn't get updated, so they were still building old versions.
> 
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb | 7 +++----
>  meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb   | 4 ++--
>  meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb    | 4 ++--
>  3 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb b/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb
> index 4c78f36..baae25f 100644
> --- a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb
> +++ b/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb
> @@ -10,13 +10,12 @@ DEPENDS = "virtual/kernel"
>  
>  inherit module
>  
> -SRCREV = "4d3e89e379fc66480d729abe8daa5c86eb585400"
> -PV = "2.0.pre11+git${SRCREV}"
> +SRCREV = "a848cad4cc82d05493c487a709f6b55f22695ec6"
> +PV = "2.0.5"
>  PR = "r0"
>  
>  SRC_URI = "git://git.lttng.org/lttng-modules.git;protocol=git \
> -           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
> -           file://lttng-sycalls-protect-is_compat_task-from-redefiniti.patch"
> +           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch"
>  

I guess the patch for lttng-modules should also remove the patch itself.
I sent a patch to do that last week:

http://lists.linuxtogo.org/pipermail/openembedded-core/2012-October/030957.html
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-October/030958.html

which also updated the PV.  I didn't update the other lttng recipes as
your patch does though, since I was assuming the lttng-modules thing was
a typo and had probably been tested with the other recipe versions as
they were.

In any case, I did test the other versions once I got it building again,
and here's a little writeup of what worked:

https://wiki.yoctoproject.org/wiki/Tracing_and_Profiling#LTTng_.28Linux_Trace_Toolkit.2C_next_generation.29


Tom

>  export INSTALL_MOD_DIR="kernel/lttng-modules"
>  export KERNEL_SRC="${STAGING_KERNEL_DIR}"
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb
> index e7f1016..0bafcb3 100644
> --- a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb
> +++ b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb
> @@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=61273c2e3f60dd38a74b01beb5f51fbd \
>  
>  DEPENDS = "liburcu popt lttng2-ust"
>  
> -SRCREV = "8c3919ea2dc77fdd47fb1c90e41490a20bb4d478"
> -PV = "v2.0.1+git${SRCREV}"
> +SRCREV = "98c8c95b0e1afb2dac686338efdf036f6446d790"
> +PV = "v2.0.4"
>  PR = "r0"
>  
>  SRC_URI = "git://git.lttng.org/lttng-tools.git;protocol=git"
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb b/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb
> index 8f650a4..0574fe9 100644
> --- a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb
> +++ b/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb
> @@ -12,8 +12,8 @@ inherit autotools
>  
>  DEPENDS = "liburcu util-linux"
>  
> -SRCREV = "a367ee66aad3ffd21ef64d1b24efc6f862e09562"
> -PV = "2.0.2+git${SRCPV}"
> +SRCREV = "5fbf75f52c808b648feebea1ed4874c5f6264b05"
> +PV = "2.0.5"
>  PR = "r0"
>  
>  SRC_URI = "git://git.lttng.org/lttng-ust.git;protocol=git"




