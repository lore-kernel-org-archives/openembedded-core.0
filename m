Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id AE2F86AC48
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jul 2013 15:00:45 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz11so3023400pad.16
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Jul 2013 08:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=YfW/BgrIK5SiUxl/If0DyprYIqUXPA1dkA6n3WgLII4=;
	b=A57V2rPX7eQl/skP6arOj++uqY1oRdSoA9920zLOcTsqhSRbqCpdf9G47vYWMvX6cd
	lGuJzECqsUFo7QMx/cVdx/j46FufA+KujLattNd51xmjqo83ny/dMXMTY0znVQakDiM0
	dJQSmzLlo5LFf3Fzzpkjx+PyViRdv42ovEmLQOpvpC1PopPKMxp17cvkpy7tX6ARGijK
	e3mX6adFUfnXhM1vKQ9Vk4l7P2OUvFAsEZgKF8jryRMMapEiwB8BmrfLXgRCdkYC/q0O
	QTrz6sCHjm+lXCZc8gH1kyIOiQUh/j8FhxJz1g76m3eyvobEhngoIMB+IbfgoxJ8NTN2
	aaXA==
X-Received: by 10.66.145.4 with SMTP id sq4mr1783915pab.46.1373122846820;
	Sat, 06 Jul 2013 08:00:46 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	ib9sm12648316pbc.43.2013.07.06.08.00.45 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 08:00:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Jul 2013 08:00:10 -0700
Message-Id: <1373122810-23466-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] eglibc: Update 2.18 recipes to fix ppc/e500 failures
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
X-List-Received-Date: Sat, 06 Jul 2013 15:00:45 -0000

This should fix the e500 errors due to bounded pointers removal

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../eglibc/cross-localedef-native_2.18.bb          |    6 +++---
 meta/recipes-core/eglibc/eglibc_2.18.bb            |    6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.18.bb b/meta/recipes-core/eglibc/cross-localedef-native_2.18.bb
index bf9e3c2..790f259 100644
--- a/meta/recipes-core/eglibc/cross-localedef-native_2.18.bb
+++ b/meta/recipes-core/eglibc/cross-localedef-native_2.18.bb
@@ -16,11 +16,11 @@ inherit autotools
 # pick up an eglibc patch
 FILESPATH = "${FILE_DIRNAME}/eglibc-${PV}"
 
-SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr23379.tar.bz2 \
+SRC_URI = "http://sakrah.dontexist.org/files/eglibc-${PV}-svnr23424.tar.bz2 \
 	   file://fix_for_centos_5.8.patch;patchdir=.. \
 	  "
-SRC_URI[md5sum] = "7da8ab8c0af6889187b9ece6dafc12b0"
-SRC_URI[sha256sum] = "bd1cdb0528fd54d11ab896b878d71c0f89b4557e908e0f2561f32bbd7472aaeb"
+SRC_URI[md5sum] = "e7bb555f34e782d428de3482d203df8d"
+SRC_URI[sha256sum] = "3824e699a91a34aebbe80bae9993b569616fad2056e4f6430cd455d604fb1d9c"
 
 S = "${WORKDIR}/eglibc-${PV}/localedef"
 
diff --git a/meta/recipes-core/eglibc/eglibc_2.18.bb b/meta/recipes-core/eglibc/eglibc_2.18.bb
index 7c26829..ce416f7 100644
--- a/meta/recipes-core/eglibc/eglibc_2.18.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.18.bb
@@ -2,7 +2,7 @@ require eglibc.inc
 
 DEPENDS += "gperf-native kconfig-frontends-native"
 
-SRC_URI = "http://sakrah.dontexist.org/files/eglibc-${PV}-svnr23379.tar.bz2 \
+SRC_URI = "http://sakrah.dontexist.org/files/eglibc-${PV}-svnr23424.tar.bz2 \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
            file://IO-acquire-lock-fix.patch \
            file://mips-rld-map-check.patch \
@@ -27,8 +27,8 @@ SRC_URI = "http://sakrah.dontexist.org/files/eglibc-${PV}-svnr23379.tar.bz2 \
            file://0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
            file://fix-tibetian-locales.patch \
           "
-SRC_URI[md5sum] = "7da8ab8c0af6889187b9ece6dafc12b0"
-SRC_URI[sha256sum] = "bd1cdb0528fd54d11ab896b878d71c0f89b4557e908e0f2561f32bbd7472aaeb"
+SRC_URI[md5sum] = "e7bb555f34e782d428de3482d203df8d"
+SRC_URI[sha256sum] = "3824e699a91a34aebbe80bae9993b569616fad2056e4f6430cd455d604fb1d9c"
 
 LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
       file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
-- 
1.7.9.5


