Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9924873306
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 19:48:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5FJm2En029802
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Jun 2015 12:48:02 -0700 (PDT)
Received: from server.local (128.224.20.197) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 15 Jun 2015 12:48:02 -0700
Message-ID: <557F2BF1.5000605@windriver.com>
Date: Mon, 15 Jun 2015 15:48:01 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Patrick Ohly <patrick.ohly@intel.com>, OpenEmbedded
	<openembedded-core@lists.openembedded.org>
References: <1434370643.9085.98.camel@intel.com>
In-Reply-To: <1434370643.9085.98.camel@intel.com>
Subject: Re: KCONF_AUDIT_LEVEL + kernel_configcheck
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
X-List-Received-Date: Mon, 15 Jun 2015 19:48:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-06-15 8:17 AM, Patrick Ohly wrote:
> Hello!
>
> In Fido and master, the following patch changed the default value of
> KCONF_AUDIT_LEVEL:
>
> $ git annotate origin/fido -- meta/classes/kernel-yocto.bbclass | grep KCONF_AUDIT_LEVEL
> ad4d5949	(Bruce Ashfield	2015-02-18 16:15:35 -0500	308)    config_check_visibility = int(d.getVar( "KCONF_AUDIT_LEVEL", True ) or 0)
> $ git annotate origin/master -- meta/classes/kernel-yocto.bbclass | grep KCONF_AUDIT_LEVEL
> ad4d5949	(Bruce Ashfield	2015-02-18 16:15:35 -0500	309)    config_check_visibility = int(d.getVar( "KCONF_AUDIT_LEVEL", True ) or 0)
>
> At least if I read it right, that wasn't the intention. The commit
> explicitly says that the default should be 1:
>
>      The visibility of auditing is controlled by KCONF_AUDIT_LEVEL:
>
>         0: no reporting
>         1: report options that are specified, but not in the final config
>         2: report options that are not hardware related, but set by a BSP
>
>      The default level is 1, with level 2 and above being for BSP development
>      only.

The line is correct, since we don't want it warning for non linux-yocto
meta-data enabled kernels. The default is indeed 1, since I set it in
the common include file. That was the default I was referring to in that
change.

>
> I found that while investigating why having an unsupported config option
> in one of my kernel fragments did not result in a warning. However, even
> with KCONF_AUDIT_LEVEL="2" in my local.conf, I still only get warnings
> about the BSP, but not my unsupported option.
>
> To reproduce, modify poky master as follows and build the default
> configuration:
>
> ------------------------------------
> $ git diff --cached
> diff --git a/meta/recipes-kernel/linux/linux-yocto/foobar.cfg b/meta/recipes-kernel/linux/linux-yocto/foobar.cfg
> new file mode 100644
> index 0000000..f40043a
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/linux-yocto/foobar.cfg
> @@ -0,0 +1,2 @@
> +CONFIG_FOOBAR=y
> +CONFIG_SECURITY_SMACK=y
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.19.bb b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
> index 6218c02..d4b9437 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.19.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
> @@ -38,3 +38,5 @@ KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>   KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>   KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>   KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
> +
> +SRC_URI += "file://foobar.cfg"
>
> ...
>
> $ bitbake -f -c kernel_configcheck linux-yocto
> Loading cache: 100% |########################################################################################################################################################################################################| ETA:  00:00:00
> Loaded 1288 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION        = "1.27.1"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Debian-8.0"
> TARGET_SYS        = "i586-poky-linux"
> MACHINE           = "qemux86"
> DISTRO            = "poky"
> DISTRO_VERSION    = "1.8+snapshot-20150615"
> TUNE_FEATURES     = "m32 i586"
> TARGET_FPU        = ""
> meta
> meta-yocto
> meta-yocto-bsp    = "master:379a030702c985c6e69831173f765a47dfeb8841"
>
> NOTE: Preparing RunQueue
> NOTE: Tainting hash to force rebuild of task /work/poky/meta/recipes-kernel/linux/linux-yocto_3.19.bb, do_kernel_configcheck
> WARNING: /work/poky/meta/recipes-kernel/linux/linux-yocto_3.19.bb.do_configure is tainted from a forced run
> WARNING: /work/poky/meta/recipes-kernel/linux/linux-yocto_3.19.bb.do_kernel_configcheck is tainted from a forced run
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> WARNING: [kernel config]: BSP specified non-hw configuration:
>
> CONFIG_BLOCK
> CONFIG_BT
> CONFIG_BT_6LOWPAN
> CONFIG_BT_BNEP
> CONFIG_BT_BNEP_MC_FILTER
> CONFIG_BT_BNEP_PROTO_FILTER
> CONFIG_BT_CMTP
> CONFIG_BT_HIDP
> CONFIG_BT_RFCOMM
> CONFIG_BT_RFCOMM_TTY
> CONFIG_CFG80211_WEXT
> CONFIG_CORDIC
> CONFIG_CRC8
> CONFIG_EFIVAR_FS
> CONFIG_EFI_PARTITION
> CONFIG_NET
> CONFIG_NETDEVICES
> CONFIG_PARTITION_ADVANCED
> CONFIG_WEXT_CORE
> CONFIG_WEXT_PROC
> CONFIG_WIRELESS
> ------------------------------------
>
> foobar.cfg is used (the CONFIG_SECURITY_SMACK part is used) but the
> CONFIG_FOOBAR part of course is not. Shouldn't this trigger the
> "specified values did not make it into the kernel's final
> configuration"?

To keep the noise down, I'm only emitting partial audit information and
the warnings only apply to options that are tagged as "hardware", since
that is also a synonym to 'required' in the configuration scheme.

.. and no. That isn't common knowledge, since I've been slowly changing
and making the audit information more visible, but don't want to flood
too many warnings, or create an ABI that limits how we can change things.

>
> There is no mismatch.cfg, only a nonhw_report.cfg. This seems to point
> towards an error in the configure task, if I understand the kernel
> recipes correctly.

See above. No mismatch for options that aren't tagged as h/w.

>
> Speaking of nonhw_report.cfg, are there plans to make the core BSPs
> clean enough to pass the check without warnings?

They pass for h/w options cleanly in 1.7 and 1.8, we get bugs and clean
up any visible warnings.

For 1.9, there's a whole slate of kernel audit, kernel configuration and
other changes that will do more cleaning.

Bruce

>


