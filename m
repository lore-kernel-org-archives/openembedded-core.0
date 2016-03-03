Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DD27A73163
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 14:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u23EN7cw009572; Thu, 3 Mar 2016 14:23:07 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iwx7gbWKMaHA; Thu,  3 Mar 2016 14:23:07 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u23EN6vM009563
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 3 Mar 2016 14:23:07 GMT
Message-ID: <1457014986.25131.69.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 03 Mar 2016 14:23:06 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Status of M3
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
X-List-Received-Date: Thu, 03 Mar 2016 14:23:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I'm not sure people realise quite how much pain we've been suffering
this week trying to get things stabilised for M3. To illustrate the
kinds of problems, let me give an idea of the issues in the past few
days. The resolved list:

* gobject-introspection has sstate relocation issues
* gobject-introspection was missing a dependency
* allarch contamination issues from gnomebase defaulting to g-i
* gobject-introspection fails on x32
* oe-selftest failures from the vm class changes
* random createrepo issue
* autobuilder workers were replaced with new distros
  - one had firewall problems
  - two had network interface problems
  - another had VNC issues causing sanity test failures
* there were autobuilder configuration changes
  - eSDK changes failed initial
  - increased ptest coverage failed initially
  - uninative tarball publishing wasn't correct 
  - handle meta-poky transition
  - handle adt-installer removal
* uninative output name issues (BUILD_ARCH verses SDK_ARCH)
* uninative sstate interaction issues (NATIVESDKSTRING)
* ongoing pseudo retry issues
* bitbake unpack improvements broke
* canterall fonts broke oe-selftest
* unsafe script references broke sanity tests
* unsafe binary references broke in sanity tests due to prelink problem
* meta-yocto -> meta-poky had multiple problems
* race in do_rootfs_wicenv
* eudev change broke oe-selftest
* rpm upgrade went through multiple different build failures
* toaster references to meta-yocto
* I screwed up manually fixing a simple merge breaking builds. Twice :(

Things which still break:

* rpm upgrade causes smart remove to not function
* gobject-introspection breaks on multilib with python-pygobject file 
  location issue
* gobject-introspection fails on musl
* createrepo has occasional failure with checksum mismatch
* oe-selftest signing failure
* sato application launch failures from glib issues due to prelink
* meta-fsl-ppc breaks on eudev change (patch pending)
* meta-fsl-ppc breakage blocks AB artefact publishing

There are only a small number of us who dive in and try and untangle
the twisted web of which patch is causing which issue and try and put
these things on a path to resolution

With this level of issues, we're simply not able to consider things
like "why aren't you testing X?" or "can you test this patch to this
component to get debugging?". There are 101 things that many of us
would love to do but we need to improve the turnaround time of the
tests we have. There are some simple things that come to mind that we
could do:

a) optimisation of oe-selftest. Currently it takes around 8 hours but
we could cut that time massively with some optimisation around the
sstate cache and the way the tests are written. This one does catch
many valid issues but its way too slow. Parallelism is also an option
here.

b) switch to uninative by default to improve native/cross artefact
reuse on the autobuilder. I have patches queued in -next to test this,
see if we could switch to it.

c) switch to the new AB cluster when its ready (newer/faster hardware)

Volunteers for a) would be most welcome, other ideas welcome too.

Cheers,

Richard



