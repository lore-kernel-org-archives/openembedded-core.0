Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QUdI5-0005Dd-RZ for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 13:20:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p59BHQaJ012000
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Jun 2011 12:17:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11638-06 for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2011 12:17:22 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p59BHFJ9011994
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Jun 2011 12:17:19 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1307617330.2529.4803.camel@phil-desktop>
References: <4DE56B0D.4020209@intel.com>
	<1307617330.2529.4803.camel@phil-desktop>
Date: Thu, 09 Jun 2011 12:17:07 +0100
Message-ID: <1307618227.15712.143.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Tell me your build error message annoyances!
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
X-List-Received-Date: Thu, 09 Jun 2011 11:20:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-09 at 12:02 +0100, Phil Blundell wrote:
> After I made a typo (mismatched quotes) in one of my recipes, my next
> bitbake run printed:
> 
> Loading cache: 100% |#####################################################################################################################################################| ETA:  00:00:00
> Loaded 1323 entries from dependency cache.
> NOTE: Error expanding variable do_configure                                                                                                                               | ETA:  --:--:--
> ERROR: Command execution failed: Traceback (most recent call last):#############################                                                                          | ETA:  00:00:00
>   File "/home/pb/oe/bitbake/lib/bb/command.py", line 99, in runAsyncCommand
>     self.cooker.updateCache()
>   File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 871, in updateCache
>     if not self.parser.parse_next():
>   File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 1120, in parse_next
>     self.shutdown(clean=False)
>   File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 1102, in shutdown
>     bb.codeparser.parser_cache_save(self.cfgdata)
>   File "/home/pb/oe/bitbake/lib/bb/codeparser.py", line 77, in parser_cache_save
>     data, version = p.load()
> EOFError
> 
> So, this is (a) confusing, because "EOFError" doesn't yield much
> information about the actual cause of the problem; (b) unhelpful, since
> it doesn't mention which line of the file (or even which recipe) was to
> blame; and (c) annoying, for the usual reasons to do with python
> traceback.
> 
> Somewhat worse, even after I fixed the typo, any subsequent attempt to
> run bitbake would just result in:
> 
> Loading cache: 100% |#####################################################################################################################################################| ETA:  00:00:00
> Loaded 1323 entries from dependency cache.
> Traceback (most recent call last):                                                                                                                                        | ETA:  --:--:--
>   File "/usr/lib/python2.6/multiprocessing/util.py", line 235, in _run_finalizers
>     finalizer()
>   File "/usr/lib/python2.6/multiprocessing/util.py", line 174, in __call__
>     res = self._callback(*self._args, **self._kwargs)
>   File "/home/pb/oe/bitbake/lib/bb/codeparser.py", line 77, in parser_cache_save
>     data, version = p.load()
> EOFError
> 
> (repeated about 10 times)
> 
> I deleted tmp/cache/* and that seemed to fix the problem.

FWIW, bitbake master has fixes for this specific issue and a number of
other codeparser performance related issues. If it meets EOF while
loading it will now just assume the cache file is corrupt and
ignore/rebuild it.

Cheers,

Richard



