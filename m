Received: from mail-wg0-f54.google.com ([74.125.82.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1TxFfD-00031m-Sw
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 12:35:44 +0100
Received: by mail-wg0-f54.google.com with SMTP id fg15so3579061wgb.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 03:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=+NCIPm5No1Mwq5lV7aGY0BnG7TIWi7Ua7Z15F9Yyu9s=;
	b=X9TZZBCh5HZu8oJnUPgWZjHF3XXv6kUDkRI0E73DMvvq/GKnBWIA+JVy8SZ3bpuG7V
	kb2hYb+Y2xUXEkZQi+5dUKIw8FzZqjTUN5iVowLQoGr/rfqnliyEJ+8I4ZhdTYVeFCly
	fmw2140WFVI2vHiaqJDZCDS9Jg11KwQgDbwEzCP+p4kVahTpt6Ua0Qdn37GLAViz9C2a
	5olIz+v34L/PnJ3u43ZqqmpkkSKwCGVyV8Dd6XGG9679YelYe8UOTRAKrggRXvqCkfvU
	bED8SfObeTs90xR8AAbtFBzM5XDT0z96uPPURJOTAs2aXpbM9Il/Lynv5PO2jaEiPNqi
	HdzA==
X-Received: by 10.180.86.39 with SMTP id m7mr14669211wiz.1.1358767215441;
	Mon, 21 Jan 2013 03:20:15 -0800 (PST)
Received: from localhost.localdomain ([83.137.143.222])
	by mx.google.com with ESMTPS id bd6sm16401088wib.10.2013.01.21.03.20.13
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 03:20:14 -0800 (PST)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2013 12:17:07 +0100
Message-Id: <1358767027-26070-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Subject: [PATCH] mtd-utils: split into multiple packages
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
X-List-Received-Date: Mon, 21 Jan 2013 11:35:51 -0000

This allows one not to install rarely used or fs specific files
As discussed in http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/31744/focus=31804

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb b/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
index 12ad9d4..5797204 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git \
 
 S = "${WORKDIR}/git/"
 
-PR = "r2"
+PR = "r3"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
 
@@ -21,6 +21,12 @@ do_install () {
 	oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
 }
 
+PACKAGES =+ "mtd-utils-jffs2 mtd-utils-ubifs mtd-utils-misc"
+
+FILES_mtd-utils-jffs2 = "${sbindir}/mkfs.jffs2 ${sbindir}/jffs2dump ${sbindir}/jffs2reader ${sbindir}/sumtool"
+FILES_mtd-utils-ubifs = "${sbindir}/mkfs.ubifs ${sbindir}/ubi*"
+FILES_mtd-utils-misc = "${sbindir}/nftl* ${sbindir}/ftl* ${sbindir}/rfd* ${sbindir}/doc* ${sbindir}/serve_image ${sbindir}/recv_image"
+
 PARALLEL_MAKE = ""
 
 BBCLASSEXTEND = "native"
-- 
1.7.0.4



