Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3DDC573F4E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 18:01:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 May 2015 11:01:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,416,1427785200"; d="scan'208";a="724809544"
Received: from dpassaue-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.14.139])
	by fmsmga002.fm.intel.com with ESMTP; 12 May 2015 11:01:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Date: Tue, 12 May 2015 19:01:16 +0100
Message-ID: <1883118.cJJW02ZV6v@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.5-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <1430385372-6975-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1430385372-6975-1-git-send-email-markus.lehtonen@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/6] devtool: improve handling of local source files
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
X-List-Received-Date: Tue, 12 May 2015 18:01:17 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Markus,

On Thursday 30 April 2015 12:16:06 Markus Lehtonen wrote:
> This patchset tries to improve handling of local source files (i.e. file://
> in SRC_URI). First, it improves packages for which S=WORKDIR (that possibly
> only have local sources. Second, it makes local sources available in the
> srctree for all packages.
> 
> See yocto bug #7602

I've finally looked at these, apologies for the delay. Some comments:

* I don't think we really want the local files to become part of the git 
repository by default - they shouldn't be committed. Once users have finished 
with devtool, we want them to be able to push the source tree to their own 
repo and point to that within the recipe, whilst keeping the local files next 
to the recipe. 

* This implies that new files added to the local files dir when we do devtool 
update-recipe should not be added as a patch, they should be copied next to 
the recipe and added to SRC_URI. I'm more than happy for us to implement this 
separately as a follow-up (i.e. we could start by not handling adding files to 
the local files directory at all.)

* The local-files directory needs to be named specific to OE - "oe-local-files" 
would be ideal. If we could have one place in the code where this was defined 
that would be ideal as well (maybe at some point we'd allow it to be 
configured).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

