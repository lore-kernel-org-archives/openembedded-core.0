Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <aalonso00@gmail.com>) id 1QtWbC-0003Ja-7o
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 05:15:22 +0200
Received: by yia28 with SMTP id 28so461757yia.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 20:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ZtJt51zhhRbTcY59P/K7JJRsdXVAaSdXXtLr0G3zCIg=;
	b=W3fmkRKPtzNJYnZEX/7U9+x+9R9uqLIE2U7h6x4yjyZXuVjBp3SW8yRjw/X5n9mzja
	dEm+XedmWjs5wcnPug47j4mOyS+7/bVe8vTbMZXNlsgvAbNfaruEWO6WNBbAanTEx6TP
	LV1KIjqJOkYT493JzKkv6DYEaUxBuACGXWLRI=
Received: by 10.236.153.193 with SMTP id f41mr1704838yhk.6.1313550644023;
	Tue, 16 Aug 2011 20:10:44 -0700 (PDT)
Received: from localhost.localdomain ([187.133.159.42])
	by mx.google.com with ESMTPS id s62sm313746yhn.19.2011.08.16.20.10.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 16 Aug 2011 20:10:43 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 22:10:31 -0500
Message-Id: <1313550631-26516-1-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH] file: new file version 5.07
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
X-List-Received-Date: Wed, 17 Aug 2011 03:15:22 -0000

* file version 5.07 also prevents magic file mistmatch
  in Fedora 15
* related to bug 1358.
  http://bugzilla.pokylinux.org/show_bug.cgi?id=1358

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 meta/recipes-devtools/file/file_5.07.bb |   36 +++++++++++++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/file/file_5.07.bb

diff --git a/meta/recipes-devtools/file/file_5.07.bb b/meta/recipes-devtools/file/file_5.07.bb
new file mode 100644
index 0000000..9b5b51f
--- /dev/null
+++ b/meta/recipes-devtools/file/file_5.07.bb
@@ -0,0 +1,36 @@
+SUMMARY = "File classification tool"
+DESCRIPTION = "File attempts to classify files depending \
+on their contents and prints a description if a match is found."
+HOMEPAGE = "http://www.darwinsys.com/file/"
+SECTION = "console/utils"
+
+# two clause BSD
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=6a7382872edb68d33e1a9398b6e03188"
+
+DEPENDS = "zlib file-native"
+DEPENDS_virtclass-native = "zlib-native"
+PR = "r0"
+
+SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
+           file://dump \
+           file://filesystems"
+
+SRC_URI[md5sum] = "b8d1f9a8a644067bd0a703cebf3f4858"
+SRC_URI[sha256sum] = "c968bfe97d87f9f564728a894d57be2c6bba9a2006763fffff85c5f72a9a3c2f"
+
+inherit autotools
+
+do_configure_prepend() {
+	cp ${WORKDIR}/dump ${S}/magic/Magdir/
+	cp ${WORKDIR}/filesystems ${S}/magic/Magdir/
+}
+
+FILES_${PN} += "${datadir}/misc/*.mgc"
+
+do_install_append_virtclass-native() {
+	create_cmdline_wrapper ${D}/${bindir}/file \
+		--magic-file ${datadir}/misc/magic.mgc
+}
+
+BBCLASSEXTEND = "native"
-- 
1.7.6



