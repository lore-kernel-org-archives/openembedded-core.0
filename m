Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id E032060017
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Apr 2017 22:43:05 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP; 23 Apr 2017 15:43:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,241,1488873600"; d="scan'208";a="1139229841"
Received: from engkeeng-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.175.234])
	by fmsmga001.fm.intel.com with ESMTP; 23 Apr 2017 15:43:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Fri, 21 Apr 2017 15:19:49 +1200
Message-ID: <6850343.uvLpTthIP9@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <alpine.LFD.2.20.1703090635210.18662@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703090635210.18662@uk63952.mitel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: does "devtool add" no longer calculate the recipe name?
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
X-List-Received-Date: Sun, 23 Apr 2017 22:43:11 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Robert,

Sorry I missed dealing with this last month, but I did just remember it and 
Trevor Woerner just helped me track down your post again. 

On Friday, 10 March 2017 12:40:24 AM NZST Robert P. J. Day wrote:
>   hoping it's not something silly i did but, recently, i used devtool
> add to create a recipe for mod_auth_tkt from the github repo. i didn't
> specify the recipe name, just used:
> 
>   $ devtool add https://github.com/gavincarr/mod_auth_tkt.git
> 
> which seemed to work fine in that it figured out that the recipe name
> would be mod-auth-tkt and created the directories by that name.
> 
>   i just did it again, and now the name is left as '%{name}',
> suggesting that devtool is no longer determining what the recipe name
> should be.
> 
>   if i specify the recipe name explicitly:
> 
> $ devtool add mod-auth-tkt https://github.com/gavincarr/mod_auth_tkt.git
> 
> then it works fine. but i'm sure i previously didn't need to do
> that. has the behaviour of devtool changed in that respect?

In this specific example the erroneous %{name} is being picked up from a spec 
file contained in the source. I can't explain why the behaviour would have 
changed, since the code handling this isn't especially new and neither is the 
spec file, and it ought to be deterministic. I've added some code to ignore 
any values extracted from spec files containing unexpanded macros such as this 
one (though I think this is a particularly unusual spec file, most define a 
literal name within Name: without using any macros). I'll also add something 
to take the name from the repository if there isn't any other indicator, since 
I think that's a reasonable fallback. At this stage in the release those fixes 
will probably wait until 2.4 however.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

