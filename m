Return-Path: <marc.ferland@gmail.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id C3F06719BD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 17:42:52 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id f55so5152126qta.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 10:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=T3AYUZWnzO9Y9cGJMmX2in7alpWb2AGczLafB5bytJE=;
	b=lBSXeuiwuKR6w8bD5hXCTItIno/BD63qIgEUVCqiMTIKEX+V1TA4DHFRVX4R8L9KlL
	7UX3/NqQstk93zRCms/aRjQcUfe/DWVKKWyJuts9EjjGpc7rIcohNjhwT4Okt58oZh/D
	BX3HHMQEEB0OBVDIJA9h98TxFMz346xNjRbwDOSX9flP1KIouYUOSzcUErY0GXaGipjo
	J/NwCBj593QXgKftBXEU3A2PWZc60giwr09z3GFsGv7YMhl9Qvvw7+1CnvM/jjoUw4do
	NxMdmRAZSBoGWmUY69/WCSNItUvxgO0XJZ3IK3/2bWcC/u7JGDjI+4DQJlNJtYH0WkTn
	GZ8Q==
X-Gm-Message-State: AODbwcAkgm6vnYwTprzk5qYh6TnzPOP8T7VHkmc8ZOzvjT6PFo7EXO28
	rt2TWycbeE2RpDc8
X-Received: by 10.237.55.98 with SMTP id i89mr4872536qtb.162.1494610973552;
	Fri, 12 May 2017 10:42:53 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id 24sm70092qtt.53.2017.05.12.10.42.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 May 2017 10:42:53 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 May 2017 13:42:40 -0400
Message-Id: <1494610960-32690-2-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494610960-32690-1-git-send-email-ferlandm@amotus.ca>
References: <1494610960-32690-1-git-send-email-ferlandm@amotus.ca>
Subject: [PATCH 2/2] nasm: upgrade 2.12.02 -> 2.13.01
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
X-List-Received-Date: Fri, 12 May 2017 17:42:52 -0000

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
---
 meta/recipes-devtools/nasm/nasm_2.12.02.bb | 28 ----------------------------
 meta/recipes-devtools/nasm/nasm_2.13.01.bb | 28 ++++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-devtools/nasm/nasm_2.12.02.bb
 create mode 100644 meta/recipes-devtools/nasm/nasm_2.13.01.bb

diff --git a/meta/recipes-devtools/nasm/nasm_2.12.02.bb b/meta/recipes-devtools/nasm/nasm_2.12.02.bb
deleted file mode 100644
index 3280b84..0000000
--- a/meta/recipes-devtools/nasm/nasm_2.12.02.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "General-purpose x86 assembler"
-SECTION = "devel"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
-
-SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 "
-
-SRC_URI[md5sum] = "d15843c3fb7db39af80571ee27ec6fad"
-SRC_URI[sha256sum] = "00b0891c678c065446ca59bcee64719d0096d54d6886e6e472aeee2e170ae324"
-
-inherit autotools-brokensep
-
-do_configure_prepend () {
-	if [ -f ${S}/aclocal.m4 ] && [ ! -f ${S}/acinclude.m4 ]; then
-		mv ${S}/aclocal.m4 ${S}/acinclude.m4
-	fi
-}
-
-do_install() {
-	install -d ${D}${bindir}
-	install -d ${D}${mandir}/man1
-
-	oe_runmake 'INSTALLROOT=${D}' install
-}
-
-BBCLASSEXTEND = "native"
-
-DEPENDS = "groff-native"
diff --git a/meta/recipes-devtools/nasm/nasm_2.13.01.bb b/meta/recipes-devtools/nasm/nasm_2.13.01.bb
new file mode 100644
index 0000000..b17bb53
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm_2.13.01.bb
@@ -0,0 +1,28 @@
+SUMMARY = "General-purpose x86 assembler"
+SECTION = "devel"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
+
+SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "b3ae134bd1b5ead73d659286f568da95"
+SRC_URI[sha256sum] = "aa0213008f0433ecbe07bb628506a5c4be8079be20fc3532a5031fd639db9a5e"
+
+inherit autotools-brokensep
+
+do_configure_prepend () {
+	if [ -f ${S}/aclocal.m4 ] && [ ! -f ${S}/acinclude.m4 ]; then
+		mv ${S}/aclocal.m4 ${S}/acinclude.m4
+	fi
+}
+
+do_install() {
+	install -d ${D}${bindir}
+	install -d ${D}${mandir}/man1
+
+	oe_runmake 'INSTALLROOT=${D}' install
+}
+
+BBCLASSEXTEND = "native"
+
+DEPENDS = "groff-native"
-- 
2.7.4


