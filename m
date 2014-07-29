Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 91B606AC83
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 04:19:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jul 2014 21:19:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,754,1400050800"; d="scan'208";a="576915778"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO [10.255.12.249])
	([10.255.12.249])
	by fmsmga002.fm.intel.com with ESMTP; 28 Jul 2014 21:19:13 -0700
Message-ID: <53D720C1.5080304@linux.intel.com>
Date: Mon, 28 Jul 2014 21:19:13 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
References: <cover.1406599885.git.Qi.Chen@windriver.com>
	<4ab37f4698f7da551ba81818e7bcbe9267502594.1406599885.git.Qi.Chen@windriver.com>
In-Reply-To: <4ab37f4698f7da551ba81818e7bcbe9267502594.1406599885.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH V3 1/1] systemd: upgrade to 215
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
X-List-Received-Date: Tue, 29 Jul 2014 04:19:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/28/2014 07:12 PM, Chen Qi wrote:
> Upgrade systemd from 213 to 215.
>
> systemd-older-kernel.patch is removed as it's fixed in 215.
>

I had a failure like this from the V2 Patch, has this been addressed:

> | cc1: warning: ./src/core: No such file or directory
> | make[1]: *** [all-recursive] Error 1
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> | WARNING: /srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_215+gitAUTOINC+252ff40a38-r0/temp/run.do_compile.687:1 exit 1 from
> |   exit 1
> | ERROR: Function failed: do_compile (log file is located at /srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_215+gitAUTOINC+252ff40a38-r0/temp/log.do_compile.687)


Sau!

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   .../systemd/systemd/systemd-older-kernel.patch     |   56 --------------------
>   .../systemd/{systemd_213.bb => systemd_215.bb}     |    8 +--
>   2 files changed, 4 insertions(+), 60 deletions(-)
>   delete mode 100644 meta/recipes-core/systemd/systemd/systemd-older-kernel.patch
>   rename meta/recipes-core/systemd/{systemd_213.bb => systemd_215.bb} (99%)
>
> diff --git a/meta/recipes-core/systemd/systemd/systemd-older-kernel.patch b/meta/recipes-core/systemd/systemd/systemd-older-kernel.patch
> deleted file mode 100644
> index 18b50e7..0000000
> --- a/meta/recipes-core/systemd/systemd/systemd-older-kernel.patch
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -From 6109f02dcc4f2d7a461c5772bab494f5753a2203 Mon Sep 17 00:00:00 2001
> -From: Robert Yang <liezhi.yang@windriver.com>
> -Date: Thu, 29 May 2014 08:09:07 +0000
> -Subject: [PATCH] rtnl-types.c: check IFLA_VLAN_PROTOCOL
> -
> -The older kernel's linux/if_link.h doesn't have IFLA_VLAN_PROTOCOL, we need
> -check whether it has been defined or not.
> -
> -The maintainer said that he would fix it:
> -
> -http://thread.gmane.org/gmane.comp.sysutils.systemd.devel/18200
> -
> -Also we need redefine IFLA_MAX from 34 to 35 when define IFLA_CARRIER,
> -otherwise there would be error:
> -
> -| src/libsystemd/sd-rtnl/rtnl-types.c:233:9: error: array index in initializer exceeds array bounds
> -|          [IFLA_CARRIER]          = { .type = NLA_U8 },
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ----
> - src/libsystemd/sd-rtnl/rtnl-types.c | 2 ++
> - src/shared/missing.h                | 2 ++
> - 2 files changed, 4 insertions(+)
> -
> -diff --git a/src/libsystemd/sd-rtnl/rtnl-types.c b/src/libsystemd/sd-rtnl/rtnl-types.c
> -index 44ac5ec..ab6161f 100644
> ---- a/src/libsystemd/sd-rtnl/rtnl-types.c
> -+++ b/src/libsystemd/sd-rtnl/rtnl-types.c
> -@@ -67,7 +67,9 @@ static const NLType rtnl_link_info_data_vlan_types[IFLA_VLAN_MAX + 1] = {
> -         [IFLA_VLAN_EGRESS_QOS]  = { .type = NLA_NESTED },
> -         [IFLA_VLAN_INGRESS_QOS] = { .type = NLA_NESTED },
> - */
> -+#ifdef IFLA_VLAN_PROTOCOL
> -         [IFLA_VLAN_PROTOCOL]    = { .type = NLA_U16 },
> -+#endif
> - };
> -
> - static const NLType rtnl_link_info_data_bond_types[IFLA_BOND_MAX + 1] = {
> -diff --git a/src/shared/missing.h b/src/shared/missing.h
> -index d5ec2f8..732853f 100644
> ---- a/src/shared/missing.h
> -+++ b/src/shared/missing.h
> -@@ -94,6 +94,8 @@
> -
> - #ifndef IFLA_CARRIER
> -   #define IFLA_CARRIER 33
> -+  #undef IFLA_MAX
> -+  #define IFLA_MAX 35
> -   #ifndef IFLA_NUM_RX_QUEUES
> -     #define IFLA_NUM_RX_QUEUES 32
> -     #ifndef IFLA_NUM_TX_QUEUES
> ---
> -1.8.3.4
> -
> diff --git a/meta/recipes-core/systemd/systemd_213.bb b/meta/recipes-core/systemd/systemd_215.bb
> similarity index 99%
> rename from meta/recipes-core/systemd/systemd_213.bb
> rename to meta/recipes-core/systemd/systemd_215.bb
> index 5de7cdc..b1ffbdd 100644
> --- a/meta/recipes-core/systemd/systemd_213.bb
> +++ b/meta/recipes-core/systemd/systemd_215.bb
> @@ -17,9 +17,9 @@ SECTION = "base/shell"
>
>   inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest
>
> -SRCREV = "c9679c652b3c31f2510e8805d81630680ebc7e95"
> +SRCREV = "252ff40a3827b4e8e62e03a5e2f80da3fe02bee6"
>
> -PV = "213+git${SRCPV}"
> +PV = "215+git${SRCPV}"
>
>   SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=git \
>              file://binfmt-install.patch \
> @@ -35,8 +35,7 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
>              file://00-create-volatile.conf \
>              file://init \
>              file://run-ptest \
> -           file://systemd-older-kernel.patch \
> -          "
> +         "
>
>   S = "${WORKDIR}/git"
>
> @@ -231,6 +230,7 @@ FILES_${PN} = " ${base_bindir}/* \
>                   ${exec_prefix}/lib/systemd \
>                   ${exec_prefix}/lib/modules-load.d \
>                   ${exec_prefix}/lib/sysctl.d \
> +                ${exec_prefix}/lib/sysusers.d \
>                   ${localstatedir} \
>                   /lib/udev/rules.d/70-uaccess.rules \
>                   /lib/udev/rules.d/71-seat.rules \
>

