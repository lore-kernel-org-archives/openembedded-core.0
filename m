Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B91E17316B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 15:11:56 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP; 31 Aug 2016 08:11:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,262,1470726000"; 
   d="scan'208";a="3102544"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.7.133])
	by fmsmga005.fm.intel.com with ESMTP; 31 Aug 2016 08:11:40 -0700
Message-ID: <1472656299.2904.4.camel@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
To: wenzong fan <wenzong.fan@windriver.com>, 'Patches and discussions about
	the oe-core layer' <openembedded-core@lists.openembedded.org>,
	seebs@seebs.net, Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 31 Aug 2016 16:11:39 +0100
In-Reply-To: <e33a2d23-6067-cf14-57ab-d40623a3597a@windriver.com>
References: <e33a2d23-6067-cf14-57ab-d40623a3597a@windriver.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Subject: Re: pseudo 1.8.1 doesn't work with docker & dumb-init
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
X-List-Received-Date: Wed, 31 Aug 2016 15:11:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-08-31 at 17:21 +0800, wenzong fan wrote:
> Hi Experts,
> 
> While I trying to build Yocto in Docker Container which using dumb-
> init 
> as init system, I found the build always be stopped at some point
> and 
> the container was terminated as well with below errors:
> 
>      Child process timeout after 2 seconds.
>      Child process exit status 4: lock_held
> 
> Sometimes there's not any obvious error message.
> 
> After some `git bisect` testing, I believe the issue was started
> since 
> commit:
> 
> ----------------------
> 9df3cdf42d8c1216682f497f0b166a43ef9f4184 is the first bad commit
> commit 9df3cdf42d8c1216682f497f0b166a43ef9f4184
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date: Tue Jul 5 13:18:31 2016 +0100
> 
>      pseudo: Upgrade to 1.8.1
> 
>      * Drop patches where the changes exist upstream
>      * Fetch from git as no tarball is available for 1.8.1
>      * Move common code to pseudo.inc
>      * Update patchset in git recipe
> 
>      (From OE-Core rev: 0c36984d4c501d12fa91cf7371511641585cc256)
> -----------------------
> 
> Finally I narrowed it down to pseudo commit:
> 
> ------------------------
> commit 77ee254a6c974aad9bcab2c58c9ee9e0880c9718
> Author: Peter Seebach <peter.seebach@windriver.com>
> Date: Tue Mar 1 16:21:15 2016 -0600
> 
>      Server launch reworking.
> 
>      This is the big overhaul to have the server provide meaningful
> exit 
> status
>      to clients.
> 
>      In the process, I discovered that the server was running with 
> signals blocked
>      if launched by a client, which is not a good thing, and
> prevented 
> this from
>      working as intended.
> 
>      Still looking to see why more than one server spawn seems to
> happen.
> ------------------------
> 
> I also created a testcase for reproducing the issue at:
> 
>      https://github.com/WenzongFan/docker-build-yocto

Thanks for providing a detailed reproducer. I'm trying to configure a
container behind my proxy here.

> 
> For dumb-init please refer to:
> 
>      https://github.com/Yelp/dumb-init
> 
> Could anyone help to fix the signal handling in pseudo?

It may not actually be pseudo at fault here. I've only skimmed the
dumb-init README but it looks like there might be a strange interaction
between the newly fixed signal handling in pseudo and dumb-init's
signal handling.

Should dumb-init be running in single-child/non-setsid mode so that
signals are only forwarded to the direct child rather than all child
processes in the dumb-init session? Is this a scenario you've tested?

Regards,

Joshua


