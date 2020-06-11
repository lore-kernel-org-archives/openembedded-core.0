Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.1607.1591854653414914990
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2020 22:50:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05B5o2Ec008102
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 10 Jun 2020 22:50:23 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Wed, 10 Jun 2020 22:50:06 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
Subject: [PATCH v2] python3: add rdepends for python3-idle
Date: Thu, 11 Jun 2020 13:48:35 +0800
Message-ID: <20200611054835.1669460-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add rdepends for python3-idle to fix below error:
 # /usr/bin/idle3 -h
 [snip]
 _tkinter.TclError: Can't find a usable init.tcl
 [snip]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/python/python3_3.8.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.8.3.bb b/meta/recipes-devtools/python/python3_3.8.3.bb
index 4367923b55..09793dade2 100644
--- a/meta/recipes-devtools/python/python3_3.8.3.bb
+++ b/meta/recipes-devtools/python/python3_3.8.3.bb
@@ -345,6 +345,7 @@ RDEPENDS_libpython3_append_libc-glibc = " libgcc"
 RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc tzdata-europe coreutils sed"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-tr-tr.iso-8859-9"
 RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
+RDEPENDS_${PN}-idle += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${PN}-tkinter tcl', '', d)}"
 RDEPENDS_${PN}-dev = ""
 
 RDEPENDS_${PN}-tests_append_class-target = " ${MLPREFIX}bash"
-- 
2.24.1

