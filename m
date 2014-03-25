Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 914796F92D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 15:03:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2PF39kS020519
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 08:03:10 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Tue, 25 Mar 2014 08:03:09 -0700
Message-ID: <53319AAD.5070506@windriver.com>
Date: Tue, 25 Mar 2014 10:03:09 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <5330220F.8050504@dresearch-fe.de>
	<1395664516.24232.56.camel@ted>	<533029C5.1000406@dresearch-fe.de>
	<1395665593.24232.58.camel@ted>	<53303FAB.5020907@dresearch-fe.de>
	<20140324151537.GD29998@jama> <53315AE7.1020304@dresearch-fe.de>
In-Reply-To: <53315AE7.1020304@dresearch-fe.de>
Subject: Re: complex versioning scenario
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
X-List-Received-Date: Tue, 25 Mar 2014 15:03:10 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/25/14, 5:31 AM, Steffen Sledz wrote:
> On 24.03.2014 16:15, Martin Jansa wrote:
>> On Mon, Mar 24, 2014 at 03:22:35PM +0100, Steffen Sledz wrote:
>>> On 24.03.2014 13:53, Richard Purdie wrote:
>>>> On Mon, 2014-03-24 at 13:49 +0100, Steffen Sledz wrote:
>>>>> On 24.03.2014 13:35, Richard Purdie wrote:
>>>>>> On Mon, 2014-03-24 at 13:16 +0100, Steffen Sledz wrote:
>>>>>>> We've a complex versioning scenario here which leads me to my limits. :(
>>>>>>>
>>>>>>> There are two recipes. One for a shared library and one for an application using this library.
>>>>>>>
>>>>>>> Both use GNU autotools (so they have internal version information). For continuous integration purposes both use AUTOREV.
>>>>>>>
>>>>>>> At the moment the recipes look like this:
>>>>>>>
>>>>>>>
>>>>>>> ------------ libfoo_git.bb ------------- PR = "r7" PE = "2" SRCREV="${AUTOREV}" PV = "gitr${SRCPV}" ...
>>>>>>>
>>>>>>>
>>>>>>> ------------ app_git.bb ---------------- DEPENDS = "... libfoo ..." PR = "r10" PE = "1" SRCREV="${AUTOREV}" PV = "gitr${SRCPV}" ...
>>>>>>>
>>>>>>>
>>>>>>> Now we have the following problem. libfoo has some incompatible changes in its interface (a new internal major version).
>>>>>>>
>>>>>>> In my opinion this should find its represenation in the package versioning in a way that the dependency checker can guarantee that the library and the application package match each other.
>>>>>>
>>>>>> It is generally impossible to directly compare two git hashes and decide whether one is "greater" than the other. This is why most git recipes have PV = "0.0+git${SRCPV}" so that you can change 0.0 when something major changes. That way you can put a constraint in the second recipe.
>>>>>>
>>>>>> This is a fundamental problem with git versioning and not something we can fix generically.
>>>>>
>>>>> To have an order in the git based versions we use the PRSERV method. This works well.
>>>>>
>>>>> But this does not help here. The change in the library interface leads directly to a new version of the library package itself (e.g. from libfoo0_gitr100+somehash to libfoo0_gitr101+someotherhash). But i need something i can write into the DEPENDS list of the application. :(
>>>>>
>>>>> Steffen
>>>>>
>>>>> BTW: Where comes the 0 in libfoo0 from?
>>>>
>>>> debian.bbclass (debian package naming) which I believe in turn is derived from the actual library version.
>>>>
>>>> Its a class specific implementation so you can't depend on it in version information though.
>>>
>>> But where does it come from? A bb variable?
>>
>> SONAME header in library
>>
>> so if you're using debian.bbclass and change ABI then you should just increase major version in SONAME (that way your foo will rdepend on libfoo0 until it's rebuilt against newer libfoo1).
>
> Thanx, this was the decisive hint.
>
> I've increased the version in the SONAME header of the library and the result is a libfoo1 package. :)
>
> But now i hit the next problem. The following rootfs stage results in this error:
>
> ---------------> snip <-----------------
> | Collected errors:
> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies for app:
> |  *    libfoo0 (>= gitr101+somehash) *
> ---------------> snap <-----------------
>
> Should the new build of libfoo1 trigger a new compile of all packages with DEPENDS containing libfoo?
>

If the package 'requiring libfoo' has a DEPENDS += ... in it.. then yes, it 
should have been rebuilt when the libfoo was rebuilt.

--Mark

