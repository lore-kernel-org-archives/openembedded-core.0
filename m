Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SvPzy-0002BJ-DU for openembedded-core@lists.openembedded.org;
	Sun, 29 Jul 2012 11:41:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6T9ThBW026979
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2012 10:29:43 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26851-04 for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2012 10:29:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6T9TWuG026973
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2012 10:29:34 +0100
Message-ID: <1343554172.16998.32.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 29 Jul 2012 10:29:32 +0100
In-Reply-To: <1343319703-15704-1-git-send-email-msm@freescale.com>
References: <1343319703-15704-1-git-send-email-msm@freescale.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] u-boot.inc: update linker arguments to pass --sysroot arg
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
X-List-Received-Date: Sun, 29 Jul 2012 09:41:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-07-26 at 11:21 -0500, Matthew McClintock wrote:
> If we are building from sstate-cache it's possible to be building
> from another folder on another machine, therefore the linker requires
> that a proper --sysroot is passed too it so it can find things like
> libgcc.a and avoid errors such as:
> 
> | arm-poky-linux-gnueabi-gcc  -g  -O2  -fno-common -ffixed-r8 -msoft-float   -D__KERNEL__ -DCONFIG_SYS_TEXT_BASE=0x80008000 -I/local/yocto/upstream/label/ubuntu1204-64b/machine/beagleboard/poky/edison/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git5+b1af6f532e0d348b153d5c148369229d24af361a-r0/git/include -fno-builtin -ffreestanding -nostdinc -isystem /local/yocto/upstream/label/ubuntu1204-64b/machine/beagleboard/poky/edison/tmp/sysroots/x86_64-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../lib/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.6.3/include -pipe  -DCONFIG_ARM -D__ARM__ -marm  -mabi=aapcs-linux -mno-thumb-interwork -march=armv5 -Wall -Wstrict-prototypes -fno-stack-protector -fno-toplevel-reorder   -o hello_world.o hello_world.c -c
> | arm-poky-linux-gnueabi-gcc  -g  -O2  -fno-common -ffixed-r8 -msoft-float   -D__KERNEL__ -DCONFIG_SYS_TEXT_BASE=0x80008000 -I/local/yocto/upstream/label/ubuntu1204-64b/machine/beagleboard/poky/edison/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git5+b1af6f532e0d348b153d5c148369229d24af361a-r0/git/include -fno-builtin -ffreestanding -nostdinc -isystem /local/yocto/upstream/label/ubuntu1204-64b/machine/beagleboard/poky/edison/tmp/sysroots/x86_64-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../lib/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.6.3/include -pipe  -DCONFIG_ARM -D__ARM__ -marm  -mabi=aapcs-linux -mno-thumb-interwork -march=armv5 -Wall -Wstrict-prototypes -fno-stack-protector -fno-toplevel-reorder   -o stubs.o stubs.c -c
> | arm-poky-linux-gnueabi-ld  -r -o libstubs.o  stubs.o
> | arm-poky-linux-gnueabi-ld -g -Ttext 0x80300000 \
> | 			-o hello_world -e hello_world hello_world.o libstubs.o \
> | 			-L. -lgcc
> | arm-poky-linux-gnueabi-ld: cannot find -lgcc
> | make[1]: *** [hello_world] Error 1
> 
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot.inc           |    2 +-
>  meta/recipes-bsp/u-boot/u-boot_2011.03.bb    |    2 +-
>  meta/recipes-bsp/u-boot/u-boot_2011.06.bb    |    2 +-
>  meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb |    1 +
>  4 files changed, 4 insertions(+), 3 deletions(-)


Merged to master, thanks.

Richard



