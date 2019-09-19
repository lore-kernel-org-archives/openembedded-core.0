Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A3F557F50F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 07:45:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8J7iM6q021766
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 00:45:06 -0700
Received: from localhost (128.224.162.203) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 19 Sep 2019 00:44:13 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Sep 2019 15:44:11 +0800
Message-ID: <1568879051-1732-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.203]
Subject: [PATCH] python: add tk-lib as runtime dependency for python-tkinter
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
X-List-Received-Date: Thu, 19 Sep 2019 07:45:15 -0000
Content-Type: text/plain

Fixes:
ERROR: python-2.7.16-r0 do_package_qa: QA Issue:
/usr/lib/python2.7/lib-dynload/_tkinter.so contained in package
python-tkinter requires libtk8.6.so, but no providers found in
RDEPENDS_python-tkinter? [file-rdeps]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-devtools/python/python3_3.7.4.bb | 2 +-
 meta/recipes-devtools/python/python_2.7.16.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.7.4.bb b/meta/recipes-devtools/python/python3_3.7.4.bb
index 14119c3..8693c44 100644
--- a/meta/recipes-devtools/python/python3_3.7.4.bb
+++ b/meta/recipes-devtools/python/python3_3.7.4.bb
@@ -321,6 +321,6 @@ FILES_${PN}-man = "${datadir}/man"
 
 RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc tzdata-europe coreutils sed"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-tr-tr.iso-8859-9"
-RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk', '', d)}"
+RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
 RDEPENDS_${PN}-dev = ""
 
diff --git a/meta/recipes-devtools/python/python_2.7.16.bb b/meta/recipes-devtools/python/python_2.7.16.bb
index c093f84..5b856a5 100644
--- a/meta/recipes-devtools/python/python_2.7.16.bb
+++ b/meta/recipes-devtools/python/python_2.7.16.bb
@@ -173,7 +173,7 @@ RDEPENDS_${PN}-modules += "${PN}-misc"
 
 # ptest
 RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip tzdata-europe coreutils sed"
-RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk', '', d)}"
+RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
 # catch manpage
 PACKAGES += "${PN}-man"
 FILES_${PN}-man = "${datadir}/man"
-- 
2.7.4


