Return-Path: <mac@mcrowe.com>
X-Greylist: delayed 455 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 29 Jan 2016 15:55:25 UTC
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id 88DC57721C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 15:55:25 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout06 with smtp
	id Brno1s00D0BmcFC01rnqxQ; Fri, 29 Jan 2016 15:47:50 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.1 cv=Rr04V3SK c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=L9H7d07YOLsA:10 a=9cW_t1CCXrUA:10 a=s5jvgZ67dGcA:10 a=kj9zAlcOel0A:10
	a=7aQ_Q-yQQ-AA:10 a=lUMY98rfZbqYkMFD4F0A:9 a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.84)
	(envelope-from <mac@mcrowe.com>) id 1aPBH2-0005FY-Py
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jan 2016 15:47:48 +0000
Date: Fri, 29 Jan 2016 15:47:48 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20160129154748.GB19208@mcrowe.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: package.tgz files not touched in sstate-cache
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
X-List-Received-Date: Fri, 29 Jan 2016 15:55:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

We have a shared sstate-cache that is populated by us building nightly
images for various branches using Jenkins. This cache is pruned
periodically (with special care of the siginfo files since we don't have
80b3974081c4a8c604e23982a6db8fb32c616058 yet.)

Recently we went back to one of those branches that hadn't been changed for
a while and were surprised to find that Bitbake wanted to build loads of
packages from source.

It turned out that whilst the populate_sysroot.gz and package_ipk.tgz files
were still in the sstate-cache, the package.tgz tarball was not. This meant
that the whole package was built again in order to satisfy the build
dependencies of other packages that had changed.

I'm suspicious that this behaviour was introduced by the optimisation in
a0f584ac3d5a94dec121b684206ecd40c968f7fc so we hadn't seen it on older
branches.

Is there a way to cause the package.tgz file to be touched during these
nightly builds too? Or, is there a way to get hold of the complete set of
sstate files so they can be touched all in one go?

Thanks.

Mike.

