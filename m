Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 35DC7771F1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 07:11:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7A7BfgZ016896
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 Aug 2016 00:11:41 -0700 (PDT)
Received: from localhost (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 10 Aug 2016 00:11:40 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Aug 2016 15:11:18 +0800
Message-ID: <6a32789791d5fc3208d57edde7b217bec5f2f78e.1470812191.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1470812191.git.yi.zhao@windriver.com>
References: <cover.1470812191.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.178]
Cc: akuster@mvista.com
Subject: [PATCH 3/5] tiff: Security fix CVE-2016-3186
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
X-List-Received-Date: Wed, 10 Aug 2016 07:11:41 -0000
Content-Type: text/plain

CVE-2016-3186 libtiff: buffer overflow in the readextension function in
gif2tiff.c allows remote attackers to cause a denial of service via a
crafted GIF file

External References:
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3186
https://bugzilla.redhat.com/show_bug.cgi?id=1319503

Patch from:
https://bugzilla.redhat.com/attachment.cgi?id=1144235&action=diff

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libtiff/files/CVE-2016-3186.patch              | 24 ++++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.6.bb      |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3186.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2016-3186.patch b/meta/recipes-multimedia/libtiff/files/CVE-2016-3186.patch
new file mode 100644
index 0000000..4a08aba
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2016-3186.patch
@@ -0,0 +1,24 @@
+Buffer overflow in the readextension function in gif2tiff.c
+allows remote attackers to cause a denial of service via a crafted GIF file.
+
+External References:
+https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3186
+https://bugzilla.redhat.com/show_bug.cgi?id=1319503
+
+CVE: CVE-2016-3186
+Upstream-Status: Backport (RedHat)
+https://bugzilla.redhat.com/attachment.cgi?id=1144235&action=diff
+
+Signed-off-by: Yi Zhao <yi.zhao@windirver.com>
+
+--- tiff-4.0.6/tools/gif2tiff.c	2016-04-06 15:43:01.586048341 +0200
++++ tiff-4.0.6/tools/gif2tiff.c	2016-04-06 15:48:05.523207710 +0200
+@@ -349,7 +349,7 @@
+     int status = 1;
+ 
+     (void) getc(infile);
+-    while ((count = getc(infile)) && count <= 255)
++    while ((count = getc(infile)) && count >= 0 && count <= 255)
+         if (fread(buf, 1, count, infile) != (size_t) count) {
+             fprintf(stderr, "short read from file %s (%s)\n",
+                     filename, strerror(errno));
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
index 0506475..36cb34e 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
@@ -8,6 +8,7 @@ SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2015-8665_8683.patch \
            file://CVE-2015-8781.patch \
            file://CVE-2015-8784.patch \
+           file://CVE-2016-3186.patch \
           "
 
 SRC_URI[md5sum] = "d1d2e940dea0b5ad435f21f03d96dd72"
-- 
2.7.4


