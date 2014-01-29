Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 83A216E87E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 12:56:24 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0TCuDRY031080; Wed, 29 Jan 2014 12:56:13 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qKMB19F_uy1c; Wed, 29 Jan 2014 12:56:13 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0TCu8eB031074
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 29 Jan 2014 12:56:10 GMT
Message-ID: <1391000162.24655.67.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ulf@emagii.com
Date: Wed, 29 Jan 2014 12:56:02 +0000
In-Reply-To: <52E8EF66.5040609@emagii.com>
References: <1390833588.17424.254.camel@ted>
	<BEFD196E-8595-4DD1-BEAD-0183FBB61D55@dominion.thruhere.net>
	<52E8EF66.5040609@emagii.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 29 Jan 2014 12:56:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-01-29 at 13:09 +0100, Ulf Samuelsson wrote:
> We discussed this 2.3 months ago.
> Did some studies on my dual hex-core machine (24 H/W treads) while 
> building a cloud9-gnome-image derivative.
> This did about 7500 tasks.
> 
> Enabled the CPU supervisors in the panel.
> 
> Everything seems to be ok with BB_NUMBER_THREADS = "24" for about 4-4500 
> tasks.
> 
> Then the CPUs are mostly inactive and only 1-2 running for ~500 tasks.
> Then parallellism  is resumed until about task 7000, and again
> only a few CPUs are active.

This is likely whilst the lib and toolchain is getting built.

> I believe that some tools use "make" within the Makefile,
> and they are written badly, and do not use "-j <n>" for
> that part of the build.

Which recipes were building at this point? It would be interesting to
track them down.

> Got my build down to 83 minutes.
> 
> Since I have 96 GB of RAM, I tried creating an 80 GB tmpfs for the build,
> and copied the download and the recipes to the ram.
> 
> That shaved only 2 monutes from the build, and some stuff,
> still built using only a single CPU.

There are certainly dependency bottlenecks in the build such as the
toolchain, compiler, gettext, gtk+ and so where large numbers of things
need those dependencies to get built before they can proceed. Not sure
what we can do to help this though.

Cheers,

Richard


