Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C4D416F01E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 09:43:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2S9htUD004548
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Mar 2014 02:43:55 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Fri, 28 Mar 2014 02:43:55 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Mar 2014 17:43:36 +0800
Message-ID: <ae8e5c51f40f80d6614eceee0501830af1fe9816.1395997035.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395997035.git.hongxu.jia@windriver.com>
References: <cover.1395997035.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 2/4] libtiff: fix CVE-2013-4244
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
X-List-Received-Date: Fri, 28 Mar 2014 09:43:55 -0000
Content-Type: text/plain

From: Baogen Shang <baogen.shang@windriver.com>

cve description:
The LZW decompressor in the gif2tiff tool in libtiff 4.0.3 and earlier
allows context-dependent attackers to cause a denial of service
(out-of-bounds write and crash) or possibly execute arbitrary code via
a crafted GIF image.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4244
Signed-off-by: Baogen Shang <baogen.shang@windriver.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libtiff/files/libtiff-CVE-2013-4244.patch         | 19 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.3.bb         |  3 ++-
 2 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-4244.patch

diff --git a/meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-4244.patch b/meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-4244.patch
new file mode 100644
index 0000000..1a66830
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-4244.patch
@@ -0,0 +1,19 @@
+This patch comes from: https://github.com/vadz/libtiff/commit/ce6841d9e41d621ba23cf18b190ee6a23b2cc833
+
+Upstream-Status: Backport
+
+Signed-off-by: Baogen shang <baogen.shang@windriver.com>
+--- a/tools/gif2tiff.c	2013-12-17 16:46:02.160814995 +0800
++++ b/tools/gif2tiff.c	2013-12-17 16:52:25.140814949 +0800
+@@ -406,6 +406,11 @@
+         return 0;
+     }
+     if (oldcode == -1) {
++    if (code >= clear) {
++        fprintf(stderr, "bad input: code=%d is larger than clear=%d\n",code, clear);
++        return 0;
++	}
++
+ 	*(*fill)++ = suffix[code];
+ 	firstchar = oldcode = code;
+ 	return 1;
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
index 9cb8edf..fb9e0bf 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
@@ -7,7 +7,8 @@ SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch \
            file://libtiff-CVE-2013-1960.patch \
            file://libtiff-CVE-2013-4232.patch \
-           file://libtiff-CVE-2013-4243.patch"
+           file://libtiff-CVE-2013-4243.patch \
+           file://libtiff-CVE-2013-4244.patch"
 
 SRC_URI[md5sum] = "051c1068e6a0627f461948c365290410"
 SRC_URI[sha256sum] = "ea1aebe282319537fb2d4d7805f478dd4e0e05c33d0928baba76a7c963684872"
-- 
1.8.1.2


