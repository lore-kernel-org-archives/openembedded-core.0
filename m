Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CEBD1605BD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 03:18:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8M3IemF029376
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Sep 2014 20:18:41 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 21 Sep 2014 20:18:40 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Sep 2014 11:18:09 +0800
Message-ID: <1411355889-28946-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] pinentry: add recipes
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
X-List-Received-Date: Mon, 22 Sep 2014 03:18:44 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

gnupg 2.x.x needs pinentry to work

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-support/pinentry/pinentry_0.8.4.bb | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta/recipes-support/pinentry/pinentry_0.8.4.bb

diff --git a/meta/recipes-support/pinentry/pinentry_0.8.4.bb b/meta/recipes-support/pinentry/pinentry_0.8.4.bb
new file mode 100644
index 0000000..7f44bbf
--- /dev/null
+++ b/meta/recipes-support/pinentry/pinentry_0.8.4.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Collection of simple PIN or passphrase entry dialogs"
+DESCRIPTION = "\
+	Pinentry is a collection of simple PIN or passphrase entry dialogs which \
+	utilize the Assuan protocol as described by the aegypten project; see \
+	http://www.gnupg.org/aegypten/ for details. \
+	This package contains the curses (text) based version of the PIN entry dialog."
+
+HOMEPAGE = "http://www.gnupg.org/related_software/pinentry/index.en.html"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=cbbd794e2a0a289b9dfcc9f513d1996e"
+
+inherit autotools-brokensep
+
+SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
+	"
+
+SRC_URI[md5sum] = "e2b6f94471ba1e978f6e5bf6b275189b"
+SRC_URI[sha256sum] = "359db3bf46cb743ba0b3aeef259f6107271ca888ba3e22c1cba525c9aca35612"
+
+EXTRA_OECONF = "--disable-rpath \
+		--disable-dependency-tracking \
+		--disable-glibtest \
+	        --disable-pinentry-gtk \
+	        --disable-pinentry-qt \
+               "
+
+PACKAGECONFIG ??= "ncurses libcap"
+
+PACKAGECONFIG[ncurses] = "--enable-ncurses  --with-ncurses-include-dir=${STAGING_INCDIR}, --disable-ncurses, ncurses"
+PACKAGECONFIG[libcap] = "--with-libcap, --without-libcap, libcap"
+PACKAGECONFIG[qt4] = "--enable-pinentry-qt4, --disable-pinentry-qt4, qt4-x11"
+PACKAGECONFIG[gtk2] = "--enable-pinentry-gtk2, --disable-pinentry-gtk2, gtk+ glib-2.0"
-- 
1.9.1


