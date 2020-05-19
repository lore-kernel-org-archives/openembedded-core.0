Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.134.1589922624012134202
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 14:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04JLA2I1006425
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 14:10:13 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Tue, 19 May 2020
 14:09:51 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [PATCH 2/3] syslinux: gcc-10
Date: Tue, 19 May 2020 14:09:28 -0700
Message-ID: <20200519210928.1995-3-joe.slater@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519210928.1995-1-joe.slater@windriver.com>
References: <20200519210928.1995-1-joe.slater@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

Add -fcommon to CFLAGS to avoid multiple definition errors for uninitialized variables.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
index e9dbefb930..5dfcfeec02 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
@@ -40,6 +40,10 @@ EXTRA_OEMAKE = " \
 	DATADIR=${datadir} MANDIR=${mandir} INCDIR=${includedir} \
 "
 
+# necessary for gcc-10
+#
+CFLAGS_append = " -fcommon"
+
 do_configure() {
 	# drop win32 targets or build fails
 	sed -e 's,win32/\S*,,g' -i Makefile
-- 
2.26.2

