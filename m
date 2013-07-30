Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 34E796B3F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 10:51:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jul 2013 03:51:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,777,1367996400"; d="scan'208";a="378299713"
Received: from unknown (HELO helios.localnet) ([10.252.122.217])
	by fmsmga002.fm.intel.com with ESMTP; 30 Jul 2013 03:50:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 30 Jul 2013 11:50:58 +0100
Message-ID: <8237333.h1yk84NkVT@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-26-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <7891D5A0-7EB3-4A7A-99EC-962DC7EF9764@gmail.com>
References: <1374763888-7315-1-git-send-email-koen@dominion.thruhere.net>
	<21EAF1A7-D7BE-4275-9998-C42694B18C43@dominion.thruhere.net>
	<7891D5A0-7EB3-4A7A-99EC-962DC7EF9764@gmail.com>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: fix PACKAGECONFIG options
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
X-List-Received-Date: Tue, 30 Jul 2013 10:51:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 30 July 2013 01:52:42 Khem Raj wrote:
> On Jul 26, 2013, at 12:01 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > Op 25 jul. 2013, om 16:51 heeft Koen Kooi <koen@dominion.thruhere.net> het 
volgende geschreven:
> >> The ??= operator is too weak and it's setting a non-existent
> >> PACKAGECONFIG option ('libpam' instead of 'pam').
> >> 
> >> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >> ---
> >> meta/recipes-core/util-linux/util-linux.inc | 4 ++--
> >> 1 file changed, 2 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/meta/recipes-core/util-linux/util-linux.inc
> >> b/meta/recipes-core/util-linux/util-linux.inc index d373cec..3d1198a
> >> 100644
> >> --- a/meta/recipes-core/util-linux/util-linux.inc
> >> +++ b/meta/recipes-core/util-linux/util-linux.inc
> >> @@ -47,9 +47,9 @@ EXTRA_OECONF = "--libdir=${base_libdir}
> >> --disable-use-tty-group \>> 
> >>                --enable-libuuid --enable-libblkid --enable-fsck
> >>                --without-udev \
> >> 		
> >> 		usrsbin_execdir='${sbindir}' \
> >> 
> >> "
> >> -PACKAGECONFIG_class-target ??= "${@base_contains('DISTRO_FEATURES',
> >> 'pam', 'libpam', '', d)} \ +PACKAGECONFIG_class-target ?=
> >> "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \>> 
> >>                                ${@base_contains('DISTRO_FEATURES',
> >>                                'systemd', 'systemd', '', d)} "
> >> 
> >> -PACKAGECONFIG[pam] = "--enable-su --enable-runuser,--disable-su
> >> --disable-runuser, pam," +PACKAGECONFIG[pam] = "--enable-su
> >> --enable-runuser,--disable-su --disable-runuser, libpam,"
> >> 
> >> # Respect the systemd feature for uuidd
> >> PACKAGECONFIG[systemd] = "--enable-socket-activation
> >> --with-systemdsystemunitdir=${systemd_unitdir}/system/,
> >> --disable-socket-activation --without-systemdsystemunitdir"> 
> > And of course this will trigger another bug:
> > |  * check_data_file_clashes: Package util-linux wants to install file
> > |  /build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/work/beaglebone-ang
> > |  strom-linux-gnueabi/cloud9-image/1.0-r0/rootfs/usr/bin/su> |  
> > |       But that file is already provided by package  * shadow
> > 
> > *sigh*
> 
> +*sigh*
> 
> has this been fixed yet ? just ran into same issue

The patch to fix it is in Saul's most recent consolidated pull.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

