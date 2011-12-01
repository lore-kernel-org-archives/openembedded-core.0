Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded-core@emagii.com>) id 1RWGXu-0008Mk-4Q
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 01:00:06 +0100
Received: from ipb4.telenor.se (ipb4.telenor.se [195.54.127.167])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id 66CDAC3D8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2011 00:53:24 +0100 (CET)
X-SENDER-IP: [83.227.56.19]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AnMbAJAS2E5T4zgTPGdsb2JhbAAMN6sbAQEBATeCJAEBAQEDAQEBNTYQCwsYCSUPAhYBGxQGDQYCAQGIC7gNg2yHNASSNoIhiQqJCQ
X-IronPort-AV: E=Sophos;i="4.71,281,1320620400"; d="scan'208";a="1767573434"
Received: from c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.244]) ([83.227.56.19])
	by ipb4.telenor.se with ESMTP; 02 Dec 2011 00:53:23 +0100
Message-ID: <4ED81372.90200@emagii.com>
Date: Fri, 02 Dec 2011 00:53:22 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4EC24711.2010805@eukrea.com>	<CAOd_LFzLRF3VvbQqrGekjtLSvfyXHQHeKyd=QcnAUFQpaGg8uA@mail.gmail.com>	<1322743693.17484.120.camel@ted>	<CAOd_LFwOiy9hR0M9FjRE5xRdN-HLwQUpMsWqiNKppr6QjvjzKw@mail.gmail.com>	<4ED7A46E.2030603@emagii.com>
	<20111201230804.GD9685@sakrah.homelinux.org>
In-Reply-To: <20111201230804.GD9685@sakrah.homelinux.org>
Subject: Re: Reproducible build problem with BB_NUMBER_THREADS=8
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ulf@emagii.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Dec 2011 00:00:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-12-02 00:08, Khem Raj wrote:
> On (01/12/11 16:59), Ulf Samuelsson wrote:
>> 2011-12-01 15:12, Cliff Brake skrev:
>>> On Thu, Dec 1, 2011 at 7:48 AM, Richard Purdie
>>> <richard.purdie@linuxfoundation.org>   wrote:
>>>
>>>> When you restart the build is the problem persistent or does it work the
>>>> second time?
>>> I set BB_NUMBER_THREADS  = "2" (was 4 when failing)
>>>
>>> I tried to restart the build and cleanall just the failing package,
>>> and it still failed.  I then ran:
>>>
>>> bitbake -c cleanall gcc-cross gcc-cross-initial gcc-cross-intermediate
>>> gcc-runtime
>>>
>>> and after that, everything worked.
>>>
>>>> Does someone have a complete console log for a build that failed with
>>>> this they could share?
>>> I'll restart the build and collect one.  So you just want the output
>>> of the console for bitbake?
>>>
>>> Thanks,
>>> Cliff
>>>
>> Here is my buildlog, creating the failure.
>> The C++ compiler cannot find "string", even though it is in
>> "<sysroot>/usr/include/c++"
>>
> This probably might have something to do with-gxx-include settings
> I will see if I can reproduce it here
I have seen the problem on the following machine
Core i7 980X (hexa core) @ 3.33 GHz
12 GB RAM
Ubuntu 11.10 x64
Build on Intel 510 120 GB SSD disk
PARALLEL_MAKE = "24" | "4"
BB_NUMBER_THREADS = "24" | "4".

I have not seen the problem on the following machine
Core i7 920 @ 2.67 GHz
4 GB RAM.
Ubuntu 11.04 x64
WD Black 1TB SATA-II
PARALLEL_MAKE = "4"
BB_NUMBER_THREADS = "4".


The problem comes in two flavours.
The one in the log, but also when building "tiff".
"tiff" bombs with another C++ include.

Someone else had a similar problem, so I cleaned out the build directory,
built tiff, and then console-image, which completed.

I changed my build script to first build tiff, and then console-image
for the next clean build. This time the c++ include problem reappeared.

I guess there is some race condition somewhere.

BR
Ulf Samuelsson

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


-- 
Best Regards
Ulf Samuelsson
eMagii



