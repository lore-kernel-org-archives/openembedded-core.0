Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3EC3C79974
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 09:28:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8T9Rxk5004536
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 02:27:59 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Sat, 29 Sep 2018 02:27:52 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2018 17:27:50 +0800
Message-ID: <1538213271-19076-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] mime.bbclass: fix do_package_qa_multilib error of lib32-fltk
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
X-List-Received-Date: Sat, 29 Sep 2018 09:28:02 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fltk.bb inherit mime.bbclass, mime.bbclass add RDEPEND during
populate_package, so need add mlprefix manually.

ERROR: QA Issue: lib32-fltk package lib32-fltk-dev - suspicious
values 'shared-mime-info-data-dev' in RRECOMMENDS [multilib]
ERROR: QA Issue: lib32-fltk package lib32-fltk-bin - suspicious
values 'shared-mime-info-data' in RDEPENDS [multilib]

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes/mime.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/mime.bbclass b/meta/classes/mime.bbclass
index 0df1583..6c7b868 100644
--- a/meta/classes/mime.bbclass
+++ b/meta/classes/mime.bbclass
@@ -53,5 +53,5 @@ python populate_packages_append () {
             postrm += d.getVar('mime_postrm')
             d.setVar('pkg_postrm_%s' % pkg, postrm)
             bb.note("adding shared-mime-info-data dependency to %s" % pkg)
-            d.appendVar('RDEPENDS_' + pkg, " shared-mime-info-data")
+            d.appendVar('RDEPENDS_' + pkg, " " + d.getVar('MLPREFIX')+"shared-mime-info-data")
 }
-- 
2.7.4


