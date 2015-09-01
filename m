Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0600776B7C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 21:11:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 01 Sep 2015 14:11:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,450,1437462000"; d="scan'208";a="796134385"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.252.26.145])
	by fmsmga002.fm.intel.com with ESMTP; 01 Sep 2015 14:11:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Brendan Le Foll <brendan.le.foll@intel.com>
Date: Tue, 01 Sep 2015 22:11:13 +0100
Message-ID: <2046670.aGx4ZuXsBC@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.5-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <20150901181617.GA24281@jupiter.iwi.intel.com>
References: <1440002007-9895-1-git-send-email-brendan.le.foll@intel.com>
	<2387622.aXAosN14aV@peggleto-mobl.ger.corp.intel.com>
	<20150901181617.GA24281@jupiter.iwi.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] devtool: add package plugin that lets you create package via devtool
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
X-List-Received-Date: Tue, 01 Sep 2015 21:11:17 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 01 September 2015 19:16:18 Brendan Le Foll wrote:
> On Thu, Aug 27, 2015 at 03:19:01PM +0100, Paul Eggleton wrote:
> > Hi Brendan,
> > 
> > > 'bitbake -e %s | grep IMAGE_PKGTYPE' % (args.recipename), watch=False) +
> > > except bb.process.ExecutionError as e:
> > > +        logger.error('Unable to get IMAGE_PKGTYPE for image')
> > > +        return e.exitcode
> > > +
> > > +    image_pkgtype = str(image_pkgtype).split('=', 1)[1].split('"',
> > > 2)[1]
> > > +    if image_pkgtype not in ("rpm", "ipk", "tar", "deb"):
> > > +        logger.error('Invalid package format (%s) found' %
> > > image_pkgtype)
> > > +        return 1
> > 
> > Instead of this, how about:
> >     tinfoil = setup_tinfoil()
> >     
> >     try:
> >         tinfoil.prepare(config_only=True)
> >         image_pkgtype = tinfoil.config_data.getVar('IMAGE_PKGTYPE', True)
> >     
> >     finally:
> >         tinfoil.shutdown()
> 
> Yeah that's much nicer. Wasn't too sure how to use tinfoil, I need to
> read about it.
> 
> > > +    package_task = config.get('Package', 'package_task',
> > > 'package_write_%s' % image_pkgtype)
> > 
> > Hmm, shouldn't the config be for image_pkgtype rather than this? (Since
> > even if this is set we'd still be using the IMAGE_PKGTYPE value for the
> > directory path in the message later on).
> 
> I don't understand what you mean, afaik I can't get IMAGE_PKGTYPE
> using config which is why bitbake/tinfoil has to be used. I'm probably
> missing something obvious sorry!

I mean optionally store the package type in the configuration instead of the 
package write task, and if it's set there you don't need to query the build 
system at all. At the moment the logic is a bit weird - e.g. hypothetically 
you may have the package write function configured as "package_write_ipk" but 
the build system could be set up to use RPM.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

