Return-Path: <tanuk@iki.fi>
X-Greylist: delayed 515 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 05 Dec 2018 11:26:31 UTC
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
	[64.147.123.26])
	by mail.openembedded.org (Postfix) with ESMTP id 9E884607A5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 11:26:31 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.west.internal (Postfix) with ESMTP id B4E3F964;
	Wed,  5 Dec 2018 06:17:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute5.internal (MEProxy); Wed, 05 Dec 2018 06:17:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=4IzmsvuTx7XsUGYxy3f+myYVrdwmK48uCXxMndpuD
	Us=; b=LpvFWXrMQnN6HsnmK6d6TU6kDBu3H9WixfUcQWo9th5ICnqOmDDiowTSr
	vuF5AGkyw549YxdNjZcqz4DSFOOltNquTYkPInLw0YY/jsKYWuNBgFIIgxTeUL6p
	0CnClsAOBAaPQKuV+YTtU/1yxVDQCMBBG4Pt0wD31QNELNMznjZBh6HiTCPEDqho
	MBkw1IGKbQXKr1AyxGPWcJkWvOdVXAGfbzn/lZ3eKMmtnJWlT7U8/UfkJ+2mo0SW
	hMdhG4fUZhUJVWTJ420dIu0RKGkEPw5gpIbfdLAH3Dq/hHjnHisAqz8rzN/B3GaX
	QfFoUW6kDreT00u0SVDpPohu8veYg==
X-ME-Sender: <xms:5LMHXLAc0oK4gojrAW7YDpCjuv5rUsnRZZqjUuQMzPf-CnSwVA1DCg>
X-ME-Proxy: <xmx:5LMHXDM1lcup-utLGn63EfCtEsPG2X1_cB_R5fEDeBFBvHr67oMbwg>
	<xmx:5LMHXOgP6Lw3SPa6sK32FWU8dS_a34qVAfpU_CIfIvbF-CLrNOG2gQ>
	<xmx:5LMHXDdE1hpCfdUpDgCR-vCNAoC3nD9wlFnT1KoFIfhVOeMrjJ0HlQ>
	<xmx:5LMHXBaKcV82bSS_qDmOkD4lXl_CeHI5yAeqtV3E1VEuP7VNMAJc0w>
	<xmx:5LMHXEk7VOhFqtRiPYIGSvb7O4DIalXTpzXX0FOkJe_XhArqEXs13w>
	<xmx:5bMHXPQ03jIjYgnQEsA1GGmYGwPkUWx0N4IDZJREhhq5E0BCo86iaiHqjPZhRPJF>
Received: from laptop (unknown [192.40.95.35])
	by mail.messagingengine.com (Postfix) with ESMTPA id 217A9102ED;
	Wed,  5 Dec 2018 06:17:56 -0500 (EST)
Message-ID: <4223eed0c893c2ff80546d68e3d524bc5004f11d.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Wed, 05 Dec 2018 13:17:41 +0200
In-Reply-To: <1543975908-38890-1-git-send-email-hongxu.jia@windriver.com>
References: <1543975908-38890-1-git-send-email-hongxu.jia@windriver.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] pulseaudio: improve reproducibility
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
X-List-Received-Date: Wed, 05 Dec 2018 11:26:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-12-05 at 10:11 +0800, Hongxu Jia wrote:
> Remove build host paths from generated binaries, the modification
> is harmless for build time compiling and runtime executing.
> 
> [YOCTO #12638]
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../pulseaudio/0001-improve-reproducibility.patch  | 50 ++++++++++++++++++++++
>  .../pulseaudio/pulseaudio_12.2.bb                  |  1 +
>  2 files changed, 51 insertions(+)
>  create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-improve-reproducibility.patch
> 
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-improve-reproducibility.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-improve-reproducibility.patch
> new file mode 100644
> index 0000000..b13adb2
> --- /dev/null
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-improve-reproducibility.patch
> @@ -0,0 +1,50 @@
> +From e03d1d77471ee16c149590dd97085cf54be1e261 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Tue, 4 Dec 2018 16:29:18 +0800
> +Subject: [PATCH] improve reproducibility
> +
> +- Do not define PA_CFLAGS with $CFLAGS which contains build host path,
> +  macro PA_CFLAGS is used for debug log, the modification is harmless;
> +
> +- Tweak definition of PA_BUILDDIR and PA_SRCDIR with relative directory,
> +  it is also harmless;

I believe changing PA_BUILDDIR and PA_SRCDIR to relative directories
actually breaks the things that use those definitions. PA_BUILDDIR is
compared to the /proc/self/exe symlink target, which is an absolute
path. The definitions are needed when running PulseAudio from the
source tree without installing, so the breakage doesn't really matter
in OE, but it would be better to set them to values that clearly don't
work rather than something that looks like is intended to work but
actually doesn't.

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk


