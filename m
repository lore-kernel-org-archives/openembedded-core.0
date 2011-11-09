Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RO3WH-0007Qk-AD
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 09:28:29 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Nov 2011 00:22:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="72722364"
Received: from unknown (HELO [10.255.12.14]) ([10.255.12.14])
	by orsmga001.jf.intel.com with ESMTP; 09 Nov 2011 00:22:12 -0800
Message-ID: <4EBA3834.8030406@linux.intel.com>
Date: Wed, 09 Nov 2011 00:22:12 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1320755519.3915.15.camel@mattotaupa>
	<D173D270-DC47-4EEB-8CC8-F0A10284EF56@dominion.thruhere.net>
	<1320757122.3915.18.camel@mattotaupa>
In-Reply-To: <1320757122.3915.18.camel@mattotaupa>
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH v2] xinit: Fix `startx` looking for `mcookie` in sysroot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Nov 2011 08:28:29 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 11/08/2011 04:58 AM, Paul Menzel wrote:
> Date: Tue, 8 Nov 2011 13:00:32 +0100
>
> `startx` run on a system based on the demo systemd image [1] and `opkg`-installed packages fails with the following error.
>
> 	/usr/bin/startx: line 139: /OE/tentacle/build/tmp-angstrom_2010_x/sysroots/x68_64-linux/usr/bin/mcookie: No such file or directory
>
> Applying commit 443bcc07 [1] from OE-classic
>
>          Author: Tom Rini<tom_rini@mentor.com>
>          Date:   Thu Apr 7 10:36:43 2011 -0700
>
>              xinit: Fix mcookie / util-linux-ng dependency
>
>              xinit just needs to know the runtime path of mcookie so we need to
>              RDEPEND on util-linux-ng and pass the runtime path in via EXTRA_OECONF
>
>              Signed-off-by: Tom Rini<tom_rini@mentor.com>
>
> fixes this issue. Commit 7f6cec6f [2]
>
>          Author: Frans Meulenbroeks<fransmeulenbroeks@gmail.com>
>          Date:   Sun Feb 21 18:11:30 2010 +0100
>
>              xinit: add dependency on util-linux-ng
>
>          […]
>
> tried to address the same problem but apparently did not help, because Tom still had problems.
>
> [1] http://www.angstrom-distribution.org/demo/beagleboard/Angstrom-systemd-image-eglibc-ipk-v2011.11-core-beagleboard.rootfs.tar.bz2
> [2] http://git.openembedded.org/openembedded/commit/443bcc0785bc004e471b3750a34d12d2fd2e5dad
> [3] http://git.openembedded.org/openembedded/commit/7f6cec6f0adb6203a6dbaf8a43c67c2c4f8bf84e
>
> Signed-off-by: Paul Menzel<paulepanter@users.sourceforge.net>
> ---
> 1. Please note that I did neither build nor run tested this patch and
> just noticed the error trying the demo image.
> 2. Koen mentioned something on IRC wanting to get rid of `startx`
> entirely. But this patch should be applied nevertheless.
>
> v2: move `RDEPENDS` further down as suggested by Koen
> ---
>   meta/recipes-graphics/xorg-app/xinit_1.3.0.bb |    7 ++++++-
>   1 files changed, 6 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-graphics/xorg-app/xinit_1.3.0.bb b/meta/recipes-graphics/xorg-app/xinit_1.3.0.bb
> index ee7c64d..20b378c 100644
> --- a/meta/recipes-graphics/xorg-app/xinit_1.3.0.bb
> +++ b/meta/recipes-graphics/xorg-app/xinit_1.3.0.bb
> @@ -9,9 +9,14 @@ systems. When this first client exits, xinit will kill the X server and \
>   then terminate."
>
>   LIC_FILES_CHKSUM = "file://COPYING;md5=0d4b5eef75f1584ccbdc5e4a34314407"
> -PR = "r0"
> +
> +PR = "r1"
>   PE = "1"
>
> +EXTRA_OECONF = "ac_cv_path_MCOOKIE=${bindir}/mcookie"
> +
> +RDEPENDS_${PN} += "util-linux-ng"
> +
Do you really mean util-linux in oe-core?

Sau!


>   FILES_${PN} += "${libdir}X11/xinit"
>
>   SRC_URI[md5sum] = "bc4e8b7d1919597cc37a0d24aa149dda"
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


