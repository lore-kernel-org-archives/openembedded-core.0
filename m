Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QMbZI-00080K-0K
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 09:53:20 +0200
Received: by pwj9 with SMTP id 9so665907pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 00:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=eEym7/O4m1awKaC9tCPDoWLTQYrUUu7inPFF7AFnBaw=;
	b=xQmjEOLdMiAtSDem6LMtgwVjbAJDGfjsUzdZTt4xEiwso7APjZ6wT2EPVZMbhUIXiz
	Wl83ss4Tju5w5XW/0eUTNPSj++nMszCHZHG5526KQlT67SSoAaQP/9aXKDQTTjJnRD+b
	lJwQl3tK1GHCqUIoh8+6pg8uvgaMm+q03npQM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=K1J66WlVayPJGvqWiGPrNI3NY6hrfgkvRppq8qXwFUOHpSYjO+6ccs38M//lpfTYcE
	pfq/UmrzeAeqg/tvMZ5W+s/KpUQGBOI1Azsz6SQvSfBMQExUBv5/xdrIy7SK1qaxbrwo
	Ldpxuanz3it2Ist+WpB9lwV8au1R/2UaCpR8E=
Received: by 10.68.20.233 with SMTP id q9mr2677333pbe.299.1305705021603;
	Wed, 18 May 2011 00:50:21 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id q20sm895285pbt.72.2011.05.18.00.50.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 00:50:20 -0700 (PDT)
Date: Wed, 18 May 2011 00:49:09 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20110518074909.GA31650@sakrah.homelinux.org>
References: <cover.1305525725.git.raj.khem@gmail.com>
	<ca9a918a98510eac991c84ce1ebe8fecbdf38361.1305525725.git.raj.khem@gmail.com>
	<1305591231.3424.152.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1305591231.3424.152.camel@rex>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 18 May 2011 07:53:20 -0000
X-Groupsio-MsgNum: 2580
Content-Type: multipart/mixed; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline

--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (17/05/11 01:13), Richard Purdie wrote:
> On Sun, 2011-05-15 at 23:04 -0700, Khem Raj wrote:
> > Do not define DEPLOY_DIR_IMAGE
> > Append -uclibc to STAGING_DIR_TARGET only for target recipe and cross
> > recipes
> > Append -uclibc to STAGING_DIR_HOST only for target recipes.
> > 
> > These changes make sure that we still share the native sysroot
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> 
> The more I looked at that patch, the more holes I could see in what we
> were doing (and what Angstrom currently does). I started playing around
> with the patch below which tried to improve on that idea.
> 
> I then concluded that we might be able to do something like:
> 
> MACHINEOVERRIDES := "${MACHINE}"
> MACHINE_append = "-uclibc"
> 
> since what we're really trying to do in the uclibc case is replace
> anything MACHINE specific with something containing uclibc?
> 
> Thoughts?
> 
> Cheers,
> 
> Richard
> 
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 553c6a2..354668f 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -23,7 +23,7 @@ python () {
>          bb.data.setVar('SSTATE_PKGARCH', bb.data.getVar('BUILD_ARCH', d), d)
>      elif bb.data.inherits_class('cross', d):
>          bb.data.setVar('SSTATE_PKGARCH', bb.data.expand("${BUILD_ARCH}_${BASE_PACKAGE_ARCH}", d), d)
> -        bb.data.setVar('SSTATE_MANMACH', bb.data.expand("${BUILD_ARCH}_${MACHINE}", d), d)
> +        bb.data.setVar('SSTATE_MANMACH', bb.data.expand("${BUILD_ARCH}_${STAGING_MACHNAME}", d), d)
>      elif bb.data.inherits_class('crosssdk', d):
>          bb.data.setVar('SSTATE_PKGARCH', bb.data.expand("${BUILD_ARCH}_${BASE_PACKAGE_ARCH}", d), d)
>      elif bb.data.inherits_class('nativesdk', d):
> @@ -31,7 +31,7 @@ python () {
>      elif bb.data.inherits_class('cross-canadian', d):
>          bb.data.setVar('SSTATE_PKGARCH', bb.data.expand("${SDK_ARCH}_${BASE_PACKAGE_ARCH}", d), d)
>      else:
> -        bb.data.setVar('SSTATE_MANMACH', bb.data.expand("${MACHINE}", d), d)
> +        bb.data.setVar('SSTATE_MANMACH', bb.data.expand("${STAGING_MACHNAME}", d), d)
>  
>      # These classes encode staging paths into their scripts data so can only be
>      # reused if we manipulate the paths
> diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
> index fef6457..c2e4e50 100644
> --- a/meta/classes/staging.bbclass
> +++ b/meta/classes/staging.bbclass
> @@ -91,7 +91,7 @@ SSTATETASKS += "do_populate_sysroot"
>  do_populate_sysroot[sstate-name] = "populate-sysroot"
>  do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}"
>  do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_HOST}/"
> -do_populate_sysroot[stamp-extra-info] = "${MACHINE}"
> +do_populate_sysroot[stamp-extra-info] = "${STAGING_MACHNAME}"
>  
>  python do_populate_sysroot_setscene () {
>  	sstate_setscene(d)
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 8b6236e..141b942 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -300,7 +300,8 @@ STAGING_DATADIR_NATIVE = "${STAGING_DIR_NATIVE}${datadir_native}"
>  
>  # This should really be MULTIMACH_HOST_SYS but that breaks "all" and machine 
>  # specific packages - hack around it for now.
> -STAGING_DIR_HOST = "${STAGING_DIR}/${MACHINE}"
> +STAGING_MACHNAME ??= "${MACHINE}"
> +STAGING_DIR_HOST = "${STAGING_DIR}/${STAGING_MACHNAME}"
>  STAGING_BINDIR = "${STAGING_DIR_HOST}${bindir}"
>  STAGING_LIBDIR = "${STAGING_DIR_HOST}${libdir}"
>  STAGING_INCDIR = "${STAGING_DIR_HOST}${includedir}"
> @@ -312,7 +313,7 @@ STAGING_PYDIR = "${STAGING_DIR}/lib/python2.4"
>  
>  # This should really be MULTIMACH_TARGET_SYS but that breaks "all" and machine 
>  # specific packages - hack around it for now.
> -STAGING_DIR_TARGET = "${STAGING_DIR}/${MACHINE}"
> +STAGING_DIR_TARGET = "${STAGING_DIR}/${STAGING_MACHNAME}"
>  STAGING_DIR_TCBOOTSTRAP = "${STAGING_DIR_TARGET}-tcbootstrap"
>  
>  # Setting DEPLOY_DIR outside of TMPDIR is helpful, when you are using
> @@ -344,8 +345,8 @@ STAGING_KERNEL_DIR = "${STAGING_DIR_HOST}/kernel"
>  
>  IMAGE_ROOTFS = "${WORKDIR}/rootfs"
>  IMAGE_BASENAME = "${PN}"
> -IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}-${DATETIME}"
> -IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"
> +IMAGE_NAME = "${IMAGE_BASENAME}-${STAGING_MACHNAME}-${DATETIME}"
> +IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${STAGING_MACHNAME}"
>  
>  # This option allows for a precentage overage of the actaul image size rather than a
>  # fixed extra space
> diff --git a/meta/conf/distro/include/tclibc-uclibc.inc b/meta/conf/distro/include/tclibc-uclibc.inc
> index 27f6ec6..e84da81 100644
> --- a/meta/conf/distro/include/tclibc-uclibc.inc
> +++ b/meta/conf/distro/include/tclibc-uclibc.inc
> @@ -20,11 +20,7 @@ CXXFLAGS += "-fvisibility-inlines-hidden"
>  
>  IMAGE_LINGUAS = ""
>  
> -DEPLOY_DIR_IMAGE = "${TMPDIR}/deploy/images"
> -DEPLOY_DIR_append = "-uclibc"
> -STAGING_DIR_TARGET_append = "-uclibc"
> -STAGING_DIR_HOST_append = "-uclibc"
> -SSTATE_MANIFESTS_append = "-uclibc"
> +STAGING_MACHNAME = "${MACHINE}-uclibc"
>  
>  LIBC_DEPENDENCIES = "\
>      uclibc \
> 

I think we need to globalize libc variable like MACHINE or MULTIMACHINE
and we could check if PREFERRED_PROVIDER_virtual/libc == TCLIBC or not
in base.bbclass for sanity. Something like attached patch might be
able to do it


-- 
-Khem

--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="a.txt"

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 23095ec..76642be 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -179,7 +179,11 @@ python base_eventhandler() {
 				pesteruser.append(v)
 		if pesteruser:
 			bb.fatal('The following variable(s) were not set: %s\nPlease set them directly, or choose a MACHINE or DISTRO that sets them.' % ', '.join(pesteruser))
-
+	if name == "ParseCompleted":
+		libc = bb.data.getVar('TCLIBC', e.data, True)
+		virtual_libc = bb.data.getVar('PREFERRED_PROVIDER_virtual/libc', e.data, True)
+		if not libc or libc != virtual_libc:
+			bb.fatal('PREFERRED_PROVIDER_virtual/libc = %s and TCLIBC = %s, they should be same.' % (virtual_libc, libc))
         if name == "ConfigParsed":
                 generate_git_config(e)
 
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 553c6a2..dbd046a 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -23,7 +23,7 @@ python () {
         bb.data.setVar('SSTATE_PKGARCH', bb.data.getVar('BUILD_ARCH', d), d)
     elif bb.data.inherits_class('cross', d):
         bb.data.setVar('SSTATE_PKGARCH', bb.data.expand("${BUILD_ARCH}_${BASE_PACKAGE_ARCH}", d), d)
-        bb.data.setVar('SSTATE_MANMACH', bb.data.expand("${BUILD_ARCH}_${MACHINE}", d), d)
+        bb.data.setVar('SSTATE_MANMACH', bb.data.expand("${BUILD_ARCH}_${MACHINE}_${TCLIBC}", d), d)
     elif bb.data.inherits_class('crosssdk', d):
         bb.data.setVar('SSTATE_PKGARCH', bb.data.expand("${BUILD_ARCH}_${BASE_PACKAGE_ARCH}", d), d)
     elif bb.data.inherits_class('nativesdk', d):
@@ -31,7 +31,7 @@ python () {
     elif bb.data.inherits_class('cross-canadian', d):
         bb.data.setVar('SSTATE_PKGARCH', bb.data.expand("${SDK_ARCH}_${BASE_PACKAGE_ARCH}", d), d)
     else:
-        bb.data.setVar('SSTATE_MANMACH', bb.data.expand("${MACHINE}", d), d)
+        bb.data.setVar('SSTATE_MANMACH', bb.data.expand("${MACHINE}_${TCLIBC}", d), d)
 
     # These classes encode staging paths into their scripts data so can only be
     # reused if we manipulate the paths
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index fef6457..856efd8 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -92,6 +92,7 @@ do_populate_sysroot[sstate-name] = "populate-sysroot"
 do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}"
 do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_HOST}/"
 do_populate_sysroot[stamp-extra-info] = "${MACHINE}"
+do_populate_sysroot[stamp-extra-info] = "${TCLIBC}"
 
 python do_populate_sysroot_setscene () {
 	sstate_setscene(d)
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index c292759..6f2d64a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -300,7 +300,7 @@ STAGING_DATADIR_NATIVE = "${STAGING_DIR_NATIVE}${datadir_native}"
 
 # This should really be MULTIMACH_HOST_SYS but that breaks "all" and machine 
 # specific packages - hack around it for now.
-STAGING_DIR_HOST = "${STAGING_DIR}/${MACHINE}"
+STAGING_DIR_HOST = "${STAGING_DIR}/${MACHINE}-${TCLIBC}"
 STAGING_BINDIR = "${STAGING_DIR_HOST}${bindir}"
 STAGING_LIBDIR = "${STAGING_DIR_HOST}${libdir}"
 STAGING_INCDIR = "${STAGING_DIR_HOST}${includedir}"
@@ -312,7 +312,7 @@ STAGING_PYDIR = "${STAGING_DIR}/lib/python2.4"
 
 # This should really be MULTIMACH_TARGET_SYS but that breaks "all" and machine 
 # specific packages - hack around it for now.
-STAGING_DIR_TARGET = "${STAGING_DIR}/${MACHINE}"
+STAGING_DIR_TARGET = "${STAGING_DIR}/${MACHINE}-${TCLIBC}"
 STAGING_DIR_TCBOOTSTRAP = "${STAGING_DIR_TARGET}-tcbootstrap"
 
 # Setting DEPLOY_DIR outside of TMPDIR is helpful, when you are using
@@ -344,8 +344,8 @@ STAGING_KERNEL_DIR = "${STAGING_DIR_HOST}/kernel"
 
 IMAGE_ROOTFS = "${WORKDIR}/rootfs"
 IMAGE_BASENAME = "${PN}"
-IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}-${DATETIME}"
-IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"
+IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}-${TCLIBC}-${DATETIME}"
+IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}-${TCLIBC}"
 
 # This option allows for a precentage overage of the actaul image size rather than a
 # fixed extra space

--3MwIy2ne0vdjdPXF--
