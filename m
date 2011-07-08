Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QfHdj-0007hC-FG for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 22:27:07 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1QfHa0-0007US-HW
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 22:23:16 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94DE226629@orsmsx504.amr.corp.intel.com>
References: <1310139697.6337.134.camel@phil-desktop>
	<1310143750.20015.911.camel@rex>
	<9DA5872FEF993D41B7173F58FCF6BE94DE226629@orsmsx504.amr.corp.intel.com>
Date: Fri, 08 Jul 2011 21:23:08 +0100
Message-ID: <1310156588.18564.21.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: eglibc issuettes continued
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
X-List-Received-Date: Fri, 08 Jul 2011 20:27:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The reason for the bogus dependencies is that these files are landing in
libc6-dev rather than the places where they ought to be:

-rwxr-xr-x root/root     42592 2011-07-08 20:16 ./lib/libnss_nis.so.2
-rwxr-xr-x root/root     30408 2011-07-08 20:16 ./lib/libthread_db.so.1
-rwxr-xr-x root/root     50748 2011-07-08 20:16 ./lib/libnss_nisplus.so.2

I'm not quite sure what's going on there.  The FILES look okay, so I
wonder if perhaps it's an issue with symlink snapping.  I'll investigate
more over the weekend if I have some time.

p.

On Fri, 2011-07-08 at 09:59 -0700, Kamble, Nitin A wrote:
> I sent a patch to fix /etc/localtime & /etc/rpc files. Other than that I am not seeing any issues for the eglibc recipe packaging.
> 
> Nitin
> 
> 
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > Richard Purdie
> > Sent: Friday, July 08, 2011 9:49 AM
> > To: Patches and discussions about the oe-core layer
> > Subject: Re: [OE-core] eglibc issuettes continued
> > 
> > On Fri, 2011-07-08 at 16:41 +0100, Phil Blundell wrote:
> > > I'm not sure whether there are pending patches which will address
> > these
> > > or not, but with a fresh pull from today I'm still not getting very
> > good
> > > packaging for eglibc 2.13.  Specifically:
> > >
> > > WARNING: For recipe eglibc, the following files were installed but
> > not
> > > shipped in any package:
> > > WARNING:   /etc/localtime
> > > WARNING:   /etc/rpc
> > > WARNING:   /etc/ld.so.conf
> > > WARNING:   /lib/gconv/ISO-2022-CN-EXT.so
> > > WARNING:   /lib/gconv/IBM921.so
> > > [... etc ...]
> > > WARNING:   /lib/gconv/.debug/ISO-2022-CN-EXT.so
> > > WARNING:   /lib/gconv/.debug/IBM921.so
> > > [... etc ...]
> > > WARNING:   /share/i18n/charmaps/ISO-8859-15.gz
> > > WARNING:   /share/i18n/charmaps/IBM285.gz
> > > [... etc ...]
> > > WARNING:   /share/i18n/locales/ss_ZA
> > > WARNING:   /share/i18n/locales/is_IS
> > > [... etc ...]
> > > WARNING: QA Issue: libc-extra-nss rdepends on eglibc-dev
> > > WARNING: QA Issue: libc-thread-db rdepends on eglibc-dev
> > > ERROR: QA run found fatal errors. Please consider fixing them.
> > >
> > > I'm not sure if these are actually new or not, though.  It's possible
> > > that they've been there for ages and I only just noticed.
> > 
> > I'm guessing something is going wrong with prefixes somewhere. I'm
> > certainly not seeing the bulk of those locally...
> > 
> > Cheers,
> > 
> > Richard
> > 
> > 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




