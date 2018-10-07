Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2C389795DA
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Oct 2018 17:11:28 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id t22-v6so12379613lfb.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Oct 2018 10:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=5qf/hDo5qNTYvnzx/+a4eOS9hzatI3bK4PbD10DXv2g=;
	b=GPwIFBtB+88lfnStzEGZwSngJ4fab1ZJ9gmlI7Z2au0UUf6YSnm7qALw4WNsx+G5hS
	un1vXNcLfMm0DvyJQ4OigwwywVT7PYN/VAkxkaJlXBrmgGjH/l0fhocZuv8qdwwGmUOc
	NrHvGA+bNEZj+rrBf3La3iycEJvefkfazNtPxDfob80svy8pgI0aMdIF8K2lGtR2IR3a
	IyZVPsEKkHn+c/y95849povGTlKHhI5++eRZ8TV0fFxO/PRGoGsN5LWSPqgendx5/iIN
	8TJ/5sVCfe4/Gf4c7zubk3w7QOuhXjaHmFsuKAjUdIxG4Oa5HsmSYi9Dcb791PjKIFCs
	IyoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=5qf/hDo5qNTYvnzx/+a4eOS9hzatI3bK4PbD10DXv2g=;
	b=Hd+SD21nrCiuz+T/JX5aGFITUCzwdalgq5ze+HpvKojhzKUVDYvc8r3sxQi6dybQDv
	EJuaEHPO8mb8DBHWDB3/Nw01IaJRDuNau7qmOf5o8M87JGgaYGRVZm+iUWNtxE4gUpVT
	redxGiaaj6V+PUw3sm974VQGhUA4Ibp66kN11w2gj9wUUXJzQv2l0fmXIRQL8cLDy/Eu
	aTGzVuntkoh5UXQLaSpfpfVq5yyJTmfMFO/9KROKxQZ0sR9qNOyWO4rs1nwgXYj2P8IQ
	YajiZTX3p2bMpEfLsZvqPw1+7LocIz699sYtT0Wj9thHrrG+kizh155Fn0x66K+sE7ay
	e0sw==
X-Gm-Message-State: ABuFfojly/rdxlTQFP6ngDY7rXUrY7JfYrsGQVk9g2s/lp7OA8KrusND
	vDAq3ton+V2uUcjoBOmmNmFOKKKUN7c=
X-Google-Smtp-Source: ACcGV62nfh8xH0YisUZpQA7VStRvngHGdv7QDSeNwTTrVYP+wqT/HJOud5weG7veS2AQqcUwhMT8LQ==
X-Received: by 2002:a19:a90f:: with SMTP id
	s15-v6mr10592745lfe.154.1538932288260; 
	Sun, 07 Oct 2018 10:11:28 -0700 (PDT)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68]) by smtp.gmail.com with ESMTPSA id
	q13-v6sm2973121lfk.25.2018.10.07.10.11.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Oct 2018 10:11:27 -0700 (PDT)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Oct 2018 19:11:21 +0200
Message-Id: <20181007171121.5206-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] gptfdisk: Use PACKAGECONFIG to control ncurses and popt dependencies
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
X-List-Received-Date: Sun, 07 Oct 2018 17:11:28 -0000

gptfdisk uses a simple Makefile with no automatic detection of
external library support. Use PACKAGECONFIG_CONFARGS and pass
the make targets in EXTRA_OEMAKE.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/recipes-devtools/fdisk/gptfdisk_1.0.4.bb | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.4.bb b/meta/recipes-devtools/fdisk/gptfdisk_1.0.4.bb
index 4426a795e2..b043c96543 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.4.bb
+++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.4.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "GPT fdisk is a disk partitioning tool loosely modeled on Linux fd
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-DEPENDS = "util-linux popt ncurses"
+DEPENDS = "util-linux"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz"
 SRC_URI[md5sum] = "5ecc3c44913bb6b53d3708d1ac7ac295"
@@ -13,13 +13,20 @@ SRC_URI[sha256sum] = "b663391a6876f19a3cd901d862423a16e2b5ceaa2f4a3b9bb681e64b9c
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/gptfdisk/files/gptfdisk/"
 UPSTREAM_CHECK_REGEX = "/gptfdisk/(?P<pver>(\d+[\.\-_]*)+)/"
 
-EXTRA_OEMAKE = "'CC=${CC}' 'CXX=${CXX}'"
+EXTRA_OEMAKE = "'CC=${CC}' 'CXX=${CXX}' gdisk fixparts ${PACKAGECONFIG_CONFARGS}"
+
+PACKAGECONFIG ??= "ncurses popt"
+PACKAGECONFIG[ncurses] = "cgdisk,,ncurses"
+PACKAGECONFIG[popt] = "sgdisk,,popt"
 
 do_install() {
     install -d ${D}${sbindir}
-    install -m 0755 cgdisk ${D}${sbindir}
+    for f in cgdisk sgdisk; do
+        if [ -x $f ]; then
+            install -m 0755 $f ${D}${sbindir}
+        fi
+    done
     install -m 0755 gdisk ${D}${sbindir}
-    install -m 0755 sgdisk ${D}${sbindir}
     install -m 0755 fixparts ${D}${sbindir}
 }
 
-- 
2.11.0


