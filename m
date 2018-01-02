Return-Path: <juro.bystricky@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id DE97D71B69
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jan 2018 23:16:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jan 2018 15:16:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,499,1508828400"; d="scan'208";a="20898468"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga001.jf.intel.com with ESMTP; 02 Jan 2018 15:16:23 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jan 2018 15:16:13 -0800
Message-Id: <1514934973-80578-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1514934973-80578-1-git-send-email-juro.bystricky@intel.com>
References: <1514934973-80578-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 1/1] rpm_4.14.0: clamp timestamps by default
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
X-List-Received-Date: Tue, 02 Jan 2018 23:16:23 -0000

Improve reproducibility by making sure that timestamps
in built rpms are not later than the value of SOURCE_DATE_EPOCH as
found in the environment.
Timestamps as usual when SOURCE_DATE_EPOCH is not set.

[YOCTO #12425]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 .../recipes-devtools/rpm/files/0001-support-sde.patch | 19 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.14.0.bb               |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-support-sde.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-support-sde.patch b/meta/recipes-devtools/rpm/files/0001-support-sde.patch
new file mode 100644
index 0000000..b947c62d
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-support-sde.patch
@@ -0,0 +1,19 @@
+
+Improve reproducibility: clamp timestamps by default.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+diff --git a/macros.in b/macros.in
+index d086248..af39c4a 100644
+--- a/macros.in
++++ b/macros.in
+@@ -248,7 +248,7 @@ package or when debugging this package.\
+ #	If true, make sure that timestamps in built rpms
+ #	are not later than the value of SOURCE_DATE_EPOCH.
+ #	Is ignored when SOURCE_DATE_EPOCH is not set.
+-%clamp_mtime_to_source_date_epoch 0
++%clamp_mtime_to_source_date_epoch 1
+ 
+ #	The directory where newly built binary packages will be written.
+ %_rpmdir		%{_topdir}/RPMS
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.0.bb b/meta/recipes-devtools/rpm/rpm_4.14.0.bb
index e4e9c3e..83af18e 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.0.bb
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
            file://0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch \
            file://0004-build-pack.c-remove-static-local-variables-from-buil.patch \
            file://0001-perl-disable-auto-reqs.patch \
+           file://0001-support-sde.patch \
            "
 
 PE = "1"
-- 
2.7.4


