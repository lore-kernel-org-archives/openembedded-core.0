Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 69244606A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 13:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6KDJsAt010708; Wed, 20 Jul 2016 14:20:01 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ghAEAGn8urr6; Wed, 20 Jul 2016 14:20:01 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6KDJsqP010719
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 20 Jul 2016 14:19:55 +0100
Message-ID: <1469020794.23580.11.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stephano Cetola <stephano.cetola@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2016 14:19:54 +0100
In-Reply-To: <20160714212038.12385-1-stephano.cetola@linux.intel.com>
References: <20160714212038.12385-1-stephano.cetola@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Steven Walter <stevenrwalter@gmail.com>
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
X-List-Received-Date: Wed, 20 Jul 2016 13:20:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-07-14 at 14:20 -0700, Stephano Cetola wrote:
> Give each rootfs its own RPM channel to use.  This puts the RPM
> metadata
> in a private subdirectory of $WORKDIR, rather than living in
> DEPLOY_DIR
> where other tasks may race with it.
> 
> This allows us to reduce the time that the rpm.lock is held to only
> the
> time needed to hardlink the RPMs, allowing the majority of the rootfs
> operation to run in parallel.
> 
> [ YOCTO #9255 ]
> 
> Signed-Off-By: Steven Walter <stevenrwalter@gmail.com>
> Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
> ---
>  meta/classes/rootfs_rpm.bbclass |  5 -----
>  meta/lib/oe/package_manager.py  | 17 ++++++++++++++---
>  2 files changed, 14 insertions(+), 8 deletions(-)

Sadly, much as I'd love to merge this, testing shows we have some
issues.

Firstly, it means we no longer generate indexes in tmp/deploy/rpm and
this breaks -c testimage since some of the tests connect and look for
packages there, e.g. https://autobuilder.yoctoproject.org/main/builders
/nightly-qa-logrotate/builds/851 but many others would have also
failed.

I've also started wondering what happens if we have some scenario where
we have:

bitbake core-image-sato epiphany
<rootfs for core-image-sato starts>
<rebuild for epiphany or one of its dependencies happens>
<old package from epiphany or one of its dependencies is removed from
tmp/deploy/rpm>
<core-image-sato index references this now removed package>

I'd hope the system should handle this since it should only be
referencing things that are direct task dependencies but with
rpm/smart, who knows :/. We should at least see how this fails (if it
fails).

It could get particularly ugly if we use globbing for the rootfs
construction (e.g. *-locale) and the list of packages changed depending
on what else was built. I'd guess we'd already have this problem but
this patch could magnify any problem.

We are going to have to at least solve the testimage package index
problem before we can merge it.

Cheers,

Richard



