Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id ACCF76E786
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 21:29:10 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1WV6F4-00059X-9G; Tue, 01 Apr 2014 23:29:10 +0200
Message-ID: <1396387742.3038.34.camel@e130.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue, 01 Apr 2014 22:29:02 +0100
In-Reply-To: <1396374702.2910.27.camel@ted>
References: <8672BB614B4CCA40A6B3BDD6FD82050B575445A7@COSNADEXC13.usr.ingenico.loc>
	<1396374241.5879.50.camel@phil-desktop.brightsign>
	<1396374515.5879.54.camel@phil-desktop.brightsign>
	<1396374702.2910.27.camel@ted>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.8.5-2+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview:  On Tue, 2014-04-01 at 18:51 +0100,
	Richard Purdie wrote: > On Tue, 2014-04-01 at 18:48 +0100,
	Phil Blundell wrote: > > Also note that
	the default for USE_DEVFS was (and is) 1,
	so the lack > > of this check is
	actually causing a difference in the default > > behaviour. If there's
	no
	appetite for reinstating the USE_DEVFS > > mechanism per se then it
	seems
	like it would be a good idea to make > > the default IMAGE_DEVICE_TABLE
	be
	blank in order to restore the > > previous default of no /dev in the
	rootfs.
	> > > > At present you get a somewhat arbitrary-seeming smattering of
	devices > > from meta/files/device_table-minimal.txt,
	including such anachronisms
	> > as /dev/ttySA0 and /dev/apm_bios. It's hard to imagine that anybody
	>
	> actually wants this stuff in their rootfs in this day and age. > >
	Can we kill apmd at the same time? Please? :) [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: image.bbclass: USE_DEVFS is now useless
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Apr 2014 21:29:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-04-01 at 18:51 +0100, Richard Purdie wrote:
> On Tue, 2014-04-01 at 18:48 +0100, Phil Blundell wrote:
> > Also note that the default for USE_DEVFS was (and is) 1, so the lack
> > of this check is actually causing a difference in the default
> > behaviour.  If there's no appetite for reinstating the USE_DEVFS
> > mechanism per se then it seems like it would be a good idea to make
> > the default IMAGE_DEVICE_TABLE be blank in order to restore the
> > previous default of no /dev in the rootfs.  
> >
> > At present you get a somewhat arbitrary-seeming smattering of devices
> > from meta/files/device_table-minimal.txt, including such anachronisms
> > as /dev/ttySA0 and /dev/apm_bios.  It's hard to imagine that anybody
> > actually wants this stuff in their rootfs in this day and age.
> 
> Can we kill apmd at the same time? Please? :)

I can't see why not.  I'd be surprised if there were many/any real users
left, beyond possibly some legacy stuff in meta-handheld, and it
definitely doesn't seem "core" by any reasonable interpretation of the
term.  

Apart from packagegrounds, the only recipe in oe-core that mentions a
dependency on apmd is matchbox-panel (for the battery applet
presumably); that dependency is conditional on having apm in
MACHINE_FEATURES (which it isn't by default), and it seems a bit fishy
anyway since I can't immediately think of a reason why matchbox-panel
would need the actual daemon.

So, I think it should probably be safe to just rescind support for both
apmd and the MACHINE_FEATURE apm in oe-core.  If meta-handheld, meta-oe
or anybody else wants to keep apmd then they can do so in their own
layers although I rather hope that nobody does.

p.



