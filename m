Return-Path: <ross.burton@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 49F5D7F8B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 12:01:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Dec 2019 04:01:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,331,1571727600"; d="scan'208";a="366053719"
Received: from brzodkie-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.32.172])
	by orsmga004.jf.intel.com with ESMTP; 19 Dec 2019 04:01:47 -0800
To: openembedded-core@lists.openembedded.org
References: <20191218233928.696037-1-raj.khem@gmail.com>
	<679f8a273b8e113fadace659a84c35b1338ddbff.camel@andred.net>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <302d5b9a-4e74-593f-1e10-fec9452d5116@intel.com>
Date: Thu, 19 Dec 2019 12:01:46 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <679f8a273b8e113fadace659a84c35b1338ddbff.camel@andred.net>
Subject: Re: [PATCH] cmake: Displace VERBOSE setting
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
X-List-Received-Date: Thu, 19 Dec 2019 12:01:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 19/12/2019 08:52, André Draszik wrote:
> Hi Khem,
> 
> On Wed, 2019-12-18 at 15:39 -0800, Khem Raj wrote:
>> Setting VERBOSE always, while is fine on one hand for debugging, its
>> coming at an expense of creating lots and lots of logs, e.g. qtwebkit
>> compile logs alone with VERBOSE is 163MB, there are many other large
>> packages which use cmake e.g. WPE, webkitgtk etc which are in same range
>> with out this option on, the logs reduce to 861K and also speeds up
>> build a notch
>>
>> If user needs to enable this logs for targetted debugging debugging that
>> could be added via
>>
>> EXTRA_OECMAKE_BUILD += "--verbose"
>>
>> in recipe
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Cc: Ross Burton <ross.burton@intel.com>
> 
> I don't agree with the reasoning to always disable this by default. - it's
> way too useful in general. I can't count the number of times it was enough
> to look at the log.do_compile to figure out something is wrong.
> 
> Now you have to recompile everything with this merged, and something that
> took 5 minutes to debug becomes an arduous task.
> 
> If the Webkit build is too verbose, you should make that specific recipe
> less verbose. E.g. you could always set
> EXTRA_OECMAKE_BUILD, and just clear
> it out in the webkit recipe.
> 
> Otherwise, based on the same reasoning, you should disable all logs, not just
> cmake logs: kernel, make output in general, bitbake logs. They all take up space.
> 
> Seriously, those logs are useful, keeping in mind that often logs are
> collected on build-machines, and having easy access is a huge time-saver.

Personally I agree with André.  We have verbose logs for autotools and 
meson, so why is cmake special.  As this is a webkit-specific issue for 
you, the neater fix would be to override this in webkit.

Stepping back though, why are 163MB log files a problem?  Are you 
archiving every log maybe?  If so then there's an argument to be made 
for a global "logs should be verbose" toggle, that defaults to on but 
you can set to off.  That way the kernel, autotools, etc can also follow 
the same logic and *all* logs can be smaller.

Ross


