Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UOl9k-000369-0P for openembedded-core@lists.openembedded.org;
	Sun, 07 Apr 2013 10:41:05 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r378YYPJ015420 for <openembedded-core@lists.openembedded.org>;
	Sun, 7 Apr 2013 09:34:34 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5L+SjU6xDFWU
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Apr 2013 09:34:33 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r378YQDQ015414
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Sun, 7 Apr 2013 09:34:30 +0100
Message-ID: <1365323007.6526.229.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 07 Apr 2013 09:23:27 +0100
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: Sanity Failures - Segfaults in qemu images
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 07 Apr 2013 08:41:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We're coming up to release however we're struggling with various sanity
test failures that keep showing up on the autobuilder.

A lot of them have been caused by issues in the qemu scripts and the
fact that the systems are being asked to do more in parallel due to the
new autobuilder infrastructure. I believe we have these ones resolved
now.

The ones that worry me are like two that happened in the last build for
example:

http://autobuilder.yoctoproject.org:8011/builders/nightly-arm-lsb/builds/95/steps/Running%20Sanity%20Tests_1/logs/stdio
http://autobuilder.yoctoproject.org:8011/builders/nightly-x86-64-lsb/builds/87/steps/Running%20Sanity%20Tests/logs/stdio

In both cases we have a segfault happening in the guest, one directly
triggered by a sanity test, the other being detected in dmesg.

We saw one of these on the previous build:

http://autobuilder.yoctoproject.org:8011/builders/nightly-x86/builds/92/steps/Running%20Sanity%20Tests/logs/stdio
(ignore the minimal failure, that was likely a timeout issue, resolved
by a recent change)

I've also seen the smart help segfault on a qemumips image. I did
download that one locally and saw the same fault the first time I booted
it. I then didn't see it again, despite running the image many times.
The booting was of a copy of the image so it wasn't a first boot issue.
The checksum matched that on the autobuilder.

At this point I think it may well be a qemu issue but we don't know that
for sure. I've not seen any report of this on real hardware.

The question is how do we debug this? Does anyone have any ideas?

The best idea I've heard so far is to generate a coredump in the image
and save that off, maybe it would give some clue in later analysis. We
could also upon failure move the actually booted somewhere for later
analysis. I wondered if we could save off the qemu state too somehow.
The trouble is none of these are simple coming up to release.

So if anyone has any ideas on what is causing this of how to debug/fix
it, I'd be very receptive to them.

Cheers,

Richard





