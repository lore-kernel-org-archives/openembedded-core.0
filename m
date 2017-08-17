Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 82DCF7851D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 14:41:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7HEf8j5019498
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 17 Aug 2017 07:41:09 -0700
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 17 Aug 2017 07:41:07 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1502833317-48183-1-git-send-email-mark.hatle@windriver.com>
	<1502890461.13978.127.camel@linuxfoundation.org>
	<e285fe7c-320d-db44-98fd-ff1d06df5706@windriver.com>
	<d01a078c-ad1a-2979-3fc2-fc5d4052ae02@linux.intel.com>
	<3d6ca1eb131841adac87ed6bbbe1b769@XBOX02.axis.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <e91cdee5-1eac-0d1e-4667-7ff077cee4ae@windriver.com>
Date: Thu, 17 Aug 2017 09:41:11 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <3d6ca1eb131841adac87ed6bbbe1b769@XBOX02.axis.com>
Subject: Re: [PATCH 0/6 v2] Fix RPM4 regressions based on Pyro
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
X-List-Received-Date: Thu, 17 Aug 2017 14:41:12 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/17/17 8:01 AM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: Alexander Kanavin [mailto:alexander.kanavin@linux.intel.com]
>> Sent: den 17 augusti 2017 12:53
>> To: Mark Hatle <mark.hatle@windriver.com>; Richard Purdie
>> <richard.purdie@linuxfoundation.org>; openembedded-
>> core@lists.openembedded.org
>> Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>> Subject: Re: [OE-core] [PATCH 0/6 v2] Fix RPM4 regressions based on
>> Pyro
>>
>> On 08/16/2017 06:37 PM, Mark Hatle wrote:
>>> Are there any examples?  I was looking there and simply didn't see
>>> any.  I saw the packaging for instance exercised python interfaces, 
>>> version comparison tools, etc.. but nothing that built a 
>>> recipe/package and then verified the contents were 'correct'.
>>>
>>> Ideally the test would be to fabricate something with a known set 
>>> of file dependencies, produce a package from it and then verify 
>>> that the package properly included those dependencies.
>>>
>>> I had looked at just picking some random library out of the deploy
>>> directory, and doing a pattern search on it's provides.. but I'm 
>>> not sure that type of test would be very robust.
>>
>> How was this regression discovered in the first place? I guess that
>> some recipe used to build without error with rpm5, and stopped 
>> building with rpm4. This is what you could test for: isolate the 
>> problematic bit, remove everything else, and write a simple recipe(s) 
>> that can be placed into meta-selftest. Then simply build those from 
>> the selftest; if they build without error, you don't need to do more 
>> sophisticated checks.
>>
>> Alex
> 
> The problem we have, which caused me to look into this, is:
> 
> We unfortunately have a lot of unversioned libraries, e.g., 
> "libfoo.so" instead of "libfoo.so.1.2.3". There is no problem 

You shouldn't have to version, but you do need to declare an soname.  (This can
be done after link as well if I remember correctly.)  Once an soname is declared
in your library, OE will know that it's runtime and not -dev.)

> building these (except we need to work around OE's default of 
> putting *.so in ${PN}-dev rather than ${PN}). However, when rpm 
> creates the packages for the applications linked with these 
> libraries, it fails to automatically determine these runtime
> dependencies. However, since there are no errors, what then 
> happens is that the image is created, lacking most of our 
> libraries, which of course leads to the image failing to boot 
> when applications cannot find the libraries they need...
> 
> The reason this is not a problem with versioned libraries is 
> that the code in OE has support for determining these and will 
> feed that information to rpm. In hindsight, it would probably 
> have been better if I looked at fixing that code to support 
> unversioned libraries, but since rpm's automatic discovery of 
> runtime dependencies worked in Morty, I thought it would be 
> easiest to get the needed functionality back that was lost in 
> the transition to dnf by fixing rpm...

It might be a good idea to have an optional QA warning for unversioned
libraries.  Last time I looked (a few years ago) we didn't have any by default.
This made it easy to define the rules that we use the declared soname(s) to
define what goes into the runtime library package and what goes into the -dev
package.

--Mark

> //Peter
> 


