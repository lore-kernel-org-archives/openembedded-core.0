Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7BC71705EA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 15:16:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6FFGAoQ013412
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 08:16:11 -0700 (PDT)
Received: from pek-kkang-d1.corp.ad.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Tue, 15 Jul 2014 08:16:09 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jul 2014 23:15:55 +0800
Message-ID: <1405437355-13212-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH] smart: set noprogress for pycurl
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
X-List-Received-Date: Tue, 15 Jul 2014 15:16:12 -0000
Content-Type: text/plain

Set NOPROGRESS for pycurl just as same as default operation in pycurl
module itself. If set NOPROGRESS with 0 for pycurl, it causes dead lock
issue of Python GIL when call smart library by python gui just like
pygtk.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../smart-set-noprogress-for-pycurl.patch            | 20 ++++++++++++++++++++
 meta/recipes-devtools/python/python-smartpm_1.4.1.bb |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-set-noprogress-for-pycurl.patch

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-set-noprogress-for-pycurl.patch b/meta/recipes-devtools/python/python-smartpm/smart-set-noprogress-for-pycurl.patch
new file mode 100644
index 0000000..2885998
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smartpm/smart-set-noprogress-for-pycurl.patch
@@ -0,0 +1,20 @@
+Set NOPROGRESS for pycurl just as same as default operation in pycurl module itself.
+If set NOPROGRESS with 0 for pycurl, it causes dead lock issue of Python GIL when
+call smart library by python gui just like pygtk.
+
+Upstream-Status: Pending
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff -u smart-1.4.1/smart.orig/fetcher.py smart-1.4.1/smart/fetcher.py
+--- smart-1.4.1/smart.orig/fetcher.py	2014-07-15 16:42:19.240437080 +0800
++++ smart-1.4.1/smart/fetcher.py	2014-07-15 17:02:37.812470289 +0800
+@@ -1720,7 +1720,7 @@
+                         handle.setopt(pycurl.OPT_FILETIME, 1)
+                         handle.setopt(pycurl.LOW_SPEED_LIMIT, 1)
+                         handle.setopt(pycurl.LOW_SPEED_TIME, SOCKETTIMEOUT)
+-                        handle.setopt(pycurl.NOPROGRESS, 0)
++                        handle.setopt(pycurl.NOPROGRESS, 1)
+                         handle.setopt(pycurl.PROGRESSFUNCTION, progress)
+                         handle.setopt(pycurl.WRITEDATA, local)
+                         handle.setopt(pycurl.FOLLOWLOCATION, 1)
diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
index 0971579..8eb2a25 100644
--- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
+++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
@@ -32,6 +32,7 @@ SRC_URI = "\
           file://smart-config-ignore-all-recommends.patch \
           file://smart-attempt.patch \
           file://smart-filename-NAME_MAX.patch \
+          file://smart-set-noprogress-for-pycurl.patch \
           "
 
 SRC_URI[md5sum] = "573ef32ba177a6b3c4bf7ef04873fcb6"
-- 
1.9.1


