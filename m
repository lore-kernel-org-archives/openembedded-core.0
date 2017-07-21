Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 86477783F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 16:14:35 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jul 2017 09:14:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,390,1496127600"; d="scan'208";a="127806207"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.128.142])
	([10.219.128.142])
	by orsmga005.jf.intel.com with ESMTP; 21 Jul 2017 09:14:34 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <cover.1500327589.git.anibal.limon@linux.intel.com>
	<1500624664.22282.97.camel@linuxfoundation.org>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <67c18789-deb3-e303-cf52-515810b78479@linux.intel.com>
Date: Fri, 21 Jul 2017 11:15:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1500624664.22282.97.camel@linuxfoundation.org>
Cc: joshua.g.lock@intel.com
Subject: Re: [PATCHv3 00/30] oeqa core and oe-selftest threaded enablement
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
X-List-Received-Date: Fri, 21 Jul 2017 16:14:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 07/21/2017 03:11 AM, Richard Purdie wrote:
> On Mon, 2017-07-17 at 16:45 -0500, Aníbal Limón wrote:
>> This v3 makes changes on tinfoil busy status patch and adds an
>> environment variable to oe-seltest script to specify number of
>> threads. 
>> There are patches for bitbake [3] and meta-yocto-bsp [4] that was
>> send
>> to their specific ML.
>>
>> The first 6 patches previous enable support of threads in oeqa core
>> are independent and can be merged first.
>>
>> The v2 address comments did by Patrick about add better explanation
>> on the commit messages and some typos.
>>
>> Other interesting information to add is that with this series we will
>> able to execute oe-selftest in around half [1] of the original time
>> [2], (9406.782s vs 17303.014s).
> 
> I tested this, admittedly on top of the server rework changes and see
> some odd failures on the autobuilder. Things aren't looking very
> deterministic and I'm a little worried about merging them.
> 
> (e.g. https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/
> 397)
> 
> The second issue I'd like to ask questions about is whether the tinfoil
> changes and server rework we've just done remove the need for some of
> this patchset?

Yes if the tinfoil API can work within a thread we can remove the
functionality to run into the main thread, but the end_thread
functionality needs to stay because the devtool test content will need
to be modified to don't touch meta/ folder.

> 
> I ask since now I'm hoping the "main thread" issues might be resolved
> and we truly can have independent tinfoil connections. There were
> issues there but I believe Paul has resolved those.
> 
> For that reason I'm going to defer this patchset from M2 (I did take
> some of the initial patches) and ask that we review the patchset in
> light of the server rework and tinfoil changes that just merged.
> 
> I do know that for example, "oeqa/selftest/case: Support bitbake memres
> mode in per build director" is no obsolete as we removed the memres
> init script and the -t option to bitbake.

Ok, i understand, after merge the patches from Paul and you, i will
rebase and test again searching for remove has much code as i can.

Cheers,
Anibal

> 
> Cheers,
> 
> Richard
> 

