Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E9BF66AD42
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 10:21:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Jun 2013 03:03:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="361943133"
Received: from unknown (HELO helios.localnet) ([10.252.122.97])
	by fmsmga002.fm.intel.com with ESMTP; 28 Jun 2013 03:02:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Fri, 28 Jun 2013 11:02:53 +0100
Message-ID: <2393683.pgSWLXlTRj@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-25-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <1372372997-1604-5-git-send-email-sgw@linux.intel.com>
References: <1372372997-1604-1-git-send-email-sgw@linux.intel.com>
	<1372372997-1604-5-git-send-email-sgw@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] packagegroup-core-boot: used udev-cache for sysvinit
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
X-List-Received-Date: Fri, 28 Jun 2013 10:21:23 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 27 June 2013 15:43:17 Saul Wold wrote:
> Enabling this by default since it does improve boot time when using sysvinit
> udev
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-core/packagegroups/packagegroup-core-boot.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb index
> d69c41d..1e1ee8e 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> @@ -43,6 +43,7 @@ RDEPENDS_${PN} = "\
>      ${VIRTUAL-RUNTIME_init_manager} \
>      ${VIRTUAL-RUNTIME_initscripts} \
>      ${VIRTUAL-RUNTIME_dev_manager} \
> +    ${@base_contains("DISTRO_FEATURES", "systemd", "", "udev-cache", d)} \
>      ${VIRTUAL-RUNTIME_update-alternatives} \
>      ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"

I appreciate the intention here but I'm not sure if this is really the 
appropriate place to put this; packagegroup-core-boot is supposed to only 
directly pull in the essentials required for booting. This will cause problems 
for those people using alternative device managers (e.g. busybox mdev) as 
well.

I'm not sure where this should go, but adding it to VIRTUAL-
RUNTIME_dev_manager (in the distro config?) could work. Anyone else have any 
better suggestion?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

