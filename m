Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C035673172
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 14:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u31EiUDZ017444 for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Apr 2016 15:45:18 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id A7XUTQPDUR8O
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 15:45:18 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u31EjGfc017469
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Apr 2016 15:45:17 +0100
Message-ID: <1459521916.7348.27.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 01 Apr 2016 15:45:16 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Availability of automated buildhistory for master/master-next and YP autobuilder
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
X-List-Received-Date: Fri, 01 Apr 2016 14:45:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We've had buildhistory for a while and its long been intended to make
better use of it. I'm pleased to say that we now have this available on
our automated infrastructure (thanks Beth, Michael and others who've
helped!).

The output gets shared into a git repository at:

http://git.yoctoproject.org/cgit.cgi/poky-buildhistory/

For master builds, there are branches like:

http://git.yoctoproject.org/cgit.cgi/poky-buildhistory/log/?h=poky/master/nightly-arm

with one per autobuilder build target. These logs are incremental and
data is appended to the previous build data.

master-next poses some challenges since it can be rebased. Right now
the autobuilder is pushing a fresh branch each time, e.g.:

http://git.yoctoproject.org/cgit.cgi/poky-buildhistory/log/?h=poky/master-next/nightly-arm

These are reset for each new build. Comparisons can be made against
the latest master branch but for now that is a manual process since the
autobuilder doesn't know how to map "master-next against master". There
are also other branches created for other poky-contrib based builds.

We do need to start analysing this data as it does highlight there are
problems within the builds. For example, looking through the latest
master packages diff for arm:

http://git.yoctoproject.org/cgit.cgi/poky-buildhistory/commit/?h=poky/master/nightly-arm&id=76be4fa8cbcab7c334ae299188f3c3d7684d5349

why did the attr-dbg package change its FILELIST? It could have been
the gcc patch but was it a good change?

The files contained in images is also a bit worrying:

http://git.yoctoproject.org/cgit.cgi/poky-buildhistory/diff/images/qemuarm/glibc/core-image-sato-sdk/files-in-image.txt?h=poky/master/nightly-arm&id=77580baf448a95c6d66f963d112300a0214c233a

The /usr/src/kernel dir/subdir permissions changed. Was that
intentional?

/var/lib/sudo/lectured changed into /var/db/sudo/lectured. Why?

I'd love some help going over this output, logging bugs for issues
found and then help in fixing the builds. I'm pretty sure there are
some serious reproducibility issues buried in there. By that, I mean
that two builds which are supposedly of the same revision, have
produced slightly differing results.

We do have some tools like buildhistory-diff which are designed to
filter the repository data and come up with a list of "serious"
problems and filter out normal version changes. We're aware there are
shortcomings in those tools but this may give us the push to go and fix
or improve them!

Cheers,

Richard

