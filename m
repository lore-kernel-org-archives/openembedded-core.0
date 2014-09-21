Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 5E2B665DEB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Sep 2014 16:02:19 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3j1D7b0hB5z3hjr0;
	Sun, 21 Sep 2014 18:02:18 +0200 (CEST)
X-Auth-Info: lbSgwOAiBLVi6MZflf8XdBJNkvt097hW44DYVIYfOBk=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3j1D7Z0kP7zvhTZ; 
	Sun, 21 Sep 2014 18:02:18 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun, 21 Sep 2014 18:02:17 +0200
User-Agent: KMail/1.13.7 (Linux/3.13-trunk-amd64; KDE/4.13.1; x86_64; ; )
References: <1407438629-13369-1-git-send-email-marex@denx.de>
	<201409190914.03281.marex@denx.de> <1411111512.4736.11.camel@ted>
In-Reply-To: <1411111512.4736.11.camel@ted>
MIME-Version: 1.0
Message-Id: <201409211802.17872.marex@denx.de>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Yocto: Install full set of python modules in Qt SDK toolchain
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
X-List-Received-Date: Sun, 21 Sep 2014 16:02:22 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Friday, September 19, 2014 at 09:25:12 AM, Richard Purdie wrote:
[...]
> > git grep nativesdk-python-modules doesn't show any matches in
> > git://git.yoctoproject.org/poky master . Do you mean the
> > nativesdk-packagegroup- python I crafted or do you refer to something
> > else please ?
> > 
> > Also, shouldn't full python be installed into all the SDK toolchains ? I
> > am for example unable to compile U-Boot 2014.10rc with the Yocto SDK
> > toolchain anymore. The SDK is missing python modules and I cannot easily
> > override the usage of python from the SDK . So I agree with Laszlo here,
> > the SDK toolchain is somewhat unusable as it is.
> 
> I refer to the package I mentioned:
> 
> $ ls -la tmp/deploy/ipk/x86_64-nativesdk/nativesdk-python-modules*
> -rw-r--r-- 2 richard richard 1512 Sep 18 17:09
> tmp/deploy/ipk/x86_64-nativesdk/nativesdk-python-modules_2.7.3-r0.3.24_x86
> _64-nativesdk.ipk
> 
> See ${PN}-modules defined in python-2.7-manifest.inc.

Oh I see, sorry. Is there any way to look up packages with bitbake or Yocto 
please ?

> I agreed there is a problem, I disagree somewhat about how it should be
> fixed since you're just installing a set of modules which is defined as
> those needed to run bitbake and I don't think this is what you actually
> want. There is also the question of whether nativesdk-python should even
> be in there...

So would this patch (paste below) work please ? If so, I would submit proper.

diff --git a/meta/classes/populate_sdk_base.bbclass 
b/meta/classes/populate_sdk_base.bbclass
index 10d04ed..7245d53 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -30,7 +30,11 @@ B_task-populate-sdk = "${SDK_DIR}"
 
 SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${REAL_MULTIMACH_TARGET_SYS}"
 
-TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-sdk-host packagegroup-cross-
canadian-${MACHINE}"
+TOOLCHAIN_HOST_TASK ?= "                               \
+       nativesdk-packagegroup-sdk-host                 \
+       packagegroup-cross-canadian-${MACHINE}          \
+       nativesdk-python-modules                        \
+       "
 TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_TARGET_TASK ?= "packagegroup-core-standalone-sdk-target packagegroup-
core-standalone-sdk-target-dbg"
 TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
diff --git a/meta/recipes-qt/meta/meta-toolchain-qt.inc b/meta/recipes-
qt/meta/meta-toolchain-qt.inc
index 6b162bd..473a123 100644
--- a/meta/recipes-qt/meta/meta-toolchain-qt.inc
+++ b/meta/recipes-qt/meta/meta-toolchain-qt.inc
@@ -1,4 +1,8 @@
-TOOLCHAIN_HOST_TASK = "nativesdk-packagegroup-${QTNAME}-toolchain-host 
packagegroup-cross-canadian-${MACHINE}"
+TOOLCHAIN_HOST_TASK = "                                                \
+       nativesdk-packagegroup-${QTNAME}-toolchain-host         \
+       packagegroup-cross-canadian-${MACHINE}                  \
+       nativesdk-python-modules                                \
+       "
 TOOLCHAIN_TARGET_TASK = "packagegroup-${QTNAME}-toolchain-target"
 TOOLCHAIN_OUTPUTNAME = "${SDK_NAME}-toolchain-${QTNAME}-${DISTRO_VERSION}"


Best regards,
Marek Vasut

