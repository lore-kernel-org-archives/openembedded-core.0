Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A6C9771633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 13:09:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 28 Aug 2015 06:09:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,424,1437462000"; d="scan'208";a="792727833"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.252.13.245])
	by orsmga002.jf.intel.com with ESMTP; 28 Aug 2015 06:09:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Aug 2015 14:09:37 +0100
Message-ID: <2222528.ueMDq1ARAi@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.5-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <14855649.MLpkRK5kp1@peggleto-mobl.ger.corp.intel.com>
References: <cover.1440678731.git.paul.eggleton@linux.intel.com>
	<26B844B8-BE69-427B-8DA7-B649C46A5632@gmail.com>
	<14855649.MLpkRK5kp1@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/1] classes/whitelist: add class to allow whitelisting recipes from a layer
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
X-List-Received-Date: Fri, 28 Aug 2015 13:09:44 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 28 August 2015 09:34:18 Paul Eggleton wrote:
> On Thursday 27 August 2015 23:07:44 Khem Raj wrote:
> > > On Aug 27, 2015, at 5:36 AM, Paul Eggleton
> > > <paul.eggleton@linux.intel.com>
> > > wrote:
> > > 
> > > Allow restricting recipes brought from a layer to a specified list. This
> > > is similar in operation to blacklist.bbclass, but instead specifies a
> > > per-layer whitelist of recipes (matched by PN or BPN) that are able to
> > > be built from the layer - anything else is skipped. This is potentially
> > > useful where you want to bring in a select set of recipes from a larger
> > > layer e.g. meta-oe.
> > 
> > For the record, I am not in favor of such feature in OE, Distros can still
> > use BBMASK if they wish to
> 
> This is significantly easier to use than BBMASK though. (Perhaps that's why
> you don't like it?)

I should expand upon this with a couple of important distinctions:

* BBMASK is a list of files to mask out, so it's a blacklist not a whitelist. 
(Sure, you could probably construct a regex that effectively gives you a 
whitelist; it probably won't be pretty though.)

* BBMASK tells bitbake not to even try reading the masked files, which means if 
you then request to build any of them (either directly or via a dependency) 
you'll be told that there's nothing providing that with no explanation as to 
why. With whitelist.bbclass (and blacklist.bbclass, which whitelist.bbclass is 
modelled after) we are using SkipPackage/SkipRecipe so you at least get a 
statement that the recipe was skipped as well as hopefully an explanatory 
reason as to why.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

