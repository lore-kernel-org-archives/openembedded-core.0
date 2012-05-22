Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SWp4r-0000Fw-7Z for openembedded-core@lists.openembedded.org;
	Tue, 22 May 2012 15:24:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4MDEWVd001607;
	Tue, 22 May 2012 14:14:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31894-07; Tue, 22 May 2012 14:14:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4MDEMqW001600
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 22 May 2012 14:14:24 +0100
Message-ID: <1337692461.10942.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 22 May 2012 14:14:21 +0100
In-Reply-To: <23F3463C-1206-424C-B269-6D87EA479D57@dominion.thruhere.net>
References: <cover.1337681343.git.liezhi.yang@windriver.com>
	<dc94c1bb359b466c779a11fd8559851a8c6ea5d2.1337681343.git.liezhi.yang@windriver.com>
	<23F3463C-1206-424C-B269-6D87EA479D57@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] tune-core2.inc: PACKAGE_EXTRA_ARCHS causes wrong packages install into image
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
X-List-Received-Date: Tue, 22 May 2012 13:24:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-05-22 at 12:30 +0200, Koen Kooi wrote:
> Op 22 mei 2012, om 12:15 heeft Robert Yang het volgende geschreven:
> 
> > There is a bug if we:
> > 1) bitbake diffutils with MACHINE=crownbay
> > 2) bitbake diffutils with MACHINE=qemux86
> > 3) bitbake core-image-sato with MACHINE=crownbay
> > 
> > Then the diffutils.i586 would be installed to the crownbay's image, this
> > is because diffutils.i586 is newer than diffutils.core2, both of
> > deploy/rpm/i586 and deploy/rpm/core2 are in the dbpath, so rpm will
> > select the newer one (diffutils.i586). This caused by:
> > 
> > PACKAGE_EXTRA_ARCHS_tune-core2 = "${PACKAGE_EXTRA_ARCHS_tune-x86} i386 i486 i586 i686 core2"
> > 
> > The PACKAGE_EXTRA_ARCHS will cause the deploy/rpm/i586 in the crownbay's
> > dbpath, so any pkg which is needed by the image of both crownbay and
> > qemux86, if the i586 one is newer than the core2, it would be installed
> > into crownbay's image.
> 
> This is a bug in RPM not respecting the arch priorities. Changing PACKAGE_EXTRA_ARCHS is the wrong way to 'fix' that.

Agreed, the core2 package should have higher priority compared to the
i586 package and be the one that "wins" and gets installed. This is a
bug in the rpm package/rootfs backend that needs to get fixed.

Cheers,

Richard




