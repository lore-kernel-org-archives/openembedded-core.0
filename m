Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QnsOt-0001fa-1S for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 15:19:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p71DF02g007344
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 14:15:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07326-01 for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2011 14:14:56 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p71DEqJL007338
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 14:14:52 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <d383462fb2d94c991d3d67ab07f444b0d6ac2c3a.1312182844.git.sgw@linux.intel.com>
References: <cover.1312182844.git.sgw@linux.intel.com>
	<d383462fb2d94c991d3d67ab07f444b0d6ac2c3a.1312182844.git.sgw@linux.intel.com>
Date: Mon, 01 Aug 2011 14:14:39 +0100
Message-ID: <1312204479.2344.442.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 22/22] feature-arm-thumb: Take ARM_INSTRUCTION_SET into account to decide thumb mode
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
X-List-Received-Date: Mon, 01 Aug 2011 13:19:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-01 at 00:36 -0700, Saul Wold wrote:
> From: Khem Raj <raj.khem@gmail.com>
> 
> This will decouple the compiling in thumb mode from having thumb
> capable cores.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../conf/machine/include/arm/feature-arm-thumb.inc |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> index e7d392e..533eab9 100644
> --- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
> +++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> @@ -4,9 +4,11 @@
>  # encoded RISC sub-set. Thumb code is smaller (maybe 70% of the ARM size)
>  # but requires more instructions (140% for 70% smaller code) so may be
>  # slower.
> -TUNEVALID[thumb] = "Use thumb instructions instead of ARM"
> -ARM_THUMB_M_OPT = "${@['-mno-thumb', '-mthumb'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) == 'thumb']}"
> +TUNEVALID[thumb] = "Use thumb instructions instead of ARM if ARM_INSTRUCTION_SET != arm"
> +ARM_THUMB_M_OPT = "${@['-mthumb', '-mno-thumb'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) != 'arm']}"
>  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "${ARM_THUMB_M_OPT}", d)}"
> +
> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb", "-mthumb", "-mno-thumb", d)}"
>  OVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "thumb", ":thumb", "", d)}"
>  
>  # Note armv7 will hit on armv7a as well

The original change committed into master in my absence is broken. This
patch is just making things even worse and more broken :(

I suspect what people really wanted was:

TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "-mno-thumb", d)}"

Cheers,

Richard



