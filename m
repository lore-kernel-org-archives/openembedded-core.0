Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5974D60CED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 17:30:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Dec 2013 09:30:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,502,1384329600"; d="scan'208";a="451491939"
Received: from paulonei-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.122.28])
	by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2013 09:30:48 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 17 Dec 2013 17:30:47 +0000
Message-ID: <1981919.t9m3XxcXSZ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-34-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <20131217171635.GH3706@jama>
References: <cover.1387292119.git.paul.eggleton@linux.intel.com>
	<c98716e9ead1e1273ed03a9bc812d792ea38dc5b.1387292119.git.paul.eggleton@linux.intel.com>
	<20131217171635.GH3706@jama>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] scripts/contrib: Add graph-tool
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
X-List-Received-Date: Tue, 17 Dec 2013 17:30:51 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 17 December 2013 18:16:35 Martin Jansa wrote:
> On Tue, Dec 17, 2013 at 02:56:21PM +0000, Paul Eggleton wrote:
> > A simple script I put together for getting the paths from one node to
> > another in a dot graph. This is useful for example in working out why
> > a particular recipe is getting built in conjunction with dot graph files
> > produced by bitbake -g.
> > 
> > For example:
> > 
> > $ bitbake -g core-image-minimal
> > ...
> > $ graph-tool find-paths pn-depends.dot core-image-minimal sqlite3-native
> > core-image-minimal -> packagegroup-core-boot -> udev -> libxslt-native ->
> > libxml2-native -> python-native -> sqlite3-native
> Nice addition, thanks.
> 
> Can it show multiple paths? Maybe it would be better example to show it
> on multiple-path case.

It can, yes:

$ graph-tool find-paths pn-depends.dot core-image-minimal util-linux
core-image-minimal -> packagegroup-core-boot -> udev -> glib-2.0 -> python-dbus -> dbus-glib -> dbus -> libsm -> e2fsprogs -> util-linux
core-image-minimal -> packagegroup-core-boot -> udev -> glib-2.0 -> python-dbus -> dbus -> libsm -> e2fsprogs -> util-linux
core-image-minimal -> packagegroup-core-boot -> udev -> util-linux

I've updated the branch to use this example.

> As future improvement it would be nice to be able to filter some paths,
> e.g. sometimes I'm interested in runtime-dependencies, sometimes finding
> path through runtime isn't enough (e.g. when my recipe has runtime
> dependency of "foo" but actually needs "foo" at build time).

Well, this script isn't very intelligent - it only operates on single graphs,
and isn't a complete tool, hence why I added it to contrib. There's certainly
scope for more work in this area, but I suspect it would be in a different tool
which is closer to the build system itself (such as Toaster).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

