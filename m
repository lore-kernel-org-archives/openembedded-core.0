Return-Path: <paul.eggleton@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9F3D673199
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 12:40:24 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 17 Aug 2016 05:40:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,529,1464678000"; d="scan'208";a="866912001"
Received: from sananes-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.254.116.91])
	by orsmga003.jf.intel.com with ESMTP; 17 Aug 2016 05:40:24 -0700
From: Paul Eggleton <paul.eggleton@intel.com>
To: Brendan Le Foll <brendan.le.foll@intel.com>,
	Christopher Lord <clord@mozilla.com>
Date: Wed, 17 Aug 2016 07:40:23 -0500
Message-ID: <3036338.LeAAZU0Ur8@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.6.6-200.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <20160817101112.GA20728@hippo.iwi.intel.com>
References: <CABDc_zW0Mi9a5G+neZMSAC5mRVo8LC-62ew_X9PiKM8uVxhAUA@mail.gmail.com>
	<20160817101112.GA20728@hippo.iwi.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: npm.bbclass
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
X-List-Received-Date: Wed, 17 Aug 2016 12:40:24 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hey Chris, long time!

On Wed, 17 Aug 2016 11:11:13 Brendan Le Foll wrote:
> >    - Is there a reason to split the package like it does? Node projects
> >    tend to have huge dependency trees, it makes updating and distributing
> >    node-based applications a bit of a chore if they end up split into 20
> >    packages, most of which have no use separately. It would be great if
> >    there was at least a way to disable this.
> 
> Paul added this, the worry was that we wanted to make sure all the
> licenses where tracked properly of the package etc...

Right, that is why we do the splitting - if you want the licenses and actual 
packages used to be fully represented in the image license manifest then they 
really do have to be split this way. Honestly I view this ugliness more as an 
artifact of how npm works (i.e. every dependency is handled separately instead 
of trying to ensure only one instance of a particular package).

> I'm not a huge fan either to be honest. Maybe we can have a npm-no-
> split.bbclass would that be ok - Paul? It's in python
> populate_packages_prepend in npm.bbclass.

Sure, but rather than a separate class I would just add a variable such as 
NPM_SPLIT_PACKAGES that defaults to "1" and then you can set it to "0" either 
globally or in each recipe.

> >    - Any patches end up getting packaged because they get put in the
> >    srcdir. I'm guessing this isn't intentional (or maybe it is?)
> >    Just wanted to provide some feedback. It's fantastic that OE has the
> >    ability to package node software, and despite the teething
> >    difficulties, I've appreciated its availability!
> 
> That is a good point, didn't think about it tbh. in npm.bbclass we
> could maybe delete everything that looks like a patch before
> compilation, little bit worried there might be nasty side effects but
> I can try :)

This is definitely not intentional, but the way we have been dealing with npm 
it makes it easy for stuff like this to leak into the output packages. I guess 
we just need to delete them under ${D} after the files are installed there.

Cheers,
Paul

