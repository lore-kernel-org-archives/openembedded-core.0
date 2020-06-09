Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.729.1591742794733505816
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 15:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 059MkD6Z011342
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Jun 2020 15:46:24 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Tue, 9 Jun 2020
 15:46:03 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [V2][oe-core][PATCH 1/1] vim: _FORTIFY_SOURCE=2 be gone
Date: Tue, 9 Jun 2020 15:46:02 -0700
Message-ID: <20200609224602.195758-1-joe.slater@windriver.com>
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

