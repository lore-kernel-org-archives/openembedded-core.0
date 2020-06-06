Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.771.1591463840967711158
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Jun 2020 10:17:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 056HHKgO008338
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sat, 6 Jun 2020 10:17:20 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Sat, 6 Jun 2020
 10:17:01 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [V2][oe-core][PATCH 1/1] vim: _FORTIFY_SOURCE=2 be gone
Date: Sat, 6 Jun 2020 10:17:01 -0700
Message-ID: <20200606171701.156910-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

vim will abort in many places with this setting.  Replace
it with the benign _FORTIFY_SOURCE=1.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta/recipes-support/vim/vim_8.2.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/vim/vim_8.2.bb b/meta/recipes-support/vim/vim_8.2.bb
index 60946a181f..709b6ddb55 100644
--- a/meta/recipes-support/vim/vim_8.2.bb
+++ b/meta/recipes-support/vim/vim_8.2.bb
@@ -8,3 +8,8 @@ BBCLASSEXTEND = "native"
 ALTERNATIVE_${PN}_append = " xxd"
 ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"
 ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
+
+# We override the default in security_flags.inc because vim (not vim-tiny!) will abort
+# in many places for _FORTIFY_SOURCE=2.  Security flags become part of CC.
+#
+lcl_maybe_fortify = "${@oe.utils.conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=1',d)}"
-- 
2.17.1

