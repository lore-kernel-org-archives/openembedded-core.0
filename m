Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1AFD96CECD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 17:02:57 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wANH2pZ1006749
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 23 Nov 2018 17:02:52 GMT
Message-ID: <b96afa3704ab3844fb69bfd7218fc381c368403c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, Yocto
	discussion list <yocto@yoctoproject.org>
Date: Fri, 23 Nov 2018 17:02:50 +0000
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Subject: Autobuilder changes
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
X-List-Received-Date: Fri, 23 Nov 2018 17:02:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I've take this quiet period as an opportunity to make some significant
autobuilder changes:

The targets have all been renamed and split up. "nightly-arm" became 
"qemuarm" and "beaglebone". The "nightly-" prefixes were dropped.

The nightly target was dropped and replaced by "a-quick" and "a-full".
The difference are a number of targets which don't often find problems.
We're also ramping down on the amount of testing qemumips-lsb/qemuppc-
lsb get for example as they're more minor architectures as things
stand. The "a-" prefix is for sorting in the UI and to separate them
out from the mass of other builds.

There are now selftest targets per "distro" which can replace the
testing that Intel QA have been doing. This is only done for "a-full"
and the selftest on a distro at random is done by "a-quick".

Buildhistory is only being generated for the qemu* targets.

The "template" used for testing qemu or "real-hardware" targets was
standardised as there were weird differences for now good reason.

The structure of "non-release" builds on 
https://autobuilder.yocto.io/pub/ was cleaned up and now appears under
a single date+number under the non-release directory which was how it
was meant to work. All the other spurious output that was there has
been cleaned up.

XML test results are now being published for all builds, e.g.:
https://autobuilder.yocto.io/pub/non-release/20181122-11/qemuarm64/

Ptest was added to "a-full" builds for arm and x86 although the arm
builds currently time out. The plan will be to enable arm when we have
an arm build server with KVM support in our rack (next week?). ptest
execution for x86 takes around 3 hours and some sample result output
is:

https://autobuilder.yocto.io/pub/non-release/20181122-11/qemux86-64-ptest/

"meta-oe" and "meta-virt" test targets were added for experimentation,
testing meta-openembedded and meta-virtualization respectively. These
are work in progress currently just doing a "world -k" build for
qemux86-64 which fails (they take around 2.5 hours).

We now run "a-quick" on master at 1am every day which will make
buildhistory more up to date and useful for the master branch and give
us better comparison data for -next and mut.

wine is installed onto the ubuntu1804 workers and the mingw testing was
split into a meta-mingw target, now with 32 and 64 bit build tests and
64 bit runtime tests. With master-next of meta-mingw this appears to
run the test. Huge kudos to Joshua Watt for putting that testing
together. If we install more onto the workers we could probably test 32
bit as well, I'm torn on that right now as its a lot more dependencies
on the workers.

Building older releases is now broken until I sort out the
corresponding helper changes for those branches but one thing at a
time!

If anyone would like to help with xml results file analysis tooling,
that is where we need work next to be able to summarise the ptest
results and do results comparison. I know Ee Peng has some work in this
area which I will be looking at next.

Cheers,

Richard




