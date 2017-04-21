Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6AED177A88
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 11:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id D121F31E60C9;
	Fri, 21 Apr 2017 13:37:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Edn0fb_AXErG; Fri, 21 Apr 2017 13:37:48 +0200 (CEST)
Received: from t510.zcs.saftware.de (p57A6179E.dip0.t-ipconnect.de
	[87.166.23.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 3172B31E5C07;
	Fri, 21 Apr 2017 13:37:47 +0200 (CEST)
Date: Fri, 21 Apr 2017 13:37:47 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
Message-ID: <20170421133747.4ba6e331@t510.zcs.saftware.de>
In-Reply-To: <20170421082534.30675-1-dmitry.rozhkov@linux.intel.com>
References: <20170421082534.30675-1-dmitry.rozhkov@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: fix race condition with systemd-udev
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
X-List-Received-Date: Fri, 21 Apr 2017 11:37:51 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 21 Apr 2017 11:25:34 +0300
Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com> wrote:

> When a new USB network interface is plugged in systemd
> fails to rename the new interface (ethX) to a predictable
> name [1] because connman locks it first.
> 
> The proposed solution is to blacklist unpredictable names
> in connman in case systemd is used as an init system.
> Also add a fix to connman that makes it to re-evaluate
> a known but blacklisted ethernet interface for enabling
> after it has got renamed.

Doesn't this break networking for everybody not using these
"predictable" names?

Regards,
Andreas


> 
> Fixes [YOCTO #11341]
> 
> [1] https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/
> 
> Signed-off-by: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
> ---
>  ...try-to-add-ether-interface-after-renaming.patch | 42 ++++++++++++++++++++++
>  .../recipes-connectivity/connman/connman/main.conf |  2 ++
>  meta/recipes-connectivity/connman/connman_1.33.bb  | 10 ++++++
>  3 files changed, 54 insertions(+)
>  create mode 100644 meta/recipes-connectivity/connman/connman/0001-rtnl-retry-to-add-ether-interface-after-renaming.patch
>  create mode 100644 meta/recipes-connectivity/connman/connman/main.conf
> 
> diff --git a/meta/recipes-connectivity/connman/connman/0001-rtnl-retry-to-add-ether-interface-after-renaming.patch b/meta/recipes-connectivity/connman/connman/0001-rtnl-retry-to-add-ether-interface-after-renaming.patch
> new file mode 100644
> index 0000000..e5f4360
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman/0001-rtnl-retry-to-add-ether-interface-after-renaming.patch
> @@ -0,0 +1,42 @@
> +From d92e713e112e48cb4434f1c67b97e6507a7cf9e8 Mon Sep 17 00:00:00 2001
> +From: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
> +Date: Thu, 20 Apr 2017 15:54:29 +0300
> +Subject: [PATCH] rtnl: retry to add ether interface after renaming
> +
> +If eth* interfaces are blacklisted to avoid a race condition
> +where connman may access an interface before systemd/udev can
> +change it to use a predictable interface name then it's impossible
> +to re-activate it under a new predictable name because an existing
> +interface is considered to be already added to the technology.
> +
> +Once blacklisted an interface is not re-evaluated under a new name.
> +
> +This patch allows to re-evaluate an interface known to connman for
> +adding it to the ethernet technology in case it's name has changed.
> +E.g. after unplugging a cable and plugging it back.
> +
> +Upstream-Status: Submitted [https://lists.01.org/pipermail/connman/2017-April/021790.html]
> +
> +Signed-off-by: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
> +---
> + src/rtnl.c | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/rtnl.c b/src/rtnl.c
> +index d1b851f..19a999c 100644
> +--- a/src/rtnl.c
> ++++ b/src/rtnl.c
> +@@ -469,7 +469,9 @@ static void process_newlink(unsigned short type, int index, unsigned flags,
> + 
> + 		if (type == ARPHRD_ETHER)
> + 			read_uevent(interface);
> +-	} else
> ++	} else if (type == ARPHRD_ETHER && interface->device_type == CONNMAN_DEVICE_TYPE_UNKNOWN)
> ++		read_uevent(interface);
> ++	else
> + 		interface = NULL;
> + 
> + 	for (list = rtnl_list; list; list = list->next) {
> +-- 
> +2.9.3
> +
> diff --git a/meta/recipes-connectivity/connman/connman/main.conf b/meta/recipes-connectivity/connman/connman/main.conf
> new file mode 100644
> index 0000000..fcd6ca0
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman/main.conf
> @@ -0,0 +1,2 @@
> +[General]
> +NetworkInterfaceBlacklist=vmnet,vboxnet,virbr,ifb,docker,veth,eth,wlan
> diff --git a/meta/recipes-connectivity/connman/connman_1.33.bb b/meta/recipes-connectivity/connman/connman_1.33.bb
> index 4129b05..02247cb 100644
> --- a/meta/recipes-connectivity/connman/connman_1.33.bb
> +++ b/meta/recipes-connectivity/connman/connman_1.33.bb
> @@ -1,5 +1,7 @@
>  require connman.inc
>  
> +OVERRIDES_append = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ':systemd', '', d)}"
> +
>  SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
>              file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
>              file://connman \
> @@ -9,8 +11,16 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
>              "
>  SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch \
>                               file://0001-Fix-compile-on-musl-with-kernel-4.9-headers.patch"
> +SRC_URI_append_systemd = "   file://0001-rtnl-retry-to-add-ether-interface-after-renaming.patch \
> +                             file://main.conf"
> +
>  
>  SRC_URI[md5sum] = "c51903fd3e7a6a371d12ac5d72a1fa01"
>  SRC_URI[sha256sum] = "bc8946036fa70124d663136f9f6b6238d897ca482782df907b07a428b09df5a0"
>  
> +do_install_append_systemd() {
> +    install -d ${D}${sysconfdir}/connman
> +    install -m 0644 ${WORKDIR}/main.conf ${D}${sysconfdir}/connman/main.conf
> +}
> +
>  RRECOMMENDS_${PN} = "connman-conf"


