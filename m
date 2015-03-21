Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1156C60034;
	Sat, 21 Mar 2015 09:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2L9TMcS000491; Sat, 21 Mar 2015 09:29:22 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GM9dktZ0iX5n; Sat, 21 Mar 2015 09:29:22 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2L9T7rB000484
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 21 Mar 2015 09:29:19 GMT
Message-ID: <1426930147.29168.104.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 21 Mar 2015 09:29:07 +0000
In-Reply-To: <20150321021120.GF4738@jama>
References: <20150316174236.48B8050234@opal.openembedded.org>
	<20150321021120.GF4738@jama>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Jonathan Liu : fontcache.bbclass: prepend to PACKAGEFUNCS instead of appending
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
X-List-Received-Date: Sat, 21 Mar 2015 09:29:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2015-03-21 at 03:11 +0100, Martin Jansa wrote:
> On Mon, Mar 16, 2015 at 05:42:36PM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: f0e3db4eaacc32423934ce09b91bc619dc5dbd21
> > URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=f0e3db4eaacc32423934ce09b91bc619dc5dbd21
> > 
> > Author: Jonathan Liu <net147@gmail.com>
> > Date:   Mon Mar  9 12:13:56 2015 +1100
> > 
> > fontcache.bbclass: prepend to PACKAGEFUNCS instead of appending
> > 
> > Appending to PACKAGEFUNCS results in the font packages missing the
> > postinst/postrm scripts and the fontconfig cache not being generated
> > in /var/cache/fontconfig when creating images or installing font
> > packages. This is because the package data has already been emitted
> > by emit_pkgdata in PACKAGEFUNCS. Prepend to PACKAGEFUNCS to ensure
> > add_fontcache_postinsts is executed before emit_pkgdata.
> 
> It's not caused by this change, but fixing this issue revealed that
> fc-cache doesn't really work here.
> 
> Every time the intercept_scripts/update_font_cache executes qemu it gets
> "stuck" eating a lot of cpu and memory until it dies. Is anyone alse
> seeing this behavior?
> 
> WARNING: The postinstall intercept hook 'update_font_cache' failed (exit code: 137)! See log for details!
> WARNING: The postinstalls for the following packages will be postponed for first boot: liberation-fonts
> ERROR: The following packages could not be configured offline and rootfs is read-only: ['liberation-fonts']
> ERROR: Function failed: do_rootfs
> 
> bitbake  32618 98.8 67.1 11031512 10983420 pts/3 R+ 03:00   4:53
> qemu-i386 -r 2.6.32 -L /OE/rootfs -E uD_LIBRARY_PATH=/OE/rootfs//usr/lib:/OE/rootfs//lib /OE/rootfs/usr/bin/fc-cache --sysroot=/OE/rootfs

There are a couple of bugs in the bugzilla around this. One seemed to be
related to circular symlinks in udev's ptest package which was
supposedly fixed. The other claims to have been resolved by upgrading
fontconfig to a version which doesn't have issues with circular paths.

There is general confusion about how to reproduce the issue and what the
real problem is though.

Does your system have any recursive directory structures?

I'd like to get to the bottom of the issue and fix it once and for all
but we likely need more info.

Cheers,

Richard


