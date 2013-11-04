Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E66736D6A2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 07:14:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA47E7Tv018279
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 3 Nov 2013 23:14:07 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Sun, 3 Nov 2013 23:14:06 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Nov 2013 15:13:55 +0800
Message-ID: <ca0a126b362417bc5d0cddd5262d11dc43229694.1383549031.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1383549031.git.hongxu.jia@windriver.com>
References: <cover.1383549031.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 3/4] udev: fix QA issue
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
X-List-Received-Date: Mon, 04 Nov 2013 07:14:05 -0000
Content-Type: text/plain

...
WARNING: QA Issue: udev: /lib/libgudev-1.0.so.0.1.1, installed in the base_prefix, requires a shared library under exec_prefix (/usr): libgobject-2.0.so.0 => /usr/lib/libgobject-2.0.so.0 (0xdead3000)
WARNING: QA Issue: udev: /lib/libgudev-1.0.so.0.1.1, installed in the base_prefix, requires a shared library under exec_prefix (/usr): libffi.so.6 => /usr/lib/libffi.so.6 (0xdead4000)
WARNING: QA Issue: udev: /lib/libgudev-1.0.so.0.1.1, installed in the base_prefix, requires a shared library under exec_prefix (/usr): libglib-2.0.so.0 => /usr/lib/libglib-2.0.so.0 (0xdead5000)
WARNING: QA Issue: udev: /lib/udev/udevd, installed in the base_prefix, requires a shared library under exec_prefix (/usr): libkmod.so.2 => /usr/lib/libkmod.so.2 (0xdead3000)
...

Install libgudev-1.0.so.0.1.1 in ${libdir} rather than ${base_libdir}
fixed this issue.

[YOCTO #5142]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/udev/udev.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 2ff8f00..2f883a0 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -32,14 +32,13 @@ inherit autotools pkgconfig update-rc.d
 
 libexecdir = "${base_libdir}"
 EXTRA_OECONF = "--disable-introspection \
-                --with-rootlibdir=${base_libdir} \
+                --with-rootlibdir=${libdir} \
                 --with-pci-ids-path=${datadir}/pci.ids \
                 ac_cv_file__usr_share_pci_ids=no \
                 ac_cv_file__usr_share_hwdata_pci_ids=no \
                 ac_cv_file__usr_share_misc_pci_ids=yes \
                 --sbindir=${base_sbindir} \
                 --libexecdir=${nonarch_base_libdir} \
-                --with-rootlibdir=${base_libdir} \
                 --with-rootprefix= \
                 --without-systemdsystemunitdir \
                "
-- 
1.8.1.2


