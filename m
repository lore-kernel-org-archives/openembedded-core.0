Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DB38B6D77B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2013 10:26:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rASAQYMg004970
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2013 02:26:34 -0800 (PST)
Received: from mliu3-desktop.corp.ad.wrs.com (128.224.162.145) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Thu, 28 Nov 2013 02:26:33 -0800
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Nov 2013 18:26:29 +0800
Message-ID: <1385634389-31914-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
MIME-Version: 1.0
Subject: [PATCH] gzip: fix MakeMaker issues with using wrong SHELL/GREP
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
X-List-Received-Date: Thu, 28 Nov 2013 10:26:35 -0000
Content-Type: text/plain

Paths of shell/grep is being determined by detecting from host at configure
stage, and then will be hard coded into scripts like zgrep, this would
cause a following runtime error:
"/usr/bin/zgrep: line 230: /usr/bin/grep: No such file or directory"

Fixed by using runtime paths instead.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-extended/gzip/gzip.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/gzip/gzip.inc b/meta/recipes-extended/gzip/gzip.inc
index 6ec1dae..4b265a6 100644
--- a/meta/recipes-extended/gzip/gzip.inc
+++ b/meta/recipes-extended/gzip/gzip.inc
@@ -12,6 +12,11 @@ SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz"
 
 inherit autotools
 
+do_configure_prepend () {
+	sed '\#|/bin/sh|\$(SHELL)|#d' -i Makefile.am
+	sed 's#\(|\[@\]GREP@|\)\$(GREP)#\1/bin/grep#g' -i Makefile.am
+}
+
 do_install_append () {
 	# Rename and move files into /bin (FHS), which is typical place for gzip
 	install -d ${D}${base_bindir}
-- 
1.8.4.1


