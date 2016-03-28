Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 75C7D65CBC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 22:10:10 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <pb@pbcl.net>)
	id 1akfMP-00048v-7a; Tue, 29 Mar 2016 00:10:09 +0200
Message-ID: <1459203003.2322.29.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Daniel Dragomir <daniel.dragomir@windriver.com>
Date: Mon, 28 Mar 2016 23:10:03 +0100
In-Reply-To: <1459178969-23397-1-git-send-email-daniel.dragomir@windriver.com>
References: <1459178969-23397-1-git-send-email-daniel.dragomir@windriver.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ARMv8-A: Add tune for AArch32 state and AArch64 state
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
X-List-Received-Date: Mon, 28 Mar 2016 22:10:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-03-28 at 18:29 +0300, Daniel Dragomir wrote:
> For AArch64 state, the default tune is aarch32 and include which
>     include just the aarch64 feature.

I don't really understand what this sentence is trying to say.  Can you
re-phrase it so as to be more accessible to non-experts?

>  meta/conf/machine/include/arm/arch-arm64.inc       |  36 -------
>  meta/conf/machine/include/arm/arch-armv8.inc       |   1 -

If you are deleting existing files, please mention that in the commit
message.  And in particular, if you are removing a file that supports
generic ARMv8 (if imperfectly) and replacing it with something that is
specific to ARMv8-A, please explain why this is a good thing.

> +TUNEVALID[crc] = "Enable CRC instructions for ARMv8-a"
> +ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'crc', '-crc', '', d)}"
> +ARMPKGSFX_FPU_64 = "${@bb.utils.contains('TUNE_FEATURES', 'crc', '-crc', '', d)}"

Why is this involved with ARMPKGSFX_FPU?  The crc instructions are not
related to the fpu.  Also, the fact that you need to duplicate both this
and the crypto one for both FPU and FPU_64 seems like an indication that
something elsewhere is misdesigned.

> +TUNEVALID[fp-armv8] = "Enable ARMv8 Vector Floating Point unit."
> +ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'fp-armv8', '-fp-armv8', '', d)}"

I don't entirely understand why this one doesn't have an FPU_64
equivalent.  Are you always enabling vfp for A64?

> +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'aarch32', 'aarch32:', '' ,d)}"
> +MACHINEOVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', ':aarch64', '' ,d)}"

As previously discussed, I am not wild about "aarch32" as the name of an
override which really means "ARMv8 in AArch32 state".  I know there is a
school of thought that says that the execution state of older cpus is
not AArch32 even if in practice it is indistinguishable, but this
doesn't seem to match either the expectations that a rational user of OE
is likely to have, or the information in the published literature.

> +ARMPKGARCH_tune-aarch64            ?= "aarch64"

This seems a tiny bit short-sighted since presumably there will be an
ARMv9 (or ARMv8.2) at some point.  What will ARMPKGARCH for A64 be then?

> +BASE_LIB_tune-aarch64            = "lib64"

This seems like more a matter of distro policy and I'm not sure it
belongs in a tune file.  If it does then can't you rely on the aarch64
MACHINEOVERRIDE and just write "BASE_LIB_aarch64" rather than having to
duplicate this for all four of the tunes (and the -be equivalents)?

> +# Duplicated from arch-arm.inc

Please add a comment explaining why you can't include arch-arm.inc.

p.



