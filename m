Return-Path: <Zhenbo.Gao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EFE7C6FFD8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 07:38:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v557cgWV029279
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 5 Jun 2017 00:38:43 -0700
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 5 Jun 2017 00:38:42 -0700
From: Zhenbo Gao <zhenbo.gao@windriver.com>
To: <ross.burton@intel.com>, <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Jun 2017 15:38:04 +0800
Message-ID: <1496648284-206244-1-git-send-email-zhenbo.gao@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] logrotate: Support system dates back to the year 1970
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
X-List-Received-Date: Mon, 05 Jun 2017 07:38:43 -0000
Content-Type: text/plain

backport commit bdbfea3 from logrotate upstream.

Signed-off-by: Zhenbo Gao <zhenbo.gao@windriver.com>
---
 ...upport-system-dates-back-to-the-year-1970.patch | 27 ++++++++++++++++++++++
 meta/recipes-extended/logrotate/logrotate_3.9.1.bb |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-extended/logrotate/logrotate/0001-Support-system-dates-back-to-the-year-1970.patch

diff --git a/meta/recipes-extended/logrotate/logrotate/0001-Support-system-dates-back-to-the-year-1970.patch b/meta/recipes-extended/logrotate/logrotate/0001-Support-system-dates-back-to-the-year-1970.patch
new file mode 100644
index 0000000..b544ec6
--- /dev/null
+++ b/meta/recipes-extended/logrotate/logrotate/0001-Support-system-dates-back-to-the-year-1970.patch
@@ -0,0 +1,27 @@
+Support system dates back to the year 1970
+
+The system time on Linux can be set back as far as 1970 (the epoch time).
+Currently logrotate stops working correctly if the time goes before 1996.
+This value (1996) appears to have been hard coded since the code was written
+back in 1996. Testing and code analysis shows this can simply be modified
+to 1970.
+
+The patch is provided by Matt Bennett <matt.bennett@alliedtelesis.co.nz>
+
+Upstream-Status: Backport +
+Signed-off-by: Zhenbo Gao <zhenbo.gao@windriver.com>
+
+diff --git a/logrotate.c.orig b/logrotate.c
+index cf8bf2c..a7dadfb 100644
+--- a/logrotate.c.orig
++++ b/logrotate.c
+@@ -2381,7 +2381,7 @@ static int readState(char *stateFilename)
+ 	}
+ 
+ 	/* Hack to hide earlier bug */
+-	if ((year != 1900) && (year < 1996 || year > 2100)) {
++	if ((year != 1900) && (year < 1970 || year > 2100)) {
+ 	    message(MESS_ERROR,
+ 		    "bad year %d for file %s in state file %s\n", year,
+ 		    argv[0], stateFilename);
+
diff --git a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb b/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
index c938d9f..4246231 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/archive/r3-9-1.tar.gz \
            file://act-as-mv-when-rotate.patch \
            file://update-the-manual.patch \
            file://disable-check-different-filesystems.patch \
+           file://0001-Support-system-dates-back-to-the-year-1970.patch \
             "
 
 SRC_URI[md5sum] = "8572b7c2cf9ade09a8a8e10098500fb3"
-- 
1.9.1


