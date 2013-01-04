Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Tr9i3-0002at-5d
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Jan 2013 17:01:31 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r04FkIBk015351
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 4 Jan 2013 07:46:18 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Fri, 4 Jan 2013 07:46:18 -0800
Message-ID: <50E6F950.2070306@windriver.com>
Date: Fri, 4 Jan 2013 09:46:24 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Philip Balister <philip@balister.org>
References: <50E5D101.9030701@balister.org> <50E5DA36.5090702@windriver.com>
	<50E6F6F0.2070502@balister.org>
In-Reply-To: <50E6F6F0.2070502@balister.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Enabling NEON instructions for fftw
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Jan 2013 16:01:32 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 1/4/13 9:36 AM, Philip Balister wrote:
> On 01/03/2013 02:21 PM, Mark Hatle wrote:
>> On 1/3/13 12:42 PM, Philip Balister wrote:
>>> So, recent versions of fftw have NEON support for the single precision
>>> build. In the poast, I just passed --enable-neon to configure or the
>>> armv7a case. Now, this is not entirely correct, since some armv7a's lack
>>> a NEON coprocessor.
>>>
>>> Does anyone have a suggestion for how to handle this better? Personally,
>>> I think if you want to run fftwf without NEON, you should have your head
>>> examined, but I would like to avoid generating packages that SIGILL on
>>> people.
>>
>> This says to me that either you need a machine specific package, or use
>> an alternative architecture for that package.. (that is compatible)..
>> then the package can switch neon on/off depending on arch of tuning flags.
>>
>> There is an armv7a-neon tuning defined.  This enabled the TUNE_FEATURES
>> of 'neon'.  So you should be able to check for that in the fftw recipe,
>> and enable the --enable-neon when it's set.  (Using PACKAGECONFIG is
>> likely best...)
>>
>> Then you can change the DEFAULTTUNE_<recipe> = "armv7-neon" in your
>> local.conf.
>
> I really do not want to depend on users putting entries in local.conf to
> obtain proper operation on a specific machine. It looks like the neon
> tune is already selected for the machine I am building for.
>
> In the end, this boils down to, do we care about supporting machines
> with/without NEON from one set of packages by making ones with NEON
> machine specific.

Machine specific is one answer, but my preference is to have a neon specific 
package arch selected.  Looking at the definitions, my expectation is that once 
the -neon version of armv7 is selected the package arch should similarly be 
modified to end in "-neon".

So as long as the BSP/machine uses the neon tune, then everything should be 
compiled and labeled properly.

> For now, I will purse the route of fftwf building with --enable if the
> neon tune is available for the machine.

Definitely the right way to do it, no matter how the package's arch is named.

> Philip
>
> Philip
>
> Philip
>
>>
>> --Mark
>>
>>> Philip
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>



