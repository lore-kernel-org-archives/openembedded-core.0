Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1T9O7z-0002TH-B1
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 00:31:19 +0200
Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 05 Sep 2012 15:17:44 -0700
Received: by qatn12 with SMTP id n12so1490742qat.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2012 15:17:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=SZGcueMY/S+VGutHBxvBcnSGbkgj9z5KHpU+wPYFoec=;
	b=mzbkEbMEH9771Y1ubVSmM8EBIWKbL1hOxrSaIFLoafeDObYmHtoRXMiBmDVK47oNTi
	hSWo4ToPaK08SLpswfBplaRIbTOgBlpIfU2FZaI/unD3/zu2/nBEOPUG+PwxFutwWKMj
	vHsvosBJSiP51SVQpFbtApGCVG7QVPvmadKftwkOYTjOiLgsh3JD6VgcbzDYbaurw/kw
	OHy/coVi/ngmZKYD4nJCefgX1OrTmtMVljSoFVkZecEuGyvq6lVX4HKFXUuWoZy0+bfv
	j0fLbZUupvcRhEucS9wtU+4zgJrFU3nQDv/0XsJztJmR/YH+KLuo2ZHlnig8fgM1yFiY
	MYDA==
MIME-Version: 1.0
Received: by 10.224.42.82 with SMTP id r18mr1011773qae.43.1346883468923; Wed,
	05 Sep 2012 15:17:48 -0700 (PDT)
Received: by 10.229.63.1 with HTTP; Wed, 5 Sep 2012 15:17:48 -0700 (PDT)
Date: Wed, 5 Sep 2012 15:17:48 -0700
Message-ID: <CAPhnLPDh_+TmCQm68b4m2ENx8rrarn5JXJ_LweZUFo-UkzSAPA@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQncGJtyFl+bpp5iqVZEEOHvLZrgXxyJk9/fYlpzFNu35R5nlzAQ4VU9Qt1B2DWkkfPFbQJN
Subject: [PATCH 1/1] [Revision 3] adt-installer: Allow changing YOCTOADT_REPO
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
X-List-Received-Date: Wed, 05 Sep 2012 22:31:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

YOCTOADT_REPO within adt-installer.conf was hardcoded to
http://adtrepo.yoctoproject.org/${SDK_VERSION}

This allows it to be overriden in local.conf by setting
ADTREPO = "http://adtrepo.yoctoproject.org/${SDK_VERSION}"

I'm also fixing a bad rm in do_populate_adt. The file name
that is being rm'd is wrong.

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 .../installer/adt-installer/adt_installer.conf     |    2 +-
 .../installer/adt-installer_1.0.bb                 |   10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
b/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
index afc69a4..171d2ac 100644
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
+++ b/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
@@ -23,7 +23,7 @@

 # Your yocto distro repository, this should include IPKG based
packages and root filesystem files where the installation is based on

-YOCTOADT_REPO="http://adtrepo.yoctoproject.org/YOCTOADT_VERSION"
+YOCTOADT_REPO="ADTREPO"

 # The following are for system wide setup
 # Target architectures that you want to setup host cross dev environment for
diff --git a/meta/recipes-devtools/installer/adt-installer_1.0.bb
b/meta/recipes-devtools/installer/adt-installer_1.0.bb
index becdef6..c5cdb86 100644
--- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
+++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
@@ -1,6 +1,6 @@
 # Yocto ADT Installer bb file
 #
-# Copyright 2010-2011 by Intel Corp.
+# Copyright 2010-2012 by Intel Corp.
 #
 # Permission is hereby granted, free of charge, to any person obtaining a copy
 # of this software and associated documentation files (the
"Software"), to deal
@@ -30,7 +30,7 @@ ALLOW_EMPTY = "1"

 PACKAGES = ""

-PR = "r10"
+PR = "r11"

 ADT_DEPLOY = "${TMPDIR}/deploy/sdk/"
 ADT_DIR = "${WORKDIR}/adt-installer/"
@@ -51,14 +51,14 @@ SRC_URI =
"svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
            file://opkg/conf/opkg-sdk-i686.conf \
 	  "

-ADTREPO = "http://adtrepo.yoctoproject.org/${SDK_VERSION}"
+ADTREPO ?= "http://adtrepo.yoctoproject.org/${SDK_VERSION}"

 do_populate_adt[umask] = "022"

 fakeroot do_populate_adt () {
 	cd ${WORKDIR}
 	mkdir -p ${ADT_DEPLOY}
-	rm -f ${ADT_DEPLOY}/adt-installer.tar.bz2
+	rm -f ${ADT_DEPLOY}/adt_installer.tar.bz2
 	rm -rf ${ADT_DIR}
 	mkdir -p ${ADT_DIR}/opkg/build
 	cp -r opkg ${ADT_DIR}/
@@ -68,7 +68,7 @@ fakeroot do_populate_adt () {
 	cp -r scripts ${ADT_DIR}/
 	cp adt_installer ${ADT_DIR}
 	cp adt_installer.conf ${ADT_DIR}
-	sed -i -e 's#YOCTOADT_VERSION#${SDK_VERSION}#' ${ADT_DIR}/adt_installer.conf
+	sed -i -e 's#ADTREPO#${ADTREPO}#' ${ADT_DIR}/adt_installer.conf
 	echo 'SDK_VENDOR=${SDK_VENDOR}' >> ${ADT_DIR}/scripts/data_define
 	echo 'DEFAULT_INSTALL_FOLDER=${SDKPATH}' >> ${ADT_DIR}/scripts/data_define
 	cp ${COREBASE}/scripts/relocate_sdk.py ${ADT_DIR}/scripts/
-- 
1.7.9.5


