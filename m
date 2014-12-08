Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B7AE760809
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Dec 2014 23:54:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sB8Ns2O2022890
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Dec 2014 15:54:03 -0800 (PST)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 8 Dec 2014 15:54:02 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Dec 2014 17:53:59 -0600
Message-ID: <fc2cd0f00c8121c08dcc2b0d45e273f20daf80ae.1418082021.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1418082021.git.peter.seebach@windriver.com>
References: <cover.1418082021.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] package.bbclass: do variable fixups even when FILES was set
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
X-List-Received-Date: Mon, 08 Dec 2014 23:54:04 -0000
Content-Type: text/plain

A number of settings (DESCRIPTION, SUMMARY, postinst, postrm,
and appends to RDEPENDS) were made only if FILES_foo was not
set for a given package. If you had a modified glibc packaging
setup that was defining FILES_glibc-gconv-somelocale, this would
prevent the automatic append of glibc-gconv as a dependency,
because extra_depends was ignored.

I think the assumption may have been that if FILES_foo was set,
DESCRIPTION_foo and SUMMARY_foo would also be set, but it seems
to me that the right answer is probably to set them if they aren't
already set, and leave them alone if they are.
---
 meta/classes/package.bbclass |   18 ++++++++++--------
 1 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 89cce40..dc4025d 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -208,16 +208,18 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
                 else:
                     the_files.append(aux_files_pattern_verbatim % m.group(1))
             d.setVar('FILES_' + pkg, " ".join(the_files))
-            if extra_depends != '':
-                d.appendVar('RDEPENDS_' + pkg, ' ' + extra_depends)
-            d.setVar('DESCRIPTION_' + pkg, description % on)
-            d.setVar('SUMMARY_' + pkg, summary % on)
-            if postinst:
-                d.setVar('pkg_postinst_' + pkg, postinst)
-            if postrm:
-                d.setVar('pkg_postrm_' + pkg, postrm)
         else:
             d.setVar('FILES_' + pkg, oldfiles + " " + newfile)
+        if extra_depends != '':
+            d.appendVar('RDEPENDS_' + pkg, ' ' + extra_depends)
+        if not d.getVar('DESCRIPTION_' + pkg, True):
+            d.setVar('DESCRIPTION_' + pkg, description % on)
+        if not d.getVar('SUMMARY_' + pkg, True):
+            d.setVar('SUMMARY_' + pkg, summary % on)
+        if postinst:
+            d.setVar('pkg_postinst_' + pkg, postinst)
+        if postrm:
+            d.setVar('pkg_postrm_' + pkg, postrm)
         if callable(hook):
             hook(f, pkg, file_regex, output_pattern, m.group(1))
 
-- 
1.7.1


