Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D6BA0771BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 17:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0THgHht007419; Fri, 29 Jan 2016 17:42:17 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0nOILFeKlYK5; Fri, 29 Jan 2016 17:42:17 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0THgDxL007416
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 29 Jan 2016 17:42:15 GMT
Message-ID: <1454089333.10340.80.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Crowe <mac@mcrowe.com>, openembedded-core@lists.openembedded.org
Date: Fri, 29 Jan 2016 17:42:13 +0000
In-Reply-To: <20160129154748.GB19208@mcrowe.com>
References: <20160129154748.GB19208@mcrowe.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: package.tgz files not touched in sstate-cache
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
X-List-Received-Date: Fri, 29 Jan 2016 17:42:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-01-29 at 15:47 +0000, Mike Crowe wrote:
> We have a shared sstate-cache that is populated by us building nightly
> images for various branches using Jenkins. This cache is pruned
> periodically (with special care of the siginfo files since we don't have
> 80b3974081c4a8c604e23982a6db8fb32c616058 yet.)
> 
> Recently we went back to one of those branches that hadn't been changed for
> a while and were surprised to find that Bitbake wanted to build loads of
> packages from source.
> 
> It turned out that whilst the populate_sysroot.gz and package_ipk.tgz files
> were still in the sstate-cache, the package.tgz tarball was not. This meant
> that the whole package was built again in order to satisfy the build
> dependencies of other packages that had changed.
> 
> I'm suspicious that this behaviour was introduced by the optimisation in
> a0f584ac3d5a94dec121b684206ecd40c968f7fc so we hadn't seen it on older
> branches.
> 
> Is there a way to cause the package.tgz file to be touched during these
> nightly builds too? Or, is there a way to get hold of the complete set of
> sstate files so they can be touched all in one go?

The "right" answer here is to figure out what in your builds seems to
be needing the package.tgz files.

The only time the system should need to pull the package tgzs from
sstate is if package_qa or package_write_* were going to rerun. This
doesn't happen often, if ever. I've sometimes wondered if we should in
fact generate them. They are useful for switching package backends.

So the fact they're not getting touched doesn't surprise me. The more
concerning thing is that its actually trying to use them.

We have found a number of bugs in this area in sstate and have some
patches merged, I know there are a small number pending too. Whether
we've found all the issues remains unknown.

For debugging this, you usually need the task graph info and the -DDDv
output of a build, then investigate what was depending on the package
sstate file.

An example of where we have tested this is the extensible SDK code. We
can now remove the package sstate objects from it and have builds
function in the SDK without them. So we know this does work, there
could be some bugs remaining though.

Cheers,

Richard

