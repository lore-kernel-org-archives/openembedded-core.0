Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 5E55760667
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 19:42:03 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Aug 2013 12:42:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,872,1367996400"; d="scan'208";a="281518231"
Received: from akagikob-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.122.214])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Aug 2013 12:42:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Phil Blundell <pb@pbcl.net>
Date: Tue, 13 Aug 2013 20:42:01 +0100
Message-ID: <7649350.krNntdZfS9@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1376422569.5025.20.camel@x121e.pbcl.net>
References: <520A6CE6.3010000@mlbassoc.com> <520A8864.4020803@mlbassoc.com>
	<1376422569.5025.20.camel@x121e.pbcl.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 13 Aug 2013 19:42:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 13 August 2013 20:36:09 Phil Blundell wrote:
> On Tue, 2013-08-13 at 13:26 -0600, Gary Thomas wrote:
> > On 2013-08-13 11:36, Martin Jansa wrote:
> > > On Tue, Aug 13, 2013 at 11:29:10AM -0600, Gary Thomas wrote:
> > >> I see that some of the gstreamer recipes have changed so that x264
> > >> is now a PACKAGECONFIG option.  However, I don't see anything that
> > >> enables this option anywhere.
> > >> 
> > >> How do I get x264 support back - it was working with Poky/Yocto
> > >> just a few weeks back...
> > >> 
> > >> Note: I have imported meta-oe/recipes-multimedia/x264 from
> > >> meta-openembedded into my layers for this [library] package.
> > > 
> > > Add x264 to PACKAGECONFIG in your .bbappend or distro config as
> > > PACKAGECONFIG_append_pn-gst-foo = " x264"
> > 
> > Thanks, although this seems very cumbersome to me.  Is this the only
> > (or at least expected) way for this to work?
> 
> Well, if it's in a .bbappend (rather than distro.conf) then you don't
> need the _append_pn-gst-foo bit, you can just write
> 
> PACKAGECONFIG += "x264"
> 
> which is probably a bit neater and more intuitive.  But if you don't
> already have a .bbappend for that recipe then you might not want to add
> one just for that, it's just a matter of taste which you prefer.
> 
> Other than that, yes, this is basically how PACKAGECONFIG is intended to
> be used.  Some recipes set a default PACKAGECONFIG based on
> DISTRO_FEATURES, but in the general case it's just a variable that you
> need to set appropriately.
> 
> The thing that's a bit unsatisfactory about this approach is that we
> don't have any equivalent to DISTRO_FEATURES_BACKFILL for recipe-local
> PACKAGECONFIG options, which means that introducing new switches for
> things that were previously default-on tends to cause unexpected
> breakage of the sort that you've observed.  It would be good to figure
> out a better way of dealing with that.

The thing is for the option in question wasn't default-on before, it was 
silently on or off depending on the availability of x264. Since x264 was 
unavailable to most users of OE-Core alone the correct thing to do was to 
default it to off, so backfilling couldn't have helped here.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

