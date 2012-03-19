Received: from smtpout.karoo.kcom.com ([212.50.160.34])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mac@mcrowe.com>) id 1S9bHN-0006OV-LB
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 13:01:37 +0100
X-IronPort-AV: E=Sophos;i="4.73,611,1325462400"; d="scan'208";a="606402843"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 19 Mar 2012 11:52:37 +0000
Received: from mac by deneb.mcrowe.com with local (Exim 4.72)
	(envelope-from <mac@mcrowe.com>) id 1S9b8e-0000Zd-R1
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 11:52:36 +0000
Date: Mon, 19 Mar 2012 11:52:36 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120319115236.GA1947@mcrowe.com>
References: <1331915573-28368-1-git-send-email-mac@mcrowe.com>
	<BE489DAB-2E22-4B8F-A565-10C5DF842857@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <BE489DAB-2E22-4B8F-A565-10C5DF842857@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] libc-common: Apply Debian-naming to libc debug symbols too
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
X-List-Received-Date: Mon, 19 Mar 2012 12:01:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Op 16 mrt. 2012, om 17:32 heeft Mike Crowe het volgende geschreven:
> > The magic in rootfs_ipk.bbclass expects to generate debug package
> > names by just appending '-dbg'.

It turns out that the above was a local change so that statement was
incorrect. Nevertheless the change probably makes sense anyway.

> >                                 This breaks for eglibc because whilst
> > the binary package has been renamed to libc6 the debug package is
> > still called libc-dbg. This patch ensures that the debug package is
> > renamed too.
> > ---
> > meta/classes/libc-common.bbclass |    1 +
> > 1 files changed, 1 insertions(+), 0 deletions(-)
> > 
> > diff --git a/meta/classes/libc-common.bbclass b/meta/classes/libc-common.bbclass
> > index 962f205..d0c1ab4 100644
> > --- a/meta/classes/libc-common.bbclass
> > +++ b/meta/classes/libc-common.bbclass
> > @@ -27,4 +27,5 @@ python populate_packages_prepend () {
> > 		bpn = d.getVar('BPN', True)
> > 		d.setVar('PKG_'+bpn, 'libc6')
> > 		d.setVar('PKG_'+bpn+'-dev', 'libc6-dev')
> > +		d.setVar('PKG_'+bpn+'-dbg', 'libc6-dbg')
> > }
 
On Fri, Mar 16, 2012 at 08:39:00PM +0100, Koen Kooi wrote:
> Missing PR bump

On eglibc?

>                 and broken upgrade path.

I'm having trouble coming up with a way to solve that. I think the
libc6-dbg package needs to RPROVIDE, RREPLACE and RCONFLICT with
libc-dbg but if I add the following:

  d.setVar('RPROVIDES_' + bpn + '-dbg', bpn + '-dbg')
  d.setVar('RCONFLICTS_' + bpn + '-dbg', bpn + '-dbg')
  d.setVar('RREPLACES_' + bpn + '-dbg', bpn + '-dbg')

Then the package names undergo translation and I get:

  Provides: libc6-dbg
  Replaces: libc6-dbg
  Conflicts: libc6-dbg

Which is clearly wrong. :(

How would you recommend I provide backward compatibility for this
change (assuming it is still seen as desirable?)

Thanks for your comments.

Mike.


