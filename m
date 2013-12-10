Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob02.myregisteredsite.com
	(atl4mhob02.myregisteredsite.com [209.17.115.40])
	by mail.openembedded.org (Postfix) with ESMTP id 54AE36D840
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 06:44:52 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.206])
	by atl4mhob02.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	rBA6ip6d003206 for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 01:44:51 -0500
Received: (qmail 21912 invoked by uid 0); 10 Dec 2013 06:44:51 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO ?192.168.80.45?)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 10 Dec 2013 06:44:50 -0000
Message-ID: <52A6B861.30104@topic.nl>
Date: Tue, 10 Dec 2013 07:44:49 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: Figuring out why sstate-cache is no longer used for a package
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
X-List-Received-Date: Tue, 10 Dec 2013 06:44:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I've been struggling with this for a few days.

We have a build server that build various images overnight. One of the 
packages in that image is "fpga-image", which takes more than an hour to build.

We have been sharing the the build server's sstate-cache via HTTP and this has 
worked excellently up until yesterday.

The current situation is that a client will grab everything from the 
buildserver's HTTP sstate-cache, potentially finishing a build from scratch in 
about five minutes. However, for some reason, the fpga-image does not fall 
into this category, and eache machine insists on re-building it from scratch. 
I've been trying to debug this, but the sstate-cache is on another machine. I 
tried copying part of the build server's sstate-cache onto my machine, but 
that only results in "bitbake-diffsigs -t fpga-image .." yielding "ERROR: No 
sigdata files found matching fpga-image .." so that apparently is a dead end.

How can I determine what is causing the system to think that it needs to 
rebuild this package?

And/Or how do tell the system that this package only depends on the SRCREV and 
MACHINE and nothing else? (I've already set INHIBIT_DEFAULT_DEPS = "1", is 
there more that I can do?)


--
Mike Looijmans - TOPIC Automation

