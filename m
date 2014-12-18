Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 05EC47279F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 11:04:44 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	sBIB4fwY027688
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 12:04:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1418900683;
	bh=3Vc36wkxPa0Sao4ux4N6Z39lLX/awF8pyaPqQuomF9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Sender;
	b=TEpaGcWwnhGOWTAuzXsGpozPg0L5wedWf9wC4jGo3VwB2Y8rNgagMLPg3FYEfQTOc
	u8WneZMFaOJ4Dx4N6VrSiOm2SXeTPEH6wgMjreVLnQl+tgnnCt78Ydl9upkZ4bnbGF
	9tMQ4VN2eseV4+8MwWMPgkKsKQqTxRkSqY5A3PGc=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id sBIB4Zje005835
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 18 Dec 2014 12:04:37 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1Y1Ysk-0006bz-IV; Thu, 18 Dec 2014 12:04:35 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Dec 2014 12:04:21 +0100
Message-Id: <1418900663-20985-2-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1418900663-20985-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1418900663-20985-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -4.9
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, SPF_NEUTRAL, T_RP_MATCHES_RCVD,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 1/3] insane: added 'pkgconfig-nosysroot' check
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
X-List-Received-Date: Thu, 18 Dec 2014 11:04:48 -0000

pkgconfig files should not contain references to $PKG_CONFIG_SYSROOT_DIR.
E.g. when a .pc file contains

| Cflags: -I/absolute-path-to-sysroot/usr/include/freetype2

pkgconfig will expand this in the next 'pkgconfig --cflags' call as

| -I/absolute-path-to-sysroot/absolute-path-to-sysroot/usr/include/freetype2

(note the duplicate path).

This patch checks therefore whether installed .pc files contain such
absolute paths.

Because some OE core packages trigger this check (fontconfig, libkmod),
it is only a warning for now.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes/insane.bbclass | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index b4bffd2..d327294 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -29,7 +29,7 @@ QA_SANE = "True"
 WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             textrel already-stripped incompatible-license files-invalid \
             installed-vs-shipped compile-host-path install-host-path \
-            pn-overrides infodir build-deps file-rdeps \
+            pn-overrides infodir build-deps file-rdeps pkgconfig-nosysroot \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -606,6 +606,20 @@ def package_qa_check_symlink_to_sysroot(path, name, d, elf, messages):
                 trimmed = path.replace(os.path.join (d.getVar("PKGDEST", True), name), "")
                 messages["symlink-to-sysroot"] = "Symlink %s in %s points to TMPDIR" % (trimmed, name)
 
+QAPATHTEST[pkgconfig-nosysroot] = "package_qa_check_pkgconfig_nosysroot"
+def package_qa_check_pkgconfig_nosysroot(file, pkgname, d, elf, messages):
+    if not file.endswith('.pc') or os.path.islink(file):
+	return
+
+    sysroot = d.getVar("PKG_CONFIG_SYSROOT_DIR", True)
+    if not sysroot:
+        return
+
+    with open(file) as f:
+        content = f.read()
+        if sysroot in content:
+            messages["pkgconfig-nosysroot"] = "pkgconfig file %s contains absolute reference to sysroot" % package_qa_clean_path(file,d)
+
 def package_qa_check_license(workdir, d):
     """
     Check for changes in the license files 
-- 
1.9.3


