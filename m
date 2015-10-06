Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id BD07E76AE2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Oct 2015 03:19:50 +0000 (UTC)
Received: by ioiz6 with SMTP id z6so207613588ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Oct 2015 20:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cUKTQAQfg+SzlNxXYllKMn34lQprbIKWqGiaGhhhinA=;
	b=wVG+kwI9o1kT/dyPvEf/oeP5W37i3Wj8GQpvRT0RgUTzPca1U/B7w/EHNu9Av2Awws
	wqpdx2TlF0+wWCEarq6VSCbfSTezL4XLNo1eqiUO/NQA9iMBix9O/8MEFdr/IsOgFl62
	JXwdT27Vrr3J66+MZwheZYhmihZF/sMhu9t7CesBmOaEElrLJ4wvmubjOr7pa8Zr292R
	PFBIM1k6KGZsD2wRijXKBadOMoteVEIzeqtQRHoHkW179Qr5K6b1+KiJz3a73XKgAcFT
	WqoMX0DkPNlgg1M29i/utWvUqlCMMuZ2Z5uteheTHnsYXEwgkkWFDz2J0d7NGFJVMDZg
	+jKw==
X-Received: by 10.107.160.143 with SMTP id j137mr33057749ioe.13.1444101588627; 
	Mon, 05 Oct 2015 20:19:48 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id bc4sm6094425igb.2.2015.10.05.20.19.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Oct 2015 20:19:47 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Oct 2015 20:19:24 -0700
Message-Id: <1444101568-16639-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1444101568-16639-1-git-send-email-armccurdy@gmail.com>
References: <1444101568-16639-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/7] busybox: move common EXTRA_OEMAKE options into busybox.inc
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
X-List-Received-Date: Tue, 06 Oct 2015 03:19:52 -0000

Current EXTRA_OEMAKE options are common to all supported versions of
busybox (1.23.2 and git), so move from version specific recipes into
busybox.inc.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc       | 1 +
 meta/recipes-core/busybox/busybox_1.23.2.bb | 2 --
 meta/recipes-core/busybox/busybox_git.bb    | 2 --
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 235bda2..949047b 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -19,6 +19,7 @@ export EXTRA_CFLAGS = "${CFLAGS}"
 export EXTRA_LDFLAGS = "${LDFLAGS}"
 
 EXTRA_OEMAKE += "'LD=${CCLD}'"
+EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
 
 PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
 
diff --git a/meta/recipes-core/busybox/busybox_1.23.2.bb b/meta/recipes-core/busybox/busybox_1.23.2.bb
index 2559823..554c816 100644
--- a/meta/recipes-core/busybox/busybox_1.23.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.23.2.bb
@@ -44,8 +44,6 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
 SRC_URI[tarball.md5sum] = "7925683d7dd105aabe9b6b618d48cc73"
 SRC_URI[tarball.sha256sum] = "05a6f9e21aad8c098e388ae77de7b2361941afa7157ef74216703395b14e319a"
 
-EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
-
 do_install_ptest () {
         cp -r ${B}/testsuite ${D}${PTEST_PATH}/
         cp ${B}/.config      ${D}${PTEST_PATH}/
diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index ed1c0a8..17de8ac 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -44,8 +44,6 @@ SRC_URI = "git://busybox.net/busybox.git \
            file://getopts.cfg \
 "
 
-EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
-
 do_install_ptest () {
         cp -r ${B}/testsuite ${D}${PTEST_PATH}/
         cp ${B}/.config      ${D}${PTEST_PATH}/
-- 
1.9.1


