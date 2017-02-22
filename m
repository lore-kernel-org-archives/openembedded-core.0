Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3F0E97302B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 07:14:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1M7EhJN024256
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 23:14:44 -0800 (PST)
Received: from pek-zchi-d1.corp.ad.wrs.com (128.224.162.239) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.294.0; Tue, 21 Feb 2017 23:14:43 -0800
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Feb 2017 15:14:42 +0800
Message-ID: <1487747682-10806-1-git-send-email-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] unzip: CVE-2014-9913 CVE-2016-9844
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
X-List-Received-Date: Wed, 22 Feb 2017 07:14:43 -0000
Content-Type: text/plain

Backport the patches for CVE-2014-9913 CVE-2016-9844

CVE-2016-9844:
Buffer overflow in the zi_short function in zipinfo.c in Info-Zip
UnZip 6.0 allows remote attackers to cause a denial of service
(crash) via a large compression method value in the central
directory file header.
CVE-2014-9913:
Buffer overflow in the list_files function in list.c in Info-Zip
UnZip 6.0 allows remote attackers to cause a denial of service
(crash) via vectors related to the compression method.

Patches come from:
https://github.com/NixOS/nixpkgs/blob/master/pkgs/tools/archivers/unzip/  or
https://release.debian.org/proposed-updates/stable_diffs/unzip_6.0-16+deb8u3.debdiff

Bug-Debian: https://bugs.debian.org/847486
Bug-Ubuntu: https://launchpad.net/bugs/1643750

(LOCAL REV: NOT UPSTREAM) --send to oe-core on 20170222

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 .../18-cve-2014-9913-unzip-buffer-overflow.patch   | 33 ++++++++++++++++++++++
 .../19-cve-2016-9844-zipinfo-buffer-overflow.patch | 32 +++++++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb           |  4 ++-
 3 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/unzip/unzip/18-cve-2014-9913-unzip-buffer-overflow.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/19-cve-2016-9844-zipinfo-buffer-overflow.patch

diff --git a/meta/recipes-extended/unzip/unzip/18-cve-2014-9913-unzip-buffer-overflow.patch b/meta/recipes-extended/unzip/unzip/18-cve-2014-9913-unzip-buffer-overflow.patch
new file mode 100644
index 0000000..eb76e2e
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/18-cve-2014-9913-unzip-buffer-overflow.patch
@@ -0,0 +1,33 @@
+From: "Steven M. Schweda" <sms@antinode.info>
+Subject: Fix CVE-2014-9913, buffer overflow in unzip
+Bug: https://sourceforge.net/p/infozip/bugs/27/
+Bug-Debian: https://bugs.debian.org/847485
+Bug-Ubuntu: https://launchpad.net/bugs/387350
+X-Debian-version: 6.0-21
+
+Upstream-Status: Backport
+
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+
+--- a/list.c
++++ b/list.c
+@@ -339,7 +339,18 @@
+                 G.crec.compression_method == ENHDEFLATED) {
+                 methbuf[5] = dtype[(G.crec.general_purpose_bit_flag>>1) & 3];
+             } else if (methnum >= NUM_METHODS) {
+-                sprintf(&methbuf[4], "%03u", G.crec.compression_method);
++                /* 2013-02-26 SMS.
++                 * http://sourceforge.net/p/infozip/bugs/27/  CVE-2014-9913.
++                 * Unexpectedly large compression methods overflow
++                 * &methbuf[].  Use the old, three-digit decimal format
++                 * for values which fit.  Otherwise, sacrifice the
++                 * colon, and use four-digit hexadecimal.
++                 */
++                if (G.crec.compression_method <= 999) {
++                    sprintf( &methbuf[ 4], "%03u", G.crec.compression_method);
++                } else {
++                    sprintf( &methbuf[ 3], "%04X", G.crec.compression_method);
++                }
+             }
+ 
+ #if 0       /* GRR/Euro:  add this? */
diff --git a/meta/recipes-extended/unzip/unzip/19-cve-2016-9844-zipinfo-buffer-overflow.patch b/meta/recipes-extended/unzip/unzip/19-cve-2016-9844-zipinfo-buffer-overflow.patch
new file mode 100644
index 0000000..fd0c024
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/19-cve-2016-9844-zipinfo-buffer-overflow.patch
@@ -0,0 +1,32 @@
+From: "Steven M. Schweda" <sms@antinode.info>
+Subject: Fix CVE-2016-9844, buffer overflow in zipinfo
+Bug-Debian: https://bugs.debian.org/847486
+Bug-Ubuntu: https://launchpad.net/bugs/1643750
+X-Debian-version: 6.0-21
+
+Upstream-Status: Backport
+
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+
+--- a/zipinfo.c
++++ b/zipinfo.c
+@@ -1921,7 +1921,18 @@
+         ush  dnum=(ush)((G.crec.general_purpose_bit_flag>>1) & 3);
+         methbuf[3] = dtype[dnum];
+     } else if (methnum >= NUM_METHODS) {   /* unknown */
+-        sprintf(&methbuf[1], "%03u", G.crec.compression_method);
++        /* 2016-12-05 SMS.
++         * https://launchpad.net/bugs/1643750
++         * Unexpectedly large compression methods overflow
++         * &methbuf[].  Use the old, three-digit decimal format
++         * for values which fit.  Otherwise, sacrifice the "u",
++         * and use four-digit hexadecimal.
++         */
++        if (G.crec.compression_method <= 999) {
++            sprintf( &methbuf[ 1], "%03u", G.crec.compression_method);
++        } else {
++            sprintf( &methbuf[ 0], "%04X", G.crec.compression_method);
++        }
+     }
+ 
+     for (k = 0;  k < 15;  ++k)
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index 547379c..d4ee487 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -16,7 +16,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
 	file://11-cve-2014-8141-getzip64data.patch \
 	file://CVE-2015-7696.patch \
 	file://CVE-2015-7697.patch \
-        file://fix-security-format.patch \
+	file://fix-security-format.patch \
+	file://18-cve-2014-9913-unzip-buffer-overflow.patch \
+	file://19-cve-2016-9844-zipinfo-buffer-overflow.patch \
 "
 
 SRC_URI[md5sum] = "62b490407489521db863b523a7f86375"
-- 
1.9.1


