Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7666073D27
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 07:21:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u817LKd1017568
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Sep 2016 00:21:20 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 1 Sep 2016 00:21:19 -0700
From: <mingli.yu@windriver.com>
To: <li.wang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Thu, 1 Sep 2016 15:19:16 +0800
Message-ID: <1472714356-6328-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] gawk: fix command location in ptest script
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
X-List-Received-Date: Thu, 01 Sep 2016 07:21:20 -0000
Content-Type: text/plain

From: Li Wang <li.wang@windriver.com>

* Correct the command location in ptest scripts such as
  update the line "#!/bin/awk -f" to "#!/usr/bin/awk -f" in the
  file /usr/lib64/gawk/ptest/test/fcall_exit2.awk belongs
  to package gawk-ptest and the line "#!/usr/local/bin/gawk -f"
  to "#!/usr/bin/gawk -f" in the file
  /usr/lib64/gawk/ptest/test/fnarydel.awk

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-extended/gawk/gawk_4.1.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/gawk/gawk_4.1.3.bb b/meta/recipes-extended/gawk/gawk_4.1.3.bb
index 6ca7f3e..1aeb450 100644
--- a/meta/recipes-extended/gawk/gawk_4.1.3.bb
+++ b/meta/recipes-extended/gawk/gawk_4.1.3.bb
@@ -43,4 +43,6 @@ do_install_ptest() {
 	for i in `grep -vE "@|^$|#|Gt-dummy" ${S}/test/Maketests |awk -F: '{print $1}'` Maketests; \
 	  do cp ${S}/test/$i* ${D}${PTEST_PATH}/test; \
 	done
+	sed -i -e 's|/usr/local/bin|${bindir}|g' \
+	    -e 's|#!${base_bindir}/awk|#!${bindir}/awk|g' ${D}${PTEST_PATH}/test/*.awk
 }
-- 
2.8.1


