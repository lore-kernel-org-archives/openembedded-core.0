Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (top.free-electrons.com [176.31.233.9])
	by mail.openembedded.org (Postfix) with ESMTP id A5AE16AC7B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Oct 2014 15:30:49 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 6B2083C0; Fri, 10 Oct 2014 17:30:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
	shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id DC5273C0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Oct 2014 17:30:39 +0200 (CEST)
Date: Fri, 10 Oct 2014 17:30:34 +0200
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20141010153034.GK18916@piout.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Issue with pkgconfig and ncurses
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
X-List-Received-Date: Fri, 10 Oct 2014 15:30:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

While building alsa-utils I ran in a weird issue. The build system was
trying to link alsa-utils with the x86_64 ncurses lib. That issue didn't
appear on another machine but could be reproduced 9 out of 10 times on
my main machine.

I tracked down the issue: when configuring alsa-utils, configure tries
to use pkg-config to fin CFLAGS/LDFLAGS for ncurses. This was failing so
it is falling back to use ncursesw5-config which points cflags and
ldflags to the x86_64 sysroot.

That is were this is nasty: the reason why pkg-config is failing is that
the configure for ncurses is doing that:
        PKG_CONFIG_LIBDIR=`echo "$PKG_CONFIG_LIBDIR" | sed -e 's/^://' -e 's/:.*//'`
        if test -n "$PKG_CONFIG_LIBDIR" && test -d "$PKG_CONFIG_LIBDIR" ; then

That test fails one my main machine because at the time ncurses is
configured, PKG_CONFIG_LIBDIR (that is
tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/lib/pkgconfig/) is
not yet created as ncurses is the first package trying to install .pc
files. The configure script then continues with only a warning but
deactivate .pc files installation.

This doesn't happen on my other machine because it has more cores
and finishes to build zlib before trying to configure ncurses!

I tried multiple thing ot fix that but I couldn't decide what is the
best way.

Should we fix the configure script for ncurses but then it may happen
again with another package.

Or should we enforce the creation of ${SYSROOT_DESTDIR}/usr/lib/pkgconfig/
from pkg-config. the main issue being that we actually compile
pkg-config-native and we want to create that in ${SYSROOT_DESTDIR} for
the machine.

Any help would be greatly appreciated.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

