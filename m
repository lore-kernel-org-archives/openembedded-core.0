Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qm5Fj-0007yU-QL
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 16:38:27 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qm5Bf-00028u-Ke
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 16:34:15 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jul 2011 15:34:14 +0100
In-Reply-To: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311777255.30326.347.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 1/3] Add ARM tune file overhaul based largely on work from Mark Hatle
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
X-List-Received-Date: Wed, 27 Jul 2011 14:38:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I just looked at this again and here are a few more comments:

On Tue, 2011-07-26 at 13:44 +0100, Richard Purdie wrote:
> +PACKAGE_EXTRA_ARCHS_tune-armv4tb = "${PACKAGE_EXTRA_ARCHS_tune-armv4} armv4tb"

That should be "${PACKAGE_EXTRA_ARCHS_tune-armv4b} armv4tb", I think.
Otherwise you will get a mixture of big and little endian in there.

> +++ b/meta/conf/machine/include/arm/arch-armv5-dsp.inc
> @@ -0,0 +1,40 @@
> +ARMPKGSFX_DSP = "${@bb.utils.contains("TUNE_FEATURES", [ "armv5", "dsp" ], "e", "", d)}"
> +
> +require conf/machine/include/arm/arch-armv5.inc
> +
> +# Little Endian
> +AVAILTUNES += "armv5e armv5te"
> +TUNE_FEATURES_tune-armv5e ?= "armv5 dsp"
> +TUNE_FEATURES_tune-armv5te ?= "armv5 dsp thumb"
> +PACKAGE_EXTRA_ARCHS_tune-armv5e = "${PACKAGE_EXTRA_ARCHS_tune-armv5} armv5e"
> +PACKAGE_EXTRA_ARCHS_tune-armv5te = "${PACKAGE_EXTRA_ARCHS_tune-armv5t} armv5e armv5te"
> +
> diff --git a/meta/conf/machine/include/arm/arch-armv5.inc b/meta/conf/machine/include/arm/arch-armv5.inc
> new file mode 100644
> index 0000000..55cbe03
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/arch-armv5.inc
> @@ -0,0 +1,51 @@
> +# Little Endian
> +AVAILTUNES += "armv5 armv5t armv5e armv5te"
> +TUNE_FEATURES_tune-armv5 ?= "armv5"
> +TUNE_FEATURES_tune-armv5t ?= "armv5 thumb"
> +PACKAGE_EXTRA_ARCHS_tune-armv5 = "${PACKAGE_EXTRA_ARCHS_tune-armv4} armv5"
> +PACKAGE_EXTRA_ARCHS_tune-armv5t = "${PACKAGE_EXTRA_ARCHS_tune-armv4t} armv5 armv5t"

There seems to be some duplication of AVAILTUNES going on here.

Also, I think this v5 stuff is more complex than it needs to be because
it seems to be trying to cater for architecture combinations that are
possible in theory but don't actually exist in the wild.  For example, I
can't immediately think of any ARMv5 implementations that lack Thumb or
the E instructions.

> +# Little Endian + VFP/DSP
> +AVAILTUNES += "armv5-vfp armv5t-vfp armv5hf-vfp armv5thf-vfp"

The comment doesn't seem to match the code here since this is the
section for chips without DSP.  Incidentally, the name "dsp" for this
feature seems quite a bad one: maybe we should just call it "armv5e".

p.




