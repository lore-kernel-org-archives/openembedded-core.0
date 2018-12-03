Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
	[209.85.161.66])
	by mail.openembedded.org (Postfix) with ESMTP id 54ED46C65C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Dec 2018 15:28:17 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id t13so5516135ywe.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2018 07:28:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pxtxMM1cNCK9g53coouuVs+bYepbVUnLtHfPolMjAQQ=;
	b=lDmbVq5rtLeMM3UQu6zT9A3RWjTVNZIzAk++SchzZUIsa803A8LN18cSZwSDxnP7fP
	JMKct/2e4Qf6aGauf0grkKwvWs9yvonMjPHGyhcOTtSPGjQnDzDMBplneTn/mQm6iPXH
	YMr6T8oKzt4KmMmwkKy5vs465dYGN/DD31ZtXsI4aefKmfi10xR32hgKjDjyxIm9yjFw
	J7Olw9/yiCStyuG8zaaoMAHDRuqDyvx2iVcPOD+uDNCCUWcOUld8iQqt41Q+glu/v/H6
	pcy0qNr4ui9C3KvaPQXlR1Bbex4x9CSWWJeyx8VxrUujeux44gBh0UXRoHlaZRMm9wJZ
	cr9g==
X-Gm-Message-State: AA+aEWaFlmUJf2Jab2vR6yz+OkYH7v6wpta+rluC9fmnqOxRYhmgjoLO
	Y5T1Yqc6LvHfGysbcoWpUr4Ex9Av
X-Google-Smtp-Source: AFSGD/Wn/Z2NsjuHJqPaGMysM2Y8i3H9b25pQ5mnsXMi8gWiMYSt6xsxBAuiZGTHwQVFh2RpOEcKQQ==
X-Received: by 2002:a81:6d57:: with SMTP id i84mr16345080ywc.292.1543850897884;
	Mon, 03 Dec 2018 07:28:17 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	w2sm11806224ywl.10.2018.12.03.07.28.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Dec 2018 07:28:17 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Dec 2018 15:28:15 +0000
Message-Id: <20181203152815.6623-1-git@andred.net>
X-Mailer: git-send-email 2.20.0.rc1
MIME-Version: 1.0
Subject: [PATCH] util-linux: split out blkdiscard into its own package
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
X-List-Received-Date: Mon, 03 Dec 2018 15:28:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

For systems that don't otherwise depend on the full
util-linux package, blkdiscard is a mere 18k (on
cortexa7t2hf-neon).

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index a05c1cabbe..b5f77f7b6b 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -27,7 +27,7 @@ DEPENDS_append_class-nativesdk = " lzo-native"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.xz \
            "
 
-PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfdisk \
+PACKAGES =+ "util-linux-agetty util-linux-blkdiscard util-linux-fdisk util-linux-cfdisk util-linux-sfdisk \
              util-linux-swaponoff util-linux-losetup util-linux-umount \
              util-linux-mount util-linux-readprofile util-linux-uuidd \
              util-linux-uuidgen util-linux-lscpu util-linux-fsck.cramfs util-linux-fsck \
@@ -74,6 +74,7 @@ FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.la"
 
 FILES_util-linux-agetty = "${base_sbindir}/agetty"
+FILES_util-linux-blkdiscard = "${sbindir}/blkdiscard"
 FILES_util-linux-fdisk = "${base_sbindir}/fdisk.${BPN}"
 FILES_util-linux-fstrim = "${base_sbindir}/fstrim.${BPN}"
 FILES_util-linux-cfdisk = "${base_sbindir}/cfdisk"
@@ -126,7 +127,7 @@ RDEPENDS_util-linux-su += "libpam"
 RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup util-linux-sulogin util-linux-lsblk"
 RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser util-linux-su', '', d)}"
 
-RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs util-linux-mountpoint util-linux-prlimit util-linux-ionice util-linux-switch-root"
+RRECOMMENDS_${PN} = "util-linux-blkdiscard util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs util-linux-mountpoint util-linux-prlimit util-linux-ionice util-linux-switch-root"
 
 RRECOMMENDS_${PN}_class-native = ""
 RRECOMMENDS_${PN}_class-nativesdk = ""
-- 
2.20.0.rc1


