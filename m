Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AA74B77026
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 22:28:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Sep 2015 15:28:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,457,1437462000"; d="scan'208";a="761161622"
Received: from afshjern.zpn.intel.com (HELO [10.219.128.48]) ([10.219.128.48])
	by orsmga001.jf.intel.com with ESMTP; 02 Sep 2015 15:28:15 -0700
To: Peter Seebach <peter.seebach@windriver.com>
References: <1441211805-17543-1-git-send-email-alejandro.franco@linux.intel.com>
	<20150902164725.5a011ab8@seebs-worktop>
From: Alex Franco <alejandro.franco@linux.intel.com>
Message-ID: <55E77821.6080506@linux.intel.com>
Date: Wed, 2 Sep 2015 17:28:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <20150902164725.5a011ab8@seebs-worktop>
Cc: clarson@kergoth.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Fix recursive mode -st on BUILDDIR setup
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
X-List-Received-Date: Wed, 02 Sep 2015 22:28:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Yes, it was also suggested to check the directories prior to chmod'ing. 
But I'm still not so sure about that, or how extensive the checking 
should be. Perhaps cleaning out sticky bits more extensively could be 
suggested in the documentation.

Alex Franco

On 09/02/2015 04:47 PM, Peter Seebach wrote:
> On Wed, 2 Sep 2015 11:36:45 -0500
> Alex Franco <alejandro.franco@linux.intel.com> wrote:
>
>> -chmod -R -st "$BUILDDIR"
>> +chmod -st "$BUILDDIR"
> I was about to say! I just did an update to a version with this, and as it
> happens, my build dir also contains about four full copies of tmp-glibc and
> sstate-cache corresponding to different versions of pseudo I was comparing
> between...
>
> I'd say maybe both $BUILDDIR and $BUILDDIR/conf. Although it might not be a
> horrible idea to think about cleaning out sticky bits, because it occurs to
> me: pseudo is not stripping the set* bits when writing to the filesystem.
> Which means that a build directory can end up containing files owned by the
> build user, and setuid, which is maybe a Bad Thing.
>
> ... It may be that pseudo should strip those bits from the filesystem.
>
> -s


