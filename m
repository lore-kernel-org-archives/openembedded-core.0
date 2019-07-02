Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BCCD37E7CE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 02:36:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jul 2019 19:36:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,441,1557212400"; d="scan'208";a="163872288"
Received: from jsun24-mobl1.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.151.80])
	by fmsmga008.fm.intel.com with ESMTP; 01 Jul 2019 19:36:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jul 2019 14:35:55 +1200
Message-Id: <92af034e880026ec17f9b05f886e38ebfe0d5526.1562034933.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1562034933.git.paul.eggleton@linux.intel.com>
References: <cover.1562034933.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libcap-ng: do not use symlink to share files with libcap-ng-python
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
X-List-Received-Date: Tue, 02 Jul 2019 02:36:12 -0000
Content-Transfer-Encoding: 8bit

I'm not sure what's going on but having this symlink present is causing
git problems rebasing just by being present; deleting it and checking it
out again does not fix it. In any event this is not the standard way of
sharing files between recipes in the same directory - extending
FILESEXTRAPATHS is, so use that method instead.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-support/libcap-ng/libcap-ng                        | 1 -
 meta/recipes-support/libcap-ng/libcap-ng-python_0.7.9.bb        | 2 ++
 .../libcap-ng/{libcap-ng-python => libcap-ng}/python.patch      | 0
 3 files changed, 2 insertions(+), 1 deletion(-)
 delete mode 120000 meta/recipes-support/libcap-ng/libcap-ng
 rename meta/recipes-support/libcap-ng/{libcap-ng-python => libcap-ng}/python.patch (100%)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng b/meta/recipes-support/libcap-ng/libcap-ng
deleted file mode 120000
index fb7744d2932..00000000000
--- a/meta/recipes-support/libcap-ng/libcap-ng
+++ /dev/null
@@ -1 +0,0 @@
-libcap-ng-python
\ No newline at end of file
diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.7.9.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.7.9.bb
index e49b445f570..43f76dc561a 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng-python_0.7.9.bb
+++ b/meta/recipes-support/libcap-ng/libcap-ng-python_0.7.9.bb
@@ -1,5 +1,7 @@
 require libcap-ng.inc
 
+FILESEXTRAPATHS_prepend := "${THISDIR}/libcap-ng:"
+
 SUMMARY .= " - python"
 
 inherit lib_package autotools python3native
diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python/python.patch b/meta/recipes-support/libcap-ng/libcap-ng/python.patch
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng-python/python.patch
rename to meta/recipes-support/libcap-ng/libcap-ng/python.patch
-- 
2.20.1


