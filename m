Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1DAE571A1F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 22:21:57 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP; 16 Nov 2016 14:21:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,650,1473145200"; d="scan'208";a="32192497"
Received: from llgoh-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.159.102])
	by fmsmga005.fm.intel.com with ESMTP; 16 Nov 2016 14:21:55 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Nov 2016 11:21:53 +1300
Message-ID: <2737183.lHG0REoQPa@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.10-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <20161116171420.GA66534@bwitkowx-mobl.ger.corp.intel.com>
References: <1478844138-13407-1-git-send-email-jiajie.hu@intel.com>
	<CAJTo0LaUcWr-=YvHBj=u+_yz0HtTS7HYWTAy6ggZjVi435La+Q@mail.gmail.com>
	<20161116171420.GA66534@bwitkowx-mobl.ger.corp.intel.com>
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 16 Nov 2016 22:22:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wed, 16 Nov 2016 09:14:20 Stephano Cetola wrote:
> On 11/11, Burton, Ross wrote:
> > A reader is definitely the right thing here, but I'm wondering why this
> > needs to loop on single characters.  As I understand it doing a read() on
> > a
> > reader wrapping stdout will read until it blocks (because the process
> > hasn't got anything to output) so result in less pointless iterating.
> 
> I've tested this and it fixes the issue, and resolves this bug:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10649
> 
> We may be able to stream this without blocking using
> Queue.get_nowait(). This could solve the looping issue as well, as
> you'd be looping over stdout.readline and placing that in the queue,
> rather than looping over each character.

FWIW I'd rather see this one merged and the issue fixed and we can optimise it 
later, especially as the original version used a single-byte read.

Thanks Jiajie for fixing the issue I caused and Stephano for verifying.

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

