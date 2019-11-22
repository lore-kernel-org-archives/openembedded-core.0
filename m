Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2C9B77D2E6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 11:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 597829C0294;
	Fri, 22 Nov 2019 06:08:06 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id d-D6Wwgm-hfu; Fri, 22 Nov 2019 06:08:05 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 676129C02E4;
	Fri, 22 Nov 2019 06:08:05 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id 5k_4t7GPryak; Fri, 22 Nov 2019 06:08:05 -0500 (EST)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 2E9589C0294;
	Fri, 22 Nov 2019 06:08:05 -0500 (EST)
Date: Fri, 22 Nov 2019 06:08:04 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <2010614174.635763.1574420884655.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <50236bca804ff079db05b696f783c9af7e408c8f.camel@linuxfoundation.org>
References: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
	<b3ae667e644cf4b81c096562965268dbe5596065.camel@linuxfoundation.org>
	<531618732.621500.1574366028835.JavaMail.zimbra@savoirfairelinux.com>
	<50236bca804ff079db05b696f783c9af7e408c8f.camel@linuxfoundation.org>
MIME-Version: 1.0
X-Mailer: Zimbra 8.8.11_GA_3737 (ZimbraWebClient - GC78 (Linux)/8.8.11_GA_3737)
Thread-Topic: NPM refactoring
Thread-Index: 2P7I1BYedB6r6q8vahk9iPJyEjr6dQ==
Cc: Jonas Andersson <jonaskgandersson@gmail.com>,
	paul eggleton <paul.eggleton@linux.intel.com>,
	Savoir-faire Linux Rennes <rennes@savoirfairelinux.com>,
	OE-core <openembedded-core@lists.openembedded.org>, bunk <bunk@stusta.de>
Subject: Re: [PATCH v3 00/17] NPM refactoring
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
X-List-Received-Date: Fri, 22 Nov 2019 11:08:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Richard,

On Nov 21, 2019, at 9:25 PM, Richard Purdie richard.purdie@linuxfoundation.org wrote:
> On Thu, 2019-11-21 at 14:53 -0500, Jean-Marie LEMETAYER wrote:
>> On Nov 21, 2019, at 7:26 PM, Richard Purdie
>> richard.purdie@linuxfoundation.org wrote:
>> > On Wed, 2019-11-20 at 10:33 +0100, Jean-Marie LEMETAYER wrote:
>> > > The current NPM support have several issues:
>> > >  - The current NPM fetcher downloads the dependency tree but not
>> > > the other
>> > >    fetchers. The 'subdir' parameter was used to fix this issue.
>> > >  - They are multiple issues with package names (uppercase, exotic
>> > > characters,
>> > >    scoped packages) even if they are inside the dependencies.
>> > >  - The lockdown file generation have issues. When a package
>> > > depends on
>> > >    multiple version of the same package (all versions have the
>> > > same checksum).
>> > > 
>> > > This patchset refactors the NPM support in Yocto:
>> > >  - As the NPM algorithm for dependency management is hard to
>> > > handle, the new
>> > >    NPM fetcher downloads only the package source (and not the
>> > > dependencies,
>> > >    like the other fetchers) (patch submitted in the bitbake-devel
>> > > list).
>> > 
>> > I'm a little confused by this item.
>> > 
>> > If the NPM fetcher only downloads a given package's source and it
>> > has
>> > dependencies, where/when are the dependencies downloaded?
>> > 
>> > My worry here is that if the fetcher isn't downloading them, DL_DIR
>> > can't contain all the needed pieces needed to reproduce a build at
>> > a
>> > later date?
>> > 
>> > I suspect I'm missing something obvious...
>> 
>> The magic is in the bbclass, in the do_fetch_append() function:
>> https://github.com/savoirfairelinux/poky/blob/npm-refactoring-v3/meta/classes/npm.bbclass#L51
>> 
>> Which calls:
>> https://github.com/savoirfairelinux/poky/blob/npm-refactoring-v3/bitbake/lib/bb/fetch2/npm.py#L312
>> 
>> Which runs the npm fetcher for each dependencies described in the
>> shrinkwrap file. This is the same behavior for the do_unpack task.
>> 
>> 
>> To be more clear, a recipe like this:
>> 
>> ```
>> SRC_URI = "npm://registry.npmjs.org/;name=my-package;version=1.0.0"
>> S = "${WORKDIR}/npm"
>> ```
>> 
>> Will only fetch/unpack the package source without handling the
>> dependencies.
>> 
>> But a recipe like this:
>> 
>> ```
>> SRC_URI = "npm://registry.npmjs.org/;name=my-package;version=1.0.0"
>> S = "${WORKDIR}/npm"
>> 
>> NPM_SHRINKWRAP = "${THISDIR}/${BPN}/npm-shrinkwrap.json"
>> inherit npm
>> ```
>> 
>> Will fetch/unpack the package and all the dependencies which are
>> described in the shrinkwrap file.
> 
> That does remove some of my worries, thanks for explaining!
> 
> It does make me wonder if we shouldn't have two fetch classes and then
> support a url like:
> 
> SRC_URI = "npm://registry.npmjs.org/;name=my-package;version=1.0.0 \
>           npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json"
> 
> where the "npmsw" handler would handle the shrinkwrap file?
> 
> Basically I don't like the way the current code has to tag the
> shrinkwrap file handling on to the fetcher...

This definitely sounds like a great idea !

I based my work on the current implementation, but I never thought of
refactoring as much. I have however some concerns about the management
of the registry and the development dependencies. I will try to come
back with a v4.

>> Bonus tips: you can have your base package SRC_URI using another
>> fetcher than npm (e.g. git) without breaking anything. The behavior
>> will still be the same.
> 
> That does start to make it clearer why this is advantageous.

Regards,
Jean-Marie

