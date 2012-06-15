Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Sffci-0000ez-Lh
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jun 2012 01:08:12 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jun 2012 15:57:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="180761341"
Received: from unknown (HELO envy.home) ([10.255.12.88])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jun 2012 15:57:32 -0700
Message-ID: <4FDBBD8D.1050201@linux.intel.com>
Date: Fri, 15 Jun 2012 15:56:13 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1339799869.git.dvhart@linux.intel.com>
	<5f472764f7cea2d386b7ee572870fc03769868fc.1339799869.git.dvhart@linux.intel.com>
In-Reply-To: <5f472764f7cea2d386b7ee572870fc03769868fc.1339799869.git.dvhart@linux.intel.com>
X-Enigmail-Version: 1.4.2
Cc: philb@gnu.org
Subject: Re: [PATCH 1/1] busybox: Include setsid and cttyhack in defconfig
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
X-List-Received-Date: Fri, 15 Jun 2012 23:08:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 06/15/2012 03:40 PM, Darren Hart wrote:
> When building very small systems, it can be useful to spawn a shell
> from a simple init script, rather than a full System V Init
> process. This requires the shell be the session leader and be able
> to open the controlling terminal if it is to have job control.
> 
> Enable CONFIG_CTTYHACK and CONFIG_SETSID to enable this. The resulting
> busybox binary does not change in size (I checked several times!).

Aha, OK, I'm hitting the menuconfig/sstate bug. By bumping the PR I was
able to get real numbers.

-rwxr-xr-x 1 dvhart dvhart 561828 2012-06-15 15:52 /home/dvhart/busybox-r8-sci
-rwxr-xr-x 1 dvhart dvhart 559268 2012-06-15 15:54 /home/dvhart/busybox-r9-i

So the delta for including SETSID and CTTYHACK is 2560 bytes.

The patch comment in the branch has been updated accordingly.

--
Darren

> 
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> ---
>  meta/recipes-core/busybox/busybox-1.19.4/defconfig |    4 ++--
>  meta/recipes-core/busybox/busybox_1.19.4.bb        |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-core/busybox/busybox-1.19.4/defconfig b/meta/recipes-core/busybox/busybox-1.19.4/defconfig
> index 372d7b5..0a5d5c9 100644
> --- a/meta/recipes-core/busybox/busybox-1.19.4/defconfig
> +++ b/meta/recipes-core/busybox/busybox-1.19.4/defconfig
> @@ -700,7 +700,7 @@ CONFIG_MICROCOM=y
>  # CONFIG_RFKILL is not set
>  # CONFIG_RUNLEVEL is not set
>  # CONFIG_RX is not set
> -# CONFIG_SETSID is not set
> +CONFIG_SETSID=y
>  CONFIG_STRINGS=y
>  # CONFIG_TASKSET is not set
>  # CONFIG_FEATURE_TASKSET_FANCY is not set
> @@ -960,7 +960,7 @@ CONFIG_ASH_BUILTIN_TEST=y
>  CONFIG_ASH_OPTIMIZE_FOR_SIZE=y
>  # CONFIG_ASH_RANDOM_SUPPORT is not set
>  CONFIG_ASH_EXPAND_PRMT=y
> -# CONFIG_CTTYHACK is not set
> +CONFIG_CTTYHACK=y
>  # CONFIG_HUSH is not set
>  # CONFIG_HUSH_BASH_COMPAT is not set
>  # CONFIG_HUSH_BRACE_EXPANSION is not set
> diff --git a/meta/recipes-core/busybox/busybox_1.19.4.bb b/meta/recipes-core/busybox/busybox_1.19.4.bb
> index 0717075..5b3f356 100644
> --- a/meta/recipes-core/busybox/busybox_1.19.4.bb
> +++ b/meta/recipes-core/busybox/busybox_1.19.4.bb
> @@ -1,5 +1,5 @@
>  require busybox.inc
> -PR = "r6"
> +PR = "r7"
>  
>  SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>             file://B921600.patch \
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel




