Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 329526C102
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 21:41:41 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z3so4399464wru.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 13:41:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ed4qtx/hUnQrJ5NaDscIGUvMiv0f+aw1mmE4jzVbYWo=;
	b=gXoblmDnuLB8iWUUhnidOGXtclrFezzX42agKfPeESRqecZ6nkfnnlKom5PoGrGaDQ
	DVC/DtrxQAmyzQb5eVHEz4O1MDbkKeS14IRod9R5rJsL5AksiK4KYHF3jUmtPH6a+v+0
	Ai+Eb9X10TxFO3m33k0ZCHl0JFYcmPjYPRQJ6wB4z4eVPW8G7Bx5YV86UR35iShhsbqo
	iTpecoMInyb6GjfRkahqtJPAFvSxruaYF/3X1c5N7rQJZ7lv0lzfAkvWDipOWLMZcd5m
	lBZB7s4LPZSCsA4vRfov7SPU2f7MJ3q+y89BIxKnLxCbl2/ZM0M6FRPnFVydDVadpw20
	liYw==
X-Gm-Message-State: APjAAAXFk60ACjZK+Xud6ox/yt1AemvOBXOtoq/u9VgFz8kbI/cJnFo7
	NgNj+hEH5dltffqZPTcCTzi/rOao
X-Google-Smtp-Source: APXvYqxxjHx5aaQ4n8AsGtxC10nhvnyFQ/YFCwRAM+OKrvK9CxpiMOIiD7YqxnEX5puKK23WMdz4ow==
X-Received: by 2002:a5d:4692:: with SMTP id u18mr8902288wrq.206.1576186902503; 
	Thu, 12 Dec 2019 13:41:42 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([79.97.20.138])
	by smtp.gmail.com with ESMTPSA id
	o19sm6838094wmc.18.2019.12.12.13.41.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 13:41:41 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2019 21:41:40 +0000
Message-Id: <20191212214140.19648-1-git@andred.net>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH] e2fsprogs: split dumpe2fs into its own package
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
X-List-Received-Date: Thu, 12 Dec 2019 21:41:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a mere 24KB (on 32bit arm), avoiding to pull in
all of the remainder +300KB in small initramfs images
when not needed.
Add this new package to RDEPENDS of e2fsprogs so as to
not break existing users.

Also, remove a stale reference to the non-existent
e2fsprogs-fsck package which was removed in 2012 from here
in commit 98b1b9f047ef ("e2fsprogs: Drop fsck binary"),
commit 93d647172786 in poky, and sort some of the lists
alphabetically.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc       | 2 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
index a54a11c354..009f5ed807 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -4,9 +4,9 @@ fixing, configuring , and debugging ext2 filesystems."
 HOMEPAGE = "http://e2fsprogs.sourceforge.net/"
 
 LICENSE = "GPLv2 & LGPLv2 & BSD & MIT"
+LICENSE_e2fsprogs-dumpe2fs = "GPLv2"
 LICENSE_e2fsprogs-e2fsck = "GPLv2"
 LICENSE_e2fsprogs-mke2fs = "GPLv2"
-LICENSE_e2fsprogs-fsck = "GPLv2"
 LICENSE_e2fsprogs-tune2fs = "GPLv2"
 LICENSE_e2fsprogs-badblocks = "GPLv2"
 LIC_FILES_CHKSUM = "file://NOTICE;md5=d50be0580c0b0a7fbc7a4830bbe6c12b \
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
index ab44c28f2a..6e69eea21c 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
@@ -82,12 +82,13 @@ do_install_append_class-target() {
 	mv ${D}${base_sbindir}/tune2fs ${D}${base_sbindir}/tune2fs.e2fsprogs
 }
 
-RDEPENDS_e2fsprogs = "e2fsprogs-badblocks"
+RDEPENDS_e2fsprogs = "e2fsprogs-badblocks e2fsprogs-dumpe2fs"
 RRECOMMENDS_e2fsprogs = "e2fsprogs-mke2fs e2fsprogs-e2fsck"
 
-PACKAGES =+ "e2fsprogs-e2fsck e2fsprogs-e2scrub e2fsprogs-mke2fs e2fsprogs-tune2fs e2fsprogs-badblocks e2fsprogs-resize2fs"
+PACKAGES =+ "e2fsprogs-badblocks e2fsprogs-dumpe2fs e2fsprogs-e2fsck e2fsprogs-e2scrub e2fsprogs-mke2fs e2fsprogs-resize2fs e2fsprogs-tune2fs"
 PACKAGES =+ "libcomerr libss libe2p libext2fs"
 
+FILES_e2fsprogs-dumpe2fs = "${base_sbindir}/dumpe2fs"
 FILES_e2fsprogs-resize2fs = "${base_sbindir}/resize2fs*"
 FILES_e2fsprogs-e2fsck = "${base_sbindir}/e2fsck ${base_sbindir}/fsck.ext*"
 FILES_e2fsprogs-e2scrub = "${base_sbindir}/e2scrub*"
@@ -117,7 +118,7 @@ ALTERNATIVE_LINK_NAME[tune2fs] = "${base_sbindir}/tune2fs"
 
 RDEPENDS_e2fsprogs-e2scrub = "bash"
 RDEPENDS_${PN}-ptest += "coreutils procps bash bzip2 diffutils perl sed"
-RDEPENDS_${PN}-ptest += "e2fsprogs-e2fsck e2fsprogs-mke2fs e2fsprogs-tune2fs e2fsprogs-badblocks e2fsprogs-resize2fs"
+RDEPENDS_${PN}-ptest += "e2fsprogs-badblocks e2fsprogs-dumpe2fs e2fsprogs-e2fsck e2fsprogs-mke2fs e2fsprogs-resize2fs e2fsprogs-tune2fs"
 
 do_compile_ptest() {
 	oe_runmake -C ${B}/tests
-- 
2.24.0


