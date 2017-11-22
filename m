Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EB34B6093D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 21:58:57 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Nov 2017 13:58:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,438,1505804400"; d="scan'208";a="152250213"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga004.jf.intel.com with ESMTP; 22 Nov 2017 13:58:58 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Nov 2017 13:58:29 -0800
Message-Id: <1511387909-80430-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] ltp: improve reproducibility
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
X-List-Received-Date: Wed, 22 Nov 2017 21:58:58 -0000

ltp package contains several gzipped files.
Improve reproducibility of the build by ensuring the gzipped files
do not contain timestamps in their headers.

https://wiki.debian.org/ReproducibleBuilds/TimestampsInGzipHeaders

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 .../ltp/ltp/0038-generate-reproducible-gzip.patch    | 20 ++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20170929.bb            |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0038-generate-reproducible-gzip.patch

diff --git a/meta/recipes-extended/ltp/ltp/0038-generate-reproducible-gzip.patch b/meta/recipes-extended/ltp/ltp/0038-generate-reproducible-gzip.patch
new file mode 100644
index 0000000..0153ace
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0038-generate-reproducible-gzip.patch
@@ -0,0 +1,20 @@
+Do not generate timestamps in gzipped file headers.
+The timestamps prevent reproducible build.
+
+Upstream-Status: Submitted [https://github.com/linux-test-project/ltp/pull/233]
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+diff --git a/testcases/network/generate.sh b/testcases/network/generate.sh
+index 00216a6..939f792 100755
+--- a/testcases/network/generate.sh
++++ b/testcases/network/generate.sh
+@@ -55,7 +55,7 @@ fi
+ if [ ! -e "bin.sm" ] ; then
+ 	cnt=0
+ 	while [ $cnt -lt 5 ] ; do
+-		gzip -1 -c ascii.sm >> "bin.sm"
++		gzip -1 -c -n ascii.sm >> "bin.sm"
+ 		cnt=$(($cnt + 1))
+ 	done
+ fi
diff --git a/meta/recipes-extended/ltp/ltp_20170929.bb b/meta/recipes-extended/ltp/ltp_20170929.bb
index 93a59b3..8a870b3 100644
--- a/meta/recipes-extended/ltp/ltp_20170929.bb
+++ b/meta/recipes-extended/ltp/ltp_20170929.bb
@@ -49,6 +49,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0035-fix-test_proc_kill-hang.patch \
            file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
            file://0037-ltp-fix-format-security-error.patch \
+           file://0038-generate-reproducible-gzip.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


