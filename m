Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 66AE06FAD2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 10:40:36 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2PAeJT2028227; Tue, 25 Mar 2014 10:40:19 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id v41KFTGxIK7e; Tue, 25 Mar 2014 10:40:19 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2PAeDIY028213
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 25 Mar 2014 10:40:14 GMT
Message-ID: <1395744006.24890.24.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steffen Sledz <sledz@dresearch-fe.de>
Date: Tue, 25 Mar 2014 10:40:06 +0000
In-Reply-To: <53315AE7.1020304@dresearch-fe.de>
References: <5330220F.8050504@dresearch-fe.de>
	<1395664516.24232.56.camel@ted> <533029C5.1000406@dresearch-fe.de>
	<1395665593.24232.58.camel@ted> <53303FAB.5020907@dresearch-fe.de>
	<20140324151537.GD29998@jama> <53315AE7.1020304@dresearch-fe.de>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: complex versioning scenario
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
X-List-Received-Date: Tue, 25 Mar 2014 10:40:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-03-25 at 11:31 +0100, Steffen Sledz wrote:
> On 24.03.2014 16:15, Martin Jansa wrote:
> Thanx, this was the decisive hint.
> 
> I've increased the version in the SONAME header of the library and the result is a libfoo1 package. :)
> 
> But now i hit the next problem. The following rootfs stage results in this error:
> 
> ---------------> snip <-----------------
> | Collected errors:
> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies for app:
> |  *    libfoo0 (>= gitr101+somehash) *
> ---------------> snap <-----------------
> 
> Should the new build of libfoo1 trigger a new compile of all packages with DEPENDS containing libfoo?

In theory, yes and in practise, bitbake does actually do this.
Unfortunately autotools sometimes do not rebuild things when it should.
This is why I've been promoting the B != S patch set which forces things
to rebuild in scenarios like this and removes the issue from autotools
and lets us handle it ourselves.

So my recommendation would be to opt in to that include file and this
should help errors like this.

The change I'd love to commit is:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t2&id=aedf7d207190f18466e82cbc9b3d49b19b3f376f

but I think its now too late to do this by default in 1.6.

Cheers,

Richard


