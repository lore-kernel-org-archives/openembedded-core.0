Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UCWMR-00026p-TQ for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 15:27:30 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r24EIbxo008047; Mon, 4 Mar 2013 14:18:38 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MZUCajvXBRlp; Mon,  4 Mar 2013 14:18:37 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r24EIWHE008030
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 4 Mar 2013 14:18:35 GMT
Message-ID: <1362406238.29587.28.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Mon, 04 Mar 2013 14:10:38 +0000
In-Reply-To: <5134A4BD.9030201@windriver.com>
References: <cover.1362217827.git.liezhi.yang@windriver.com>
	<1362224344.11004.14.camel@ted> <5133852E.2010504@linux.intel.com>
	<513394C2.6030004@linux.intel.com> <5134A4BD.9030201@windriver.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: Darren Hart <dvhart@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/2] Fully support ext3/ext4 rootfs generation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Mar 2013 14:27:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-03-04 at 21:42 +0800, Robert Yang wrote:
> 
> On 03/04/2013 02:21 AM, Darren Hart wrote:
> >
> >
> > On 03/03/2013 09:15 AM, Darren Hart wrote:

> Yes, we do have hard links in the rootfs, e.g: core-image-sato and 
> core-image-sato-sdk:
> 
> # The sato
> $ find core-image-sato/1.0-r0/rootfs/ -type f -printf "%p %i %n\n" | grep -v '1$'
> core-image-sato/1.0-r0/rootfs/etc/terminfo/v/vt200 26977609 2
> core-image-sato/1.0-r0/rootfs/etc/terminfo/v/vt220 26977609 2
> core-image-sato/1.0-r0/rootfs/usr/bin/arm-poky-linux-gnueabi-ld.bfd 26978690 2
> core-image-sato/1.0-r0/rootfs/usr/bin/arm-poky-linux-gnueabi-ld 26978690 2

What if the count was 11? or 21? I'm just mentioning we need to improve
that command!

> # The sato-sdk:
> $ find core-image-sato-sdk/1.0-r0/rootfs/ -type f -printf "%p %i %n\n" | grep -v 
> '1$'
> core-image-sato-sdk/1.0-r0/rootfs/etc/terminfo/v/vt200 26903519 2
> core-image-sato-sdk/1.0-r0/rootfs/etc/terminfo/v/vt220 26903519 2
> core-image-sato-sdk/1.0-r0/rootfs/usr/include/et/com_err.h 28058656 2
> core-image-sato-sdk/1.0-r0/rootfs/usr/include/com_err.h 28058656 2
> core-image-sato-sdk/1.0-r0/rootfs/usr/bin/arm-poky-linux-gnueabi-ld.bfd 26900939 2
> core-image-sato-sdk/1.0-r0/rootfs/usr/bin/perlbug 26899680 2
> core-image-sato-sdk/1.0-r0/rootfs/usr/bin/gawk-4.0.1 26900368 2
> core-image-sato-sdk/1.0-r0/rootfs/usr/bin/psed 26899667 2
> core-image-sato-sdk/1.0-r0/rootfs/usr/bin/s2p 26899667 2
> core-image-sato-sdk/1.0-r0/rootfs/usr/bin/c2ph 26899695 2
> core-image-sato-sdk/1.0-r0/rootfs/usr/bin/perlthanks 26899680 2
> core-image-sato-sdk/1.0-r0/rootfs/usr/bin/pstruct 26899695 2
> core-image-sato-sdk/1.0-r0/rootfs/usr/bin/arm-poky-linux-gnueabi-ld 26900939 2
> core-image-sato-sdk/1.0-r0/rootfs/usr/bin/gawk 26900368 2

I'm slightly surprised there aren't more hardlinks for gcc in here. A
meta-toolchain-sdk tarball will probably have a load of hardlinks in too
if you want something to test with (we don't usually make extX images
for the toolchain though).

Cheers,

Richard



