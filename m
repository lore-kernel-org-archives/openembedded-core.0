Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QUd3U-00052N-Nc for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 13:05:40 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QUd0J-0007wA-FN
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 13:02:23 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DE56B0D.4020209@intel.com>
References: <4DE56B0D.4020209@intel.com>
Organization: Phil Blundell Consulting Ltd
Date: Thu, 09 Jun 2011 12:02:10 +0100
Message-ID: <1307617330.2529.4803.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
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
X-List-Received-Date: Thu, 09 Jun 2011 11:05:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-31 at 15:26 -0700, Scott Garman wrote:
> I'd like to collect some feedback on error messages while building that 
> you find confusing/annoying/unhelpful. I'm going to be working on trying 
> to improve the situation and would like to hear from you about what 
> could be more helpful.

Here's another one which, although perhaps slightly off-topic for your
current effort, still seems to fall into all three of the categories you
mentioned :-)

After I made a typo (mismatched quotes) in one of my recipes, my next
bitbake run printed:

Loading cache: 100% |#####################################################################################################################################################| ETA:  00:00:00
Loaded 1323 entries from dependency cache.
NOTE: Error expanding variable do_configure                                                                                                                               | ETA:  --:--:--
ERROR: Command execution failed: Traceback (most recent call last):#############################                                                                          | ETA:  00:00:00
  File "/home/pb/oe/bitbake/lib/bb/command.py", line 99, in runAsyncCommand
    self.cooker.updateCache()
  File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 871, in updateCache
    if not self.parser.parse_next():
  File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 1120, in parse_next
    self.shutdown(clean=False)
  File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 1102, in shutdown
    bb.codeparser.parser_cache_save(self.cfgdata)
  File "/home/pb/oe/bitbake/lib/bb/codeparser.py", line 77, in parser_cache_save
    data, version = p.load()
EOFError

So, this is (a) confusing, because "EOFError" doesn't yield much
information about the actual cause of the problem; (b) unhelpful, since
it doesn't mention which line of the file (or even which recipe) was to
blame; and (c) annoying, for the usual reasons to do with python
traceback.

Somewhat worse, even after I fixed the typo, any subsequent attempt to
run bitbake would just result in:

Loading cache: 100% |#####################################################################################################################################################| ETA:  00:00:00
Loaded 1323 entries from dependency cache.
Traceback (most recent call last):                                                                                                                                        | ETA:  --:--:--
  File "/usr/lib/python2.6/multiprocessing/util.py", line 235, in _run_finalizers
    finalizer()
  File "/usr/lib/python2.6/multiprocessing/util.py", line 174, in __call__
    res = self._callback(*self._args, **self._kwargs)
  File "/home/pb/oe/bitbake/lib/bb/codeparser.py", line 77, in parser_cache_save
    data, version = p.load()
EOFError

(repeated about 10 times)

I deleted tmp/cache/* and that seemed to fix the problem.

p.




