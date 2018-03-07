Return-Path: <alexandre.belloni@bootlin.com>
X-Greylist: delayed 363 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 07 Mar 2018 10:18:02 UTC
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
	by mail.openembedded.org (Postfix) with ESMTP id 49AFC78969
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Mar 2018 10:18:02 +0000 (UTC)
Received: by mail.bootlin.com (Postfix, from userid 110)
	id 524A92075C; Wed,  7 Mar 2018 11:11:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on mail.bootlin.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
	shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (unknown [37.71.171.242])
	by mail.bootlin.com (Postfix) with ESMTPSA id DD9C720376;
	Wed,  7 Mar 2018 11:11:58 +0100 (CET)
Date: Wed, 7 Mar 2018 11:12:00 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <20180307101200.GK3035@piout.net>
References: <20180305082233.8493-1-quentin.schulz@bootlin.com>
	<1a37561b-5f40-3435-a1fd-5aeb2a5acad2@topic.nl>
MIME-Version: 1.0
In-Reply-To: <1a37561b-5f40-3435-a1fd-5aeb2a5acad2@topic.nl>
User-Agent: Mutt/1.9.3 (2018-01-21)
Cc: thomas.petazzoni@bootlin.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox: mdev: make mdev auto load modules at boot
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
X-List-Received-Date: Wed, 07 Mar 2018 10:18:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 06/03/2018 at 13:28:52 +0100, Mike Looijmans wrote:
> ﻿On 05-03-18 09:22, Quentin Schulz wrote:
> > Thanks to the MODALIAS line at the beginning of mdev.conf, mdev supports
> > module auto probing on hotplug.
> > 
> > However, this does not work for cold plugged modules (i.e. modules for
> > devices that were probed before mdev is added as hotplug handler).
> > Running mdev -s to replay hotplug events does not work in that case.
> 
> I'd rather have this in a seperate bootscript, like this (which performs the
> same but applies a filter):
> https://github.com/topic-embedded-products/meta-topic/tree/master/recipes-core/module-init-tools
> 
> This gives users a choice as to whether or not they want this to happen.
> 

Well, this is a matter of expectations, I really think that final users
will expect that by default modules will be automatically loaded at boot
time. Wanting modules to be loaded automatically by the hotplug events
and not at boot time is a really specific use case.

Advanced users will still have the choice to use a different init script
if they don't want that to happen.


> Another note: Since this runs at each and every boot, it'd be wise to
> optimize this for performance. That "sort -u" might be bad for performance,
> and modprobe doesn't mind if modules were already probed.
> 
> 
> 
> > Let's manually modprobe all modules in the rootfs.
> > 
> > Taken from:
> >   - https://github.com/buildroot/buildroot/commit/07f46c2b6daec44a6176039c90be67e66c4c2e42
> >   - https://github.com/buildroot/buildroot/commit/b4fc5a180c81689a982d5c595844331684c14f51
> > 
> > We need xargs to support zero termination of args so let's enable this
> > configuration in the fragment for mdev.
> > 
> > Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
> > ---
> >   meta/recipes-core/busybox/busybox/mdev.cfg | 2 ++
> >   meta/recipes-core/busybox/files/mdev       | 1 +
> >   2 files changed, 3 insertions(+)
> > 
> > diff --git a/meta/recipes-core/busybox/busybox/mdev.cfg b/meta/recipes-core/busybox/busybox/mdev.cfg
> > index 6aefe90e43..0d60fc9560 100644
> > --- a/meta/recipes-core/busybox/busybox/mdev.cfg
> > +++ b/meta/recipes-core/busybox/busybox/mdev.cfg
> > @@ -9,3 +9,5 @@ CONFIG_SETSID=y
> >   CONFIG_CTTYHACK=y
> >   CONFIG_FEATURE_SHADOWPASSWDS=y
> > +
> > +CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM=y
> > diff --git a/meta/recipes-core/busybox/files/mdev b/meta/recipes-core/busybox/files/mdev
> > index 8c9c06e96c..165b275256 100755
> > --- a/meta/recipes-core/busybox/files/mdev
> > +++ b/meta/recipes-core/busybox/files/mdev
> > @@ -9,6 +9,7 @@ touch /dev/mdev.seq
> >   #sysctl -w kernel.hotplug=/sbin/mdev
> >   echo "/sbin/mdev" > /proc/sys/kernel/hotplug
> >   mdev -s
> > +find /sys/ -name modalias -print0 | xargs -0 sort -u -z | xargs -0 modprobe -abq
> >   #
> >   # We might have mounted something over /dev, see if /dev/initctl is there.
> > 
> 
> 
> 
> Kind regards,
> 
> Mike Looijmans
> System Expert
> 
> TOPIC Products
> Materiaalweg 4, NL-5681 RJ Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
> 
> Please consider the environment before printing this e-mail
> 
> 
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
Alexandre Belloni, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

