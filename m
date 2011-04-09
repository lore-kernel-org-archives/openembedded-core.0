Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q8b1k-0006Xl-Qf for openembedded-core@lists.openembedded.org;
	Sat, 09 Apr 2011 18:28:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p39GQcv1025574;
	Sat, 9 Apr 2011 17:26:38 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25326-04; Sat,  9 Apr 2011 17:26:34 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p39GQOOw025568
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 9 Apr 2011 17:26:30 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1302283745.22904.146.camel@rex>
References: <1302277262.22904.136.camel@rex> <1302283745.22904.146.camel@rex>
Date: Sat, 09 Apr 2011 09:26:20 -0700
Message-ID: <1302366380.22904.153.camel@rex>
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
X-List-Received-Date: Sat, 09 Apr 2011 16:28:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-04-08 at 10:29 -0700, Richard Purdie wrote:
> To follow up on this, I added instrumentation to runqueue.py
> fork_off_task(). There are two things of note. On my laptop which is a
> much slower system than the one I showed in the benchmark (a quad core),
> the task overhead isn't 1+ seconds as shown in the graph but 0.4 seconds
> per task. I think the reason is there is a compile job running in
> parallel on the other graph which is starving new tasks of CPU.
> 
> The second thing of note is 95% of the 0.4 seconds are in the
> loadDataFull() call as suspected. I did notice that the logging changes
> around that point in the code can distort timings but the time is really
> being spent there.

I've dug into this a bit. When running a given task, it is parsing all
bbclassextend variants again. I have a simple patch which fixes that
which I'll cleanup and share.

What I also noticed which was more odd was that the first finalise()
call was taking 0.2s, subsequent ones were taking 0.1s. It turns out
that the parsercache which is used by the siggen code isn't functioning
the way it should with a lot of cache misses. I think this is related to
the parallel parsing and only saving out cached data from the core, not
the individual recipes (i.e. the cache from the parser subthreads). I
suspect we could get some performance improvement by fixing this.

Cheers,

Richard





