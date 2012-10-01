Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TIgP9-0006eN-QB for openembedded-core@lists.openembedded.org;
	Mon, 01 Oct 2012 15:51:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q91DcRLx003175;
	Mon, 1 Oct 2012 14:38:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02349-08; Mon,  1 Oct 2012 14:38:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q91DcKa3003168
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 1 Oct 2012 14:38:21 +0100
Message-ID: <1349098703.15753.103.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <philb@gnu.org>
Date: Mon, 01 Oct 2012 14:38:23 +0100
In-Reply-To: <1349092206.32611.57.camel@phil-desktop>
References: <1348501103.31293.51.camel@phil-desktop>
	<50607F4E.5040300@linux.intel.com>
	<1348503778.31293.52.camel@phil-desktop>
	<20120924192845.GE3295@jama.jama.net>
	<1349092206.32611.57.camel@phil-desktop>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: work-shared not being correctly shared
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Oct 2012 13:51:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-10-01 at 12:50 +0100, Phil Blundell wrote:
> On Mon, 2012-09-24 at 21:28 +0200, Martin Jansa wrote:
> > On Mon, Sep 24, 2012 at 05:22:57PM +0100, Phil Blundell wrote:
> > > On Mon, 2012-09-24 at 08:42 -0700, Saul Wold wrote:
> > > > Yes, I am seeing something similar with do_patch happening twice on the 
> > > > work-shared area, I talked with Richard a bit ago about it, and I am 
> > > > digging into the siginfo files, you can use bitbake-sigdiff to see what 
> > > > sigs are changed causing it unpack twice (or in my case patch twice).
> > > 
> > > Ah, right, it seems to be rm_old_work that's causing the problem.  I'll
> > > disable that for now and figure out how to fix it later.
> > 
> > That was already discussed few weeks ago, you should be able to find it
> > in archive.
> 
> I found this thread:
> 
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/026185.html
> 
> but there didn't appear to be any clear conclusion about what the right
> fix for the problem was.  Does anybody have any further insight into
> that?

The issue is that rm_old_work references PN in its task definition.
gcc's shared work directory assumes it can get the same sstate checksums
for fetch/unpack/patch which is broken by:

addtask rm_old_works before do_unpack

The trick would seem to be to change do_unpack for do_configure which is
how others worked around it.

Not a perfect fix but equally not annoying enough to lose lots of sleep
over.

Cheers,

Richard



