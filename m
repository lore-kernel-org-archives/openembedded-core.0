Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QPyOR-0008AW-71 for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 16:52:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4REmsES003118;
	Fri, 27 May 2011 15:48:54 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02984-03; Fri, 27 May 2011 15:48:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4REmlOo003112
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 27 May 2011 15:48:47 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306507609.27470.272.camel@rex>
References: <cover.1306444161.git.dvhart@linux.intel.com>
	<e5f5d48165bcb5dc3ccf160a29e16ca700f85395.1306444161.git.dvhart@linux.intel.com>
	<1306452282.27470.214.camel@rex>  <4DDF1DDD.30001@linux.intel.com>
	<1306485644.27470.247.camel@rex>  <4DDFAD9E.7080902@linux.intel.com>
	<1306507609.27470.272.camel@rex>
Date: Fri, 27 May 2011 15:48:41 +0100
Message-ID: <1306507721.27470.273.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/2] u-boot: remove UBOOT_MACHINE and COMPATIBLE_MACHINES
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
X-List-Received-Date: Fri, 27 May 2011 14:52:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-05-27 at 15:46 +0100, Richard Purdie wrote:
> On Fri, 2011-05-27 at 06:56 -0700, Darren Hart wrote:
> > 
> > On 05/27/2011 01:40 AM, Richard Purdie wrote:
> > > On Thu, 2011-05-26 at 20:43 -0700, Darren Hart wrote:
> > >> On 05/26/2011 04:24 PM, Richard Purdie wrote:
> > >>> On Thu, 2011-05-26 at 14:12 -0700, Darren Hart wrote:
> > >>>> Note: I used bb.note() instead of bb.debug() to ensure the message at least
> > >>>>       makes it to the console. From what I could gather, bb.debug() doesn't
> > >>>>       go anywhere during recipe parsing.
> > >>>
> > >>> Why?
> > >>>
> > >>
> > >> My thinking was that the only time you would legitimately try and build
> > >> this package when you can't is during a "world" build, which is likely
> > >> an unattended sort of build anyway. The rest of the time you might hit
> > >> this error would be when you intended to build u-boot but are missing
> > >> the requisite configuration bits in your machine config.
> > > 
> > > You've inserted the note at parsing time though so every time anyone
> > > builds anything this will show up.
> > 
> > Aha! Got it. I changed it and ran a test:
> > 
> > bb.note("DEBUG TO FOLLOW")
> > bb.debug(1, "To build %s, see %s for instructions on setting \
> > 	     up your machine config" % (PN, FILE))
> > 
> > 
> > $ rm -rf tmp/cache; bitbake -DDDD u-boot | tee log
> > Pseudo is not present but is required, building this first before the
> > main build
> > Loading cache...done.
> > Loaded 998 entries from dependency cache.
> > Parsing recipes...NOTE: DEBUG TO FOLLOW
> > done.
> > Parsing of 783 .bb files complete (780 cached, 3 parsed). 1000 targets,
> > 11 skipped, 0 masked, 0 errors.
> > 
> > As you can see, even with -DDDD, the message never makes it to the
> > console. So I agree that bb.note() is inappropriate, unfortunately,
> > bb.debug doesn't appear to be working. I believe it was yesterday...
> 
> The result was cached (780 cached). Try that command after "touch
> conf/local.conf" and it will be in there.

Sorry, the note did appear though.

That needs looking into and is possibly a logging problem. Needs fixing
as a separate issue though and use of bb.note there isn't the right
approach.

Cheers,

Richard



