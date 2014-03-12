Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4C35F6F800
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 06:38:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2C6cv8v017752
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 23:38:58 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 11 Mar 2014 23:38:57 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Mar 2014 02:38:54 -0400
Message-ID: <015d5a2ffbf03ecfe5804b2c3418cdfb14d45579.1394606302.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1394606302.git.liezhi.yang@windriver.com>
References: <cover.1394606302.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] docbook-sgml-dtd-native: remove catalog file when do_clean
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
X-List-Received-Date: Wed, 12 Mar 2014 06:38:58 -0000
Content-Type: text/plain

The docbook_sgml_dtd_sstate_postinst adds catalog file to
/etc/sgml/sgml-docbook.cat, but the do_clean would not remove the file,
which would cause unexpected errors since we have multiple versions
of docbook-sgml-dtd:

docbook-sgml-dtd-3.1-native_3.1.bb
docbook-sgml-dtd-4.1-native_4.1.bb
docbook-sgml-dtd-4.5-native.bb

If we run:

$ bitbake docbook-sgml-dtd-4.1-native
$ bitbake docbook-sgml-dtd-4.1-native -ccleansstate && bitbake docbook-sgml-dtd-3.1-native
$ bitbake docbook-utils-native

We would get this error:

jade: cannot open "/path/to/etc/sgml/sgml-docbook-dtd-4.1.cat" (No such file or directory)
make[2]: *** [sgmldiff.html] Error 1

Remove the catalog entry when do_clean will fix the problem.

[YOCTO #5949]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../docbook-sgml-dtd/docbook-sgml-dtd-native.inc             |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-native.inc b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-native.inc
index 1b357b5..bf2affb 100644
--- a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-native.inc
+++ b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-native.inc
@@ -58,3 +58,13 @@ docbook_sgml_dtd_sysroot_preprocess () {
     install -m 755 ${STAGING_BINDIR_NATIVE}/install-catalog ${SYSROOT_DESTDIR}${bindir_crossscripts}/install-catalog-docbook-sgml-dtd-${DTD_VERSION}
 }
 
+CLEANFUNCS += "docbook_sgml_dtd_sstate_clean"
+
+docbook_sgml_dtd_sstate_clean () {
+	# Ensure that the catalog file sgml-docbook.cat is properly
+	# updated when the package is removed from sstate cache.
+	if [ -s ${sysconfdir}/sgml/sgml-docbook.bak ]; then
+		sed -i '/'"\/sgml\/sgml-docbook-dtd-${DTD_VERSION}.cat"'/d' \
+			${sysconfdir}/sgml/sgml-docbook.bak
+	fi
+}
-- 
1.7.10.4


