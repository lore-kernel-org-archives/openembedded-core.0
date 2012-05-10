Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SSOFP-0003yW-4Y for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 09:57:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4A7lLsA007984
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 08:47:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25795-06 for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 08:47:14 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4A7lApZ007978
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 08:47:13 +0100
Message-ID: <1336636025.2494.117.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 10 May 2012 08:47:05 +0100
In-Reply-To: <CABcZANkdKjrx6hdYGLbjsxO-yfFQxZXXcTOuTfa-Xqh2c0VmgA@mail.gmail.com>
References: <1336607861.2494.113.camel@ted>
	<CABcZANkdKjrx6hdYGLbjsxO-yfFQxZXXcTOuTfa-Xqh2c0VmgA@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: bitbake/runqueue: Fix 'full' stamp checking to be more efficient and cache results
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
X-List-Received-Date: Thu, 10 May 2012 07:57:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-05-09 at 17:03 -0700, Chris Larson wrote:
> On Wed, May 9, 2012 at 4:57 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
> > index b870caf..48433be 100644
> > --- a/bitbake/lib/bb/runqueue.py
> > +++ b/bitbake/lib/bb/runqueue.py
> > @@ -875,7 +875,7 @@ class RunQueue:
> >             bb.msg.fatal("RunQueue", "check_stamps fatal internal error")
> >         return current
> >
> > -    def check_stamp_task(self, task, taskname = None, recurse = False):
> > +    def check_stamp_task(self, task, taskname = None, recurse = False, cache = {}):
> 
> When people do this, it's typically a bug, but I presume you're doing
> it intentionally here? Use of mutable default values is often
> problematic due to their being shared across all calls to that
> function, but that's okay for a cache. Maybe you intended this, given
> it's a cache, but I wanted to ensure it was a conscious choice. Also,
> this adds yet another global cache with no form of invalidation /
> clear at all, it'll continue to grow through the lifetime of the
> process.

I'll change it to cache = None and then default it to {} in the code. I
agree infinitely growing caches in memory are not a good idea as we need
to avoid them as this could really screw up a UI doing re-execution.

Cheers,

Richard





