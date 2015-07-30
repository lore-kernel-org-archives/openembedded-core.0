Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BC14075A60
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 06:40:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6U6e3Bu004074
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 29 Jul 2015 23:40:03 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.235.1; Wed, 29 Jul 2015 23:39:43 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Thu, 30 Jul 2015 14:37:23 +0800
Message-ID: <e2cc770155e7daa41e37f2f7e930f8a2da61ffdc.1438237957.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1438237957.git.kai.kang@windriver.com>
References: <cover.1438237957.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] smartpm: set noprogress for pycurl
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
X-List-Received-Date: Thu, 30 Jul 2015 06:40:06 -0000
Content-Type: text/plain

Set NOPROGRESS for pycurl just as same as default operation in pycurl
module itself. If set NOPROGRESS with 0 for pycurl, it causes dead lock
issue of Python GIL when call smart library by python gui just like
pygtk.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../smart-set-noprogress-for-pycurl.patch            | 20 ++++++++++++++++++++
 meta/recipes-devtools/python/python-smartpm_git.bb   |  1 +
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
diff --git a/meta/recipes-devtools/python/python-smartpm_git.bb b/meta/recipes-devtools/python/python-smartpm_git.bb
index 163461e..8b974b0 100644
--- a/meta/recipes-devtools/python/python-smartpm_git.bb
+++ b/meta/recipes-devtools/python/python-smartpm_git.bb
@@ -22,6 +22,7 @@ SRC_URI = "\
           file://smart-rpm4-fixes.patch \
           file://smart-add-for-rpm-ignoresize-check.patch \
           file://smart-already-installed-message.patch \
+          file://smart-set-noprogress-for-pycurl.patch \
          "
 
 SRCREV = "407a7eca766431257dcd1da15175cc36a1bb22d0"
-- 
1.9.1


