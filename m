Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q8z1u-0001kK-SK for openembedded-core@lists.openembedded.org;
	Sun, 10 Apr 2011 20:06:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3AI4JCW004707;
	Sun, 10 Apr 2011 19:04:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04580-02; Sun, 10 Apr 2011 19:04:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3AI45V2004701
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 10 Apr 2011 19:04:10 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1302366380.22904.153.camel@rex>
References: <1302277262.22904.136.camel@rex>
	<1302283745.22904.146.camel@rex>  <1302366380.22904.153.camel@rex>
Date: Sun, 10 Apr 2011 11:04:01 -0700
Message-ID: <1302458641.22904.159.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: poky <poky@lists.yoctoproject.org>
Subject: Re: [poky] Illustration of task latency
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
X-List-Received-Date: Sun, 10 Apr 2011 18:06:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-04-09 at 09:26 -0700, Richard Purdie wrote:
> I've dug into this a bit. When running a given task, it is parsing all
> bbclassextend variants again. I have a simple patch which fixes that
> which I'll cleanup and share.
> 
> What I also noticed which was more odd was that the first finalise()
> call was taking 0.2s, subsequent ones were taking 0.1s. It turns out
> that the parsercache which is used by the siggen code isn't functioning
> the way it should with a lot of cache misses. I think this is related to
> the parallel parsing and only saving out cached data from the core, not
> the individual recipes (i.e. the cache from the parser subthreads). I
> suspect we could get some performance improvement by fixing this.

Fixes for the issues I noticed are in:

http://git.pokylinux.org/cgit/cgit.cgi/poky-contrib/log/?h=rpurdie/bboptimise

It turns out executing a function at process exit time with
multiprocessing is quite tricky and I'm not 100% sure I'm using public
API with the approach I've ended up using.

The speedups have a good feel to them and show the right things with
benchmarks. It will be interesting to see how much affect they have on
real world build time (which I'll test when I get home next week).
They're also showing a significant reduction in parsing time.

I also noticed that skipped recipes were always being reparsed which is
suboptimial and I've included a work in progress fix for that in the
above branch too.

Cheers,

Richard



