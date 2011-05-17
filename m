Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QMTWu-0000RC-Hx for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 01:18:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HNFRIv021720
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 00:15:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21281-08 for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 00:15:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HNFFek021705
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 00:15:15 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DD2FE07.4030708@linux.intel.com>
References: <4DD2FE07.4030708@linux.intel.com>
Date: Wed, 18 May 2011 00:15:13 +0100
Message-ID: <1305674113.3424.292.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC PATCH] u-boot: remove UBOOT_MACHINE and COMPATIBLE_MACHINES
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
X-List-Received-Date: Tue, 17 May 2011 23:18:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-17 at 16:00 -0700, Darren Hart wrote:
> oe-core does not define any machines, so it does not make sense to
> add machine specific information in the oe-core u-boot recipe and
> infrastructure.
> 
> Since every machine wishing to use the u-boot recipe would need to add itself to
> COMPATIBLE_MACHINES, typically via a bbappend recipe, the mechanism loses any
> utility it may have had and unecessarily complicates using the u-boot recipe. By
> removing it, we simplify the task of adding support for new machines.

NAK.

This break usability of things like "bitbake world" since all of a
sudden it will try and build u-boot in cases where it makes no sense
(qemu* machines for example).

I know it sounds strange but we do want this recipe enabled on a case by
case basis (and we have the beagleboard as a reference platform using it
which is handy). This means the default of no supported machine is
correct even if it looks odd.

Having the recipe deselect itself (raise a skip parsing event) if
UBOOT_MACHINE isn't set instead of using COMPATIBLE_MACHINE would be
acceptable though.

Cheers,

Richard



