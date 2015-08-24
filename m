Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id A087E76BEB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 22:19:28 +0000 (UTC)
Received: by pacdd16 with SMTP id dd16so106441418pac.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HEGYp7O1ux88oHbFjOrFxZZ0MUzEpUzuilPxRcl37Cc=;
	b=vgKSRpx4Jkgc3Lqim3KtiwUtivPWvRngD9+M7TR11stZRfNX4esJSz6ilYfb9zoIYU
	XKAmT3JcKzkEUaPhetPJ+MHvPfDMT2NGCnaU/7RhGrzreTqAUNPbvjk7lXm6ZhQgXT55
	qroL38oesL371Npyp2ZDynCKEYGrDEkAaa348oX6bNhLRCV3+RXLd5bNBLPz88Q3nAlF
	zkpB2zztW3yH97GfsMuf5qYOjyZjHWh++iBZyrVuI0AGtB5mUDlX/0NxztBwNLOQB20P
	TqcgWugvyb7C9deyMezgwxCHA0HaBgMhpUBIfNFJuCHlHuOrjGctgOHyfuS4dpsBBzwh
	AC/Q==
X-Received: by 10.68.228.36 with SMTP id sf4mr50286870pbc.0.1440454768855;
	Mon, 24 Aug 2015 15:19:28 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	cr6sm7550698pdb.17.2015.08.24.15.19.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 15:19:27 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 15:19:15 -0700
Message-Id: <19f46bb2f6951eca80f159b612b407e3df0b6ea1.1440454290.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1440454290.git.chris_larson@mentor.com>
References: <cover.1440454290.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/3] insane.bbclass: handle tests which need fakeroot
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
X-List-Received-Date: Mon, 24 Aug 2015 22:19:30 -0000

From: Christopher Larson <chris_larson@mentor.com>

If any tests listed in FAKEROOT_QA are enabled (listed in ALL_QA), then
run do_package_qa under fakeroot.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/insane.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 9c05c86..cd773b7 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -38,6 +38,9 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             split-strip packages-list pkgv-undefined var-undefined \
             version-going-backwards expanded-d \
             "
+FAKEROOT_QA = ""
+FAKEROOT_QA[doc] = "QA tests which need to run under fakeroot. If any \
+enabled tests are listed here, the do_package_qa task will run under fakeroot."
 
 ALL_QA = "${WARN_QA} ${ERROR_QA}"
 
@@ -1210,6 +1213,11 @@ python () {
         for var in 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RCONFLICTS', 'RPROVIDES', 'RREPLACES', 'FILES', 'pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm', 'ALLOW_EMPTY':
             if d.getVar(var, False):
                 issues.append(var)
+
+        fakeroot_tests = d.getVar('FAKEROOT_QA', True).split()
+        if set(tests) & set(fakeroot_tests):
+            d.setVarFlag('do_package_qa', 'fakeroot', '1')
+            d.appendVarFlag('do_package_qa', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
     else:
         d.setVarFlag('do_package_qa', 'rdeptask', '')
     for i in issues:
-- 
2.2.1


