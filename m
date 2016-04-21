Return-Path: <Tudor.Florea@enea.com>
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.37])
	by mail.openembedded.org (Postfix) with ESMTP id AFE88605FE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 08:24:51 +0000 (UTC)
Received: from 1at9us-00056m-TR by out11b.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <Tudor.Florea@enea.com>)
	id 1at9us-00057N-U1; Thu, 21 Apr 2016 01:24:50 -0700
Received: by emcmailer; Thu, 21 Apr 2016 01:24:50 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11b.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <Tudor.Florea@enea.com>)
	id 1at9us-00056m-TR; Thu, 21 Apr 2016 01:24:50 -0700
Received: from [IPv6:fda8:8b75:6fa6:1000:39ce:bb3c:9bbb:39af] (192.168.15.34)
	by smtp.enea.com (172.21.1.209) with Microsoft SMTP Server id
	14.3.294.0; Thu, 21 Apr 2016 10:24:49 +0200
To: Mark Hatle <mark.hatle@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <57166561.7020006@enea.com> <571672AD.9060706@windriver.com>
	<5716CA2A.4050001@enea.com> <5716D69E.5080506@windriver.com>
From: Tudor Florea <tudor.florea@enea.com>
Message-ID: <57188E50.2030200@enea.com>
Date: Thu, 21 Apr 2016 11:24:48 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <5716D69E.5080506@windriver.com>
X-Originating-IP: [192.168.15.34]
X-Outbound-IP: 192.36.1.72
X-Env-From: Tudor.Florea@enea.com
X-PolicySMART: 6030817
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: Re: rpm generation question
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
X-List-Received-Date: Thu, 21 Apr 2016 08:24:54 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit



On 20/04/2016 04:08, Mark Hatle wrote:
> On 4/19/16 7:15 PM, Tudor Florea wrote:
>>
>>
>> On 19/04/2016 21:02, Mark Hatle wrote:
>>> On 4/19/16 12:05 PM, Tudor Florea wrote:
>>>> As part of our test infrastructure we're attempting to install ptest
>>>> packages (and execute the tests accordingly).
>>>> Attempting to install ptest for valgrind fails with this error:
>>>>
>>>> error: Can't install valgrind-ptest-3.11.0-r0.1@ppce500mc: no package
>>>> provides /this/is/a/bogus/interpreter/name
>>>
>>> You can turn off the file level requires and provides on a per package basis.
>>>
>>> SKIP_FILEDEPS_${PN}-ptest = '1'
>>
>> Mark,
>> Thank you for the information provided.
>> Unfortunately this did not work as expected.
>> First issue: the dependency on bogus interpreter still exists with the
>> line above.
>> I was able to force remove this dependency by setting
>> MERGEPERFILEDEPS = "0"
>> on meta/classes/package_rpm.bbclass. Of course this is not a fix but
>> only a test. I'm not sure if there is something missing around.
>>
>> The second issue: The rpm created this way can be installed using the
>> command:
>> rpm -ivH ./valgrind-ptest-3.11.0-r0.4.ppce500mc.rpm
>> but still fails when attempt to install using smart.
>>
>> Is this second issue a bug or smart is supposed to work this way?
> 
> What is the error with smart.  If it's the same dependency error then it almost
> sounds like the feed database is out of sync.
It was the same error. I have rebuild and retest everything from scratch
and now is working.
I'm going to send a patch for this.
Thank you very much.
 Tudor.
> 
> --Mark
> 
>>
>> Thank you,
>>  Tudor.
>>
>>>
>>> Otherwise (for rpm packages) the system will attempt to discover and use the
>>> per-file interpreter and other dependencies.  Since ptest is only tests, and the
>>> dependencies here are specific to tests -- it should be safe to disable them.
>>>
>>> (If that isn't the right approach for some reason, there are some other ways to
>>> do a file level provide, but they're significantly more complicated and rarely
>>> used.)
>>>
>>> --Mark
>>>
>>>>
>>>> smart install valgrind-ptest-3.11.0-r0.1@ppce500mc
>>>> Loading cache...
>>>> Updating cache...
>>>> ###############################################################################
>>>> [100%]
>>>>
>>>> Computing transaction...
>>>>
>>>>  error: Can't install valgrind-ptest-3.11.0-r0.1@ppce500mc: no package
>>>> provides /this/is/a/bogus/interpreter/name
>>>>
>>>>
>>>> This is most probably caused by the file shell_badinterp contained in
>>>> this package having the following contents:
>>>>
>>>> #! /this/is/a/bogus/interpreter/name
>>>>
>>>> true
>>>>
>>>> Does anyone have an idea how to get rid of this error?
>>>> More specific: How can I exclude dependency on
>>>> "/this/is/a/bogus/interpreter/name" for an rpm package?
>>>>
>>>> Thank you very much.
>>>>   Tudor.
>>>>
>>>
> 

