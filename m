Return-Path: <sgarman@zenlinux.com>
X-Greylist: delayed 478 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 11 Sep 2014 18:06:26 UTC
Received: from masterfoo.zenlinux.com (masterfoo.zenlinux.com [50.116.21.172])
	by mail.openembedded.org (Postfix) with ESMTP id 973C865D58
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Sep 2014 18:06:26 +0000 (UTC)
Received: from [192.168.1.12] (c-50-139-96-211.hsd1.or.comcast.net
	[50.139.96.211])
	by masterfoo.zenlinux.com (Postfix) with ESMTPSA id 53BD91EA35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Sep 2014 10:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=zenlinux.com; s=dkim;
	t=1410458309; bh=ER9RQnq4mTOVf4MN0hnm4SLC+rNgJPIS9fA7+9MT7gI=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=D7pyfUzrIOpVZXQRiPoxIVDsk82IdQ8Eksn61iij0MTcMZWuvy8icy3zOVMUoE4/A
	78DwLVSKX32bk4NA/SAQNH1X2rB8kzYbbg/eUXGI4Xdbaa3pzfbieZ0UnPQyYE/bMw
	js3e3CBftCHTMJa2H7cHo065NYIYqu01/sxNp7uI=
Message-ID: <5411E2C3.3080807@zenlinux.com>
Date: Thu, 11 Sep 2014 10:58:27 -0700
From: Scott Garman <sgarman@zenlinux.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <A0F68394C677A9428EE03709453BAAEC7959C76C@BRS-Exch02.haemo.net>
In-Reply-To: <A0F68394C677A9428EE03709453BAAEC7959C76C@BRS-Exch02.haemo.net>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.3.9
	(masterfoo.zenlinux.com [0.0.0.0]);
	Thu, 11 Sep 2014 10:58:29 -0700 (PDT)
X-Virus-Scanned: clamav-milter 0.98.4 at masterfoo
X-Virus-Status: Clean
Subject: Re: bzImage not included in rootfs
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
X-List-Received-Date: Thu, 11 Sep 2014 18:06:35 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

On 09/11/2014 05:08 AM, Chiz Chikwendu wrote:
> I am new to Openembedded (and yocto).
> 
> I have built an image with poky build environment.
> 
>  
> 
> I noticed that the kernel’s bzImage is not included in the rootfs.
> 
> How do I get the system to include “bzImage” in the rootfs (boot/bzImage-)?
> 
>  
> 
> I’ve done some research, and I saw a note about setting the parameter:
> 
> RDEPENDS_kernel-base = “zImage”
> 
>  
> 
> This should override the kernel settings and build the kernel into the
> rootfs. I tried it, however it is not working for me.

Hi Chiz,

Which MACHINE are you building for? This is probably something that is
set in the machine's BSP, since some hw platforms use bootloaders which
look for the kernel in a separate flash disk than the rootfs, so for
those devices there's no need to put the kernel in the rootfs.

If you're building one of the qemu machine targets, note that in
meta/conf/machine/include/qemu.inc there is:

# Don't include kernels in standard images
RDEPENDS_kernel-base = ""

Finally, where are you trying to set RDEPENDS_kernel-base in your
example above? I'm assuming in your local.conf file? I believe that
should be the place to do it so that it overrides the machine
configuration's definition.

Finally, make sure you've cleared the build cache for the image
generation by running bitbake -c cleanall <image-name> before trying to
generate it again.

Scott


