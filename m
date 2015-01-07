Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5982E72823
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 07:07:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t07779A3021662
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 6 Jan 2015 23:07:09 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 6 Jan 2015 23:07:09 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 7 Jan 2015 15:06:51 +0800
Message-ID: <7c252e3e624e6fc7102b89e305c1dec977a9845b.1420613743.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1420613743.git.hongxu.jia@windriver.com>
References: <cover.1420613743.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] python3: avoid debian renaming for libpython3
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
X-List-Received-Date: Wed, 07 Jan 2015 07:07:11 -0000
Content-Type: text/plain

When Debian-renaming, 'libpython3' was incorrectly converted to
'libpython3.3m1.0', it caused install 'libpython3' failed.
(IMAGE_INSTALL_append = " python3", INSTALL_ALL_python3 = "1")
...
ERROR: libpython3 not found in the base feeds (qemux86 i586 x86 noarch any all).
libpython3.3m1.0-3.3.3-r0.0@i586
...

We assign DEBIAN_NOAUTONAME for 'libpython3' to avoid debian renaming.

The same to 'libpython3-staticdev'.

[YOCTO #5264]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/python/python3_3.3.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.3.3.bb b/meta/recipes-devtools/python/python3_3.3.3.bb
index 2c1f63f..3163fbd 100644
--- a/meta/recipes-devtools/python/python3_3.3.3.bb
+++ b/meta/recipes-devtools/python/python3_3.3.3.bb
@@ -204,6 +204,8 @@ FILES_${PN}-pyvenv += "${bindir}/pyvenv-${PYTHON_MAJMIN} ${bindir}/pyvenv"
 PACKAGES =+ "libpython3 libpython3-staticdev"
 FILES_libpython3 = "${libdir}/libpython*.so.*"
 FILES_libpython3-staticdev += "${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}/libpython${PYTHON_BINABI}.a"
+DEBIAN_NOAUTONAME_libpython3 = "1"
+DEBIAN_NOAUTONAME_libpython3-staticdev = "1"
 
 # catch debug extensions (isn't that already in python-core-dbg?)
 FILES_${PN}-dbg += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.debug"
-- 
1.9.1


