Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 1DDD578A5E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 14:09:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Mar 2018 06:09:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,427,1515484800"; d="scan'208";a="36044938"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 05 Mar 2018 06:09:02 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20180302153220.16494-1-alexander.kanavin@linux.intel.com>
	<1520067233.3436.34.camel@linuxfoundation.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <c6097246-f40b-1d51-a0bb-83bb7e223043@linux.intel.com>
Date: Mon, 5 Mar 2018 16:03:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1520067233.3436.34.camel@linuxfoundation.org>
Subject: Re: [PATCH] perl: use parallel build where possible
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
X-List-Received-Date: Mon, 05 Mar 2018 14:09:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 03/03/2018 10:53 AM, Richard Purdie wrote:
> On Fri, 2018-03-02 at 17:32 +0200, Alexander Kanavin wrote:
>> While the upstream just runs a number of make tasks hardcoded to a
>> single thread
>> in succession, we can add '-j n_threads' to a few of them. The
>> benefit
>> is real: on my machine the do_compile() time goes from 250 seconds to
>> about 90.
>>
>> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>> ---
>>   meta/recipes-devtools/perl/perl_5.24.1.bb | 5 +++++
>>   1 file changed, 5 insertions(+)
> 
> I like the idea of the patch but I think it triggered:
> 
> https://autobuilder.yocto.io/builders/nightly-world/builds/806/steps/BuildImages/logs/stdio

Unfortunately it's also a race:

| JSON::PP 2.27103 is not available
...
| Unsuccessful Makefile.PL(ext/ODBM_File): code=65280 at make_ext.pl 
line 521.
| makefile:590: recipe for target 'lib/auto/ODBM_File/ODBM_File.so' failed

Maybe we should look into reducing perl dependencies instead, 
particularly look into whether perl is really still needed for RDEPENDS 
of various ptests of 'core' packages.

Alex

