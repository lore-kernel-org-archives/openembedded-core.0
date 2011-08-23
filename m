Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QvnOU-0005KM-Ie
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 11:35:38 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QvnJv-0005FM-QM
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 11:30:55 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 23 Aug 2011 10:30:55 +0100
In-Reply-To: <9367246f3304f18ffb82a2b588337a073d830b51.1314043945.git.sgw@linux.intel.com>
References: <cover.1314043945.git.sgw@linux.intel.com>
	<9367246f3304f18ffb82a2b588337a073d830b51.1314043945.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314091855.6733.319.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 03/19] tune: Add hard floating point variants of cortexa8 tunes
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
X-List-Received-Date: Tue, 23 Aug 2011 09:35:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-22 at 14:51 -0700, Saul Wold wrote:
> From: Darren Hart <dvhart@linux.intel.com>
> 
> Enable machines or distros to select the hard floating point abi for cortexa8
> machines. I left out the arm7a thumb+neon combinations as they were not
> present in the original non-hf set.
> 
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> CC: Jason Kridner <jkridner@beagleboard.org>
> CC: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/conf/machine/include/tune-cortexa8.inc |   16 +++++++++++++---
>  1 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
> index 67c5f0b..edd1717 100644
> --- a/meta/conf/machine/include/tune-cortexa8.inc
> +++ b/meta/conf/machine/include/tune-cortexa8.inc
> @@ -5,12 +5,22 @@ require conf/machine/include/arm/arch-armv7a.inc
>  TUNEVALID[cortexa8] = "Enable Cortex-A8 specific processor optimizations"
>  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa8", "-mtune=cortex-a8", "", d)}"
>  
> -AVAILTUNES += "cortexa8 cortexa8t"
> +# Little Endian base configs
> +AVAILTUNES += "cortexa8 cortexa8t cortexa8-neon"
>  TUNE_FEATURES_tune-cortexa8 = "${TUNE_FEATURES_tune-armv7a} cortexa8"
>  TUNE_FEATURES_tune-cortexa8t = "${TUNE_FEATURES_tune-armv7at} cortexa8"
> -TUNE_FEATURES_tune-cortexa8-neon = "${TUNE_FEATURES_tune-cortexa8} neon"
> -
> +TUNE_FEATURES_tune-cortexa8-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa8"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa8 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa8t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}"

This part of the patch doesn't seem to match any of the description in
the checkin comment.

> +# VFP Tunes
> +AVAILTUNES += "cortexa8hf cortexa8thf cortexa8hf-neon"
> +TUNE_FEATURES_tune-cortexa8hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa8"
> +TUNE_FEATURES_tune-cortexa8thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa8"
> +TUNE_FEATURES_tune-cortexa8hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa8"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa8hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa8thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf}"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa8hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}"

I don't think "VFP Tunes" is a very good description of these, since it
might lead folks to think that they need to enable these tunes to get
vfp instructions (which is untrue: the vfp ISA is controlled by the
"vfp" tune feature and this is set for both armv6 and armv7a
automatically).  If they are hard-float ABI tunes, which seems to be the
case, then let's call them that. 

Also, on a broader issue, I continue to feel that adding more and more
terms to what is already quite a large cross product is not a very good
way to proceed.  There's nothing very cortexa8 specific about the
hardfloat API and, to do this comprehensively, we'd have to add an -hf
version of every existing tune definition which has vfp enabled.  I
think it would be better to find a way to express this sort of thing
which captures the orthogonality of the different options and avoids the
need to write out every permutation in longhand.

Also also, on a more tangential note, I remain skeptical that the
hardfloat ABI is actually a useful thing to support.  I'd be interested
to see any benchmark results which demonstrate that it's worthwhile.

p.




