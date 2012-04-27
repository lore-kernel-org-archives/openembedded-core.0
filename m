Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SNssB-0000ZN-UU
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 23:38:40 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Apr 2012 14:29:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="159192732"
Received: from unknown (HELO [10.255.12.123]) ([10.255.12.123])
	by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2012 14:28:59 -0700
Message-ID: <4F9B0F9B.7070900@linux.intel.com>
Date: Fri, 27 Apr 2012 14:28:59 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1333861256-22395-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1333861256-22395-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] connman: Fix linking with gold linker
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
X-List-Received-Date: Fri, 27 Apr 2012 21:38:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/07/2012 10:00 PM, Khem Raj wrote:
> Fixes errors like below
>
> /home/kraj/work/angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/libexec/armv5te-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.6.3/ld:
> error: hidden symbol '__start___debug' is not defined locally
> /home/kraj/work/angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/libexec/armv5te-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.6.3/ld:
> error: hidden symbol '__stop___debug' is not defined locally
> collect2: ld returned 1 exit status
> make[1]: *** [plugins/loopback.la] Error 1
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   ...ange-visibility-to-default-for-debug-symb.patch |   35 ++++++++++++++++++++
>   meta/recipes-connectivity/connman/connman_0.79.bb  |    3 +-
>   2 files changed, 37 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch
>
> diff --git a/meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch b/meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch
> new file mode 100644
> index 0000000..e6f03e6
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch
> @@ -0,0 +1,35 @@
> +From 4ddaf78dad5a9ee4a0658235f71b75132192123e Mon Sep 17 00:00:00 2001
> +From: Khem Raj<raj.khem@gmail.com>
> +Date: Sat, 7 Apr 2012 18:52:12 -0700
> +Subject: [PATCH] plugin.h: Change visibility to default for debug symbols
> +
> +gold refuses to link in undefined weak symbols which
> +have hidden visibility
> +
> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
> +
> +
> +Upstream-Status: Pending
> +---
> + include/plugin.h |    4 ++--
> + 1 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/include/plugin.h b/include/plugin.h
> +index 692a4e5..a9361c3 100644
> +--- a/include/plugin.h
> ++++ b/include/plugin.h
> +@@ -89,9 +89,9 @@ struct connman_plugin_desc {
> + #else
> + #define CONNMAN_PLUGIN_DEFINE(name, description, version, priority, init, exit) \
> + 		extern struct connman_debug_desc __start___debug[] \
> +-				__attribute__ ((weak, visibility("hidden"))); \
> ++				__attribute__ ((weak, visibility("default"))); \
> + 		extern struct connman_debug_desc __stop___debug[] \
> +-				__attribute__ ((weak, visibility("hidden"))); \
> ++				__attribute__ ((weak, visibility("default"))); \
> + 		extern struct connman_plugin_desc connman_plugin_desc \
> + 				__attribute__ ((visibility("default"))); \
> + 		struct connman_plugin_desc connman_plugin_desc = { \
> +--
> +1.7.5.4
> +
> diff --git a/meta/recipes-connectivity/connman/connman_0.79.bb b/meta/recipes-connectivity/connman/connman_0.79.bb
> index f87c4dd..da48e94 100644
> --- a/meta/recipes-connectivity/connman/connman_0.79.bb
> +++ b/meta/recipes-connectivity/connman/connman_0.79.bb
> @@ -6,6 +6,7 @@ SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
>               file://add_xuser_dbus_permission.patch \
>               file://ethernet_default.patch \
>               file://disable_alg-test.patch \
> +            file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
>               file://connman"
>   S = "${WORKDIR}/git"
> -PR = "r1"
> +PR = "r2"

Merged into OE-Core

Thanks
	Sau!


