Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 90D6A6E688
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 07:22:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7H7MxpT018107
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 17 Aug 2018 00:22:59 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Fri, 17 Aug 2018 00:22:46 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Aug 2018 15:22:41 +0800
Message-ID: <1534490562-15144-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/2] libxml2: fix CVE-2018-9251 and CVE-2018-14567
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
X-List-Received-Date: Fri, 17 Aug 2018 07:22:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...1-Fix-infinite-loop-in-LZMA-decompression.patch | 55 ++++++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.8.bb          |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-Fix-infinite-loop-in-LZMA-decompression.patch

diff --git a/meta/recipes-core/libxml/libxml2/0001-Fix-infinite-loop-in-LZMA-decompression.patch b/meta/recipes-core/libxml/libxml2/0001-Fix-infinite-loop-in-LZMA-decompression.patch
new file mode 100644
index 0000000..16c2295
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/0001-Fix-infinite-loop-in-LZMA-decompression.patch
@@ -0,0 +1,55 @@
+From 28a9dc642ffd759df1e48be247a114f440a6c16e Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Mon, 30 Jul 2018 13:14:11 +0200
+Subject: [PATCH] Fix infinite loop in LZMA decompression
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Check the liblzma error code more thoroughly to avoid infinite loops.
+
+Closes: https://gitlab.gnome.org/GNOME/libxml2/issues/13
+Closes: https://bugzilla.gnome.org/show_bug.cgi?id=794914
+
+This is CVE-2018-9251 and CVE-2018-14567.
+
+Thanks to Dongliang Mu and Simon Wörner for the reports.
+
+CVE: CVE-2018-9251
+CVE: CVE-2018-14567
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/commit/2240fbf5912054af025fb6e01e26375100275e74]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ xzlib.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/xzlib.c b/xzlib.c
+index a839169..0ba88cf 100644
+--- a/xzlib.c
++++ b/xzlib.c
+@@ -562,6 +562,10 @@ xz_decomp(xz_statep state)
+                          "internal error: inflate stream corrupt");
+                 return -1;
+             }
++            /*
++             * FIXME: Remapping a couple of error codes and falling through
++             * to the LZMA error handling looks fragile.
++             */
+             if (ret == Z_MEM_ERROR)
+                 ret = LZMA_MEM_ERROR;
+             if (ret == Z_DATA_ERROR)
+@@ -587,6 +591,11 @@ xz_decomp(xz_statep state)
+             xz_error(state, LZMA_PROG_ERROR, "compression error");
+             return -1;
+         }
++        if ((state->how != GZIP) &&
++            (ret != LZMA_OK) && (ret != LZMA_STREAM_END)) {
++            xz_error(state, ret, "lzma error");
++            return -1;
++        }
+     } while (strm->avail_out && ret != LZMA_STREAM_END);
+ 
+     /* update available output and crc check value */
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.8.bb b/meta/recipes-core/libxml/libxml2_2.9.8.bb
index 4ebd2ef..f01cb2c 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.8.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://fix-execution-of-ptests.patch \
            file://fix-CVE-2017-8872.patch \
            file://fix-CVE-2018-14404.patch \
+           file://0001-Fix-infinite-loop-in-LZMA-decompression.patch \
            "
 
 SRC_URI[libtar.md5sum] = "b786e353e2aa1b872d70d5d1ca0c740d"
-- 
2.7.4


