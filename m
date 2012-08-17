Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T2Pst-0002kM-4g for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 18:58:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7HGkoJd011086;
	Fri, 17 Aug 2012 17:46:50 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10094-09; Fri, 17 Aug 2012 17:46:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7HGkg0D011080
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 17 Aug 2012 17:46:43 +0100
Message-ID: <1345222003.27428.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Fri, 17 Aug 2012 17:46:43 +0100
In-Reply-To: <4413337.0EdOH8CKvX@helios>
References: <1345049073-27898-1-git-send-email-paul.eggleton@linux.intel.com>
	<20120817102638.GD17007@mi.fu-berlin.de>
	<502E22BF.4050809@communistcode.co.uk> <4413337.0EdOH8CKvX@helios>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] classes/chrpath: trigger an error if chrpath fails
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
X-List-Received-Date: Fri, 17 Aug 2012 16:58:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-08-17 at 14:31 +0100, Paul Eggleton wrote:
> On Friday 17 August 2012 11:53:51 Jack Mitchell wrote:
> > On 17/08/12 11:26, Henning Heinold wrote:
> > > On Fri, Aug 17, 2012 at 11:05:43AM +0100, Jack Mitchell wrote:
> > >> any provider
> > >> WARNING: Failed to fetch URL
> > >> http://kernel.org/pub/linux/kernel/people/jsipek/guilt/guilt-0.33.tar.gz
> > >> , attempting MIRRORS if available
> > >> *ERROR: chrpath command failed with exit code 7
> > >> ERROR: chrpath command failed with exit code 7*
> > > 
> > > Hi,
> > > 
> > > you can grep the logfiles in the work-dir for chrpath call and you will
> > > find the package. I saw it on some perl modules, but not now.
> > > 
> > > Bye Henning
> > 
> > Ok, here we go:
> > 
> >    
> > x86_64-linux/perl-native-5.14.2-r1/temp/log.do_populate_sysroot.30355:ERROR
> > : chrpath command failed with exit code 7
> >    
> > x86_64-linux/perl-native-5.14.2-r1/temp/log.do_populate_sysroot.30355:ERROR
> > : chrpath command failed with exit code 7
> > 
> > This is on kraj/toolchain-rework, I don't know how synced with master it
> > is so apologies if it has already been fixed.
> 
> I can confirm this; with the patch I have just sent to improve the error
> handling, on top of master I now get:
> 
> ---------- snip -----------
> ERROR: perl-native: chrpath command failed with exit code 7:
> /home/paul/poky/poky/build/tmp/work/i686-linux/perl-native-5.14.2-r1/sysroot-destdir/home/paul/poky/poky/build/tmp/sysroots/i686-linux/usr/lib/perl-native/perl/5.14.2/auto/Time/HiRes/HiRes.so: RPATH=/lib/i386-linux-gnu
> new rpath '$ORIGIN/../../../../../../../../../..' too large; maximum length 19
> 
> ERROR: Function failed
> ERROR: Logfile of failure stored in: /home/paul/poky/poky/build/tmp/work/i686-linux/perl-native-5.14.2-r1/temp/log.do_populate_sysroot.17120
> ERROR: Task 3 (/home/paul/poky/poky/meta/recipes-devtools/perl/perl-native_5.14.2.bb, do_populate_sysroot) failed with exit code '1'
> ---------- snip -----------
> 
> This is with a from-scratch build of perl-native; TMPDIR in my case is
> "/home/paul/poky/poky/build/tmp" as you can probably tell from the above.

FWIW my chrpath.bbclass change fixes this. Since this is now breaking
builds for everyone (or will be) I've merged it straight in.

Cheers,

Richard



