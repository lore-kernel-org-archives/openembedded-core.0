Return-Path: <brendan.le.foll@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BE63E6FF78
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 May 2016 10:57:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 05 May 2016 03:57:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,581,1455004800"; d="scan'208";a="973190310"
Received: from jupiter.iwi.intel.com (HELO jupiter.localdomain)
	([172.28.33.51])
	by fmsmga002.fm.intel.com with ESMTP; 05 May 2016 03:57:17 -0700
Date: Thu, 5 May 2016 11:57:43 +0100
From: Brendan Le Foll <brendan.le.foll@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20160505105743.GA22250@jupiter.localdomain>
References: <CAAPZna1xLfbyYUKa+qcLfeGCv=mqg7JwWtirfAbqfM+TCu5m7g@mail.gmail.com>
	<20160504170600.GA14676@jupiter.localdomain>
	<CAAPZna0WB0OjbEzo7eh6NctTcrm78O+fAtnFNwb-Ksgscg1x7w@mail.gmail.com>
	<7618991.MRiH0pG9k0@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <7618991.MRiH0pG9k0@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: npm class usage
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
X-List-Received-Date: Thu, 05 May 2016 10:57:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 05, 2016 at 07:10:43PM +1200, Paul Eggleton wrote:
> Note also that devtool add / recipetool create are capable of creating pretty 
> complete recipes for npm packages where licenses are also correctly set per 
> package (so you get them in the image manifest). I'd strongly recommend using 
> it for this; if you have any issues please let me know.

So actually it errors in this case because of a test package in the
resolve module (this shows the issue quicker/easier) see:
$ recipetool create "npm://registry.npmjs.org;name=resolve;version=1.1.7"

There's a node_modules dir inside test/ it gets taken as if npm had
resolved/download a dep when in fact it hasn't. Since node packages
can and do ship their own deps with them sometimes, I think the only
fix would be in npm_split_package_dirs to walk 1 level of the ${PN}
dir only so that:

${PN}/node_modules -> taken
${PN}/tests/node_modules -> ignored
${PN}/node_modules/${PN}/node_modules -> taken

Cheers,
Brendan

