Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 68A7960664
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 19:36:20 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.7])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1V9KOA-0007ul-F1; Tue, 13 Aug 2013 21:36:18 +0200
Message-ID: <1376422569.5025.20.camel@x121e.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Gary Thomas <gary@mlbassoc.com>
Date: Tue, 13 Aug 2013 20:36:09 +0100
In-Reply-To: <520A8864.4020803@mlbassoc.com>
References: <520A6CE6.3010000@mlbassoc.com> <20130813173641.GN17945@jama>
	<520A8864.4020803@mlbassoc.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.4.4-3 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Enabling x264 support in gstreamer
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
X-List-Received-Date: Tue, 13 Aug 2013 19:36:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-08-13 at 13:26 -0600, Gary Thomas wrote:
> On 2013-08-13 11:36, Martin Jansa wrote:
> > On Tue, Aug 13, 2013 at 11:29:10AM -0600, Gary Thomas wrote:
> >> I see that some of the gstreamer recipes have changed so that x264
> >> is now a PACKAGECONFIG option.  However, I don't see anything that
> >> enables this option anywhere.
> >>
> >> How do I get x264 support back - it was working with Poky/Yocto
> >> just a few weeks back...
> >>
> >> Note: I have imported meta-oe/recipes-multimedia/x264 from meta-openembedded
> >> into my layers for this [library] package.
> >
> > Add x264 to PACKAGECONFIG in your .bbappend or distro config as
> > PACKAGECONFIG_append_pn-gst-foo = " x264"
> 
> Thanks, although this seems very cumbersome to me.  Is this the only
> (or at least expected) way for this to work?

Well, if it's in a .bbappend (rather than distro.conf) then you don't
need the _append_pn-gst-foo bit, you can just write

PACKAGECONFIG += "x264"

which is probably a bit neater and more intuitive.  But if you don't
already have a .bbappend for that recipe then you might not want to add
one just for that, it's just a matter of taste which you prefer.

Other than that, yes, this is basically how PACKAGECONFIG is intended to
be used.  Some recipes set a default PACKAGECONFIG based on
DISTRO_FEATURES, but in the general case it's just a variable that you
need to set appropriately.

The thing that's a bit unsatisfactory about this approach is that we
don't have any equivalent to DISTRO_FEATURES_BACKFILL for recipe-local
PACKAGECONFIG options, which means that introducing new switches for
things that were previously default-on tends to cause unexpected
breakage of the sort that you've observed.  It would be good to figure
out a better way of dealing with that.

p.



