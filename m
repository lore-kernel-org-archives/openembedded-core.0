Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id D14D96BCA4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 11:00:47 +0000 (UTC)
Received: from [69.196.158.250] (port=43331 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1VEzy3-0002jM-NN; Thu, 29 Aug 2013 07:00:47 -0400
Date: Thu, 29 Aug 2013 07:00:45 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <20130829104913.GM3544@jama>
Message-ID: <alpine.DEB.2.02.1308290657140.5063@oneiric>
References: <alpine.DEB.2.02.1308290628130.4283@oneiric>
	<20130829104913.GM3544@jama>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: appears to be inconsistency re: base-files between oe-core and meta-angstrom
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
X-List-Received-Date: Thu, 29 Aug 2013 11:00:48 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 29 Aug 2013, Martin Jansa wrote:

> On Thu, Aug 29, 2013 at 06:29:17AM -0400, Robert P. J. Day wrote:
> >
> >   trying to build a "hardware-bringup-image" defined in angstrom layer
> > and running into:
> >
> > ERROR: QA Issue: Fixup Perms: Unable to correct directory link, target already exists: /var/log -> /var/volatile/log
> > ERROR: QA Issue: Fixup Perms: Unable to correct directory link, target already exists: /var/run -> /run
> > ERROR: QA Issue: Fixup Perms: Unable to correct directory link, target already exists: /var/tmp -> /var/volatile/tmp
> >
> > this would *appear* to be because oe-core defines, in
> > base-files_3.0.14.bb:
> >
> > volatiles = "log tmp"
> > ... snip ...
> >         for d in ${volatiles}; do
> >                 ln -sf volatile/$d ${D}${localstatedir}/$d
> >         done
> >         ln -snf ../run ${D}${localstatedir}/run
> >         ln -snf ../run/lock ${D}${localstatedir}/lock
> >
> > which seems to want to create /var/{run,log,tmp} as symlinks, but over
> > in meta-angstrom, we have base-files_3.0.14.bbappend which seems to
> > want to create them as actual directories instead:
>
> Expectations from base-files .bbappend and FILESYSTEM_PERMS_TABLES need
> to be consistent, is it possible that you're using .bbappend from
> angstrom and not FILESYSTEM_PERMS_TABLES set by angstrom config?
>
> conf/distro/include/angstrom-core-tweaks.inc:FILESYSTEM_PERMS_TABLES = "fs-perms-angstrom.txt"

  ah, i suspect that's what's happening. so what's the correct way to
set up this OE build? i'm trying to build the angstrom
"hardware-bringup-image" using a current oe-core, and my bblayers.conf
file looks like:

BBLAYERS ?= " \
  /home/rpjday/oe/dist/layers/oe-core/meta \
  /home/rpjday/oe/dist/layers/meta-openembedded/meta-oe \
  /home/rpjday/oe/dist/layers/meta-angstrom \
  /home/rpjday/oe/dist/layers/meta-ti \
  "

what should i have done differently?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

