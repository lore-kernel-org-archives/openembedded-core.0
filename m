Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 73D2C7808D;
	Mon, 19 Jun 2017 14:05:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5JE555Z020054
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 19 Jun 2017 07:05:05 -0700
Received: from soho-mhatle-m.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 19 Jun 2017 07:05:04 -0700
To: Philip Balister <philip@balister.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
References: <1497868738.24449.41.camel@linuxfoundation.org>
	<cbc4d73d-be96-309d-a749-0ad344572a22@balister.org>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <a34e53ad-edce-faf4-0d4f-f7621f05d57a@windriver.com>
Date: Mon, 19 Jun 2017 09:05:10 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <cbc4d73d-be96-309d-a749-0ad344572a22@balister.org>
Subject: Re: [Openembedded-architecture] OE-Core/Yocto Project's first CVE (CVE-2017-9731)
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
X-List-Received-Date: Mon, 19 Jun 2017 14:05:21 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 6/19/17 8:20 AM, Philip Balister wrote:
> On 06/19/2017 06:38 AM, Richard Purdie wrote:
>> I suspect this has been missed by some people so I want to spell it
>> out. We have our first CVE in OE-Core itself.
>>
>> The issue is limited to binary ipks potentially exposing sensitive
>> information through the "Source:" field which contained the full
>> SRC_URI. Those urls could potentially contain sensitive information
>> about servers and credentials.
> 
> So the issue is leaking credentials, not build system paths? I mention
> this because we do leak build system paths into images in other places.

Build systems paths would be unrelated to this, assuming I understand it properly.

Information leak of the build user, time of build, and build system paths can
all occur.  (This is part of the overall binary reproducible stuff as well.)

When it comes to information leaks, specifically build system leaks.  As long as
they don't contain credential information then it is a point of mitigation vs a
'bug' in my opinion.  We clearly want to move toward a binary reproducible build
-- doing so will further limit the leaks (or at least make them understood.)

For build user, hostname, directories and build time/date issues -- we've
already mitigated many of them.  Directory structure was done when we started to
use the compilers path replacement operations.  (It's probably not 100%
effective, but I'd say any items that are left are reasonable bug candidates.)
We've also made passes to remove many of the other items, but I'd simply
consider them regular bugs at this point...  but information leaks like this are
something people often don't think about and probably should be made aware of.

It would be reasonable to write up a 'best practices' type document.  Explaining
that simply due to the nature of building many of these things will be 'leaked'
and where some of them are leaked through.  (Package generation, compilation,
etc for instance.)

Controlling your 'production' build environment can mitigate many of the
potential issues here.  By using non-confidential path names (i.e. don't include
confidential 'customer', code-name, etc in build paths), changing or otherwise
managing the host name on your build system (i.e. instead of
my-product.my-company.internal.com... something like 'build-1' as a hostname can
help hide many of these things.)  Using a 'build user' who doesn't have any
network credentials, other then on the build system itself...

--Mark

> Philip
> 
> 
>>
>> After discussion, I ended up changing the field to contain the recipe
>> filename (no path). There was talk of filtering the urls however if you
>> try, it becomes clear that sensitive elements can remain and no
>> solution is likely 100% effective. The other package backends don't do
>> this at all so this brings ipk more into line with them. Simply
>> clearing the field doesn't work with the current opkg-utils. It can be
>> changed but the change becomes more invasive.
>>
>> This fix has been merged to master.
>>
>> I also did take the decision to backport this change back to
>> pyro/morty/krogoth too. I appreciate this can cause some disruption to
>> people who rely on SRC_URI being in the Source: field however I
>> couldn't see any other realistic way forward.
>>
>> Cheers,
>>
>> Richard
>> _______________________________________________
>> Openembedded-architecture mailing list
>> Openembedded-architecture@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-architecture
>>
> _______________________________________________
> Openembedded-architecture mailing list
> Openembedded-architecture@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-architecture
> 


