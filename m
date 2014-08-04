Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-04.prod.phx3.secureserver.net
	(p3plsmtpa08-04.prod.phx3.secureserver.net [173.201.193.105])
	by mail.openembedded.org (Postfix) with ESMTP id B823B60144
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 14:56:38 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa08-04.prod.phx3.secureserver.net with 
	id aewe1o0071mTNtu01ewefw; Mon, 04 Aug 2014 07:56:39 -0700
Message-ID: <53DF9F25.1060404@pabigot.com>
Date: Mon, 04 Aug 2014 09:56:37 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: blocking pie in recipes that build shared object files
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
X-List-Received-Date: Mon, 04 Aug 2014 14:56:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I've now hit two recipes in meta-openembedded that fail on armv7-a 
because SECURITY_CFLAGS has -pie as an option that leaks into a link 
command building a shared object file.  This produces:

| 
/prj/oe/omap/build-beaglebone-master/tmp/sysroots/beaglebone/usr/lib/Scrt1.o: 
In function `_start':
| 
/prj/oe/omap/build-beaglebone-master/tmp/work/cortexa8hf-vfp-neon-poky-linux-gnueabi/eglibc/2.19-r0/eglibc-2.19/libc/csu/../ports/sysdeps/arm/start.S:128: 
undefined reference to `main'
| collect2: error: ld returned 1 exit status
| error: command 'arm-poky-linux-gnueabi-gcc' failed with exit status 1

In openembedded-core meta/conf/distro/include/security_flags.inc 
provides a bunch of package-specific overrides to use 
SECURITY_NO_PIE_CFLAGS for this sort of package.

It's not clear to me how that should be accomplished for recipes that 
are not part of openembedded-core.  For 
http://patches.openembedded.org/patch/77165/ for python-smbus in 
meta-python I chose to override it in the bb file.

What is the best-practices solution to this problem?

Peter


