Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rv92f-0001MR-Um for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 16:02:42 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q18Esc7x020852
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Feb 2012 14:54:38 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20709-01 for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2012 14:54:34 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q18EsWPI020846
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Feb 2012 14:54:33 GMT
Message-ID: <1328712879.29471.34.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 08 Feb 2012 14:54:39 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Some notes on speeding up do_package_write_rpm
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
X-List-Received-Date: Wed, 08 Feb 2012 15:02:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I had a look at why do_package_write_rpm seems slow. It's clear most of
the time is being spent in rpmbuild. Taking the BUILDSPEC script, it was
interesting to run it standalone with "strace -f". The result with
libxfont was a 13.5MB log file showing lots of execs of grep, wc, cut
and other shell utils.

This confirmed suspicion I had that the X.provides and X.requires
scripts that are written out and called by rpmbuild were causing some
performance issues since those scripts are where the grep/wc/cut calls
are coming from.

Rewriting dump_filterdeps() in package_rpm.bbclass to write out a python
script instead of a shell script (doing the same work), resulted in an
strace logfile of 1.5MB, much smaller. The big win is that python has
internal functions for these things so we don't have all the exec()
overhead and don't hit the kernel anywhere near as much.

This showed small improvements in times for some simple package writing
tasks. I then ran "time bitbake eglibc-locale -c package_write_rpm -f"
which I've noticed is one of the last tasks to complete on my standard
build time benchmark atm. The results with shell script (i.e. before):

real	7m15.207s
user	2m31.320s
sys	0m27.720s

and after, with the python script:

real	5m23.727s
user	3m25.540s
sys	1m4.530s

So in real terms its much faster but it claims to be using more user and
sys resources. So it looks to be a performance speedup (and everything
I've done would agree with that) but those user/sys numbers don't make
sense.

I find the first set of numbers odd anyway as how can something spending
2.5 minutes in user and 0.5 minutes in sys making a total of 3 minutes,
take 7.25 minutes to run on a multicore system that is otherwise idle. I
suspect somewhere, the accounting in the kernel is screwing up maybe in
the handling of the many short lived processes we were triggering. The
real numbers correspond with my stopwatch so I'm happy to proceed with
changes in this direction but if anyone does understand why those
numbers would differ like that, I'd be interested to know about it.

Tests to see how much overall this helps our build time are still in
progress.

Cheers,

Richard




