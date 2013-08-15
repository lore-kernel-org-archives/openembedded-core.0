Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 06B596B7B4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 12:01:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 Aug 2013 05:01:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,885,1367996400"; d="scan'208";a="386730882"
Received: from timevans-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.122.206])
	by fmsmga002.fm.intel.com with ESMTP; 15 Aug 2013 05:01:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Thu, 15 Aug 2013 13:01 +0100
Message-ID: <3913312.dVjBbQiR11@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1376512209-11622-4-git-send-email-mark.hatle@windriver.com>
References: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
	<1376512209-11622-4-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 03/11] package_rpm.bbclass: Add support for PACKAGE_EXCLUDE to RPM installs
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
X-List-Received-Date: Thu, 15 Aug 2013 12:01:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 14 August 2013 15:30:01 Mark Hatle wrote:
> Using the new smart exclude mechanism an error will be generated in the
> excluded package is required for the image to be generated.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/classes/package_rpm.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta/classes/package_rpm.bbclass
> b/meta/classes/package_rpm.bbclass index 324d83f..74ae0ed 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -356,6 +356,11 @@ EOF
>  		smart --data-dir=${target_rootfs}/var/lib/smart config --set
> rpm-extra-macros._var=${localstatedir} smart
> --data-dir=${target_rootfs}/var/lib/smart config --set
> rpm-extra-macros._tmppath=/install/tmp package_write_smart_config
> ${target_rootfs}
> +		# Do the following configurations here, to avoid them being saved for
> field upgrade 
> +		for i in ${PACKAGE_EXCLUDE}; do
> +			smart --data-dir=$1/var/lib/smart flag --set exclude-packages $i
> +		done

IMO, it would be correct to persist these exclusions into the runtime 
configuration. Not doing so is inconsistent with the behaviour of 
BAD_RECOMMENDATIONS, and it means that if you do an upgrade or an install on 
the target, these excluded packages can sneak back in which I would think 
would not be desirable unless the user explicitly turns off the exclusion. 
Clearing the flag if it were persisted is easy to do with smart.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

