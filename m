Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0D0CB70018
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 15:41:42 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jun 2017 08:41:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,401,1493708400"; d="scan'208";a="985763830"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.128.139])
	([10.219.128.139])
	by orsmga003.jf.intel.com with ESMTP; 27 Jun 2017 08:41:41 -0700
To: Patrick Ohly <patrick.ohly@intel.com>
References: <20170626204241.16149-1-anibal.limon@linux.intel.com>
	<1498546425.7464.16.camel@intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <ef4123bb-40de-51a5-c9b2-c53cc9fd9074@linux.intel.com>
Date: Tue, 27 Jun 2017 10:41:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1498546425.7464.16.camel@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] oeqa/selftest/{context, case}: Add signal handlers SIG{INT, TERM}
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
X-List-Received-Date: Tue, 27 Jun 2017 15:41:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 06/27/2017 01:53 AM, Patrick Ohly wrote:
> On Mon, 2017-06-26 at 15:42 -0500, Aníbal Limón wrote:
>>      def run(self, logger, args):
>>          self._process_args(logger, args)
>> +
>> +        signal.signal(signal.SIGTERM, self._signal_clean_handler)
>> +        signal.signal(signal.SIGINT, self._signal_clean_handler)
>> +
>>          rc = None
>>  
>>          if args.machine:
>> @@ -220,6 +264,8 @@ class
>> OESelftestTestContextExecutor(OETestContextExecutor):
>>              os.remove(output_link)
>>          os.symlink(args.output_log, output_link)
>>  
>> +        self._signal_clean_handler(None, None)
>> +
> 
> Can't you achieve the same thing with less code by using a
>    try:
>       ... modify configuration ...
>       ... run tests ...
>    finally:
>       ... clean up ...
> block in run()?
> 
> Then you are also guaranteed to clean up if an unexpected exception
> triggers the aborting of run().

Yes but this will only work with SIGINT because it raises
KeyboardInterrupt exception but there is a need to set SIGTERM too.

Cheers,
Anibal

> 

