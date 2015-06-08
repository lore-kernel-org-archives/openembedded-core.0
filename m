Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F1E70757C4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jun 2015 22:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t58MittC016887; Mon, 8 Jun 2015 23:46:08 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 336XCE44hm0Z; Mon,  8 Jun 2015 23:46:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t58Mjun7016924
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 8 Jun 2015 23:46:07 +0100
Message-ID: <1433803556.28975.117.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 08 Jun 2015 23:45:56 +0100
In-Reply-To: <20150608124313.GB2384@jama>
References: <1433661612.28975.63.camel@linuxfoundation.org>
	<20150608124313.GB2384@jama>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC] sstate: Add eventhandler which cleans up stale recipe data
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
X-List-Received-Date: Mon, 08 Jun 2015 22:46:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-06-08 at 14:43 +0200, Martin Jansa wrote:
> On Sun, Jun 07, 2015 at 08:20:12AM +0100, Richard Purdie wrote:
> > "Incremental builds do not work well when renaming recipes or changing
> > architecture" is a long standing issue which causes people considerable
> > pain. We've struggled for a long time to come up with a way to
> > generically address the problem.
> > 
> > There are additional issues where removal of a layer caused data to
> > continue to exist and additionally, changing DISTRO_FEATURES also caused
> > problems in an existing TMPDIR.
> > 
> > This patch attempts to address this by adding a mapping between stamp
> > files and manifests. After parsing we can easily tell which stamp files
> > are still reachable, if any manifest has a stamp that can no longer be
> > reached, we can remove it. Since this code ties this to the sstate
> > architecture list, it will not remove data from other than the current
> > MACHINE (and its active architectures). It does not clean the sstate
> > cache so if another build activates something which was cleaned, it
> > should reinstall from sstate.
> > 
> > We can also go one step further, depending on the setting of
> > SSTATE_PRUNE_OBSOLETEWORKDIR, workdirs which are no longer active can
> > also be removed. This avoids the buildup of many old copies of data in
> > WORKDIR for example when versions are upgraded.
> > 
> > The one thing which may surprise people with this change is if you
> > remove a layer, data added by that layer will be "uninstalled" before
> > the next build continues. I believe this is a feature and a good thing
> > to do though.
> > 
> > This code is safe with existing builds. If something isn't in the new
> > index it simply isn't removed. Since changes to the sstate code trigger
> > a rebuild, after this merges, we can assume the code will start to
> > detect changes from that point onwards.
> > 
> > [Right now this is an RFC, it appeared to do the right things in some
> > brief local tests and I am pretty excited that this could solve a long
> > standing usability issue in a clean and effective way. There is a bug
> > related to DISTRO_FEATURES changes right now since even skipped recipes
> > will still show active stamps meaning systemd isn't removed from a
> > sysvinit build and vice versa. I should be able to fix that next week
> > before merging. This patch depends on the patch on the bitbake list for
> > the event it needs. Before merging I will bump version number
> > requirements to ensure people have it. I also want to improve the log
> > output so it tells users what its doing rather than the obtuse
> > bb.error().]
> > 
> > [YOCTO #4102]
> 
> Thanks RP, good work, I'm cherry-picking both changes for my next world
> build.

There were some small but annoying bugs in the first version I posted.
I've shaken them out and posted a version which appears to work much
better.

The sysvinit issue turned out to be the metadata markup, not the skipped
metadata problem I was expecting it to be.

I'm quietly excited with this change as I think it should improve
people's experiences in a number of ways.

Cheers,

Richard



