Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TCekO-0006Vy-8m
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Sep 2012 00:52:28 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TCeYC-0002lg-DQ; Sat, 15 Sep 2012 00:39:52 +0200
Message-ID: <1347662258.4444.34.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Fri, 14 Sep 2012 23:37:38 +0100
In-Reply-To: <5053AFAB.6000409@windriver.com>
References: <1347643776-4028-1-git-send-email-paul.eggleton@linux.intel.com>
	<1347659456.4444.1.camel@x121e.pbcl.net>
	<5053A818.4070402@windriver.com>
	<1347660202.4444.10.camel@x121e.pbcl.net>
	<5053ABF3.8010708@windriver.com>
	<1347660965.4444.17.camel@x121e.pbcl.net>
	<5053AFAB.6000409@windriver.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xserver-xorg: remove broken RREPLACES
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
X-List-Received-Date: Fri, 14 Sep 2012 22:52:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-14 at 17:28 -0500, Mark Hatle wrote:
> Based on that, I'm not sure what RREPLACES is being used for:
> 
> FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards 
> ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so 
> ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt 
> ${datadir}/X11/xorg.conf.d"
> 
> Since under the packaging rules, that one file will only exist in the one 
> package, and it won't ever exist in both packages.
> 
> So Replaces is wrong under either definition from what I can tell.

The point is that it was in older versions of xserver-xorg.  It's indeed
not in the current version, and in fact it can't be since (due to the
way that FILES works) there is no way for a single file to end up in
more than one of the PACKAGES for a given recipe.

In the particular case at hand I think the problem is relatively minor,
since folks who have an old xserver-xorg installed can upgrade by first
installing the new xserver-xorg (which doesn't ship libexa.so) and then
installing xserver-xorg-module-exa.  But, if the new xserver-xorg had
depended on xserver-xorg-module-exa then this wouldn't have worked
without the RREPLACES.

p.




