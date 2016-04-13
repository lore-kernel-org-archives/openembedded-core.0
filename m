Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 81FFD60670
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 21:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3DLxRH8010031; Wed, 13 Apr 2016 22:59:27 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3jHSJFOAQjOx; Wed, 13 Apr 2016 22:59:27 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3DLxLJS010028
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 13 Apr 2016 22:59:22 +0100
Message-ID: <1460584761.9308.130.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>, Mike Crowe <mac@mcrowe.com>
Date: Wed, 13 Apr 2016 22:59:21 +0100
In-Reply-To: <2659265.dUGdYN6AGr@peggleto-mobl.ger.corp.intel.com>
References: <20160329125626.GA11712@mcrowe.com>
	<20160413140103.GA14803@mcrowe.com>
	<CAP9ODKpPEmPQuz7rJWfzCz5Rw4rpBHvBoRAg-FXktNd2nu6vRg@mail.gmail.com>
	<2659265.dUGdYN6AGr@peggleto-mobl.ger.corp.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: Over-pruning the sstate cache
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
X-List-Received-Date: Wed, 13 Apr 2016 21:59:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-04-14 at 09:33 +1200, Paul Eggleton wrote:
> On Wed, 13 Apr 2016 11:11:11 Otavio Salvador wrote:
> > On Wed, Apr 13, 2016 at 11:01 AM, Mike Crowe <mac@mcrowe.com>
> > wrote:
> > > On Wednesday 13 April 2016 at 10:47:13 -0300, Otavio Salvador
> > > wrote:
> > > > Couldn't this to be done, similar to the fetchall task?
> > > 
> > > That's the sort of thing I was thinking of with my
> > > "all_populate_sysroot"
> > > task in my original question.
> > > 
> > > But, I've a working script using Richard's method now. I'll share
> > > it once
> > > I've tested it a bit more.
> > 
> > Having it as a task allows it to avoid races and like, when running
> > inside of the BitBake. It also can reuse the metadata database
> > information and ought to be faster. Once you share the script I
> > will
> > see if I can rework it to a task and see how it looks.
> 
> FWIW there's a bug open to implement this as an option to bitbake:
> 
>   https://bugzilla.yoctoproject.org/show_bug.cgi?id=7733
> 
> It's currently assigned to me and was targeted for 2.0; at this stage
> it'll be 
> 2.1. If there's interest in having this implemented we can certainly
> increase 
> the priority, since up to this point it was just an idea I had.

Whilst I can see the attraction of Paul's bug for some of the existing
tasks we have, I'm not seeing this as an easy way to fix the
timestamp/touch problem you're mentioning.

Partly that is because it would end up running all the tasks in
question rather than simply knowing what their hash was and then
touching the appropriate files. I think a recursive task based solution
would get very very messy and be hard to make work right.

What you'd probably have to do is either have a specific "touch sstate"
task which then used the sstate internal functions to calculate the
sstate filenames for all sstate tasks in a given recipe and then ran
the touch operation. I guess something like that would then benefit
from Paul's recursive operation.

bitbake -S is slow as it basically involves a recipe reparse. If you
cache is cold, it will end up with two parses, one initial parse, then
the parse which actually does the work. Offhand, I'm not sure if we
could generate the locked sigs data from the data in memory or not. I
know we can't generate the sigdata/siginfo files from that alone.

Just looking at the code, the code is so slow as it reparses without
parallel process usage. I think this is so the dumpsigs code has all
the data it needs in the current process rather than spread over
multiple processes with no way to easily transfer the amount of data
involved. Definitely something we should look to fix now that -S is
being more commonly used.

Cheers,

Richard



