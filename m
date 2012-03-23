Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SBD9z-00075m-C0
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 23:40:39 +0100
Received: by wera1 with SMTP id a1so3010738wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 15:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=2rG44zfW33MljlSGjBGR+tSQ0zaX4vJa/G1c7LFiSSQ=;
	b=eqIne5v2lbMoq/hyvnEF9LKn1P4/dp9JoM85VLI0/PsZ5i21TdyW7VpTf1kf5dtuE8
	NeQ1bC1Ldb+Z8X8/29rddQQfOVlTzgW7EifxYpmC/Ie1u2mYKQeuqaZZlsXmifDaXQn+
	4rRoPfI4R3D2FSeESRP/K98lz4Q6zAm+1VCg3jqE87lLPeMOhcarcyar47JAsE3PF4SI
	RAICFTngKQbAiUtPuX8QdCw0WMhbMfwIBxYj8HV8kQSWyvcz/i85ERyhSG4ZWt3dygJk
	aLErmzLhGbOdF3bX2/NLA9TlnvpwOZrUmZYncEY3XnxgkVeanFtX6ZeeWYPMNN178l2c
	o2hg==
Received: by 10.180.24.7 with SMTP id q7mr624206wif.11.1332541903065;
	Fri, 23 Mar 2012 15:31:43 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gp8sm17499241wib.5.2012.03.23.15.31.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 15:31:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 23:30:47 +0100
Message-Id: <313583f23e026bed3155643d1e8914313fce7478.1332541342.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <af4afbb6196cc0f3bacdca43776ae952c7bf4b05.1332541342.git.Martin.Jansa@gmail.com>
References: <af4afbb6196cc0f3bacdca43776ae952c7bf4b05.1332541342.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332541342.git.Martin.Jansa@gmail.com>
References: <cover.1332541342.git.Martin.Jansa@gmail.com>
Subject: [PATCHv 08/10] libusb*: import native support from meta-oe
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
X-List-Received-Date: Fri, 23 Mar 2012 22:40:39 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/libusb/libusb-compat_0.1.3.bb |    7 +++++--
 meta/recipes-support/libusb/libusb1_1.0.8.bb       |    2 ++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libusb/libusb-compat_0.1.3.bb b/meta/recipes-support/libusb/libusb-compat_0.1.3.bb
index 43da5af..7edd422 100644
--- a/meta/recipes-support/libusb/libusb-compat_0.1.3.bb
+++ b/meta/recipes-support/libusb/libusb-compat_0.1.3.bb
@@ -13,9 +13,12 @@ DEPENDS = "libusb1"
 # Besides, libusb-0.1 uses a per 1ms polling that hurts a lot to power
 # consumption.
 PROVIDES = "libusb"
+PROVIDES += "virtual/libusb0"
+PROVIDES_virtclass-native += "virtual/libusb0-native"
+BBCLASSEXTEND = "native nativesdk"
 
 PE = "1"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-compat-${PV}.tar.bz2 \
            file://0.1.0-beta1-gcc3.4-fix.patch"
@@ -23,7 +26,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-compat-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "570ac2ea085b80d1f74ddc7c6a93c0eb"
 SRC_URI[sha256sum] = "a590a03b6188030ee1ca1a0af55685fcde005ca807b963970f839be776031d94"
 
-inherit autotools pkgconfig binconfig
+inherit autotools pkgconfig binconfig lib_package
 
 EXTRA_OECONF = "--libdir=${base_libdir}"
 
diff --git a/meta/recipes-support/libusb/libusb1_1.0.8.bb b/meta/recipes-support/libusb/libusb1_1.0.8.bb
index b8fa790..5a664ca 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.8.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.8.bb
@@ -6,6 +6,8 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
+BBCLASSEXTEND = "native nativesdk"
+
 PR = "r4"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2"
-- 
1.7.8.5



