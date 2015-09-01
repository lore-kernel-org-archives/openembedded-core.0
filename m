Return-Path: <brendan.le.foll@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D620376B7C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 18:16:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 01 Sep 2015 11:16:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,450,1437462000"; d="scan'208";a="795651109"
Received: from jupiter.iwi.intel.com ([172.28.33.51])
	by orsmga002.jf.intel.com with ESMTP; 01 Sep 2015 11:16:10 -0700
Date: Tue, 1 Sep 2015 19:16:18 +0100
From: Brendan Le Foll <brendan.le.foll@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20150901181617.GA24281@jupiter.iwi.intel.com>
References: <1440002007-9895-1-git-send-email-brendan.le.foll@intel.com>
	<2387622.aXAosN14aV@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <2387622.aXAosN14aV@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
User-Agent: Mutt/1.5.23+102 (2ca89bed6448) (2014-03-12)
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
X-List-Received-Date: Tue, 01 Sep 2015 18:16:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 27, 2015 at 03:19:01PM +0100, Paul Eggleton wrote:
> Hi Brendan,
> 
> > 'bitbake -e %s | grep IMAGE_PKGTYPE' % (args.recipename), watch=False) +   
> > except bb.process.ExecutionError as e:
> > +        logger.error('Unable to get IMAGE_PKGTYPE for image')
> > +        return e.exitcode
> > +
> > +    image_pkgtype = str(image_pkgtype).split('=', 1)[1].split('"', 2)[1]
> > +    if image_pkgtype not in ("rpm", "ipk", "tar", "deb"):
> > +        logger.error('Invalid package format (%s) found' % image_pkgtype)
> > +        return 1
> 
> Instead of this, how about:
> 
>     tinfoil = setup_tinfoil()
>     try:
>         tinfoil.prepare(config_only=True)
>         image_pkgtype = tinfoil.config_data.getVar('IMAGE_PKGTYPE', True)
>     finally:
>         tinfoil.shutdown()

Yeah that's much nicer. Wasn't too sure how to use tinfoil, I need to
read about it.

> > +    package_task = config.get('Package', 'package_task', 'package_write_%s'
> > % image_pkgtype) 
> 
> Hmm, shouldn't the config be for image_pkgtype rather than this? (Since even if 
> this is set we'd still be using the IMAGE_PKGTYPE value for the directory path 
> in the message later on).

I don't understand what you mean, afaik I can't get IMAGE_PKGTYPE
using config which is why bitbake/tinfoil has to be used. I'm probably
missing something obvious sorry!

Cheers,
Brendan

