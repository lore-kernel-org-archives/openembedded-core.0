Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3646273BB8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 09:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8O9IjFh008768; Thu, 24 Sep 2015 10:18:45 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0sVegxQzXuqi; Thu, 24 Sep 2015 10:18:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8O9IUdL008765
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 24 Sep 2015 10:18:42 +0100
Message-ID: <1443086310.19044.56.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Thu, 24 Sep 2015 10:18:30 +0100
In-Reply-To: <56039856.3050902@windriver.com>
References: <cover.1442311946.git.liezhi.yang@windriver.com>
	<5600C0E4.4030606@windriver.com>
	<1443045619.19044.40.camel@linuxfoundation.org>
	<56039856.3050902@windriver.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/6] Fixes for mutilib SDK
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
X-List-Received-Date: Thu, 24 Sep 2015 09:18:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-09-24 at 14:29 +0800, Robert Yang wrote:
> 
> On 09/24/2015 06:00 AM, Richard Purdie wrote:
> > On Tue, 2015-09-22 at 10:45 +0800, Robert Yang wrote:
> >> Hi RP and Ross,
> >>
> >> These patches are required by multilib's do_rootfs and do_populate_sdk,
> >> otherwise they are broken or partly broken. These patches don't affect
> >> do_rootfs or do_populate_sdk without multilib are to be installed.
> >
> > Thanks for these. Patches 1-4 look ok, we can try them in -next however
> > I do worry about 5 and 6. Could you confirm if you tested those before
> > or after the recent data store changes? Its possible the OVERRIDE fixes
> > there may have fixed the issues 5 and 6 were trying to fix so I'd like
> > to confirm if they're still needed or not.
> >
> > If they are, they don't look like the right solution so I'll need to
> > look further at the exact issue there.
> 
> Hi RP,
> 
> I tested on latest master branch without patch 5 and 6, we still have
> the issues.
> 
> # local.conf
> MACHINE = "qemux86-64"
> require conf/multilib.conf
> MULTILIBS = "multilib:lib32"
> DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
> 
> # populate sdk for lib32-core-image-minimal
> $ bitbake lib32-core-image-minimal -cpopulate_sdk
> 
> # Install sdk
> $ 
> ./tmp/deploy/sdk/poky-glibc-x86_64-lib32-core-image-minimal-core2-64-toolchain-1.8+snapshot.sh
> 
> # Check messages on the screen:
> SDK has been successfully set up and is ready to be used.
> Each time you wish to use the SDK in a new shell session, you need to source the 
> environment setup script e.g.
>   $ . /buildarea/lyang1/sdk32/environment-setup-core2-64-pokymllib32-linux
> 
> This is incorrect, it should be environment-setup-x86-pokymllib32-linuxm
> (core2-64 != x86).
> 
> # Check the installed sdk, the sysroots are:
> core2-64-pokymllib32-linux  x86_64-pokysdk-linux
> 
> But SDKTARGETSYSROOT in environment-setup-core2-64-poky-linux and
> environment-setup-x86-pokymllib32-linux is /path/to/sysroots/core2-64-poky-linux
> , this is incorrect.

Thanks, I will look into that further. With your first four patches
applied, the autobuilder showed this issue:

https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/builds/500/steps/Running%20Sanity%20Tests_2/logs/stdio

I've not looked into what is going on there as yet.

Cheers,

Richard


