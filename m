Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8B25C60746
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 17:14:18 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 16 Nov 2016 09:14:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,500,1473145200"; 
   d="scan'208";a="5131597"
Received: from bwitkowx-mobl.ger.corp.intel.com ([10.254.102.13])
	by orsmga002.jf.intel.com with ESMTP; 16 Nov 2016 09:14:18 -0800
Date: Wed, 16 Nov 2016 09:14:20 -0800
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20161116171420.GA66534@bwitkowx-mobl.ger.corp.intel.com>
References: <1478844138-13407-1-git-send-email-jiajie.hu@intel.com>
	<CAJTo0LaUcWr-=YvHBj=u+_yz0HtTS7HYWTAy6ggZjVi435La+Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaUcWr-=YvHBj=u+_yz0HtTS7HYWTAy6ggZjVi435La+Q@mail.gmail.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] devtool: fix handling of unicode characters from subprocess stdout
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
X-List-Received-Date: Wed, 16 Nov 2016 17:14:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 11/11, Burton, Ross wrote:
> A reader is definitely the right thing here, but I'm wondering why this
> needs to loop on single characters.  As I understand it doing a read() on a
> reader wrapping stdout will read until it blocks (because the process
> hasn't got anything to output) so result in less pointless iterating.
> 
> Ross

I've tested this and it fixes the issue, and resolves this bug:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10649

We may be able to stream this without blocking using
Queue.get_nowait(). This could solve the looping issue as well, as
you'd be looping over stdout.readline and placing that in the queue,
rather than looping over each character.

