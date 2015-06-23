Return-Path: <mac@mcrowe.com>
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mail.openembedded.org (Postfix) with ESMTP id 5F17360125
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 18:46:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,667,1427756400"; d="scan'208";a="61459525"
Received: from deneb.mcrowe.com (HELO deneb) ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 23 Jun 2015 19:46:28 +0100
Received: from mac by deneb with local (Exim 4.84)
	(envelope-from <mac@mcrowe.com>)
	id 1Z7TDH-0008P5-SJ; Tue, 23 Jun 2015 19:46:27 +0100
Date: Tue, 23 Jun 2015 19:46:27 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20150623184627.GA31536@mcrowe.com>
References: <1434221081-4286-1-git-send-email-mac@mcrowe.com>
	<1435072346.2483.417.camel@pbcl.net>
	<1435072851.11489.86.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1435072851.11489.86.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pixbufcache: Ensure that jpeg-native is available for postinst if necessary
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
X-List-Received-Date: Tue, 23 Jun 2015 18:46:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tuesday 23 June 2015 at 16:20:51 +0100, Richard Purdie wrote:
> On Tue, 2015-06-23 at 16:12 +0100, Phil Blundell wrote:
> > On Sat, 2015-06-13 at 19:44 +0100, Mike Crowe wrote:
> > > diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
> > > index 9e6ecc8..755a654 100644
> > > --- a/meta/classes/pixbufcache.bbclass
> > > +++ b/meta/classes/pixbufcache.bbclass
> > > @@ -72,6 +72,7 @@ PIXBUFCACHE_SYSROOT_DEPS_class-native = "\
> > >      glib-2.0-native:do_populate_sysroot_setscene libffi-native:do_populate_sysroot_setscene \
> > >      libpng-native:do_populate_sysroot_setscene zlib-native:do_populate_sysroot_setscene \
> > >      harfbuzz-native:do_populate_sysroot_setscene \
> > > +    ${@bb.utils.contains('PACKAGECONFIG', 'jpeg', 'jpeg-native:do_populate_sysroot_setscene', '', d)} \
> > 
> > I'm not sure this is quite right.  PACKAGECONFIG at the point this is
> > expanded will be the PACKAGECONFIG for whatever recipe is currently
> > inheriting pixbufcache.bbclass, whereas I think what you really need
> > here is the PACKAGECONFIG that gdk-pixbuf itself was built with.  Or,
> > er, something.
> 
> Right, its not that simple. As it happens I was just looking at this
> patch:
> 
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=32afecae2495b0486a044b66154573caf39144c7
> 
> which I proposed a while ago which does solve this problem, with some
> ugliness in base.bbclass. I know Ross doesn't like it, neither do I, I
> do prefer it to the pretty horrible things PIXBUFCACHE_SYSROOT_DEPS does
> though.

Based on my (probably incomplete) understanding of the problem and your
solution:

The setscene tasks for libpng-native, jpeg-native etc. will all be run
automatically as setscene tasks. The problem is that they might not run
before pixbufcache_sstate_postinst does.

The existing hack, which I extended inexpertly, ensured that the setscene
tasks run in the right order so that libpng-native, jpeg-native etc. are
definitely present in the sysroot prior to pixbufcache_sstate_postinst
running.

Would it be possible to make your change less "ugly" by making it more
generic. For example, adding a companion to SSTATEPOSTINSTFUNCS named
SSTATELATEPOSTINSTFUNCS that runs at the sceneQueueComplete event?

Alternatively, I'm afraid that I don't understand why pixbufcache.bbclass
can't have its own event handler which would at least keep the ugliness in
a single file.

Having said all that, I'm slightly worried about what would happen if
gdk-pixbuf-native were to be resurrected from sstate but jpeg-native could
not be (e.g. perhaps the file has gone missing.) The end of setscene would
still be too early to run the postinst in that case. I've not experimented
to see if this can really happen though.

I'm prepared to have a go at trying to fix this in an acceptable way but
I'm not really sure how to go about it. :(

Thanks.

Mike.

