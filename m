Return-Path: <o.mandel@menlosystems.com>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 71E4860268
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 13:44:34 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3t0n3R2Y9kz3hjZF;
	Fri, 21 Oct 2016 15:44:35 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3t0n3R2DsszvkSP;
	Fri, 21 Oct 2016 15:44:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id mEatPylsKC-I; Fri, 21 Oct 2016 15:44:34 +0200 (CEST)
X-Auth-Info: 8prHhvcaqmQWKXptgjAiSf6lUWi65mezzNnhYl6FeQvcSZ0prZtfoAhGJTVgMjOO
Received: from menlobuildsrv.menlosystems.local
	(host-141-40-253-38.customer.izb-online.de [141.40.253.38])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 21 Oct 2016 15:44:34 +0200 (CEST)
From: Olaf Mandel <o.mandel@menlosystems.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2016 13:44:27 +0000
Message-Id: <1477057467-25114-1-git-send-email-o.mandel@menlosystems.com>
X-Mailer: git-send-email 2.1.4
Cc: Olaf Mandel <o.mandel@menlosystems.com>
Subject: [PATCH] texi2html: Allow compiling out-of-source
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
X-List-Received-Date: Fri, 21 Oct 2016 13:44:35 -0000

Compiling texi2html 5.0 out-of-source with USE_NLS set to no failed
because it trieed to copy from srcdir without using that variable.
Fix this issue.

No need to send upstream: current trunk already contains this.

Signed-off-by: Olaf Mandel <o.mandel@menlosystems.com>
---
 .../files/0001-Allow-compiling-out-of-source.patch | 38 ++++++++++++++++++++++
 meta/recipes-extended/texi2html/texi2html_5.0.bb   |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-extended/texi2html/files/0001-Allow-compiling-out-of-source.patch

diff --git a/meta/recipes-extended/texi2html/files/0001-Allow-compiling-out-of-source.patch b/meta/recipes-extended/texi2html/files/0001-Allow-compiling-out-of-source.patch
new file mode 100644
index 0000000..754f0a2
--- /dev/null
+++ b/meta/recipes-extended/texi2html/files/0001-Allow-compiling-out-of-source.patch
@@ -0,0 +1,38 @@
+From: Olaf Mandel <o.mandel@menlosystems.com>
+Date: Fri, 21 Oct 2016 13:04:44 +0000
+Subject: [PATCH] Allow compiling out-of-source
+
+---
+ Makefile.am | 2 +-
+ Makefile.in | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 3447463..c9b5b5c 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -208,7 +208,7 @@ i18n/en.thl i18n/: $(po_document_dir)/po_document/$(PACKAGE)_document.pot
+ 	  done; \
+ 	  msgexec -i $< "$(srcdir)/gettext_to_separated.pl" | "$(srcdir)/separated_to_hash.pl" en > i18n/en.thl; \
+ 	else \
+-	  cp -p i18n_ref/*.thl i18n; \
++	  cp -p "$(srcdir)/i18n_ref/"*.thl i18n; \
+ 	fi
+ 
+ i18n_ref:
+diff --git a/Makefile.in b/Makefile.in
+index 4264b37..a13f84d 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -1126,7 +1126,7 @@ i18n/en.thl i18n/: $(po_document_dir)/po_document/$(PACKAGE)_document.pot
+ 	  done; \
+ 	  msgexec -i $< "$(srcdir)/gettext_to_separated.pl" | "$(srcdir)/separated_to_hash.pl" en > i18n/en.thl; \
+ 	else \
+-	  cp -p i18n_ref/*.thl i18n; \
++	  cp -p "$(srcdir)/i18n_ref/"*.thl i18n; \
+ 	fi
+ 
+ i18n_ref:
+-- 
+2.1.4
+
diff --git a/meta/recipes-extended/texi2html/texi2html_5.0.bb b/meta/recipes-extended/texi2html/texi2html_5.0.bb
index eac289e..ae64816 100644
--- a/meta/recipes-extended/texi2html/texi2html_5.0.bb
+++ b/meta/recipes-extended/texi2html/texi2html_5.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 PR = "r2"
 
 SRC_URI     = "${SAVANNAH_GNU_MIRROR}/texi2html/${BPN}-${PV}.tar.bz2 \
+               file://0001-Allow-compiling-out-of-source.patch \
                "
 
 SRC_URI[md5sum] = "f15ac876fcdc8be865b16535f480aa54"
-- 
2.1.4


