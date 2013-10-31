Return-Path: <heinold@mi.fu-berlin.de>
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
	[130.133.4.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7BCE861957
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 08:10:06 +0000 (UTC)
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.80.1)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1VbnKP-003rpD-Vl>; Thu, 31 Oct 2013 09:10:06 +0100
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.80.1)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1VbnKP-000lXK-Sj>; Thu, 31 Oct 2013 09:10:05 +0100
Received: from heinold by andorra.imp.fu-berlin.de with local (internal_ws
	Exim 4.80) id 1VbnKO-0006i9-Lx
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 09:10:04 +0100
Date: Thu, 31 Oct 2013 09:10:04 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-core@lists.openembedded.org
Message-ID: <20131031081004.GA25741@mi.fu-berlin.de>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: [PATCH 1/1] iproute2: explicitly add 'bash' to its RDEPENDS]
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
X-List-Received-Date: Thu, 31 Oct 2013 08:10:07 -0000
X-Groupsio-MsgNum: 46443
Content-Type: message/rfc822
Content-Disposition: inline


On Wed, Oct 30, 2013 at 10:07:46AM +0800, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
> 
> If we build a minimal image with iproute2 installed, the following
> error will appear during rootfs.
> 
> error: Can't install iproute2-3.10.0-r0.0@i586: no package provides /bin/bash
> 
> The problem is that iproute2 has an implicit dependency on 'bash'.
> This dependency is from per-file dependency checking. But as 'bash'
> is not explicitly specified in the RDEPENDS in recipe, it's not built.
> This leads to the above error.
> 
> Fix this problem by explicitly adding 'bash' to the RDEPENDS.
> 
> [YOCTO #5415]
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-connectivity/iproute2/iproute2.inc |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
> index 3db21db..40f6a6c 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2.inc
> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
> @@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
>                      file://ip/ip.c;beginline=3;endline=8;md5=689d691d0410a4b64d3899f8d6e31817"
>  
>  DEPENDS = "flex-native bison-native iptables"
> +RDEPENDS_${PN} = "bash"
>  
>  inherit update-alternatives
>  
> -- 
> 1.7.9.5

Hi,

there is only one script rtpr which "needs" bash with the following content:

#! /bin/bash

exec tr "[\\\\]" "[
]"

So in my opinion it is not worth to include bash for that and there
should be a simpler solution.

Bye Henning

