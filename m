Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id A32496160A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 12:15:27 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r85CSAp6007871; Thu, 5 Sep 2013 13:28:10 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PfXbV2Eco3Kn; Thu,  5 Sep 2013 13:28:09 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r85CS4UB007853
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 5 Sep 2013 13:28:05 +0100
Message-ID: <1378383289.32427.63.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 05 Sep 2013 13:14:49 +0100
In-Reply-To: <CAJTo0Labk000SpLOiM8gtuSu2pwK0jsgU9osO60GEFntThxSeA@mail.gmail.com>
References: <cover.1378339881.git.dvhart@linux.intel.com>
	<7e9270b1c56aeeb6ed22210cab98d2675b092d5d.1378339881.git.dvhart@linux.intel.com>
	<CAJTo0La0W7PXkuBsvqD2XqPMMbbLtmJef5T97sikSJogZ1XCiQ@mail.gmail.com>
	<CAP9ODKqVU+ka+VzjPj6p0iVsirrOSqLtDFWNzfBcKutwj1Fo3Q@mail.gmail.com>
	<CAJTo0Labk000SpLOiM8gtuSu2pwK0jsgU9osO60GEFntThxSeA@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Darren Hart <dvhart@linux.intel.com>, Poky <poky@yoctoproject.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] xorg-driver-common: Add configure and install appends from meta-intel
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
X-List-Received-Date: Thu, 05 Sep 2013 12:15:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-09-05 at 12:40 +0100, Burton, Ross wrote:
> On 5 September 2013 12:37, Otavio Salvador <otavio@ossystems.com.br> wrote:
> >> Sadly when using libtool you can't "opt-out" of installing .la files
> >> unless you delete the files that just got installed.  In my opinion
> >> this is something that needs to be done globally instead of
> >> per-recipe.
> >
> > So autotools.bbclass?
> 
> Exactly.  Phil sent patches to do this previously, and I've a
> branch... somewhere that has another unfinished version.

I continue to have mixed feelings about this: 

* We've not done side by side build comparisons with something like
buildhistory.

* Figuring out any runtime issues with dlopen is the hardest part and we
don't actually have real data on whether there are issues there or not.

* We'd be deviating from the way the libtool authors suggest their tool
should operate. This makes filing bug reports and interacting with
upstream harder. I continue to dream of a libtool with working sysroot
support for example instead of carrying our hacks/workarounds/bugfixes.

* They are used in places, for example the darwin shlibs code currently
uses them. It could be updated to use otool these days mind but I'd
probably make the current code a fallback for unknown arches since it is
guaranteed to work everywhere.

So whilst I know several people love to just delete them, its a slightly
more complex issue than that.

Cheers,

Richard (who isn't keen on libtool and would rather replace that instead)


