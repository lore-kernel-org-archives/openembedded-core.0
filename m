Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id C94476F64E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Mar 2014 02:21:01 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2A2Jeff029085; Mon, 10 Mar 2014 02:20:50 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hwAtR9qC0k53; Mon, 10 Mar 2014 02:20:49 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2A2Kdw6029139
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 10 Mar 2014 02:20:44 GMT
Message-ID: <1394418034.7883.50.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 09 Mar 2014 19:20:34 -0700
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: Status Update
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
X-List-Received-Date: Mon, 10 Mar 2014 02:21:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Its been a while since I sent one of these out, I never got back into
the habit after I was away last year. I'm told they're useful to various
people and they stop me having to repeat myself to people so I'm going
to give them another go.

Pending Patches
===============

The feature freeze point for the 1.6 release is today. Some things of
note that have merged recently including:

* Reworked ext2/3/4 rootfs generation. Great work to the people involved
  in getting the patches upstream! Can we delete genext2fs now? Please?
* ToasterUI Updates
* Systemd Upgrade to 209/210ish
* lttng updates
* core-image-basic renaming
* PRINC deprecation warning
* autotools aclocal improvements
* using the separate build include by default
* bitbake manual updates
* various oe-selftest improvements/tweaks

Its good to see many of these coming in, some have been long awaited.

I'm aware we don't quite have some things yet, in particular the 3.14
kernel so there are some changes to still to come in. We've been testing
the -dev kernel on the autobuilder, we have a list of issues we need to
resolve (perf mainly at this point) and as soon as 3.14 is officially
released we'll be good to go. Other things I'm aware of as pending for
1.6 are:

* gummiboot recipes (various versions exist in various layers, this 
  pulls things together hopefully)
* oe-init-build-env tweaks from Gary
* some parts of the "on hardware" automated testing
* possibly some bitbake fetcher extension code for automated "upgrade" 
  detection
* Enabling Separate B from S by default. Martin asked me to hold off 
  this until the issues form the previous changes get sorted out. 
  OE-Core is ready for it, the question is the other layers. We 
  probably need to bump the tmpdir ABI number for this change.

I get the feeling there may be some other things which I don't have on
the list too, please let me know of major pending features I don't have
here.

There are also some things looking very unlikely to get done in 1.6 at
this point. These include:

* Memory Resident and Interactive Bitbake work
* Kernel installation footprint optimisation
* python devshell
* PR Server improvements
* Locked SState support

Patches for some parts of these exist but we're running out of runway to
get them into a state ready to merge.

The recent autobuilder changes did cause a backlog of patches waiting
for testing. On the positive side the autobuilder does seem to have
stabilised now and the changes present there have been worth waiting
for. I believe we have caught up with most of the backlog now and had a
mostly green build on Friday.


Bitbake Changes
===============

We found there were some issues when SIGTERM was sent to bitbake's
various (sub)processes, as might happen on a buildbot or jenkins setup
when stopping builds. The exact effect depended on the order the
processes received the signal and ranged from locking up to using 100%
CPU. There is a fairly comprehensive set of patches on the bitbake-devel
list which should make things behave better.

I've also been a little frustrated with the latency of certain bitbake
commands, it seems to do nothing at some points and debugging confirmed
that (e.g. setting the server/process.py select call timeout to 5s made
the issues extremely obvious). Again, there are patches out to try and
optimise out the various delays which are pointless and bitbake feels
snappier as a result, at least to me anyway.

I'd also like to give a mention to the BitBake manual once again. Its
been heavily reworked, improved and brought up to date. The edits are
now in bitbake master branch.

1.4.3
=====

This was held back due to the recent gnutls CVE, its now undergoing
testing and should be ready for release soon if that is successful. If
not, it will have to wait until after 1.6 ships.


Cheers,

Richard



