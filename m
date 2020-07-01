Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.13041.1593570984404396973
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 19:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0612aNmn017038
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2020 19:36:23 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Tue, 30 Jun 2020 19:36:22 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] python3: add ldconfig rdepends for python3-ctypes
Date: Wed, 1 Jul 2020 10:33:18 +0800
Message-ID: <20200701023318.3887430-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200701023318.3887430-1-mingli.yu@windriver.com>
References: <20200701023318.3887430-1-mingli.yu@windriver.com>
MIME-Version: 1.0
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
index 2eb2a422e6..abcd16e63d 100644
--- a/meta/recipes-devtools/python/python3_3.8.3.bb
+++ b/meta/recipes-devtools/python/python3_3.8.3.bb
@@ -350,6 +350,7 @@ FILES_${PN}-man = "${datadir}/man"
 
 # See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
 RDEPENDS_libpython3_append_libc-glibc = " libgcc"
+RDEPENDS_${PN}-ctypes_append_libc-glibc = " ldconfig"
 RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc tzdata-europe coreutils sed"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-tr-tr.iso-8859-9"
 RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
-- 
2.17.1

