Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 894E960670
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 01:50:42 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP; 08 Jan 2017 17:50:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,338,1477983600"; d="scan'208";a="46936558"
Received: from aupadhye-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.185.80])
	by orsmga004.jf.intel.com with ESMTP; 08 Jan 2017 17:50:40 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Mon, 09 Jan 2017 14:50:38 +1300
Message-ID: <2771269.x2rcQKjYlC@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.8.13-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <1483535103.28169.52.camel@intel.com>
References: <cover.1482376395.git.paul.eggleton@linux.intel.com>
	<af03426da1f2d00149a2021b8d681b2dcef3a1ea.1482376395.git.paul.eggleton@linux.intel.com>
	<1483535103.28169.52.camel@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] classes/buildstats: don't expand variable pointing to SystemStats
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
X-List-Received-Date: Mon, 09 Jan 2017 01:50:43 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Patrick,

On Wed, 04 Jan 2017 14:05:03 Patrick Ohly wrote:
> On Thu, 2016-12-22 at 16:13 +1300, Paul Eggleton wrote:
> > We're placing an object into the datastore - it's very definitely not
> > something we want to be expanding.
> 
> Why does it matter? Is it faster to tell getVar() that expansion isn't
> necessary?
> 
> I'm fine with the change, I'm just trying to understand whether this
> merely cosmetic or has some real impact.

It will be very slightly faster if we say expand=False since the preamble to 
the expansion code won't be run - though I doubt the speed difference is 
actually significant outside of a tight loop. There is a guard to prevent 
actually doing the expansion on a non-string value though so expanding it 
doesn't do any actual harm (and having that guard is a good thing since it 
saves us pain if we want to write code to get the expanded value of any 
variable).

However, to my mind the patch is more about correctness - in this case we know 
for sure that the value isn't a string, so we should avoid trying to expand 
it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

