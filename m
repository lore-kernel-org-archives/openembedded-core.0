Return-Path: <mac@mcrowe.com>
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mail.openembedded.org (Postfix) with ESMTP id D0534741CF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 15:25:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,666,1427756400"; d="scan'208";a="129532866"
Received: from deneb.mcrowe.com (HELO deneb) ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 23 Jun 2015 16:25:01 +0100
Received: from mac by deneb with local (Exim 4.84)
	(envelope-from <mac@mcrowe.com>)
	id 1Z7Q4L-0006yW-34; Tue, 23 Jun 2015 16:25:01 +0100
Date: Tue, 23 Jun 2015 16:25:01 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Phil Blundell <pb@pbcl.net>
Message-ID: <20150623152501.GA26456@mcrowe.com>
References: <1434221081-4286-1-git-send-email-mac@mcrowe.com>
	<1435072346.2483.417.camel@pbcl.net>
MIME-Version: 1.0
In-Reply-To: <1435072346.2483.417.camel@pbcl.net>
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
X-List-Received-Date: Tue, 23 Jun 2015 15:25:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tuesday 23 June 2015 at 16:12:26 +0100, Phil Blundell wrote:
> On Sat, 2015-06-13 at 19:44 +0100, Mike Crowe wrote:
> > diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
> > index 9e6ecc8..755a654 100644
> > --- a/meta/classes/pixbufcache.bbclass
> > +++ b/meta/classes/pixbufcache.bbclass
> > @@ -72,6 +72,7 @@ PIXBUFCACHE_SYSROOT_DEPS_class-native = "\
> >      glib-2.0-native:do_populate_sysroot_setscene libffi-native:do_populate_sysroot_setscene \
> >      libpng-native:do_populate_sysroot_setscene zlib-native:do_populate_sysroot_setscene \
> >      harfbuzz-native:do_populate_sysroot_setscene \
> > +    ${@bb.utils.contains('PACKAGECONFIG', 'jpeg', 'jpeg-native:do_populate_sysroot_setscene', '', d)} \
> 
> I'm not sure this is quite right.  PACKAGECONFIG at the point this is
> expanded will be the PACKAGECONFIG for whatever recipe is currently
> inheriting pixbufcache.bbclass, whereas I think what you really need
> here is the PACKAGECONFIG that gdk-pixbuf itself was built with.  Or,
> er, something.

The problem I was seeing was with gdk-pixbuf itself so it sounds like I
need to add the dependency only when '${BPN}' == 'gdk-pixbuf' itself. I'll
have a go at that.

Thanks.

Mike.


