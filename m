Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qnsux-0002bO-CA for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 15:52:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p71Dm38Y007594;
	Mon, 1 Aug 2011 14:48:03 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07326-05; Mon,  1 Aug 2011 14:47:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p71DlsLl007588
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 1 Aug 2011 14:47:55 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1312206102-16094-1-git-send-email-koen@dominion.thruhere.net>
References: <1312206102-16094-1-git-send-email-koen@dominion.thruhere.net>
Date: Mon, 01 Aug 2011 14:47:41 +0100
Message-ID: <1312206461.2344.457.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH v2] arch-armv7a.inc: fix armv7a-vfp-neon -> armv7a compat case
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
X-List-Received-Date: Mon, 01 Aug 2011 13:52:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-01 at 15:41 +0200, Koen Kooi wrote:
> Without this 'armv7a' is used as TUNE_ARCH but does *not* end up in PACKAGE_EXTRA_ARCHS:
> 
> arch all 1
> arch any 6
> arch noarch 11
> arch arm 16
> arch armv4 21
> arch armv4t 26
> arch armv5 31
> arch armv5t 36
> arch armv5-vfp 41
> arch armv5t-vfp 46
> arch armv5e 51
> arch armv5te 56
> arch armv5e-vfp 61
> arch armv5te-vfp 66
> arch armv6-vfp 71
> arch armv6t-vfp 76
> arch armv7-vfp 81
> arch armv7t2-vfp 86
> arch armv7a-vfp 91
> arch armv7at2-vfp 96
> arch armv7a-vfp-neon 101
> arch armv7at2-vfp-neon 106
> arch beagleboard 111
> 
> Which leads to a failing do_rootfs
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/conf/machine/include/arm/arch-armv7a.inc |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
> index ce9cee5..704f86b 100644
> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
> @@ -14,9 +14,9 @@ TUNE_FEATURES_tune-armv7a ?= "armv7a vfp"
>  TUNE_FEATURES_tune-armv7at ?= "armv7a vfp thumb"
>  TUNE_FEATURES_tune-armv7a-neon ?= "armv7a vfp neon"
>  TUNE_FEATURES_tune-armv7at-neon ?= "armv7a vfp neon thumb"
> -PACKAGE_EXTRA_ARCHS_tune-armv7a = "${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7a-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv7a = "${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7a armv7a-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-armv7a-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv7a-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-armv7at = "${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7a-vfp armv7at2-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv7at = "${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7a armv7a-vfp armv7at2-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-armv7at-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfp-neon armv7at2-vfp-neon"

I didn't spell it out but you still need the b versions too for the
equivalent lines ;-)

Cheers,

Richard




