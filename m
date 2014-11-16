Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-02.prod.phx3.secureserver.net
	(p3plsmtpa09-02.prod.phx3.secureserver.net [173.201.193.231])
	by mail.openembedded.org (Postfix) with ESMTP id 2E6D27210A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Nov 2014 00:05:39 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa09-02.prod.phx3.secureserver.net with 
	id G05e1p0090BVjqb0105e71; Sat, 15 Nov 2014 17:05:39 -0700
Message-ID: <5467EA52.6020008@pabigot.com>
Date: Sat, 15 Nov 2014 18:05:38 -0600
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <54677D77.2090104@pabigot.com>
In-Reply-To: <54677D77.2090104@pabigot.com>
Subject: Re: opkg/rpm inconsistencies in multilib image installations
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
X-List-Received-Date: Sun, 16 Nov 2014 00:05:44 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/2014 10:21 AM, Peter A. Bigot wrote:
> tl;dr: multilib apparently defines its own root directory underneath 
> ${IMAGE_ROOT} which includes copies of /etc files like passwd that are 
> not known to pseudo.  opkg and rpm differ in whether useradd scripts 
> are run when a multilib package is installed, resulting in failures to 
> add users/groups during multilib install when using opkg because a 
> sanity check thinks they already exist because pseudo is looking 
> somewhere else.

Actually, I'm going to retract this whole thing, since I'm now unable to 
reproduce any of the problems described here.  Possibly because of 
changes to the pseudo patches that fixed problems I thought were 
unrelated to this behavior.

Sorry for the noise.

Peter

>
> Details:
>
> Ross pointed out in 
> http://lists.openembedded.org/pipermail/openembedded-core/2014-November/099032.html 
> that the patches to prevent using host /etc files in pseudo failed 
> under multilib and asked me to look into it.
>
> Recall that with these patches PSEUDO_PASSWD (where pseudo looks up 
> users and groups for getpwnam(3) etc) is set in bitbake.conf to:
>
> PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${STAGING_DIR_NATIVE}"
>
> where STAGING_DIR_NATIVE holds the fallback files that provide only 
> enough entries to get fs-perms.txt to work before the target staging 
> /etc exists.
>
> Because images are different and with some packagers base-passwd can't 
> be installed unless user root can be resolved, in an (updated) 
> image.bbclass we use this:
>
> # Prefer image, but use the fallback files for lookups if the image ones
> # aren't yet available.
> PSEUDO_PASSWD = "${IMAGE_ROOTFS}:${STAGING_DIR_NATIVE}"
>
> Adding this line to perform_groupadd in useradd_base.bbclass
>        bbnote "rootdir $rootdir 
> PSEUDO_PASSWD=${PSEUDO_PASSWD}=$PSEUDO_PASSWD"
>
> and adding linebreaks for readability, I'm finding that when 
> lib32-dbus-1 is installed with PACKAGE_CLASSES = "package_ipk" we have:
>
> rootdir
>  /prj/oe/omap/build-ab-multilib/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r0/multilib/lib32 
>
> PSEUDO_PASSWD
> =/prj/oe/omap/build-ab-multilib/tmp/sysroots/lib32-qemux86-64
> :/prj/oe/omap/build-ab-multilib/tmp/sysroots/x86_64-linux
> =/prj/oe/omap/build-ab-multilib/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r0/rootfs 
>
> :/prj/oe/omap/build-ab-multilib/tmp/sysroots/x86_64-linux
>
> In other words, useradd.bbclass (1) thinks the etc directory is in $D, 
> the bitbake variable PSEUDO_PASSWD during build (2) thinks it's in the 
> multilib 32-bit target staging directory, and the PSEUDO_PASSWD 
> actually running (3) thinks it's in IMAGE_ROOT.
>
> Because of this, useradd.bbclass can't find netdev in $D/etc/group so 
> invokes groupadd which does a sanity check and complains that netdev 
> already exists in ${IMAGE_ROOT}/etc/group and things crumble to a stop.
>
> Interestingly the build+install works with PACKAGE_CLASSES = 
> "package_rpm" which shows this for the install of 
> dbus-1-1.8.2-r0.3.core2_64.rpm:
>
> rootdir
>  /prj/oe/omap/build-ab-multilib/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r0/rootfs 
>
> PSEUDO_PASSWD
> =/prj/oe/omap/build-ab-multilib/tmp/sysroots/qemux86-64
> :/prj/oe/omap/build-ab-multilib/tmp/sysroots/x86_64-linux
> =/prj/oe/omap/build-ab-multilib/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r0/rootfs 
>
> :/prj/oe/omap/build-ab-multilib/tmp/sysroots/x86_64-linux
>
> and either does not install dbus-1-1.8.2-r0.3.lib32_x86.rpm or somehow 
> prevents the groupadd scripts from being run.
>
> Whatever's going on here, RPM and OPKG appear to differ in the 
> environment and selected packages for multilib images, which surely 
> isn't right. I didn't check deb.
>
> Once somebody reconciles the packager behaviors, I'll return to deal 
> with any remaining changes to pseudo.  If we have to allow multilib to 
> create users/groups in a non-standard root directory it's gonna get 
> messy.
>
> Peter


