Return-Path: <mac@mcrowe.com>
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mail.openembedded.org (Postfix) with ESMTP id E612E6F778
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Apr 2014 15:53:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,810,1389744000"; d="scan'208";a="73577366"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 07 Apr 2014 16:53:34 +0100
Received: from mac by deneb.mcrowe.com with local (Exim 4.80)
	(envelope-from <mac@mcrowe.com>) id 1WXBrZ-00053C-MN
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Apr 2014 16:53:33 +0100
Date: Mon, 7 Apr 2014 16:53:33 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20140407155333.GA19351@mcrowe.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: export TARGET_LDFLAGS and native sstate
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
X-List-Received-Date: Mon, 07 Apr 2014 15:53:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

We're building for both ARM and MIPS-based MACHINEs in a single source
tree. This seems to result in us compiling (or luckily most of the time
resurrecting from sstate-cache) two different versions of all -native
packages due to different base hashes.

It seems that this difference in base hashes is due to the exported
variable TARGET_LDFLAGS being different between the two CPUs:

< export TARGET_LDFLAGS="-Wl,-O1  -Wl,--as-needed"
---
> export TARGET_LDFLAGS="-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed"

which in turn is because TARGET_LINK_HASH_STYLE is explicitly set to "sysv"
on MIPS but allowed to be "gnu" on everything else.

Every time I switch back and forth between building ARM-based and
MIPS-based machines the do_populate_sysroot_setscene tasks run for each
required -native recipe.

If I modify native.bbclass to do:

 TARGET_LDFLAGS = "${BUILD_LDFLAGS}"

then the hashes match and this unnecessary sysroot population is avoided.

Is this a sensible thing to be doing? It does mean that TARGET_LDFLAGS
contains a lot of (presumably unnecessary) rpath shenanigans but perhaps
that doesn't matter. :(

Thanks.

Mike.

