Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 33F0377BEB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 11:05:19 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w03B5JeD006535
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 3 Jan 2018 11:05:20 GMT
Message-ID: <1514977519.5525.127.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 03 Jan 2018 11:05:19 +0000
In-Reply-To: <6d876c01-b89f-0c00-6c3b-a0245da3d5b6@windriver.com>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155EC71FFA72@fmsmsx111.amr.corp.intel.com>
	<6d876c01-b89f-0c00-6c3b-a0245da3d5b6@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: =?UTF-8?B?UmU6IFlvY3RvIFByb2plY3QgU3RhdHVzIFdXNTHigJkxNw==?=
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
X-List-Received-Date: Wed, 03 Jan 2018 11:05:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-12-22 at 13:23 -0500, Randy MacLeod wrote:
> On 2017-12-18 10:52 AM, Jolley, Stephen K wrote:
> > ·We have identified further intermittent bugs in various releases
> > which 
> > we’re continuing to look into (including gpg memory allocation
> > issues on 
> > pyro, sstate writing races in morty, further occurrences of the
> > inode 
> > count issues with our NAS on the autobuilder).
> If any of the new problems prove to be difficult to debug, please
> reply with the defect ID so that people can read the background
> and perhaps help out in some way.

Thanks, I'm catching up after the holidays. The morty sstate writing
issue was resolved with a backport:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=morty&id=e3ff03599e55fd2abcaa33e29779c388cdbed94e

The gpg issue is:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=12022

I've only just realised that I appear to be the one assigned to fix it
:/. So that one remains open and in need of help. We put a single
threaded workaround into master/rocko I think but its slowing down
selftest and really needs a better fix.

> WR used to use a single large NAS for our build cluster 3+ years ago.
> While it worked to first order, there was a background of mysterious
> errors. We switch to local disks and pushing logs/status to
> a centralized git repo and we've been happy with that choice.

In this case we have it working quite well, except for one oddity where
the NFS client free inode counts go a bit crazy. We've decided to stop
checking the free inode count on the NAS for now whilst we continue to
see if we can figure it out which means builds should be working again
and not hitting this. The bug is:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=12267

So the gpg one is the one I could use help with.

Cheers,

Richard



