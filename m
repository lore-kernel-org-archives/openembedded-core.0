Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0734F719B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 10:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v2UA8phc004613; 
	Thu, 30 Mar 2017 11:08:51 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QmUrF8kSAFSF; Thu, 30 Mar 2017 11:08:51 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2UA8m5E004609
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 30 Mar 2017 11:08:49 +0100
Message-ID: <1490868528.13980.353.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Bergin <peter@berginkonsult.se>,
	openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 11:08:48 +0100
In-Reply-To: <794d2836-c1ae-cc8b-f1dd-d1fb27b05e28@berginkonsult.se>
References: <1490731726-14536-1-git-send-email-peter@berginkonsult.se>
	<1490742158.13980.296.camel@linuxfoundation.org>
	<2b16b764-38e0-4112-48b4-9e17cbe129c3@berginkonsult.se>
	<1490782943.13980.306.camel@linuxfoundation.org>
	<794d2836-c1ae-cc8b-f1dd-d1fb27b05e28@berginkonsult.se>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] busybox: move default config fragments to defconfig
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
X-List-Received-Date: Thu, 30 Mar 2017 10:08:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-03-29 at 19:19 +0200, Peter Bergin wrote:
> Thanks for your suggestion. I think this is one step better than
> what's  in master today as it can more easily be overridden. But I
> don't think  this is a better solution to the problem than moving the
> defaults to the defconfig. Probably I have a bit different view of
> grouping the config features. I think that the grouping in .cfg
> fragments is a good design if you have features that you enable for
> example via DISTRO_FEATURE or VIRTUAL-RUNTIME_init_manager or some
> other feature option that is present in the build system. As in the
> examples with mbox.cfg and init.cfg.
> 
> I think grouping of configurations because they belong together is a 
> task for busybox's Kconfig. In the Kconfig system for busybox you can
> see the options you have and their relations. If you start a project
> and want to tune busybox the natural place to do it is in the
> defconfig file. And modifying the defconfig file with help of
> menuconfig.
> 
> What pros do you see of having standard feature .cfg files in SRC_URI
> that are (default) always added instead of having them in the
> defconfig? How does it help the developer/maintainer?

I can see cases where there is a logic group of features (such as
login-utilities) where there isn't a corresponding DISTRO_FEATURE or
VIRTUAL-RUNTIME yet we do want the developer/maintainer being able to
turn that group of things on/off, depending on the rest of their system
/distro setup.

I do agree that some of the smaller configs are a little unusual, but
even those do actually have uses since for example people have security
policies which may "ban" sha1 due to its vulnerabilities. With your
proposal they'd be forced into providing their own complete defconfig
which I don't think does anyone any favours where as today, they can
control that single thing but inherit our defaults.

I'd like to encourage more inheritance, not less. Equally, you do have
a valid problem in wanting to control things entirely and I'm trying to
give you a solution which can work for everyone.

Cheers,

Richard






