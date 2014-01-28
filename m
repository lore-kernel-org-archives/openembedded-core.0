Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id DF3046BD61
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 10:42:16 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0SAffxf020682; Tue, 28 Jan 2014 10:42:10 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zAoVZpotDhkx; Tue, 28 Jan 2014 10:42:10 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0SAg476020699
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Tue, 28 Jan 2014 10:42:05 GMT
Message-ID: <1390905718.21652.84.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 28 Jan 2014 10:41:58 +0000
In-Reply-To: <BEFD196E-8595-4DD1-BEAD-0183FBB61D55@dominion.thruhere.net>
References: <1390833588.17424.254.camel@ted>
	<BEFD196E-8595-4DD1-BEAD-0183FBB61D55@dominion.thruhere.net>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] local.conf.sample: Add automatic defaults for BB_NUMBER_THREADS and PARALLEL_MAKE
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
X-List-Received-Date: Tue, 28 Jan 2014 10:42:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-01-28 at 11:08 +0100, Koen Kooi wrote:
> Op 27 jan. 2014, om 15:39 heeft Richard Purdie <richard.purdie@linuxfoundation.org> het volgende geschreven:
> 
> > Its rather sad that people don't appear to read local.conf and then complain
> > about slow builds when they're just using a single thread. Most systems have
> > more than one core now so we might as well use a more automatic default
> > for these values. This may lead to better experiences for new users.
> > 
> > [YOCTO #2528]
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> > index 71856b8..36d33e1 100644
> > --- a/meta/conf/local.conf.sample
> > +++ b/meta/conf/local.conf.sample
> > @@ -18,12 +18,18 @@
> > # option determines how many tasks bitbake should run in parallel:
> > #
> > #BB_NUMBER_THREADS ?= "4"
> > +#
> > +# Default to setting automatically based on cpu count
> > +BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
> 
> I've noticed that after 4 threads IO becomes a big bottleneck when you
> have things like webkit, qt, asio etc in the buildqueue. Combine that
> with issues like every make -j thread taking >2GB ram with asio and
> webkit this default seems a bit high. I'd use 0.5*numcpu with a lower
> bound of 2.

This is one of those things I think we'll not find a perfect answer to
and its why I left the defaults alone for as long.

Personally, I run with 48 threads enabled and I've yet to see it do
anything too crazy. At the end of the day it all comes down to the
hardware you're running it on though.

webkit is a particular case where whilst its building you'd probably
want different values. Which numbers you use depends on how often you're
building it...

I'm not sure we can win. If the build appears to take over a system, I'm
hoping the user will look at the conf file and figure out how to make it
use less of the system...

Cheers,

Richard





