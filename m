Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 70189782E0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 14:37:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7HEbePK012703
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 17 Aug 2017 07:37:41 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 17 Aug 2017 07:37:40 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1502833317-48183-1-git-send-email-mark.hatle@windriver.com>
	<1502890461.13978.127.camel@linuxfoundation.org>
	<e285fe7c-320d-db44-98fd-ff1d06df5706@windriver.com>
	<d01a078c-ad1a-2979-3fc2-fc5d4052ae02@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <5a938fd6-109e-25f8-638a-1530d055bff5@windriver.com>
Date: Thu, 17 Aug 2017 09:37:43 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <d01a078c-ad1a-2979-3fc2-fc5d4052ae02@linux.intel.com>
Cc: peter.kjellerstedt@axis.com
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
X-List-Received-Date: Thu, 17 Aug 2017 14:37:49 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/17/17 5:53 AM, Alexander Kanavin wrote:
> On 08/16/2017 06:37 PM, Mark Hatle wrote:
>> Are there any examples?  I was looking there and simply didn't see any.  I saw
>> the packaging for instance exercised python interfaces, version comparison
>> tools, etc.. but nothing that built a recipe/package and then verified the
>> contents were 'correct'.
>>
>> Ideally the test would be to fabricate something with a known set of file
>> dependencies, produce a package from it and then verify that the package
>> properly included those dependencies.
>>
>> I had looked at just picking some random library out of the deploy directory,
>> and doing a pattern search on it's provides.. but I'm not sure that type of test
>> would be very robust.
> 
> How was this regression discovered in the first place? I guess that some 
> recipe used to build without error with rpm5, and stopped building with 
> rpm4. This is what you could test for: isolate the problematic bit, 
> remove everything else, and write a simple recipe(s) that can be placed 
> into meta-selftest. Then simply build those from the selftest; if they 
> build without error, you don't need to do more sophisticated checks.
> 

In -my- case (I can't speak for Peter), I found the issue trying to build SRPMs
on the target.  I either ran into dep problems or could not install what I built.

Further I went in and simply looked at the output (deploy dir):  rpm -qp
<package> --provides

I was able to quickly determine that only OE style dependencies were present.

So from a test perspective, we probably need to build something with a known
content and run rpmdeps against it, and then build a package (recipe) and verify
the dependencies are there as well.  I just don't know how to implement that in
the existing unit-test framework.

--Mark

> Alex
> 


