Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A0C24606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 21:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6RLe2N0030693; Wed, 27 Jul 2016 22:40:02 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id IwPYeHe17720; Wed, 27 Jul 2016 22:40:02 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6RLdxNv030671
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 27 Jul 2016 22:40:00 +0100
Message-ID: <1469655599.23580.119.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stephano Cetola <stephano.cetola@linux.intel.com>
Date: Wed, 27 Jul 2016 22:39:59 +0100
In-Reply-To: <20160727034330.GA8090@cakenne1-mobl.amr.corp.intel.com>
References: <20160714212038.12385-1-stephano.cetola@linux.intel.com>
	<1469020794.23580.11.camel@linuxfoundation.org>
	<20160727034330.GA8090@cakenne1-mobl.amr.corp.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Steven Walter <stevenrwalter@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Allow for simultaneous do_rootfs tasks with rpm
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
X-List-Received-Date: Wed, 27 Jul 2016 21:40:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-07-26 at 20:43 -0700, Stephano Cetola wrote:
> On 07/20, Richard Purdie wrote:
> > On Thu, 2016-07-14 at 14:20 -0700, Stephano Cetola wrote:
> > > Give each rootfs its own RPM channel to use.  This puts the RPM
> > > metadata
> > > in a private subdirectory of $WORKDIR, rather than living in
> > > DEPLOY_DIR
> > > where other tasks may race with it.
> > > 
> > > This allows us to reduce the time that the rpm.lock is held to
> > > only
> > > the
> > > time needed to hardlink the RPMs, allowing the majority of the
> > > rootfs
> > > operation to run in parallel.
> > > 
> > > [ YOCTO #9255 ]
> > > 
> > > Signed-Off-By: Steven Walter <stevenrwalter@gmail.com>
> > > Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
> > > ---
> > >  meta/classes/rootfs_rpm.bbclass |  5 -----
> > >  meta/lib/oe/package_manager.py  | 17 ++++++++++++++---
> > >  2 files changed, 14 insertions(+), 8 deletions(-)
> > 
> > Sadly, much as I'd love to merge this, testing shows we have some
> > issues.
> > 
> > Firstly, it means we no longer generate indexes in tmp/deploy/rpm
> > and
> > this breaks -c testimage since some of the tests connect and look
> > for
> > packages there, e.g. 
> > https://autobuilder.yoctoproject.org/main/builders
> > /nightly-qa-logrotate/builds/851 but many others would have also
> > failed.
> > 
> 
> After digging into this I think that I can change the tests so that
> they
> point at the correct location:
> 
> e.g.
> tmp/work/qemux86-oe-linux/core-image-sato/1.0
> -r0/rpms/qemux86/repodata
> 
> based on the target triplet, image, PV (I'm guessing here), and arch
> variables. I realized when digging into this that using "rpms" in the
> path (which was a result of this patch) is wrong. It should be "rpm".
> 
> Let me know if this sounds right or if I'm dreaming.

Its not the right fix. The tests can be run against a pre-existing
image which wasn't "built" by the same build directory. tmp/deploy/xxx
is therefore the correct location for the packages/index, we just need
to ensure something has built the indexes there.

Cheers,

Richard

