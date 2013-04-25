Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefanx.stanacar@intel.com>) id 1UVLIV-0001Jt-Tn
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 14:29:41 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Apr 2013 05:11:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,550,1363158000"; d="scan'208";a="324980044"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 25 Apr 2013 05:10:59 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.149])
	by linux.intel.com (Postfix) with ESMTP id 093942C8001
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2013 05:10:50 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2013 15:11:00 +0300
Message-Id: <2671dbce89693f9d607b299640a10c46176b9f46.1366891465.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1366891465.git.stefanx.stanacar@intel.com>
References: <cover.1366891465.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1366891465.git.stefanx.stanacar@intel.com>
References: <cover.1366891465.git.stefanx.stanacar@intel.com>
Subject: [PATCH 2/3] scripts/contrib/build-perf-test.sh: skip network sanity tests
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Apr 2013 12:30:08 -0000
X-List-Received-Date: Thu, 25 Apr 2013 12:30:08 -0000

When your proxy/network connection is unstable the network sanity test
which runs before every build (because we wipe all the files in the build dir)
can influence build time. Appending  CONNECTIVITY_CHECK_URIS = ""
in local.conf will disable the check.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 scripts/contrib/build-perf-test.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/contrib/build-perf-test.sh b/scripts/contrib/build-perf-test.sh
index f48220a..ee30409 100755
--- a/scripts/contrib/build-perf-test.sh
+++ b/scripts/contrib/build-perf-test.sh
@@ -165,6 +165,10 @@ else
     echo "DL_DIR = \"$clonedir/build-perf-test/downloads\"" >> conf/local.conf
 fi
 
+# Sometimes I've noticed big differences in timings for the same commit, on the same machine
+# Disabling the network sanity check helps a bit (because of my crappy network connection and/or proxy)
+echo "CONNECTIVITY_CHECK_URIS =\"\"" >> conf/local.conf
+
 #
 # Functions
 #
-- 
1.8.1.4



