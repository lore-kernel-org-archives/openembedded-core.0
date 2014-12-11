Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 474417226C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 10:27:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBBAReST011515
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 11 Dec 2014 02:27:40 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 11 Dec 2014 02:27:39 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<paul.eggleton@linux.intel.com>
Date: Thu, 11 Dec 2014 18:27:25 +0800
Message-ID: <0745844a642f89d50f01a28d5f1fbeb5b71de547.1418293391.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418293391.git.hongxu.jia@windriver.com>
References: <cover.1418293391.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] busybox.inc: fix QA package-missing warnings
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
X-List-Received-Date: Thu, 11 Dec 2014 10:27:42 -0000
Content-Type: text/plain

While building busybox with QA package-missing checking enabled,
there was warning:
...
WARNING: QA Issue: package busybox-mdev not generated, but listed in PACKAGES
WARNING: QA Issue: package busybox-httpd not generated, but listed in PACKAGES
...

The config in ${B}/.config decides to generate busybox-mdev,
busybox-httpd or not. Files are copied if the packages generated.
So set PACKAGES in do_package according to the existance of files.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index bd66e4f..23115ae 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -314,6 +314,16 @@ python () {
 }
 
 python do_package_prepend () {
+    if not os.path.exists(d.expand("${D}${sysconfdir}/init.d/busybox-httpd")):
+        packages = (d.getVar('PACKAGES', True) or '').split()
+        packages.remove(d.expand('${PN}-httpd'))
+        d.setVar('PACKAGES', ' '.join(packages))
+
+    if not os.path.exists(d.expand("${D}${sysconfdir}/init.d/mdev")):
+        packages = (d.getVar('PACKAGES', True) or '').split()
+        packages.remove(d.expand('${PN}-mdev'))
+        d.setVar('PACKAGES', ' '.join(packages))
+
     # We need to load the full set of busybox provides from the /etc/busybox.links
     # Use this to see the update-alternatives with the right information
 
-- 
1.9.1


