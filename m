Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Pz7mi-0007hB-Ma for openembedded-core@lists.openembedded.org;
	Mon, 14 Mar 2011 14:26:08 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2ECtIx5000905;
	Mon, 14 Mar 2011 12:55:18 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00821-01; Mon, 14 Mar 2011 12:55:14 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2ECtAZf000895
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 14 Mar 2011 12:55:13 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <46D5E03C-9927-4F57-A6AC-7024B8478E1C@dominion.thruhere.net>
References: <cover.1299891748.git.sgw@linux.intel.com>
	<4D7ACD9C.3010002@linux.intel.com>
	<20110312023140.GA4829@sakrah.homelinux.org>
	<201103141151.12235.paul.eggleton@linux.intel.com>
	<46D5E03C-9927-4F57-A6AC-7024B8478E1C@dominion.thruhere.net>
Date: Mon, 14 Mar 2011 12:55:04 +0000
Message-ID: <1300107304.30423.12.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>, poky@yoctoproject.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 0/1] gnu-config make sure we use perl-native
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
X-List-Received-Date: Mon, 14 Mar 2011 13:26:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-03-14 at 13:18 +0100, Koen Kooi wrote:
> Op 14 mrt 2011, om 12:51 heeft Paul Eggleton het volgende geschreven:
> 
> > On Saturday 12 March 2011 02:31:40 Khem Raj wrote:
> >>> Back to the drawing board on why the miss-match is occuring in
> >>> Config.pm then.
> >> 
> >> somewhere there is /usr/bin/perl referred may be a cross recipe ?
> > 
> > I've hit this issue this morning, and have filed a bug report:
> > 
> >  http://bugzilla.pokylinux.org/show_bug.cgi?id=866
> > 
> > Not sure if it helps but at least it should be easy to reproduce.
> 
> I haven't checked if the OE .dev and OE core gnu-config are similar, but have a look at:
> 
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=be21179c5321bd0afb9221f020ac12ad75c86a3b
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=edcdefbf6e0675c1bcc1fc4f464f654223380e50

There are a few related patches to this floating around and I know Tom
did some work in OE.dev to make perl-native an early bootstrap
dependency.

I've been giving this some thought and given the various goals we have,
I think the long term best solution is going to be to place perl into an
isolated bin directory in sysroots, then for anything using really using
perl-native, add that directory to PATH. This is similar to what we now
do with the bootstrap toolchains in OE-Core. This way the dependencies
are deterministic and either perl is or isn't required but we don't
instantly need to build perl-native or run the risk of nasty loops in
the early bootstrap. Anything requiring perl-native would add the
directory to PATH, probably using a tiny class file.

The above patches still would make sense of course.

Cheers,

Richard




