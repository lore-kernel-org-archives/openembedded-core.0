Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id E02E36F8A8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 11:53:58 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2OBrlbT024201; Mon, 24 Mar 2014 11:53:47 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id c1Ma-pVf9lQD; Mon, 24 Mar 2014 11:53:47 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2OBriKH024194
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 24 Mar 2014 11:53:46 GMT
Message-ID: <1395662018.24232.47.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Mar 2014 11:53:38 +0000
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
X-List-Received-Date: Mon, 24 Mar 2014 11:54:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Executive Summary
=================

A very rocky week but we now have consistent green builds on the
autobuilder.

1.6 Release Status
===============

Over the last week things have stabilised a lot from my perspective.
Most of the major changes are now in or have at least been tested. In
particular the linux-yocto-dev kernel (3.14) is now cleanly building so
whilst the change is coming in late, it comparatively well tested.

The reference BSPs are also set to change and patches are being tested
for those. It is late in the cycle for them however this was we get to
close out a long standing set of bugs that are unlikely to get fixed and
replace them with a new set of things which people are much more likely
to work on.

The archiver changes are in, there is a second set of patches pending.
I'd appreciate eyes on this from people who use the code.

I'm not going to push the B != S change in this release. It will land
immediately into master as soon as we branch for 1.6 though.

systemd and pulseaudio merged in the end, not least since the systemd
changes appear to address some of the sanity failures we've been seeing.

Autobuilder
===========

We've had a rough ride over the last week. We kept managing to "break"
slaves, one with disk corruption problems (RAID firmware?), another with
power supply issues and a variety of other issues. This took us from
seven to four slaves.

We also had a build fail when fork() stopped working, probably due to
resource issues. As such we've dropped from 3 to 2 concurrent builds on
the builders. There were also various software issues with disks not
being cleared properly and some autobuilder git fetcher code problems.

Thanks to hard work from Beth and Michael, we're now back at autobuilder
full slave count and we have updated autobuilder code which showed great
promise over the weekend. We now have green builds for 1.6 with two
exceptions, the uclibc world build and qa-targetbuilds targets, both
only recently added to the system.

Bitbake Changes
===============

The sig child handler was a disaster, I ended up reverting the code to
use subprocess' poll() method. The handler would be more efficient but
doesn't mix with subprocess well in python 2.7.3. We were seeing hanging
bitbake processes, we should now have all those issues resolved for
release.

Cheers,

Richard




