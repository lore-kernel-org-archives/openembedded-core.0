Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4323173232
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 08:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t888rhtS000332; Tue, 8 Sep 2015 09:53:43 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hlLvh7vK_RaG; Tue,  8 Sep 2015 09:53:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t888rVpQ000315
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 8 Sep 2015 09:53:42 +0100
Message-ID: <1441702411.24871.278.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 08 Sep 2015 09:53:31 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: Illustration of good and bad QA test output
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
X-List-Received-Date: Tue, 08 Sep 2015 08:53:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

A while back, I asked for a review of test output when things fail as it
was causing problems. I suspect some people don't really understand why
this is a big deal. I'd therefore like to illustrate this with a new
example:

https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/180/steps/Running%20oe-selftest/logs/stdio

This is a failure we encountered on the autobuilder. It basically tells
me that "1 is not 0".  I did see this failure in master-next but I had
no what to know what was causing it, whether it was a patch in -next or
whether it came from somewhere else. I therefore had to move things
forward and merged -next.

Locally, I added this change:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=c8134250f72d5102f96137265ae71cf8f2eff5a9

In amongst the build output this shows when the test fails, I see:

WARNING: Failed to fetch URL file://d1/sstate:m4::1.4.17:r0::3:d1c56d6fa574f1093f4be30cb90ac127_populate_lic.tgz.sig, attempting MIRRORS if available
ERROR: Fetcher failure: Unable to find file file://d1/sstate:m4::1.4.17:r0::3:d1c56d6fa574f1093f4be30cb90ac127_populate_lic.tgz.sig anywhere. The paths that were searched were:
    /media/build1/poky/build/temp_sstate_20150907190612
    /media/build1/poky/build/temp_sstate_20150907190612
NOTE: recipe m4-1.4.17-r0: task do_populate_lic_setscene: Succeeded

and from that error and my knowledge of what was in -next, I can be
pretty sure this comes from:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=e3feac122b6baa67a6e75a99da6e8834f0f2a7b0

and I now know who to blame (sorry Ross!). The issue is that this is now
in master and we have the error in a much more serious place. If the QA
code was showing better information in the case of failure, this would
never have made it into master.

I mention this since I'm hoping a practical example of how the test
failures influence decisions and make a difference to the project might
encourage people to pay more attention to these details.

Cheers,

Richard


