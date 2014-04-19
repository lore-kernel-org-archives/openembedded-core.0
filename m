Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3F906609AA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Apr 2014 22:40:48 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s3JMea43031678; Sat, 19 Apr 2014 23:40:36 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JbpIJIWn_NI7; Sat, 19 Apr 2014 23:40:36 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s3JMeTnK031674
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sat, 19 Apr 2014 23:40:30 +0100
Message-ID: <1397947224.16672.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 19 Apr 2014 23:40:24 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: "Hart, Darren" <darren.hart@intel.com>
Subject: Fetch/Unpack performance dependent on git version
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
X-List-Received-Date: Sat, 19 Apr 2014 22:40:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I thought it might be worth highlighting to people that the performance
of the git fetcher *and* the unpack process is highly dependant on the
version of git.

Firstly, all versions of git 1.6+ appear to default to injecting an
fsync() after fetching objects. fsync() usage significantly hurts our
builds. It is also a bit pointless in our usecase, we can however
disable it with a simple tweak to the fetcher:

-        ud.basecmd = data.getVar("FETCHCMD_git", d, True) or "git"
+        ud.basecmd = data.getVar("FETCHCMD_git", d, True) or "git -c core.fsyncobjectfiles=0"

Secondly, for older versions of git, git clone is running repository
coverage checks even for local cloning. E.g.:

git version 1.8.3.2 on my system:

$ bitbake linux-yocto -c fetch
$ time bitbake linux-yocto -c unpack
51.33user 1.93system 1:09.27elapsed 76%CPU (0avgtext+0avgdata 779380maxresident)k

after updating to git 1.9.2:

$ bitbake linux-yocto -c fetch
$ time bitbake linux-yocto -c unpack
4.28user 0.63system 0:04.36elapsed 112%CPU (0avgtext+0avgdata 260692maxresident)k

so 16 times faster!

The commit in question for anyone interested:

https://github.com/git/git/commit/125a05fd0b45416558923b753f6418c24208d443

Michael/Beth: Can we please upgrade the autobuilder to a daisy release
buildtools tarball which has git 1.9.x in it? This should massively
speed up certain parts of the autobuilder.

Stefan: Could you see which version of git is on the performance
benchmark machine? A run with the daisy build tools tarball would be
extremely interesting if its before 1.9.

Cheers,

Richard



