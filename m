Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.21234.1591580234701241397
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Jun 2020 18:37:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0581aqhR017628
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 7 Jun 2020 18:37:03 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Sun, 7 Jun 2020 18:36:35 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH V2] vim: restore the 'chmod -x' workaround in do_install
Date: Mon, 8 Jun 2020 09:36:33 +0800
Message-ID: <20200608013633.9752-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

These workarounds are removed because a previous patch
solve the host path reference for gawk and perl, and it skips
the do_package_qa issue by setting the INSANE_SKIP. But it
introduces regression for do_rootfs. The dependencies are
calculated and will require packages like python, perl, gawk
and csh. The error is like below.

Error:
 Problem: conflicting requests
    - nothing provides /bin/csh needed by vim-tools-8.2-r0.corei7_64
    - nothing provides /usr/bin/nawk needed by vim-tools-8.2-r0.corei7_64
    - nothing provides /usr/bin/python needed by vim-tools-8.2-r0.corei7_64

So we keep the previous patch which solve the host path reference
problem and restore the long-used 'chmod -x' workaround here.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-support/vim/vim.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 9f3dc08027..4d2886c19e 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -83,6 +83,12 @@ EXTRA_OECONF = " \
 do_install() {
     autotools_do_install
 
+    # Work around file-rdeps picking up csh, awk, perl or python as a dep
+    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
+    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
+    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
+    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
+    
     # Install example vimrc from runtime files
     install -m 0644 runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
 
-- 
2.17.1

