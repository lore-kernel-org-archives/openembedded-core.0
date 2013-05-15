Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1UcdAX-00035f-DO
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 16:59:05 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 8831AF811DA; Wed, 15 May 2013 08:40:53 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id EE32AF81199;
	Wed, 15 May 2013 08:40:51 -0600 (MDT)
Message-ID: <51939E73.8070605@mlbassoc.com>
Date: Wed, 15 May 2013 08:40:51 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Image dependency broken
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 May 2013 14:59:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I think this recent commit (poky tree) broke image generation,
at least for incremental/update builds:

commit db921312019c94b3fb8381bf3824befc9108336a
Author: Phil Blundell <pb@pbcl.net>
Date:   Fri May 3 13:38:22 2013 +0100

     image.bbclass: Don't mark do_rootfs and do_build as nostamp

Here's how to test it:

Build Configuration:
BB_VERSION        = "1.19.0"
BUILD_SYS         = "i686-linux"
NATIVELSBSTRING   = "Fedora-16"
TARGET_SYS        = "arm-poky-linux-gnueabi"
MACHINE           = "qemuarm"
DISTRO            = "poky"
DISTRO_VERSION    = "1.4+snapshot-20130515"
TUNE_FEATURES     = "armv5 thumb dsp"
TARGET_FPU        = "soft"
meta
meta-yocto
meta-yocto-bsp    = "master:bd27cca7e6817e6cbf3cba38e05f0877e3f03d6a"

* Build an image, e.g. core-image-sato
   $ bitbake core-image-sato
* Cause some dependency to be rebuilt
   $ bitbake xserver-xorg -c cleansstate
* Rebuild the image
   $ bitbake core-image-sato

What you'll find is that the dependencies will be rebuilt, but the
image is not.  Here are the stamps for this exact process that I
just ran:

$ ls -l tmp/stamps/armv5te-poky-linux-gnueabi/xserver-xorg
total 368
-rw-rw-r-- 1 gthomas gthomas      0 May 15 08:20 2_1.14.0-r8.1.do_build.3e8287828bc62961b7db97e9e69bd2a5
-rw-rw-r-- 1 gthomas gthomas      0 May 15 08:16 2_1.14.0-r8.1.do_cleansstate.4e8825d39727a0ed3efd1a93b6eb4a82
-rw-rw-r-- 1 gthomas gthomas   5661 May 15 08:16 2_1.14.0-r8.1.do_cleansstate.sigdata.4e8825d39727a0ed3efd1a93b6eb4a82
-rw-r--r-- 1 gthomas gthomas      0 May 15 08:19 2_1.14.0-r8.1.do_compile.dc92ebacd7e15baa56464e9c32a93c52
-rw-rw-r-- 1 gthomas gthomas  18218 May 15 08:19 2_1.14.0-r8.1.do_compile.sigdata.dc92ebacd7e15baa56464e9c32a93c52
-rw-r--r-- 1 gthomas gthomas      0 May 15 08:18 2_1.14.0-r8.1.do_configure.8288f649a20df8f220ceda9822461b98
-rw-rw-r-- 1 gthomas gthomas  33807 May 15 08:18 2_1.14.0-r8.1.do_configure.sigdata.8288f649a20df8f220ceda9822461b98
-rw-rw-r-- 1 gthomas gthomas      0 May 15 08:17 2_1.14.0-r8.1.do_fetch.e041d2b80813561f11663626a326c4af
-rw-rw-r-- 1 gthomas gthomas   2891 May 15 08:17 2_1.14.0-r8.1.do_fetch.sigdata.e041d2b80813561f11663626a326c4af
-rw-r--r-- 1 gthomas gthomas      0 May 15 08:19 2_1.14.0-r8.1.do_install.304974032557bbf7a50f81f20b704970
-rw-rw-r-- 1 gthomas gthomas  20671 May 15 08:19 2_1.14.0-r8.1.do_install.sigdata.304974032557bbf7a50f81f20b704970
-rw-r--r-- 1 gthomas gthomas      0 May 15 08:20 2_1.14.0-r8.1.do_package.b9006d14db7c26d2b98015efcb903498
-rw-rw-r-- 1 gthomas gthomas      0 May 15 08:20 2_1.14.0-r8.1.do_packagedata.e8f16ce387d2fc4a6312c02a2eb85f69
-rw-rw-r-- 1 gthomas gthomas  18993 May 15 08:20 2_1.14.0-r8.1.do_packagedata.sigdata.e8f16ce387d2fc4a6312c02a2eb85f69
-rw-rw-r-- 1 gthomas gthomas 164700 May 15 08:20 2_1.14.0-r8.1.do_package.sigdata.b9006d14db7c26d2b98015efcb903498
-rw-rw-r-- 1 gthomas gthomas      0 May 15 08:20 2_1.14.0-r8.1.do_package_write.0c34d92401a3c979b54ed62ebf6dc186
-rw-r--r-- 1 gthomas gthomas      0 May 15 08:20 2_1.14.0-r8.1.do_package_write_rpm.07f566ba533e20251687c91694a8b9e7
-rw-rw-r-- 1 gthomas gthomas  38641 May 15 08:20 2_1.14.0-r8.1.do_package_write_rpm.sigdata.07f566ba533e20251687c91694a8b9e7
-rw-rw-r-- 1 gthomas gthomas      0 May 15 08:17 2_1.14.0-r8.1.do_patch.e500c1c6714cba27a1b004d6bceb68f0
-rw-rw-r-- 1 gthomas gthomas   8506 May 15 08:17 2_1.14.0-r8.1.do_patch.sigdata.e500c1c6714cba27a1b004d6bceb68f0
-rw-rw-r-- 1 gthomas gthomas      0 May 15 08:17 2_1.14.0-r8.1.do_populate_lic.21bb89cdd6694d1181a1bbabdbf9fbba
-rw-rw-r-- 1 gthomas gthomas   9744 May 15 08:17 2_1.14.0-r8.1.do_populate_lic.sigdata.21bb89cdd6694d1181a1bbabdbf9fbba
-rw-r--r-- 1 gthomas gthomas      0 May 15 08:20 2_1.14.0-r8.1.do_populate_sysroot.b8ad7b95ae87340121078e3c18341edd.qemuarm
-rw-rw-r-- 1 gthomas gthomas  22421 May 15 08:20 2_1.14.0-r8.1.do_populate_sysroot.sigdata.b8ad7b95ae87340121078e3c18341edd
-rw-rw-r-- 1 gthomas gthomas      0 May 15 08:17 2_1.14.0-r8.1.do_unpack.7cec1f4078c7145429aaf1ca80c0b1c8
-rw-rw-r-- 1 gthomas gthomas   2070 May 15 08:17 2_1.14.0-r8.1.do_unpack.sigdata.7cec1f4078c7145429aaf1ca80c0b1c8

$ ls -l tmp/stamps/qemuarm-poky-linux-gnueabi/core-image-sato
total 188
-rw-rw-r-- 1 gthomas gthomas      0 May 15 08:06 1.0-r0.do_build.3e2800c527d6725d5f1c377be38a549f
-rw-rw-r-- 1 gthomas gthomas      0 May 15 07:55 1.0-r0.do_fetch.5c76e66fdf9e584278f9569035a10df6
-rw-rw-r-- 1 gthomas gthomas      0 May 15 08:16 1.0-r0.do_packagedata_setscene.bdfa92ae747b100a69ca6a85ea20b5a2
-rw-rw-r-- 1 gthomas gthomas      0 May 15 08:16 1.0-r0.do_package_setscene.5072f304a688a27941a87ff54cea9a34
-rw-rw-r-- 1 gthomas gthomas      0 May 15 08:02 1.0-r0.do_package_write.a12eea68cedc0b54f78285fd7f1515b4
-rw-rw-r-- 1 gthomas gthomas      0 May 15 08:16 1.0-r0.do_package_write_rpm_setscene.289d75c694c2c37f0d0ca4a738077a18
-rw-rw-r-- 1 gthomas gthomas      0 May 15 07:55 1.0-r0.do_patch.42bdef43ce686536917980a9bb5e157a
-rw-rw-r-- 1 gthomas gthomas      0 May 15 08:02 1.0-r0.do_populate_lic.45ace5bfc5b954cb128f01284893d63f
-rw-rw-r-- 1 gthomas gthomas   9559 May 15 08:02 1.0-r0.do_populate_lic.sigdata.45ace5bfc5b954cb128f01284893d63f
-rw-rw-r-- 1 gthomas gthomas      0 May 15 08:16 1.0-r0.do_populate_sysroot_setscene.8c98b7b8f4b070a18138ccadbd98352b.qemuarm
-rw-r--r-- 1 gthomas gthomas      0 May 15 08:06 1.0-r0.do_rootfs.9fb4936c3db40740b8c259566633bbc6
-rw-rw-r-- 1 gthomas gthomas 179471 May 15 08:06 1.0-r0.do_rootfs.sigdata.9fb4936c3db40740b8c259566633bbc6
-rw-rw-r-- 1 gthomas gthomas      0 May 15 07:55 1.0-r0.do_unpack.86e1fb19353d6b861fd4aebe280b352a

$ ls -l tmp/deploy/images/core-image-sato-qemuarm.tar.bz2
lrwxrwxrwx 1 gthomas gthomas 53 May 15 08:06 tmp/deploy/images/core-image-sato-qemuarm.tar.bz2 -> core-image-sato-qemuarm-20130515113022.rootfs.tar.bz2

This shows that the X server package was rebuilt, but the final
core-image-sato image was not.

Submitted as Yocto bug #4498

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


