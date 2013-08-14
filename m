Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0FDA56B7B0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 20:29:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7EKTMlS021923
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 13:29:23 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 14 Aug 2013 13:29:21 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Aug 2013 15:30:02 -0500
Message-ID: <1376512209-11622-5-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
References: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 04/11] python-smartpm: Add support to disable installing recommends
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
X-List-Received-Date: Wed, 14 Aug 2013 20:29:21 -0000
Content-Type: text/plain

In order to attempt to reduce image sizes by skipping recommended packages,
a new mode was added to smart that only evaluates required packaged.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../smart-config-ignore-all-recommends.patch       | 24 ++++++++++++++++++++++
 .../python/python-smartpm_1.4.1.bb                 |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-config-ignore-all-recommends.patch

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-config-ignore-all-recommends.patch b/meta/recipes-devtools/python/python-smartpm/smart-config-ignore-all-recommends.patch
new file mode 100644
index 0000000..a1dec2d
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smartpm/smart-config-ignore-all-recommends.patch
@@ -0,0 +1,24 @@
+Add a simple method to disable the install of recommended packages
+
+Upstream-status: Pending
+
+Usage:
+   smart config --set ignore-all-recommends=1
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: smart-1.4.1/smart/transaction.py
+===================================================================
+--- smart-1.4.1.orig/smart/transaction.py
++++ smart-1.4.1/smart/transaction.py
+@@ -611,7 +611,9 @@ class Transaction(object):
+             for prv in req.providedby:
+                 for prvpkg in prv.packages:
+                     if not reqrequired:
+-                        if pkgconf.testFlag("ignore-recommends", prvpkg):
++                        if sysconf.get("ignore-all-recommends", 0) == 1:
++                            continue
++                        elif pkgconf.testFlag("ignore-recommends", prvpkg):
+                             continue
+                     if isinst(prvpkg):
+                         found = True
diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
index b3b471a..5d673b9 100644
--- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
+++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
@@ -29,6 +29,7 @@ SRC_URI = "\
           file://smart-conflict-provider.patch \
           file://smart-flag-ignore-recommends.patch \
           file://smart-flag-exclude-packages.patch \
+          file://smart-config-ignore-all-recommends.patch \
           "
 
 SRC_URI[md5sum] = "573ef32ba177a6b3c4bf7ef04873fcb6"
-- 
1.8.1.2.545.g2f19ada


