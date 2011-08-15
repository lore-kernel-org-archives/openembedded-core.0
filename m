Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qszbt-0005dj-4L for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 18:01:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7FFvDkl018291;
	Mon, 15 Aug 2011 16:57:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17567-07; Mon, 15 Aug 2011 16:57:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7FFv5hc018285
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 15 Aug 2011 16:57:06 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <201108151649.40904.paul.eggleton@linux.intel.com>
References: <201108142050.37352.paul.eggleton@linux.intel.com>
	<1313420625.6733.182.camel@phil-desktop>
	<201108151649.40904.paul.eggleton@linux.intel.com>
Date: Mon, 15 Aug 2011 16:57:02 +0100
Message-ID: <1313423822.14274.595.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: Machine specific sysroot issue
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
X-List-Received-Date: Mon, 15 Aug 2011 16:01:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-15 at 16:49 +0100, Paul Eggleton wrote:
> On Monday 15 August 2011 16:03:44 Phil Blundell wrote:
> > I can't immediately think why this should be behaving differently to any
> > other library (eglibc for example).  It's quite normal for those
> > packages to be architecture-specific and not machine-specific.
> > 
> > What I think is meant to happen when you change MACHINE is that
> > populate_sysroot will rerun (because ${MACHINE} is factored into the
> > stamp for that task) but it will use all the previously cached build
> > artifacts from sstate and hence you won't end up having to rebuild
> > everything.  It sounds as if that isn't happening in this case for some
> > reason, though I can't immediately think what libopie2 might be doing to
> > defeat it.
> > 
> > Is it just include.pro that goes wrong, or does the whole of libopie2 go
> > missing from the sysroot when you change MACHINE?
> 
> Actually it's just include.pro - everything else gets copied to the sysroot 
> for the new machine just fine.
> 
> I've sort of figured this out. include.pro is getting installed to the sysroot  
> and not ${D} in do_install (and it's the only file handled this way). I'm 
> guessing that because of this it never gets picked up by sstate.

This is the problem. You want to install the file into ${D} and then all
should be well...

Cheers,

Richard



