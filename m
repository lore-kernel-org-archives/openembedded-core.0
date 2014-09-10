Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B9E1165CD8
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 10 Sep 2014 08:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8A8RngP009374; Wed, 10 Sep 2014 09:27:49 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id W7tn9t4jjK1D; Wed, 10 Sep 2014 09:27:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8A8Rgqn009359
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 10 Sep 2014 09:27:44 +0100
Message-ID: <1410337664.19272.89.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Darren Hart <dvhart@linux.intel.com>, "Ashfield, Bruce"
	<Bruce.Ashfield@windriver.com>
Date: Wed, 10 Sep 2014 09:27:44 +0100
In-Reply-To: <D034EC78.A7DD4%dvhart@linux.intel.com>
References: <D034EC78.A7DD4%dvhart@linux.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: "Brandt, Todd E" <todd.e.brandt@intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	Tom Zanussi <tom.zanussi@linux.intel.com>,
	"Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: Packaging kernel sources
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
X-List-Received-Date: Wed, 10 Sep 2014 08:33:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-09-09 at 17:42 -0700, Darren Hart wrote:
> I'm working on a project which needs to have the full kernel sources
> installed on the target. The kernel-dev package as defined by
> kernel.bbclass is heavily pruned to minimize packaging time and size and
> is intended to enable building of external modules on the target.
> 
> Is there an accepted best-practice for how to get the full source packaged
> and installed? I can easily write a new recipe,
> linux-custom-source_git.bb, to install the sources, for example, without
> impacting the packaging time of "virtual/kernel" package.
> 
> It would be nice in some respects for it to all come from the same recipe
> though, but I suspect the impact to the common-case where this is not need
> would be far too great.

Personally, I'm leaning towards a couple of big changes in this area:

a) "binning" the kernel-dev package and replacing it with some kind of
separate full source recipe like this.

The benefit is a fully functional on target source which is only built
by people who care about it. This means for most users/builds, we no
longer need to generate that huge package. The downside is a little more
complexity for those that needs this but its not much.


b) binning the separate kernel staging dir and making it work more like
the gcc shared work directory. This means external module builds and the
tools like perf and so on would use this shared source directory.

The benefit would be that we no longer have the huge install step in the
main kernel recipe and the populate_sysroot step shinks in size. 

The downside has more impact here, the problem with shared work is that
it cannot be removed once extracted since the system never knows when
something else may need to use it. For gcc the argument was that we have
so many users (gcc-cross-initial, gcc-cross, gcc-runtime,
gcc-cross-canadian, gcc-crosssdk, gcc-crosssdk-initial and so on) that
the multiple copies were far worse. For the kernel, we can argue that we
have a ton of disk usage from it in the sysroot anyway so this change
just makes things more efficient effectively.

The other issue is that for shared work dirs, the stamps need to be kept
in sync, if they step out, odd things happen (i.e. do_fetch, do_unpack,
do_patch task checksums need to match for linux-yocto, perf, kernel
modules and anything else using it). We may need to add some better
error cases to catch problems. Not an insurmountable problem, just one
that will likely need to be addressed.

I do feel the whole situation with the current kernel size is out of
control and badly affecting user experience.

Cheers,

Richard



