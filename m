Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 035146065B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 08:33:28 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4U8bfjr010770; Thu, 30 May 2013 09:37:41 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DObNvI3Vla4o; Thu, 30 May 2013 09:37:40 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4U8ba1w010745
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 30 May 2013 09:37:38 +0100
Message-ID: <1369902787.14887.281.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 30 May 2013 09:33:07 +0100
In-Reply-To: <2488771.kIoG59Gxit@helios>
References: <1369840203-21898-1-git-send-email-mark.hatle@windriver.com>
	<1369857580.6644.13.camel@pb-ThinkPad-R50e>
	<51A668CA.1070205@windriver.com> <2488771.kIoG59Gxit@helios>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/21] Add directory information to the pkgdata files
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
X-List-Received-Date: Thu, 30 May 2013 08:33:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-05-30 at 09:29 +0100, Paul Eggleton wrote:
> On Wednesday 29 May 2013 15:44:58 Mark Hatle wrote:
> > On 5/29/13 2:59 PM, Phil Blundell wrote:
> > > On Wed, 2013-05-29 at 11:30 -0500, Mark Hatle wrote:
> > >> It's up to the tooling that are using these files to check if the
> > >> directory
> > >> exists, if it does not -- then using bitbake -c patch <recipe> will
> > >> create it. (even in the sstate-cache case.)
> > > 
> > > I'm not sure whether checking that the directory exists is all that
> > > safe; in the shared-sstate scenario I think it's conceivable that the
> > > directory might exist but contain something else, or be unreadable due
> > > to permissions, or disappear underneath you while you're using it.
> > > 
> > > And, of course, "bitbake -c patch ..." won't necessarily create the same
> > > ${S} that you got from pkgdata in that case, it will create it in your
> > > local TMPDIR.
> > 
> > On 5/29/13 12:36 PM, Khem Raj wrote:
> >  > Hi Mark
> >  > 
> >  > This won't work well when package is populated from sstate is there a way
> >  > for it to work seamlessly across sstate it might be useful
> > 
> > I was looking at this again.  I thought the pkgdata was reconstructed each
> > time in the current TMPDIR.  I didn't realize it was just restored from the
> > sstate-cache.  (We've got other patches in layers that trigger pkgdata-like
> > files to be generated as well.. and I must have gotten the two confused.)
> 
> I think this is new behaviour for 1.4, so that might explain some of the 
> confusion. Previously the pkgdata generation happened in do_package, but now 
> that do_rootfs and other places rely upon the presence of pkgdata, it is now a 
> separate task so it can be accelerated by sstate and do_package doesn't need 
> to be re-run.

It moved from do_package to do_packagedata (or whatever its called) in
1.4 for performance reasons but it has always been installed from the
sstate cache since the beginning of sstate.

Cheers,

Richard


