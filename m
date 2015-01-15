Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D5DE172A3A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 14:20:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Jan 2015 06:17:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,403,1418112000"; d="scan'208";a="670420204"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com) ([10.252.5.31])
	by orsmga002.jf.intel.com with ESMTP; 15 Jan 2015 06:20:40 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chong Lu <Chong.Lu@windriver.com>
Date: Thu, 15 Jan 2015 14:20:39 +0000
Message-ID: <2031560.2Rc0YuEC5v@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <b2a5af309a2b2e6b23070ae2f2343e39b12a52df.1421044647.git.Chong.Lu@windriver.com>
References: <cover.1421044647.git.Chong.Lu@windriver.com>
	<b2a5af309a2b2e6b23070ae2f2343e39b12a52df.1421044647.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/1] bitbake-layers: add a ability to query layer dependencies from layer index
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
X-List-Received-Date: Thu, 15 Jan 2015 14:20:44 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Chong,

On Monday 12 January 2015 14:48:42 Chong Lu wrote:
> It maybe depends on other layers when one layer is added to BBLAYERS. If
> define LAYERDEPENDS variable in this layer, we will get error from bitbake.
> But sometimes, we don't have defined. Add a mechanism to extend
> bitbake-layers and it will query layer dependencies from layer index
> (http://layers.openembedded.org/layerindex/api/)
> Use `bitbake-layers show-layer-dependencies' to find out dependencies and
> update bblayers.conf as appropriate.

OK, so this is actually a patch against bitbake and thus should be sent to the 
bitbake mailing list instead.

Having said that, I have looked over the code. This is definitely a step in the 
right direction, however I would make the following comments:

1) Since this is for bitbake we can't really have hardcoded references to the 
OE layer index in the code. I'd suggest we have bitbake-layers query a 
variable e.g. BITBAKE_LAYERINDEX_URL, and then separately patch OE to set that 
from conf/bitbake.conf. (It should also give a sensible error if the variable 
isn't set for some reason.)

2) I think this could be a bit more practical in terms of usage. As described 
in the bug I was thinking of a command for which you would specify the name of 
a layer you wanted to use, and then bitbake-layers would call the layer index, 
find the specified layer and all of its dependencies, fetch them, then add them 
to bblayers.conf. This kind of does the first part but leaves the rest to the 
user - I think we can go a bit further than that. FWIW as you may have seen I 
did just add some code to make clean modifications to bblayers.conf which may 
be useful for part of this.

For #2 there may be a slight problem to solve, which is that whatever 
equivalent of OE-Core you have on your local disk needs to be considered 
equivalent to the "oe-core" layer in the layer index so you don't end up 
adding that. Toaster has solved this same issue, but in a way that won't work 
here, so we might have to figure out an alternative solution.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

