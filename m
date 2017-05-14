Return-Path: <mac@mcrowe.com>
Received: from avasout05.plus.net (avasout05.plus.net [84.93.230.250])
	by mail.openembedded.org (Postfix) with ESMTP id 8E25560620
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 May 2017 09:07:39 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout05 with smtp
	id L97d1v0020BmcFC0197egB; Sun, 14 May 2017 10:07:40 +0100
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.2 cv=Y+WIilWN c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=tJ8p9aeEuA8A:10 a=elASCIoeAAAA:8 a=-An2I_7KAAAA:8
	a=SiXVQ6FcJLq9sL2hWCMA:9 a=CjuIK1q_8ugA:10 a=UlySpbFP9e0eES3xxyTT:22
	a=Sq34B_EcNBM9_nrAYB9S:22
Received: from mac by deneb with local (Exim 4.84_2)
	(envelope-from <mac@mcrowe.com>)
	id 1d9pV3-0007oI-Ey; Sun, 14 May 2017 10:07:37 +0100
Date: Sun, 14 May 2017 10:07:37 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170514090737.GA29032@mcrowe.com>
References: <1449401194-31567-1-git-send-email-paul.barker@commagility.com>
	<20151215140434.75233de0@centos-7>
	<20170508102903.GA9571@mcrowe.com>
MIME-Version: 1.0
In-Reply-To: <20170508102903.GA9571@mcrowe.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Paul Barker <paul.barker@commagility.com>
Subject: Re: [PATCH RFC] module.bbclass: Fix potential do_compile/do_make_scripts race condition
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
X-List-Received-Date: Sun, 14 May 2017 09:07:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tuesday 15 December 2015 at 14:04:34 +0000, Paul Barker wrote:
> > On Sun, 6 Dec 2015 11:26:33 +0000
> > Paul Barker <paul.barker@commagility.com> wrote:
> > 
> > > I ran into a race condition building multiple external modules against a 3.10.y
> > > series kernel using the dylan branch of OpenEmbedded. This is difficult to
> > > reproduce as it requires very specific timing: the do_make_scripts task for one
> > > module was linking the modpost script whilst the do_compile task for another
> > > module was attempting to use the modpost script. This resulted in a permission
> > > error:

[snip]

> > > | /bin/sh: scripts/mod/modpost: Permission denied

[snip]

On Monday 08 May 2017 at 11:29:03 +0100, Mike Crowe wrote:
> We've started seeing the same symptom, but with a v3.14 kernel. We have
> several recipes that build out-of-tree modules and I can see
> do_make_scripts for one running at the same time as do_compile for the one
> that fails.
> 
> If I try to reproduce the problem by hand, I cannot. However, I only see
> modpost being compiled for one of the tasks in the logs.
> 
> I can't really explain why I see the problem with a newer kernel.
> Regardless, it seems unwise to even attempt to run do_make_tasks and
> do_compile in parallel.
> 
> It looks this patch was reviewed favourably, but doesn't seem to have made
> it into master.
> 
> In the meantime, I'll try this patch and see if it makes the problem go
> away for us.

The patch does seem to have resolved the problem, although there haven't
yet been enough test runs to be completely sure.

A complete copy of Paul Barker's original patch applied to master follows.

Mike.

--8<--

From 4615110d4f5eb7925c280ed38789fb8aff44379f Mon Sep 17 00:00:00 2001
From: Paul Barker <paul.barker@commagility.com>
Date: Sun, 6 Dec 2015 11:26:34 +0000
Subject: [PATCH] module.bbclass: Fix potential do_compile/do_make_scripts race
 condition

In the Linux 3.10.y series, repeatedly running 'make scripts' causes the modpost
script to be rebuilt every time. This causes a potential race condition when
building multiple external modules against a 3.10.y series kernel: one recipe
may be running do_make_scripts and modifying modpost whilst another is running
do_compile and using modpost. In my case this caused a permission error during
do_compile for one recipe as modpost was not executable at the time it tried to
run it.

In Linux 3.11 this was resolved and multiple invocations of 'make scripts' does
not cause modpost to be rebuilt. However, there are still vendor kernels in use
based on the 3.10.y series. Even on later kernel versions it would require more
investigation to conclude that running 'make scripts' whilst also building an
out-of-tree module is always safe. Therefore we should prevent do_make_scripts
from running at the same time as do_compile.

A side effect of this is that only one out-of-tree module recipe can be running
do_compile at any time. This may affect build time if multiple, large
out-of-tree modules are being built but that should be rare and the impact on
overall build time should be low.

Signed-off-by: Paul Barker <paul.barker@commagility.com>
Tested-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/module.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index 802476bc7a..1971f41156 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -4,6 +4,10 @@ addtask make_scripts after do_prepare_recipe_sysroot before do_compile
 do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
 do_make_scripts[depends] += "virtual/kernel:do_shared_workdir"
 
+# Ensure one recipe isn't running do_make_scripts whilst another is using those
+# scripts in do_compile.
+do_compile[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
+
 EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR}"
 
 MODULES_INSTALL_TARGET ?= "modules_install"
-- 
2.11.0


