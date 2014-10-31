Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa12-08.prod.phx3.secureserver.net
	(p3plsmtpa12-08.prod.phx3.secureserver.net [68.178.252.237])
	by mail.openembedded.org (Postfix) with ESMTP id 05ABB71F1F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 15:36:12 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa12-08.prod.phx3.secureserver.net with 
	id 9rcC1p00F0BVjqb01rcCir; Fri, 31 Oct 2014 08:36:13 -0700
Message-ID: <5453AC6C.5090206@pabigot.com>
Date: Fri, 31 Oct 2014 10:36:12 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: issues encountered using wic
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
X-List-Received-Date: Fri, 31 Oct 2014 15:36:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I've started to transition to wic (in master) in hopes it reduces the 
amount of host passwd contamination resulting from creating SD images by 
untarring the rootfs onto an SD card.  I've run into the following 
initial issues:

First, wic requires a populated rootfs, by default in the recipe build 
directory.  Two issues: (1) this normally removed by rm_work, and (2) 
bitbake foo-image will not populate that directory if the required 
artifacts are available from sstate-cache (as happens when you then add 
foo-image to RM_WORK_EXCLUDE and reinvoke bitbake).

Both could be solved by getting the rootfs contents from an archive 
created by the image instead of assuming it's unpacked somewhere 
already.  Requiring IMAGE_FSTYPES to contain "tar.bz2" for wic doesn't 
seem burdensome.  Taking this path also opens up the possibility for wic 
plug-ins to customize configuration files (such as host keys) in the 
image rootfs without contaminating a shared resource used by other 
invocations of wic.

If this seems like a reasonable approach and the wic maintainers would 
like assistance with it, I'd be happy to put together a patch.

Second, wic requires IMAGE_BOOT_FILES to be provided (normally in 
machine.conf, as with meta-yocto-bsp's beaglebone.conf).  I normally use 
the beaglebone.conf from meta-ti, and found copying the IMAGE_BOOT_FILES 
setting to that BSP layer didn't work because the reference to 
${UBOOT_SUFFIX} remained empty. meta-yocto-bsp's beaglebone.conf defines 
and uses UBOOT_SUFFIX="img", but this is fragile as the real 
UBOOT_SUFFIX comes from u-boot.inc (where the default is "bin") or some 
other override.

Is there a way to resolve the potential inconsistency other than 
hard-coding a specific suffix in machine.conf?  "include u-boot.inc" in 
the machine.conf seems like a bad idea.

Peter

