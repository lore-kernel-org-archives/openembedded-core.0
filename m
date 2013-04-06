Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UObRC-0003ti-0n for openembedded-core@lists.openembedded.org;
	Sun, 07 Apr 2013 00:18:19 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r36MBpgC021378; Sat, 6 Apr 2013 23:11:52 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id htFKm0JS3YSE; Sat,  6 Apr 2013 23:11:51 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r36MBiXp021371
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sat, 6 Apr 2013 23:11:47 +0100
Message-ID: <1365285646.6526.208.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 06 Apr 2013 23:00:46 +0100
In-Reply-To: <AB22E165-191E-4930-929D-E6B277A265F4@dominion.thruhere.net>
References: <1365006329-20964-1-git-send-email-radu.moisan@intel.com>
	<1365006329-20964-3-git-send-email-radu.moisan@intel.com>
	<825B3AFA-0F5B-45F2-B4DE-D359A1E4414B@dominion.thruhere.net>
	<515D75D5.4020204@intel.com>
	<1B3FBA45-5658-4BF8-A854-84058F80DCBF@dominion.thruhere.net>
	<515EBCA1.6000502@intel.com>
	<CAL7ttbc2VXkMz79oyHt69E0wsSvEYqndNHSQMLCDO56TF6v=og@mail.gmail.com>
	<1365172473.6526.195.camel@ted>
	<AB22E165-191E-4930-929D-E6B277A265F4@dominion.thruhere.net>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] udev: enable multilib support
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
X-List-Received-Date: Sat, 06 Apr 2013 22:18:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2013-04-06 at 12:32 +0200, Koen Kooi wrote:
> Op 5 apr. 2013, om 16:34 heeft Richard Purdie <richard.purdie@linuxfoundation.org> het volgende geschreven:
> 
> > On Fri, 2013-04-05 at 16:29 +0300, Alex Damian wrote:
> >> On udev-184 they changed the default location from /sbin/
> >> to /lib/udev/ and I kept same as the upstream is.
> > 
> > Firstly, I know some people did ask me questions offlist about this and
> > I probably gave misleading answers. I thought this was a problem with
> > the location of the rules directory initially. We need to have one rules
> > directory regardless of multilibs.
> > 
> > Binaries however are a very different question. The multilib code we
> > have in OE is complex and does make some assumptions about layout, not
> > least as we have to interface into several package managers and also
> > work with all their assumptions. The situation is that:
> > 
> > * library files are expected to go into /libX
> > * binaries are expected to go into the usual bin/sbin dirs
> > * files in /etc, /usr/share and other similar directories are expected 
> >  to be identical
> > * We have sanity tests which check for these things
> > 
> > The package managers are taught to let certain packages "win" in
> > bin/sbin and to error if overlapping files outside this are not
> > identical.
> > 
> > It therefore follows that we would have to start adding exceptions to
> > this code if we have potential for both 32 bit and 64 bit /lib/udev/
> > binaries. We'd also have to add rules about which one would be expected
> > to "win" under which circumstances and so on.
> > 
> > To me, the simplest solution here is to point libexec dir at /sbin so
> > that we have /sbin/udev/ since this then works with the various multilib
> > rules. It means a user can install the 64 bit and 32 bit multilibs for
> > udev in parallel (for libudev for example) and that things should all
> > work correctly.
> > 
> > I appreciate upstream don't agree with that approach but equally they
> > don't have the generic multilib support we have to worry about. Hacking
> > the multilib code to pieces just to match upstream in this case is going
> > to be a lot more painful, I appreciate its the not optimal solution
> > though.
> 
> 
> FWIW, the udev *libraries* (libudev, libgudev, etc) go in
> $prefix/lib64 on 64 bit machines, the udev *binaries* into /lib. So
> multi*lib* should work.

Which is effectively what I said.

multilib package A has binary X in /lib. multilib package also B has
binary X in /lib. Package A and B cannot be installed at the same time
(package managers can't cope) and the sanity tests will fail.

Sure, we can force the libraries to be in separate packages. There is no
mechanism to force conflicts between two different multilibs easily
though and the system can still end up trying to install both packages
with conflicting binaries which it needs a resolution to.

So either we set udev to use paths which don't overlap with the lib
handling or we hack the multilib code, each of the package managers and
sanity tests.

Cheers,

Richard




