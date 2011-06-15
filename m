Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QWmWx-0008E1-Av for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 11:36:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5F9XYd0024882
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 10:33:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24800-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 10:33:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5F9XR97024876
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 10:33:27 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <DCECC705-8B71-44A7-B1B6-1BE79A1FCADD@dominion.thruhere.net>
References: <1308086002-16398-1-git-send-email-raj.khem@gmail.com>
	<1308086688.15712.362.camel@rex>
	<DCECC705-8B71-44A7-B1B6-1BE79A1FCADD@dominion.thruhere.net>
Date: Wed, 15 Jun 2011 10:33:25 +0100
Message-ID: <1308130405.15712.369.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH V2] allarch.bbclass: Set FEED_ARCH to original value of BASE_PACKAGE_ARCH and then set BASE_PACKAGE_ARCH to 'all'
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 15 Jun 2011 09:36:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-15 at 10:56 +0200, Koen Kooi wrote:
> Op 14 jun 2011, om 23:24 heeft Richard Purdie het volgende geschreven:
> 
> > On Tue, 2011-06-14 at 14:13 -0700, Khem Raj wrote:
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >> meta/classes/allarch.bbclass |    5 +++--
> >> 1 files changed, 3 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
> >> index e3ac392..b9ba28b 100644
> >> --- a/meta/classes/allarch.bbclass
> >> +++ b/meta/classes/allarch.bbclass
> >> @@ -2,9 +2,10 @@
> >> # This class is used for architecture independent recipes/data files (usally scripts)
> >> #
> >> 
> >> +# We need to pour the value of BASE_PACKAGE_ARCH into FEED_ARCH
> >> +# before we reset it
> >> +FEED_ARCH := ${BASE_PACKAGE_ARCH}
> >> BASE_PACKAGE_ARCH = "all"
> >> -PACKAGE_ARCH = "all"
> >> -
> >> # No need for virtual/libc or a cross compiler
> >> INHIBIT_DEFAULT_DEPS = "1"
> > 
> > This is a *really* bad idea. An "all" package should have no need to set
> > architecture specific values into FEED_ARCH.
> > 
> > Just for those not following IRC, the problem is Angstrom adds FEED_ARCH
> > to OVERRIDES. Adding "all" to overrides turns out to do nasty things to
> > classes like rm_work with "_all" in the function names.
> 
> So I did the following in angstrom.inc:
> 
> # Add FEED_ARCH and SOC_FAMILY to machine overrides so we get access to e.g. 'armv7a' and 'omap3'
> # Hopefully we'll never see a machine or arch with 'all' as substring
> MACHINEOVERRIDES .= ":${@bb.data.getVar('FEED_ARCH', d,1).replace('all','noarch')}:${SOC_FAMILY}"
> 
> That makes parsing work for MACHINE=crownbay again, but:
> 
> koen@dominion:/OE/tentacle/sources/meta-openembedded$ MACHINE=crownbay bitbake foo
> NOTE: Out of date cache found, rebuilding...
> NOTE: angstrom DOES NOT support gconf-dbus because gconf-dbus has been merged back into main GConf                                                                                         | ETA:  00:03:09
> NOTE: angstrom DOES NOT support gconf-dbus-native because gconf-dbus has been merged back into main GConf
> NOTE: angstrom DOES NOT support libiconv because the eglibc provided iconv library is used##############################                                                                   | ETA:  00:00:44
> NOTE: angstrom DOES NOT support libiconv because the eglibc provided iconv library is used#############################################################                                    | ETA:  00:00:24
> Parsing recipes: 100% |####################################################################################################################################################################| Time: 00:01:52
> Parsing of 1287 .bb files complete (0 cached, 1287 parsed). 1655 targets, 60 skipped, 0 masked, 0 errors.
> Traceback (most recent call last):
>   File "/usr/lib/python2.6/multiprocessing/util.py", line 235, in _run_finalizers
> Traceback (most recent call last):
>   File "/usr/lib/python2.6/multiprocessing/util.py", line 235, in _run_finalizers
> Traceback (most recent call last):
>   File "/usr/lib/python2.6/multiprocessing/util.py", line 235, in _run_finalizers
> Traceback (most recent call last):
>   File "/usr/lib/python2.6/multiprocessing/util.py", line 235, in _run_finalizers
>     finalizer()
>   File "/usr/lib/python2.6/multiprocessing/util.py", line 174, in __call__
>     res = self._callback(*self._args, **self._kwargs)
>   File "/OE/tentacle/sources/bitbake/lib/bb/codeparser.py", line 91, in parser_cache_save
>     finalizer()
>   File "/usr/lib/python2.6/multiprocessing/util.py", line 174, in __call__
>     res = self._callback(*self._args, **self._kwargs)
>   File "/OE/tentacle/sources/bitbake/lib/bb/codeparser.py", line 91, in parser_cache_save
>     finalizer()
>   File "/usr/lib/python2.6/multiprocessing/util.py", line 174, in __call__
>     res = self._callback(*self._args, **self._kwargs)
>   File "/OE/tentacle/sources/bitbake/lib/bb/codeparser.py", line 91, in parser_cache_save
>     finalizer()
>   File "/usr/lib/python2.6/multiprocessing/util.py", line 174, in __call__
>     res = self._callback(*self._args, **self._kwargs)
>   File "/OE/tentacle/sources/bitbake/lib/bb/codeparser.py", line 91, in parser_cache_save
>     data, version = p.load()
> ValueError: could not convert string to int
>     data, version = p.load()
> ValueError: could not convert string to int
>     data, version = p.load()
>     data, version = p.load()
> ValueError: could not convert string to int
> ValueError: could not convert string to int
> ERROR: Command execution failed: Traceback (most recent call last):
>   File "/OE/tentacle/sources/bitbake/lib/bb/command.py", line 99, in runAsyncCommand
>     self.cooker.updateCache()
>   File "/OE/tentacle/sources/bitbake/lib/bb/cooker.py", line 937, in updateCache
>     if not self.parser.parse_next():
>   File "/OE/tentacle/sources/bitbake/lib/bb/cooker.py", line 1247, in parse_next
>     self.shutdown()
>   File "/OE/tentacle/sources/bitbake/lib/bb/cooker.py", line 1236, in shutdown
>     bb.codeparser.parser_cache_savemerge(self.cooker.configuration.data)
>   File "/OE/tentacle/sources/bitbake/lib/bb/codeparser.py", line 121, in parser_cache_savemerge
>     data, version = p.load()
> ValueError: could not convert string to int
> 
> And the same happens for every machine now. So where did I misconvert an int to string?!?!?

Wiping out the code parser cache would fix this. I also pushed a fix for
it to bitbake master.

Cheers,

Richard



