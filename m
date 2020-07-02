Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.3494.1593657368382967178
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 19:36:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0622a41u002110
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 1 Jul 2020 19:36:04 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Wed, 1 Jul 2020 19:35:42 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
Subject: [PATCH v2] python3: add ldconfig rdepends for python3-ctypes
Date: Thu, 2 Jul 2020 10:33:10 +0800
Message-ID: <20200702023310.3616646-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

The ctypes module needs to use "ldconfig -p" to find the
library path and it simply has below logic if no ldconfig
installed.
  except OSError:
      pass

Before the patch:
  >>> from ctypes.util import find_library
  >>> lib_path = find_library('archive')
  >>> print(lib_path)
  None

After the patch:
  >>> from ctypes.util import find_library
  >>> lib_path = find_library('archive')
  >>> print(lib_path)
  libarchive.so.13

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/python/python3_3.8.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.8.3.bb b/meta/recipes-devtools/python/python3_3.8.3.bb
index 2eb2a422e6..a7cfbad5cd 100644
--- a/meta/recipes-devtools/python/python3_3.8.3.bb
+++ b/meta/recipes-devtools/python/python3_3.8.3.bb
@@ -350,6 +350,7 @@ FILES_${PN}-man = "${datadir}/man"
 
 # See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
 RDEPENDS_libpython3_append_libc-glibc = " libgcc"
+RDEPENDS_${PN}-ctypes_append_libc-glibc = " ${MLPREFIX}ldconfig"
 RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc tzdata-europe coreutils sed"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-tr-tr.iso-8859-9"
 RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
-- 
2.26.2

