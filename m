Return-Path: <openembedded-core@emagii.com>
Received: from smtprelay-b22.telenor.se (smtprelay-b22.telenor.se
	[195.54.99.213])
	by mail.openembedded.org (Postfix) with ESMTP id B0DE56D77A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 08:04:41 +0000 (UTC)
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-b22.telenor.se (Postfix) with ESMTP id 2E140CB4D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 09:04:41 +0100 (CET)
X-SENDER-IP: [83.227.57.102]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AgoYAMu9jVJT4zlmPGdsb2JhbAANS4M/vVROgTMDAQEBATiCWgEBAQECAQEBATU2CgYLCyEWDwkDAgECARUBGxQTBgIBAYd3CwiuYpF7F49yFoQcA5VDgk+BMJQJ
X-IronPort-AV: E=Sophos;i="4.93,742,1378850400"; d="scan'208";a="656303425"
Received: from c-6639e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.236]) ([83.227.57.102])
	by ipb2.telenor.se with ESMTP; 21 Nov 2013 09:04:41 +0100
Message-ID: <528DBE98.3080309@emagii.com>
Date: Thu, 21 Nov 2013 09:04:40 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <528D2429.7040705@emagii.com> <1384982956.16887.94.camel@ted>
In-Reply-To: <1384982956.16887.94.camel@ted>
Subject: Re: Improving Build Speed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ulf@emagii.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Nov 2013 08:04:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


>>       Why restrict PARALLEL_MAKE to anything less than the number of H/W
>> threads in the machine?
>>
>>       Came up with a construct PARALLEL_HIGH which is defined alongside
>> PARALLEL_MAKE in conf/local.conf
>>
>>       PARALLEL_MAKE = "-j8"
>>       PARALLEL_HIGH = "-j24"
>>
>>       In the appropriate recipes, which seems to be processed by bitbake
>> in solitude I do:
>>
>>       PARALLEL_HIGH ?= "${PARALLEL_MAKE}"
>>       PARALLEL_MAKE  = "${PARALLEL_HIGH}"
>>
>>       This means that they will try to use each H/W thread.
> Please benchmark the difference. I suspect we can just set the high
> number of make for everything. Note that few makefiles are well enough
> written to benefit from high levels of make (webkit being an notable
> exception).
>
It looks like it is shaving off  ~2 minutes from a build which normally 
takes ~84 minutes.

First build
PARALLEL_MAKE = "-j12"
PARALLEL_HIGH = "-j24"
BB_NUMBER_THREADS = "24"
real    83m24.093s

Second build
PARALLEL_MAKE = "-j12"
PARALLEL_HIGH = "-j12"
BB_NUMBER_THREADS = "24"
real    85m12.007s


BR
Ulf

> Cheers, Richard _______________________________________________ 
> Openembedded-core mailing list 
> Openembedded-core@lists.openembedded.org 
> http://lists.openembedded.org/mailman/listinfo/openembedded-core 


-- 
Best Regards
Ulf Samuelsson
eMagii


