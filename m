Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QzDGn-00011H-GU
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Sep 2011 21:49:49 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QzDC3-0006iS-Rn
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Sep 2011 21:44:55 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E5FBFEC.3060406@windriver.com>
References: <cover.1306865217.git.scott.a.garman@intel.com>
	<7826575ce92090c4460c7d016e0b06441f84cff7.1306865217.git.scott.a.garman@intel.com>
	<1314895291.19905.197.camel@phil-desktop>
	<4E5FB8AC.1070007@windriver.com>
	<1314896288.19905.199.camel@phil-desktop>
	<4E5FBFEC.3060406@windriver.com>
Date: Thu, 01 Sep 2011 20:44:49 +0100
Message-ID: <1314906289.2958.7.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 2/7] shadow: add a -native recipe with customized utilities
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
X-List-Received-Date: Thu, 01 Sep 2011 19:49:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-01 at 12:25 -0500, Mark Hatle wrote:
> On 9/1/11 11:58 AM, Phil Blundell wrote:
> > And, I guess, if you want to support online package management then it
> > does make some sense to have the shadow utils there.  But I don't
> > need/want that in my configuration.
> 
> Does busybox or something else provide a compatible adduser?  If so maybe a
> virtual RDEPENDS is more reasonable in this case.

I'm not sure offhand (it's actually useradd, not adduser, for what
that's worth) but, even if busybox does provide those applets, that
probably isn't quite the point.  The issue here is that I don't really
want to have any implementation of useradd at all on the target system;
using one from busybox would be a bit less bad than requiring standalone
shadow, but still not really ideal.

One workaround would be to weaken the RDEPENDS to an RRECOMMENDS, which
would allow me to declare it as a BAD_RECOMMENDATION.  Or I guess we
could make it be a virtual and I could then provide a dummy-useradd
package which satisfies the dependency but doesn't actually install any
files.  

The approach we take with update-rc.d is to let it be installed and then
have rootfs_ipk rip it back out again after image construction is done,
but this won't work with shadow as it stands due to the postinst issue
in that package.  So a third option would be to find a way to finesse
the postinst thing somehow and then use the same rootfs_ipk logic with
shadow too.

None of those really sound very appealing.  Anybody have a better idea?

p.




