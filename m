Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 50D2D782A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 19:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B287320B84;
	Mon, 12 Jun 2017 19:46:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 5iPDmeO9MT9V; Mon, 12 Jun 2017 19:46:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 88D03207AF;
	Mon, 12 Jun 2017 19:46:35 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2C6A31624F4; Mon, 12 Jun 2017 15:46:35 -0400 (EDT)
Date: Mon, 12 Jun 2017 15:46:35 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20170612194635.GX28053@denix.org>
References: <cover.85d08ae286e0b2f8503f9e657148201e6b90edde.1497013310.git-series.patrick.ohly@intel.com>
	<9dfd9eff13b3831c7e88c97318f97d2daeac9a78.1497013310.git-series.patrick.ohly@intel.com>
MIME-Version: 1.0
In-Reply-To: <9dfd9eff13b3831c7e88c97318f97d2daeac9a78.1497013310.git-series.patrick.ohly@intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] bitbake.conf: DISTRO_FEATURES as overrides
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
X-List-Received-Date: Mon, 12 Jun 2017 19:46:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This now breaks parsing my distro config on these lines:

ENABLE_SYSVINIT ?= "0"
DISTRO_FEATURES_append = "${@base_conditional("ENABLE_SYSVINIT", "1", "", " systemd", d)}"


Here's the log:

ERROR: Unable to parse /OE/arago-master/sources/bitbake/lib/bb/data_smart.py
Traceback (most recent call last):
  File "/OE/arago-master/sources/bitbake/lib/bb/data_smart.py", line 426, in DataSmart.expandWithRefs(s='${@base_conditional("ENABLE_SYSVINIT", "1", "", " systemd", d)}', varname='DISTRO_FEATURES_append'):
                 except Exception as exc:
    >                raise ExpansionError(varname, s, exc) from exc
     
bb.data_smart.ExpansionError: Failure expanding variable DISTRO_FEATURES_append, expression was ${@base_conditional("ENABLE_SYSVINIT", "1", "", " systemd", d)} which triggered exception NameError: name 'base_conditional' is not defined

-- 
Denys


On Fri, Jun 09, 2017 at 03:04:03PM +0200, Patrick Ohly wrote:
> As discussed in "[Openembedded-architecture] Yocto Compatible 2.0 +
> signature changes", changes in .bbappend must depend on some explicit
> configuration change, typically selecting a distro feature.
> 
> For _append and _remove, adding an override that is set only when the
> corresponding entry is in DISTRO_FEATURES achieves that:
> 
> In local.conf:
>   DISTRO_FEATURES_append = " my-distro-feature"
> 
> In layer.conf:
>   DISTRO_FEATURES_OVERRIDES += "my-distro-feature"
> 
> In a .bbappend:
>   do_install_append_df-my-distro-feature () {
>        ...
>   }
> 
> The subset of DISTRO_FEATURES that are made available as overrides
> must be configured explicitly because using them this way should
> be a conscious decision.
> 
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  meta/conf/bitbake.conf | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 3ad905c..fce1882 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -713,7 +713,7 @@ DISTRO_NAME ??= "OpenEmbedded"
>  #
>  # This works for  functions as well, they are really just environment variables.
>  # Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
> -OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:forcevariable"
> +OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}${DISTROFEATURESOVERRIDES}:${CLASSOVERRIDE}:forcevariable"
>  OVERRIDES[vardepsexclude] = "MACHINEOVERRIDES"
>  CLASSOVERRIDE ?= "class-target"
>  DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
> @@ -722,6 +722,21 @@ MACHINEOVERRIDES[vardepsexclude] = "MACHINE"
>  
>  FILESOVERRIDES = "${TRANSLATED_TARGET_ARCH}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}"
>  
> +# Turns certain DISTRO_FEATURES into overrides of the same name
> +# or (optionally) some other name. Ensures that these special
> +# distro features remain set also for native and nativesdk
> +# recipes, so that these overrides can also be used there.
> +#
> +# Beware that this part of OVERRIDES changes during parsing, so usage
> +# of these overrides should be limited to .bb and .bbappend files,
> +# because then DISTRO_FEATURES is final.
> +DISTRO_FEATURES_OVERRIDES ??= ""
> +DISTRO_FEATURES_OVERRIDES[doc] = "A space-separated list of <feature> entries. \
> +Each entry is added to OVERRIDES as df-<feature> if <feature> is in DISTRO_FEATURES."
> +DISTRO_FEATURES_FILTER_NATIVE_append = " ${DISTRO_FEATURES_OVERRIDES}"
> +DISTRO_FEATURES_FILTER_NATIVESDK_append = " ${DISTRO_FEATURES_OVERRIDES}"
> +DISTROFEATURESOVERRIDES = "${@ ''.join([':df-' + x for x in (set(d.getVar('DISTRO_FEATURES_OVERRIDES').split()) & set((d.getVar('DISTRO_FEATURES') or '').split()))]) }"
> +
>  ##################################################################
>  # Include the rest of the config files.
>  ##################################################################
> -- 
> git-series 0.9.1
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

