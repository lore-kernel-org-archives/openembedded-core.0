Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 410D66A451
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 13:30:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Jun 2014 06:30:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,471,1400050800"; d="scan'208";a="556995564"
Received: from pskulath-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.252])
	by orsmga002.jf.intel.com with ESMTP; 13 Jun 2014 06:30:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
Date: Fri, 13 Jun 2014 14:30:38 +0100
Message-ID: <1621519.vTJ1eh8nMH@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.6-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <cover.1402552609.git.sgw@linux.intel.com>
References: <cover.1402552609.git.sgw@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [RFC - WIP v2 00/10] conf-files: New recipe to consolidate config file
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
X-List-Received-Date: Fri, 13 Jun 2014 13:31:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 11 June 2014 22:56:19 Saul Wold wrote:
> This is a little further along, I would really like to get some
> feedback on the direction I am taking this.
> 
> The idea is that a block of anonymous code will generate all the
> metadata and do_install() function for the existing config files
> such that a .bbappend can be created to override specific files
> from a single recipe instead of from 10-12 different .bbappends.

I have some reservations about this change as-is. I certainly accept that 
currently the placement of typical BSP config files is a bit of a mess, and new 
users definitely find it difficult to know where to go to change a particular file; 
however there will always be config files this recipe doesn't cover. Most 
significantly, it also requires everyone with existing BSP and distro layers to 
go and migrate their bbappends over to the new structure, for not that much 
gain. If we are going to go down this route, we absolutely must have a script 
which migrates existing bbappends to this new layout. We'll also need to 
ensure runtime upgrades work, i.e. PR values will have to increase from the 
old packages to the new ones provided by the single recipe.

As a more general improvement in this area, I'd really like to see us have 
some tooling around finding where a particular config file (or other file I want 
to replace) comes from and then creating the bbappend to substitute my 
version. We have the part that tracks down the recipe from a file - albeit in a 
not-very-easy-to-use form - in scripts/oe-pkgdata-util (with its "find-path" 
command); Toaster has the functionality to do this as well. This solution has 
the benefit of being able to work for any configuration file (or other file) that 
any recipe in any layer introduces. In fact this will be of benefit even if we 
decide to go ahead with the conf-files move, so I've entered an enhancement 
request to cover it separately:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=6447

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

