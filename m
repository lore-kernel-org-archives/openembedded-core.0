Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.10081.1588869362774748848
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 09:36:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 047GZUYs014882
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 7 May 2020 09:35:51 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Thu, 7 May 2020
 09:35:31 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][PATCH 1/1] wget: improve reproducible build
Date: Thu, 7 May 2020 09:35:32 -0700
Message-ID: <20200507163532.80178-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Modify DEBUG_PREFIX_MAP as used by sed to handle
whitespace correctly.

This modifies an existing patch.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../wget/wget/0002-improve-reproducibility.patch                 | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch b/meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch
index 8781df2..050fc2c 100644
--- a/meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch
+++ b/meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch
@@ -34,6 +34,11 @@ Link: gcc -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions
 Upstream-Status: Inappropriate [oe-core specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+sed use of DEBUG_PREFIX_MAP must treat whitespace the same as the
+echo command building version.c or the expression match will fail.
+
+Signed-off-by: Joe Slater <jslater@windriver.com>
 ---
  src/Makefile.am | 4 ++++
  1 file changed, 4 insertions(+)
@@ -47,12 +52,12 @@ index 28c0be2..44084a3 100644
  	echo 'const char *version_string = "@VERSION@";' >> $@
  	echo 'const char *compilation_string = "'$(COMPILE)'";' \
 +	    | sed -e "s,$(TOOLCHAIN_OPTIONS),,g" \
-+	          -e "s,$(DEBUG_PREFIX_MAP),,g" \
++	          -e "s,$$(echo $(DEBUG_PREFIX_MAP)),,g" \
  	    | $(ESCAPEQUOTE) >> $@
  	echo 'const char *link_string = "'$(CCLD) $(AM_CFLAGS) $(CFLAGS) \
  	$(AM_LDFLAGS) $(LDFLAGS) $(LIBS) $(wget_LDADD)'";' \
 +	    | sed -e "s,$(TOOLCHAIN_OPTIONS),,g" \
-+	          -e "s,$(DEBUG_PREFIX_MAP),,g" \
++	          -e "s,$$(echo $(DEBUG_PREFIX_MAP)),,g" \
  	    | $(ESCAPEQUOTE) >> $@
  
  css.c: $(srcdir)/css.l
-- 
2.7.4

