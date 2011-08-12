Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QrssS-0005g9-Pl for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 16:38:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7CEXq0x012807
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2011 15:33:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12087-08 for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2011 15:33:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7CEXkb7012801
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2011 15:33:46 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E452F82.7060208@windriver.com>
References: <1313153364.14274.486.camel@rex> <4E452F82.7060208@windriver.com>
Date: Fri, 12 Aug 2011 15:33:06 +0100
Message-ID: <1313159586.14274.494.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] local.conf.sample: Cleanup and improve
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
X-List-Received-Date: Fri, 12 Aug 2011 14:38:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-12 at 08:49 -0500, Mark Hatle wrote:
> On 8/12/11 7:49 AM, Richard Purdie wrote:
> > local.conf is the first thing anyone new to the project sees. Over time it
> > has built up a ton cruft and isn't even accurate in places.
> >     
> > This patch:
> >   
> > * Moves things to local.conf.sample.extended if a new user is unlikely
> >   to need to immediately care about the options
> > * Reorders the file to be more intuitive to a new user
> > * Moves certain default values to default-distrovars.inc in cases where
> >   most users wouldn't want to change the value
> > * Adds large blocks of text to explain what an option does. There have
> >   been too many cases of a user not realising what some of these
> >   settings do and how they can use them to their advantage (like DL_DIR
> >   for example).
> >     
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > 
> > diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
> > index 2ef25e4..c2fd77e 100644
> > --- a/meta/conf/distro/include/default-distrovars.inc
> > +++ b/meta/conf/distro/include/default-distrovars.inc
> ...
> 
> > +#
> > +# Package Management configuration
> > +#
> > +# This variable lists which packaging formats to enable. Multiple package backends 
> > +# can be enabled at once and the first item listed in the variable will be used 
> > +# to generate the root filesystems.
> > +# Options are:
> > +#  - 'package_deb' for debian style deb files
> > +#  - 'package_ipk' for ipk files are used by opkg (a debian style embedded package manager)
> > +#  - 'package_rpm' for rpm style packages
> > +# E.g.: PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk"
> > +# We default to rpm:
> > +PACKAGE_CLASSES ?= "package_rpm"
> 
> While I certainly advocate package_rpm usage, should we be changing from the
> default of ipk to rpm here?  I'm tempted to say we need to stick w/ ipk for the
> time being...

Sorry, this was intended to be ipk in the OE-Core version and I've just
messed up that difference. I'll fix, thanks.

> >  # If you do not use (or have installed) xterm you will need to
> >  # uncomment these variables and set them to the terminal you wish to use
> > -# when resolving patches which cannot be applied
> > -# Supported shell prefixes for *_TERMCMD and *_TERMCMDRUN ARE:
> > +# 
> > +# Supported shell prefixes for *_TERMCMD and *_TERMCMDRUN are:
> >  # GNOME, SCREEN, XTERM and KONSOLE
> >  # Note: currently, Konsole support only works for KDE 3.x due to the way
> >  # newer Konsole versions behave
> >  #TERMCMD = "${XTERM_TERMCMD}"
> >  #TERMCMDRUN = "${XTERM_TERMCMDRUN}"
> > -# Alternatively, if you prefer you can disable patch resolution:
> > +# You can disable interactive patch resolution (tasks will just fail instead) with:
> >  #PATCHRESOLVE = "noop"
> 
> Should patch resolution be noop by default?  (I suspect due to my above concern
> w/ ipkg, changing the behavior now is likely a bad idea.)

Good question. I suspect most people prefer noop and it would make more
sense for unattended builds...


> > +# The following are used to control options related to debugging.
> > +#
> > +# Uncomment this to change the optimization to make debugging easer, at the 
> > +# possible cost of performance.
> > +# DEBUG_BUILD = "1"
> > +#
> > +# Uncomment this to disable the stripping of the installed binaries
> > +# INHIBIT_PACKAGE_STRIP = "1"
> > +#
> > +# Uncomment this to disable the split of the debug information into -dbg files
> > +# INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> > +#
> > +# When splitting debug information, the following controls the results of the
> > +# file splitting.
> > +#
> > +#  .debug (default):
> > +#    When splitting the debug information will be placed into
> > +#    a .debug directory in the same dirname of the binary produced:
> > +#      /bin/foo -> /bin/.debug/foo
> > +#
> > +#  debug-file-directory:
> > +#    When splitting the debug information will be placed into
> > +#    a central debug-file-directory, /usr/lib/debug:
> > +#      /bin/foo -> /usr/lib/debug/bin/foo.debug
> > +#
> > +#    Any source code referenced in the debug symbols will be copied
> > +#    and made available within the /usr/src/debug directory
> 
> May have been a bug in the original.  The "Any source code ..." comment refers
> to both of the above.  It should likely lose two spaces in the indent...

Ok, this was just a cut and paste :)

Cheers,

Richard



