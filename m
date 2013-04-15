Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1URjue-0006Bv-0M for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 15:57:41 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3FDePe5012629 for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 14:40:25 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4VY2CHndjSu0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 14:40:25 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3FDeNmu012614
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 14:40:24 +0100
Message-ID: <1366033200.8670.43.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Apr 2013 14:40:00 +0100
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: A success of the new performance metrics
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
X-List-Received-Date: Mon, 15 Apr 2013 13:57:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Sometimes people wonder why I take so long to merge certain patches. The
issue is that if some core area of the code changes, it can have a
ripple effect on the rest of the system.

One of the goals of 1.4 is to improve performance. In order to
demonstrate we did (and to be better able to track regressions) this
meant improving our performance testing so we now have:

https://wiki.yoctoproject.org/wiki/Performance_Test

The QA team just produced the numbers for 1.4M6.rc1. In case its not
clear, M6 is the final release milestone. The results caused them to
send me an urgent email "you might want to look at the numbers". They're
right, we seem to have regressed badly between M5.rc3 and M6.rc1 on
multiple benchmarks. Eeek!

Paul was able to track this down to a recent bitbake change:

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=05d4f94c25b14ca99a1df01030edc00125f95405

Upon looking at the patch and thinking performance, it was immediately
obvious to a seasoned bitbake performance hacker that the usage of
keys() would cripple us.

So its sad I didn't spot this on the initial review/testing. On the
other hand its great that the benchmarks caused us to as the right
questions and find a problem. Thankfully its easy to fix the problem as
we don't need keys() here.

Lets hope the rc2 benchmarks look a bit better :)

Cheers,

Richard





