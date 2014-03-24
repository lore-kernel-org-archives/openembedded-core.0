Return-Path: <sledz@dresearch-fe.de>
Received: from zk223.dresearch-fe.de (zk223.dresearch-fe.de [217.92.177.116])
	by mail.openembedded.org (Postfix) with ESMTP id E7CE56F7C6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 12:49:09 +0000 (UTC)
Received: from fensuse.internal.dresearch-fe.de
	(fensuse.internal.dresearch-fe.de [172.29.23.6])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id C9718E012B;
	Mon, 24 Mar 2014 12:49:09 +0000 (UTC)
Received: from [IPv6:::1] (localhost [IPv6:::1])
	by fensuse.internal.dresearch-fe.de (Postfix) with ESMTP id ABF587012BB;
	Mon, 24 Mar 2014 13:49:09 +0100 (CET)
Message-ID: <533029C5.1000406@dresearch-fe.de>
Date: Mon, 24 Mar 2014 13:49:09 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <5330220F.8050504@dresearch-fe.de> <1395664516.24232.56.camel@ted>
In-Reply-To: <1395664516.24232.56.camel@ted>
X-Enigmail-Version: 1.6
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 24 Mar 2014 12:49:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.03.2014 13:35, Richard Purdie wrote:
> On Mon, 2014-03-24 at 13:16 +0100, Steffen Sledz wrote:
>> We've a complex versioning scenario here which leads me to my limits. :(
>>
>> There are two recipes. One for a shared library and one for an application using this library.
>>
>> Both use GNU autotools (so they have internal version information). For continuous integration purposes both use AUTOREV.
>>
>> At the moment the recipes look like this:
>>
>>
>> ------------ libfoo_git.bb -------------
>> PR = "r7"
>> PE = "2"
>> SRCREV="${AUTOREV}"
>> PV = "gitr${SRCPV}"
>> ...
>>
>>
>> ------------ app_git.bb ----------------
>> DEPENDS = "... libfoo ..."
>> PR = "r10"
>> PE = "1"
>> SRCREV="${AUTOREV}"
>> PV = "gitr${SRCPV}"
>> ...
>>
>>
>> Now we have the following problem. libfoo has some incompatible
>> changes in its interface (a new internal major version).
>>
>> In my opinion this should find its represenation in the package
>> versioning in a way that the dependency checker can guarantee that the
>> library and the application package match each other.
> 
> It is generally impossible to directly compare two git hashes and decide
> whether one is "greater" than the other. This is why most git recipes
> have PV = "0.0+git${SRCPV}" so that you can change 0.0 when something
> major changes. That way you can put a constraint in the second recipe.
> 
> This is a fundamental problem with git versioning and not something we
> can fix generically.

To have an order in the git based versions we use the PRSERV method. This works well.

But this does not help here. The change in the library interface leads directly to a new version of the library package itself (e.g. from libfoo0_gitr100+somehash to libfoo0_gitr101+someotherhash). But i need something i can write into the DEPENDS list of the application. :(

Steffen

BTW: Where comes the 0 in libfoo0 from?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

