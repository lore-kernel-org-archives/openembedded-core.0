Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RlTxH-00088p-SD
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 00:21:13 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 11 Jan 2012 22:24:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95014551"
Received: from unknown (HELO [10.255.13.168]) ([10.255.13.168])
	by azsmga001.ch.intel.com with ESMTP; 11 Jan 2012 22:24:15 -0800
Message-ID: <4F0E7C8F.5020204@linux.intel.com>
Date: Wed, 11 Jan 2012 22:24:15 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1325541916-22423-1-git-send-email-msm@freescale.com>
In-Reply-To: <1325541916-22423-1-git-send-email-msm@freescale.com>
Cc: Matthew McClintock <msm@freescale.com>
Subject: Re: [PATCH] libxml2: add shared library version info to libxml shared libraries
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
X-List-Received-Date: Thu, 12 Jan 2012 23:21:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/02/2012 02:05 PM, Matthew McClintock wrote:
> This fixes an issue with RPM where it checks version imformation for
> binaries linked against libxml and fails because it's missing info
>
> | error: Failed dependencies:
> |              libxml2.so.2(LIBXML2_2.6.0) is needed by fmc-0.9.7+2-r2.1.ppce500mc
> |              libxml2.so.2(LIBXML2_2.4.30) is needed by fmc-0.9.7+2-r2.1.ppce500mc
> | ERROR: Function 'do_rootfs' failed (see
>
> Note: fmc is just an example recipe/name
>
> Signed-off-by: Matthew McClintock<msm@freescale.com>
> ---
>   .../libxml/libxml2/fix_version_info.patch          |   23 ++++++++++++++++++++
>   meta/recipes-core/libxml/libxml2_2.7.8.bb          |    4 ++-
>   2 files changed, 26 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-core/libxml/libxml2/fix_version_info.patch
>
> diff --git a/meta/recipes-core/libxml/libxml2/fix_version_info.patch b/meta/recipes-core/libxml/libxml2/fix_version_info.patch
> new file mode 100644
> index 0000000..77113ef
> --- /dev/null
> +++ b/meta/recipes-core/libxml/libxml2/fix_version_info.patch
> @@ -0,0 +1,23 @@
> +Upstream-Status: Already upstream
> +
> +From 00819877651b87842ed878898ba17dba489820f0 Mon Sep 17 00:00:00 2001
> +From: Daniel Veillard<veillard@redhat.com>
> +Date: Thu, 04 Nov 2010 20:53:14 +0000
> +Subject: Reactivate the shared library versionning script
> +
> +---
> +diff --git a/configure.in b/configure.in
> +index 59d0629..a1d2c89 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -84,7 +84,7 @@ else
> +   esac
> + fi
> + AC_SUBST(VERSION_SCRIPT_FLAGS)
> +-AM_CONDITIONAL([USE_VERSION_SCRIPT], [test -z "$VERSION_SCRIPT_FLAGS"])
> ++AM_CONDITIONAL([USE_VERSION_SCRIPT], [test -n "$VERSION_SCRIPT_FLAGS"])
> +
> + dnl
> + dnl We process the AC_ARG_WITH first so that later we can modify
> +--
> +cgit v0.9.0.2
> diff --git a/meta/recipes-core/libxml/libxml2_2.7.8.bb b/meta/recipes-core/libxml/libxml2_2.7.8.bb
> index 2fa246e..0b6ce02 100644
> --- a/meta/recipes-core/libxml/libxml2_2.7.8.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.7.8.bb
> @@ -1,6 +1,8 @@
>   require libxml2.inc
>
> -PR = "r4"
> +PR = "r5"
> +
> +SRC_URI += "file://fix_version_info.patch"
>
>   SRC_URI[md5sum] = "8127a65e8c3b08856093099b52599c86"
>   SRC_URI[sha256sum] = "cda23bc9ebd26474ca8f3d67e7d1c4a1f1e7106364b690d822e009fdc3c417ec"

Merged into OE-Core

Thanks
	Sau!


