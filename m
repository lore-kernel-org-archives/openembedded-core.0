Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.3001.1588817175371034467
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 19:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 04726D7d015000
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 6 May 2020 19:06:14 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Wed, 6 May 2020 19:06:00 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] iproute2.inc: clean .o before do_configure
Date: Thu, 7 May 2020 10:05:59 +0800
Message-ID: <1588817159-434433-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Reproduce steps:
1. add 'DISTRO_FEATURES_append = ' usrmerge'' in local.conf
2. bitbake iproute2
3. remove 'DISTRO_FEATURES_append = ' usrmerge'' from local.conf
4. bitbake iproute2

In step4, since CLEANBROKEN is set, files generated in step2 is not
cleaned and rebuilded. Check after step4:

file /sbin/ip.iproute2
/sbin/ip.iproute2: ELF 64-bit LSB pie executable, x86-64, version 1
(SYSV), dynamically linked, interpreter /usr/lib64/ld-linux-x86-64.so.2,

interpreter path is wrong, it should be  /lib64/ld-linux-x86-64.so.2

This will make run ip.iproute2 report error:
-sh: /sbin/ip.iproute2: No such file or directory

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-connectivity/iproute2/iproute2.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index 403d264..e70620c 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -29,6 +29,10 @@ EXTRA_OEMAKE = "\
     LIBDIR='${libdir}' \
 "
 
+do_configure_prepend () {
+    find ${B} -ignore_readdir_race -name \*.o -type f -print0 | xargs -0 rm -f
+}
+
 do_configure_append () {
     sh configure ${STAGING_INCDIR}
     # Explicitly disable ATM support
-- 
2.7.4

