Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SC7os-0001Bs-7Q for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 13:10:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2QB1d2h024531
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 12:01:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20450-05 for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 12:01:35 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2QB1Tow024524
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 12:01:30 +0100
Message-ID: <1332759689.28414.104.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 26 Mar 2012 12:01:29 +0100
In-Reply-To: <1332694123-5078-1-git-send-email-raj.khem@gmail.com>
References: <1332694123-5078-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] tune/armv7: Add -mthumb to TUNE_CCARGS
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
X-List-Received-Date: Mon, 26 Mar 2012 11:10:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-03-25 at 09:48 -0700, Khem Raj wrote:
> armv7 is least common denominator of armv7-a
> armv7-m and armv7-r and armv7-m does not support
> ARM instructions but only thumb2 instruction set
> which means armv7 when chosen will complain if
> code is compiled in arm mode which is default
> in OE if not specified other wise
> 
> Fixes errors like below
> 
> error: target CPU does not support ARM mode
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/machine/include/arm/arch-armv7.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/conf/machine/include/arm/arch-armv7.inc b/meta/conf/machine/include/arm/arch-armv7.inc
> index 33d9f0d..563a6b4 100644
> --- a/meta/conf/machine/include/arm/arch-armv7.inc
> +++ b/meta/conf/machine/include/arm/arch-armv7.inc
> @@ -4,7 +4,7 @@ ARMPKGARCH ?= "armv7"
>  
>  TUNEVALID[armv7] = "Enable instructions for ARMv7"
>  TUNE_CONFLICTS[armv7] = "armv4 armv5 armv6"
> -TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7", "-march=armv7", "", d)}"
> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7", "-march=armv7 -mthumb", "", d)}"
>  MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "armv7", ":armv7", "" ,d)}"
>  
>  require conf/machine/include/arm/arch-armv6.inc

Looking at this file, if the above is true and armv7 can't do anything
other than thumb, shouldn't we just delete the non-thumb configurations
for "armv7"?

Adding in "thumb" to the TUNE_FEATURES should add the -mthumb it needs
to work.

Cheers,

Richard




