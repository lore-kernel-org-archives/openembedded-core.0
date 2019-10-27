Return-Path: <stefan@herbrechtsmeier.net>
Received: from dd41138.kasserver.com (dd41138.kasserver.com [85.13.157.12])
	by mail.openembedded.org (Postfix) with ESMTP id 81FDD7FB96
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 09:58:26 +0000 (UTC)
Received: from [192.168.178.36] (i59F77EF2.versanet.de [89.247.126.242])
	by dd41138.kasserver.com (Postfix) with ESMTPSA id 8DF5F11A1245;
	Sun, 27 Oct 2019 10:58:26 +0100 (CET)
To: Adrian Bunk <bunk@stusta.de>
References: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
	<8e660284b1ece9e66eb47747213e8faafdd99655.camel@linuxfoundation.org>
	<5290bb1a-4cc8-4ed9-8f33-3c8994f06f22@herbrechtsmeier.net>
	<CANNYZj99FATCkw+6V088NkTWm3DEUAcoZaP+XBUR0xZnGeeQdw@mail.gmail.com>
	<20191024153740.GB9707@localhost>
	<b15dc7e214c76e710446b6dd634f669658d5a577.camel@linuxfoundation.org>
	<a83142c2-9106-f996-d1d9-380cbf8d2b97@herbrechtsmeier.net>
	<20191025110849.GB17425@localhost>
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Message-ID: <02dddebb-76a0-80e4-165c-5cd989058321@herbrechtsmeier.net>
Date: Sun, 27 Oct 2019 10:58:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191025110849.GB17425@localhost>
Cc: "Paul Eggleton \(paul.eggleton@linux.intel.com\)"
	<paul.eggleton@linux.intel.com>, rennes@savoirfairelinux.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 0/6] NPM refactoring
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
X-List-Received-Date: Sun, 27 Oct 2019 09:58:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Am 25.10.19 um 13:08 schrieb Adrian Bunk:
> On Fri, Oct 25, 2019 at 10:35:20AM +0200, Stefan Herbrechtsmeier wrote:
>> Am 24.10.19 um 17:59 schrieb Richard Purdie:
>>> On Thu, 2019-10-24 at 18:37 +0300, Adrian Bunk wrote:
>>>> On Thu, Oct 24, 2019 at 02:12:43PM +0200, Alexander Kanavin wrote:
>>>>> On Thu, 24 Oct 2019 at 14:02, Stefan Herbrechtsmeier <
>>>>> stefan@herbrechtsmeier.net> wrote:
>>>>>
>>>>>> @Richard: What is your opinion about the per recipe dependency?
>>>>>> Typically OE use one recipe per project. The NPM based solution
>>>>>> handle a
>>>>>> project and all dependencies via one recipe.
>>>>>
>>>>> I don't think it's at all realistic to stick to the 'one recipe per
>>>>> component' in node.js world. A typical 'npm install' can pull down
>>>>> hundreds, or over a thousand dependencies, it's not feasible to
>>>>> have a
>>>>> recipe for each.
>>>>
>>>> Debian has for the perl/python/node/go/rust/haskell ecosystems
>>>> one recipe per component, with ~ 1k recipes each.
>>>
>>> I think we'll have to end up having a smaller number of recipes which
>>> generate multiple packages. That gives a reasonable parsing time at the
>>> expense of having to pre-generate some of the recipe, a bit like the
>>> core perl and python recipes work today. The exact split will depend on
>>> the ecosystems and the "blocks" people tend to build in as its a
>>> compromise between building too much and parsing time.
>>
>> How should this work? Node.js consist of multiple independent packages and
>> every package define its own dependencies. Thereby the dependencies is
>> defined with a version range which often reference a single version.
> 
> Yes, it is a problem that backwards compatibility is frequently broken
> in Node.js packages and just using npm might result in 10 different
> versions of the same package installed and used.

Therefore the distribution could add an compatibility identifier 
(interface version) to the packages and translate the version range of 
the dependencies into a compatibility identifier. The default 
compatibility identifier is the major version of the package. This 
allows the distribution to ship one package per compatibility 
identifier. The distribution could provide multiple compatibility 
identifiers by a single package or introduce additional packages / 
compatibility identifiers based on the major, minor and maybe patch 
version of the package.

This information could and should be shared between different 
distributions to automate the creation of distribution packages from npm 
packages.

> This is a huge mess that either has to be sorted out when packaging
> (as is done in Debian), or you end up with security support basically
> impossible for something very exposed on the internet.

Ack

Regards
   Stefan

