Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SsBDu-0001Wx-2V for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 13:18:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6KB6sKJ011669
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 12:06:54 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09727-05 for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 12:06:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6KB6ksp011659
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 12:06:48 +0100
Message-ID: <1342782398.21788.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 20 Jul 2012 12:06:38 +0100
In-Reply-To: <20120720104117.GE3534@jama.jama.net>
References: <lyk3xy7mlu.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20120720104117.GE3534@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Broken parallel build of gcc*
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
X-List-Received-Date: Fri, 20 Jul 2012 11:18:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-07-20 at 12:41 +0200, Martin Jansa wrote:
> On Fri, Jul 20, 2012 at 12:28:29PM +0200, Enrico Scholz wrote:
> > Hi,
> > 
> > some of the recent changes seem to break the parallel build of the gcc*
> > recipes which are sharing a same source directory:
> > 
> > | $ ./bitbake gcc-cross-initial gcc-cross-intermediate gcc-cross -c cleansstate
> > | $ BB_NUMBER_THREADS=3 ./bitbake gcc-cross-initial gcc-cross-intermediate gcc-cross
> > | ...
> > | NOTE: package gcc-cross-initial-4.7.1.0+git1+d07e24f4ab59f264d68d21838795349faab5dede-r7: task do_unpack: Started
> > | NOTE: package gcc-cross-4.7.1.0+git1+d07e24f4ab59f264d68d21838795349faab5dede-r7: task do_unpack: Started
> > | NOTE: package gcc-cross-initial-4.7.1.0+git1+d07e24f4ab59f264d68d21838795349faab5dede-r7: task do_unpack: Succeeded
> > | ERROR: Error executing a python function in ...recipes-devtools/gcc/gcc-cross_4.7.bb:
> > | OSError: [Errno 39] Directory not empty: '...tmp/work-shared/gcc-4.7.1.0+git1+d07e24f4ab59f264d68d21838795349faab5dede-r7/git/'
> > | NOTE: package gcc-cross-4.7.1.0+git1+d07e24f4ab59f264d68d21838795349faab5dede-r7: task do_unpack: Failed
> > 
> > It seems that the work-shared/ directory is not locked and cleaned when
> > starting the second unpack.
> 
> I can confirm the same
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/026174.html

The autobuilder is not seeing this and I'm not seeing it locally either.

This would imply there is some difference in configuration which is
triggering it. rm_work* is a possibility, as could ASSUME_PROVIDED
settings potentially although unlikely.

Encrico: Which DISTRO are you using and do you use rm_work*.bbclass?

Cheers,

Richard





