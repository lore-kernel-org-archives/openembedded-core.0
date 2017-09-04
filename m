Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id BE52C780F6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 07:57:04 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id e204so5649656wma.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 00:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kdkAEzDn1JhTYbg8XytuGnL5EeF+t+fHjjHJ8Ora1t8=;
	b=L0UXmpcIvxeeCRpysE5I/7jYSFo9YWVM8dTyZRa6rqzY5WgQfJnfNnCwDeHlplNgdk
	ztXwlaNBcWWGPWF5cRcH7RCDorQzVR+E83QR1dLdDls7mNvMOkcu5CVyF8qnzceTyt6O
	AUDuGBVwLH2CSTmxJ4BlVWNCbnndCH+mK0Rgd8UtexFxW9ub0rR1gfBm1O0ZRuftaJju
	0gLGFzCDkUXU2Q75jQXci0ezucuWWGNqr7pGgpsgqb1aga5n9dL9+c9W4kEJBqNbtMxE
	ElrfITA8dWBFB7Idy9bdvn3FjFt+QhKkAnaHCwTVzgvrKeUH1EeAUP1E1CbQNYAr0l7q
	yvXA==
X-Gm-Message-State: AHPjjUgjnHyCbDkKbqDatF4+s+AB0A+mwIFUvrEATAV7oJ1RosKuQyHl
	KG3xYpxa5cg5WPmmWrQ=
X-Google-Smtp-Source: ADKCNb4i447SEUx9LPZEO6H8TP3ri6ejvRXAFfcmgFffb1QlnfUZgE3PWDE1Y8EfPESfEDN/OY8WyA==
X-Received: by 10.28.213.198 with SMTP id m189mr3876646wmg.87.1504511825063;
	Mon, 04 Sep 2017 00:57:05 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	i75sm2723065wri.81.2017.09.04.00.57.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Sep 2017 00:57:04 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Sep 2017 08:57:02 +0100
Message-Id: <20170904075702.6223-1-git@andred.net>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Subject: [PATCH] util-linux: split out ionice into its own package
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
X-List-Received-Date: Mon, 04 Sep 2017 07:57:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

For systems that don't otherwise depend on the full
util-linux package, ionice is a mere 31k (on mipsel).

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 47c2839970..85f8ba1e3c 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -33,7 +33,8 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-blkid util-linux-mkfs util-linux-mcookie util-linux-reset \
              util-linux-lsblk util-linux-mkfs.cramfs util-linux-fstrim \
              util-linux-partx util-linux-hwclock util-linux-mountpoint \
-             util-linux-findfs util-linux-getopt util-linux-sulogin util-linux-prlimit"
+             util-linux-findfs util-linux-getopt util-linux-sulogin util-linux-prlimit \
+             util-linux-ionice"
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', 'util-linux-pylibmount', '', d)}"
 PACKAGES =+ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser util-linux-su', '', d)}"
 
@@ -91,6 +92,7 @@ FILES_util-linux-findfs = "${sbindir}/findfs"
 FILES_util-linux-getopt = "${base_bindir}/getopt.${BPN}"
 FILES_util-linux-runuser = "${sbindir}/runuser"
 FILES_util-linux-prlimit = "${bindir}/prlimit"
+FILES_util-linux-ionice = "${bindir}/ionice"
 FILES_util-linux-su = "${bindir}/su.util-linux ${sysconfdir}/pam.d/su-l"
 CONFFILES_util-linux-su = "${sysconfdir}/pam.d/su-l"
 
@@ -123,7 +125,7 @@ RDEPENDS_util-linux-su += "libpam"
 RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup util-linux-sulogin util-linux-lsblk"
 RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser util-linux-su', '', d)}"
 
-RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs util-linux-mountpoint util-linux-prlimit"
+RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs util-linux-mountpoint util-linux-prlimit util-linux-ionice"
 
 RRECOMMENDS_${PN}_class-native = ""
 RRECOMMENDS_${PN}_class-nativesdk = ""
-- 
2.14.1


