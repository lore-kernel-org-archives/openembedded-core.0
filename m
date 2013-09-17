Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E2DF56C7AB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 02:35:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8H2Z5iX025251
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 19:35:55 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Mon, 16 Sep 2013 19:35:38 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Sep 2013 22:35:02 -0400
Message-ID: <115a322c3e8d0998cb24ade3ce11ca0a2b0b211c.1379384999.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1379384999.git.liezhi.yang@windriver.com>
References: <cover.1379384999.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] python-smartpm: truncate the filename to meet NAME_MAX
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
X-List-Received-Date: Tue, 17 Sep 2013 02:35:55 -0000
Content-Type: text/plain

There is a "File name too long" error when len(TMPDIR) = 410, this is
because the function getLocalPath() converts the filepath into the
filename, so there would be the error when len(filename)
> NAME_MAX, truncate the filename to meet NAME_MAX will fix the problem.

[YOCTO #5201]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../python-smartpm/smart-filename-NAME_MAX.patch   |   35 ++++++++++++++++++++
 .../python/python-smartpm_1.4.1.bb                 |    1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-filename-NAME_MAX.patch

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-filename-NAME_MAX.patch b/meta/recipes-devtools/python/python-smartpm/smart-filename-NAME_MAX.patch
new file mode 100644
index 0000000..22794a7
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smartpm/smart-filename-NAME_MAX.patch
@@ -0,0 +1,35 @@
+From a17998b6be3319ae476a64f366737bc267a53a8a Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Mon, 16 Sep 2013 05:54:13 -0400
+Subject: [PATCH] fetcher.py: truncate the filename to meet NAME_MAX
+
+The function getLocalPath() converts the filepath into the filename,
+there would be a "File name too long" error when len(filename) >
+NAME_MAX, truncate it to meet NAME_MAX will fix the problem.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ smart/fetcher.py |    8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/smart/fetcher.py b/smart/fetcher.py
+--- a/smart/fetcher.py
++++ b/smart/fetcher.py
+@@ -139,6 +139,14 @@ class Fetcher(object):
+             filename = os.path.basename(path)
+         if self._localpathprefix:
+             filename = self._localpathprefix+filename
++        # pathconf requires the path existed
++        if not os.path.exists(self._localdir):
++            os.makedirs(self._localdir)
++        name_max = os.pathconf(self._localdir, 'PC_NAME_MAX')
++        # The length of the filename should be less than NAME_MAX
++        if len(filename) > name_max:
++            iface.debug(_("Truncate %s to %s") % (filename, filename[-name_max:]))
++            filename = filename[-name_max:]
+         return os.path.join(self._localdir, filename)
+ 
+     def setForceCopy(self, value):
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
index f406d69..f349469 100644
--- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
+++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
@@ -31,6 +31,7 @@ SRC_URI = "\
           file://smart-flag-exclude-packages.patch \
           file://smart-config-ignore-all-recommends.patch \
           file://smart-attempt.patch \
+          file://smart-filename-NAME_MAX.patch \
           "
 
 SRC_URI[md5sum] = "573ef32ba177a6b3c4bf7ef04873fcb6"
-- 
1.7.10.4


