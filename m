Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QM7y3-0001SM-SV for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 02:16:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4H0E0f5025741;
	Tue, 17 May 2011 01:14:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25538-04; Tue, 17 May 2011 01:13:56 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4H0DrYp025735
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 17 May 2011 01:13:54 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <ca9a918a98510eac991c84ce1ebe8fecbdf38361.1305525725.git.raj.khem@gmail.com>
References: <cover.1305525725.git.raj.khem@gmail.com>
	<ca9a918a98510eac991c84ce1ebe8fecbdf38361.1305525725.git.raj.khem@gmail.com>
Date: Tue, 17 May 2011 01:13:51 +0100
Message-ID: <1305591231.3424.152.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/2] tclibc-uclibc.inc: Append -uclibc only to target recipes
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
X-List-Received-Date: Tue, 17 May 2011 00:16:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-05-15 at 23:04 -0700, Khem Raj wrote:
> Do not define DEPLOY_DIR_IMAGE
> Append -uclibc to STAGING_DIR_TARGET only for target recipe and cross
> recipes
> Append -uclibc to STAGING_DIR_HOST only for target recipes.
> 
> These changes make sure that we still share the native sysroot
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

The more I looked at that patch, the more holes I could see in what we
were doing (and what Angstrom currently does). I started playing around
with the patch below which tried to improve on that idea.

I then concluded that we might be able to do something like:

MACHINEOVERRIDES := "${MACHINE}"
MACHINE_append = "-uclibc"

since what we're really trying to do in the uclibc case is replace
anything MACHINE specific with something containing uclibc?

Thoughts?

Cheers,

Richard


diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 553c6a2..354668f 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -23,7 +23,7 @@ python () {
         bb.data.setVar('SSTATE_PKGARCH', bb.data.getVar('BUILD_ARCH', d), d)
     elif bb.data.inherits_class('cross', d):
         bb.data.setVar('SSTATE_PKGARCH', bb.data.expand("${BUILD_ARCH}_${BASE_PACKAGE_ARCH}", d), d)
-        bb.data.setVar('SSTATE_MANMACH', bb.data.expand("${BUILD_ARCH}_${MACHINE}", d), d)
+        bb.data.setVar('SSTATE_MANMACH', bb.data.expand("${BUILD_ARCH}_${STAGING_MACHNAME}", d), d)
     elif bb.data.inherits_class('crosssdk', d):
         bb.data.setVar('SSTATE_PKGARCH', bb.data.expand("${BUILD_ARCH}_${BASE_PACKAGE_ARCH}", d), d)
     elif bb.data.inherits_class('nativesdk', d):
@@ -31,7 +31,7 @@ python () {
     elif bb.data.inherits_class('cross-canadian', d):
         bb.data.setVar('SSTATE_PKGARCH', bb.data.expand("${SDK_ARCH}_${BASE_PACKAGE_ARCH}", d), d)
     else:
-        bb.data.setVar('SSTATE_MANMACH', bb.data.expand("${MACHINE}", d), d)
+        bb.data.setVar('SSTATE_MANMACH', bb.data.expand("${STAGING_MACHNAME}", d), d)
 
     # These classes encode staging paths into their scripts data so can only be
     # reused if we manipulate the paths
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index fef6457..c2e4e50 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -91,7 +91,7 @@ SSTATETASKS += "do_populate_sysroot"
 do_populate_sysroot[sstate-name] = "populate-sysroot"
 do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}"
 do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_HOST}/"
-do_populate_sysroot[stamp-extra-info] = "${MACHINE}"
+do_populate_sysroot[stamp-extra-info] = "${STAGING_MACHNAME}"
 
 python do_populate_sysroot_setscene () {
 	sstate_setscene(d)
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8b6236e..141b942 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -300,7 +300,8 @@ STAGING_DATADIR_NATIVE = "${STAGING_DIR_NATIVE}${datadir_native}"
 
 # This should really be MULTIMACH_HOST_SYS but that breaks "all" and machine 
 # specific packages - hack around it for now.
-STAGING_DIR_HOST = "${STAGING_DIR}/${MACHINE}"
+STAGING_MACHNAME ??= "${MACHINE}"
+STAGING_DIR_HOST = "${STAGING_DIR}/${STAGING_MACHNAME}"
 STAGING_BINDIR = "${STAGING_DIR_HOST}${bindir}"
 STAGING_LIBDIR = "${STAGING_DIR_HOST}${libdir}"
 STAGING_INCDIR = "${STAGING_DIR_HOST}${includedir}"
@@ -312,7 +313,7 @@ STAGING_PYDIR = "${STAGING_DIR}/lib/python2.4"
 
 # This should really be MULTIMACH_TARGET_SYS but that breaks "all" and machine 
 # specific packages - hack around it for now.
-STAGING_DIR_TARGET = "${STAGING_DIR}/${MACHINE}"
+STAGING_DIR_TARGET = "${STAGING_DIR}/${STAGING_MACHNAME}"
 STAGING_DIR_TCBOOTSTRAP = "${STAGING_DIR_TARGET}-tcbootstrap"
 
 # Setting DEPLOY_DIR outside of TMPDIR is helpful, when you are using
@@ -344,8 +345,8 @@ STAGING_KERNEL_DIR = "${STAGING_DIR_HOST}/kernel"
 
 IMAGE_ROOTFS = "${WORKDIR}/rootfs"
 IMAGE_BASENAME = "${PN}"
-IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}-${DATETIME}"
-IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"
+IMAGE_NAME = "${IMAGE_BASENAME}-${STAGING_MACHNAME}-${DATETIME}"
+IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${STAGING_MACHNAME}"
 
 # This option allows for a precentage overage of the actaul image size rather than a
 # fixed extra space
diff --git a/meta/conf/distro/include/tclibc-uclibc.inc b/meta/conf/distro/include/tclibc-uclibc.inc
index 27f6ec6..e84da81 100644
--- a/meta/conf/distro/include/tclibc-uclibc.inc
+++ b/meta/conf/distro/include/tclibc-uclibc.inc
@@ -20,11 +20,7 @@ CXXFLAGS += "-fvisibility-inlines-hidden"
 
 IMAGE_LINGUAS = ""
 
-DEPLOY_DIR_IMAGE = "${TMPDIR}/deploy/images"
-DEPLOY_DIR_append = "-uclibc"
-STAGING_DIR_TARGET_append = "-uclibc"
-STAGING_DIR_HOST_append = "-uclibc"
-SSTATE_MANIFESTS_append = "-uclibc"
+STAGING_MACHNAME = "${MACHINE}-uclibc"
 
 LIBC_DEPENDENCIES = "\
     uclibc \



