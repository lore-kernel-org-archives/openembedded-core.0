Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 065967054E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 10:12:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7UACqe6002395
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 03:12:52 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sat, 30 Aug 2014 03:12:51 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 30 Aug 2014 03:12:49 -0700
Message-ID: <aaf863f43056faf85c4ca7d40902d8a0c7057832.1409393505.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1409393505.git.liezhi.yang@windriver.com>
References: <cover.1409393505.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libpam: remove MLPREFIX from PN
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
X-List-Received-Date: Sat, 30 Aug 2014 10:12:57 -0000
Content-Type: text/plain

The commit df3038768f59f7a0c814974ff674d4e59cbdfca4 changed 'libpam' to
'pn', then we don't need the "MLPREFIX + pn" any more, otherwise we
would get the name like: "lib32-lib32-libpam-x", and the warn:

WARNING: QA Issue: lib32-pam-plugin-access rdepends on
lib32-lib32-libpam-suffix, but it isn't a build dependency? [build-deps]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/pam/libpam_1.1.6.bb |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index d7033d0..a3fb893 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -94,13 +94,12 @@ python populate_packages_prepend () {
     def pam_plugin_hook(file, pkg, pattern, format, basename):
         pn = d.getVar('PN', True)
         libpam_suffix = d.getVar('libpam_suffix', True)
-        mlprefix = d.getVar('MLPREFIX', True) or ''
 
         rdeps = d.getVar('RDEPENDS_' + pkg, True)
         if rdeps:
-            rdeps = rdeps + " " + mlprefix + pn + "-" + libpam_suffix
+            rdeps = rdeps + " " + pn + "-" + libpam_suffix
         else:
-            rdeps = mlprefix + pn + "-" + libpam_suffix
+            rdeps = pn + "-" + libpam_suffix
         d.setVar('RDEPENDS_' + pkg, rdeps)
 
         provides = d.getVar('RPROVIDES_' + pkg, True)
-- 
1.7.9.5


