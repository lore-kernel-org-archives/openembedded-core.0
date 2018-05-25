Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 25C9174889
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 02:40:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4P2eZ2Z021985
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 19:40:35 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Thu, 24 May 2018 19:40:34 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 May 2018 10:48:13 +0800
Message-ID: <94e950b50e9beda639f4a2142a000a020beda802.1527216285.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1527216285.git.liezhi.yang@windriver.com>
References: <cover.1527216285.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 08/24] gawk: fix command location in ptest script
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
X-List-Received-Date: Fri, 25 May 2018 02:40:34 -0000
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
 meta/recipes-extended/gawk/gawk_4.2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/gawk/gawk_4.2.1.bb b/meta/recipes-extended/gawk/gawk_4.2.1.bb
index 6b99357..9663752 100644
--- a/meta/recipes-extended/gawk/gawk_4.2.1.bb
+++ b/meta/recipes-extended/gawk/gawk_4.2.1.bb
@@ -43,6 +43,8 @@ do_install_ptest() {
 	for i in `grep -vE "@|^$|#|Gt-dummy" ${S}/test/Maketests |awk -F: '{print $1}'` Maketests inclib.awk; \
 	  do cp ${S}/test/$i* ${D}${PTEST_PATH}/test; \
 	done
+	sed -i -e 's|/usr/local/bin|${bindir}|g' \
+	    -e 's|#!${base_bindir}/awk|#!${bindir}/awk|g' ${D}${PTEST_PATH}/test/*.awk
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


