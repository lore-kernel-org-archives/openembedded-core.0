Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TASe3-0008SM-AL
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Sep 2012 23:32:51 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TASRy-00077f-L6; Sat, 08 Sep 2012 23:20:22 +0200
Message-ID: <1347139096.4396.250.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Sat, 08 Sep 2012 22:18:16 +0100
In-Reply-To: <1905623.pDvREZZpJY@helios>
References: <cover.1346837268.git.liezhi.yang@windriver.com>
	<4a36b4005fc384ac817023873b2febc854c4415d.1346837268.git.liezhi.yang@windriver.com>
	<1347134935.4396.235.camel@x121e.pbcl.net> <1905623.pDvREZZpJY@helios>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 1/2] opkg svn: Add the --force-arch option
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
X-List-Received-Date: Sat, 08 Sep 2012 21:32:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-09-08 at 21:40 +0100, Paul Eggleton wrote:
> On Saturday 08 September 2012 21:08:55 Phil Blundell wrote:
> > a) for people who are not using O_P_M, it's becoming apparent that the
> > whole concept of using opkg (or rpm, or any other external package
> > manager) for rootfs construction is more of a liability than an asset
> > because bitbake has more knowledge about which particular binaries ought
> > to be installed.  For those use-cases, it might be better to think in
> > terms of abolishing opkg altogether which would solve this problem and a
> > variety of others.
> 
> On the other hand, using the package manager for rootfs construction for those 
> that *are* using online package management allows us to have at least some 
> confidence that a rootfs produced directly from the metadata and one produced 
> by on-system upgrades will be the same; you can also have package management 
> on in one image and off in another (or change it on the fly) and expect to have 
> the same contents, apart from the package manager being removed. The potential 
> for subtle differences in behaviour is too great to go down the path of 
> implementing it ourselves IMO, not to mention the extra code paths to 
> maintain.

I agree that for the folks who do want O_P_M, using the same package
manager for rootfs construction that they will use online is the only
sensible way to build images.  But it'd be interesting to consider what
proportion of the oe-core userbase genuinely requires O_P_M for their
usecase -- I suspect it's probably a minority nowadays and, personally,
I would consider it a fairly bad idea to ship a product which relied on
opkg-based O_P_M in anything other than a trivial way.

I've long been tempted to implement a pure bitbake-based rootfs
construction system for micro and get rid of opkg altogether.  This
would:

a) improve build time, since it would eliminate the (relatively slow)
opkg-make-index step.  In principle I think one could eliminate the
entire package_write_xx step as well since the necessary data for
installation can be recovered directly from sstate_xxx_package.tgz.

b) not make package choice subject to opkg's whims, and ensure that the
runtime dependency resolution matches what bitbake had decided to do
during the build

c) avoid a class of problems to do with stale data in deploy/ipk if the
package versions in the metadata go backwards (e.g. checking out an
older version or a different branch).

As you say, there would be a certain amount of work involved in making
this happen, but on the other hand bitbake does already carry out most
of the necessary dependency analysis in order to do the right thing with
statically-specified RDEPENDS in recipes.

p.




