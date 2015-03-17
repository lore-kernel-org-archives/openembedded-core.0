Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2384373923
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 16:06:29 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 17 Mar 2015 09:06:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,417,1422950400"; d="scan'208";a="542145567"
Received: from gwu9-mobl.amr.corp.intel.com (HELO
	alimon-ThinkPad-W540.amr.corp.intel.com) ([10.252.136.33])
	by orsmga003.jf.intel.com with ESMTP; 17 Mar 2015 09:05:24 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Mar 2015 10:06:24 -0600
Message-Id: <16014a3e172b8571ad7eb8b4185fb3b7d4b9a14a.1426608243.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1426608243.git.anibal.limon@linux.intel.com>
References: <cover.1426608243.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1426608243.git.anibal.limon@linux.intel.com>
References: <cover.1426608243.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv2 2/3] systemtap: Fix build in x32 ABI
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
X-List-Received-Date: Tue, 17 Mar 2015 16:06:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a patch for fix printing of time_t value that is long long int
in x32 ABI instead of long int.

[YOCTO #7423]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 .../systemtap/systemtap/x32_abi_time.patch         | 34 ++++++++++++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.inc    |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/x32_abi_time.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/x32_abi_time.patch b/meta/recipes-kernel/systemtap/systemtap/x32_abi_time.patch
new file mode 100644
index 0000000..28a7eae
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/x32_abi_time.patch
@@ -0,0 +1,34 @@
+Fix time_t print because in x32 ABI is long long int instead of long int.
+
+Upstream-Status: Pending
+
+Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
+
+diff --git a/cache.cxx b/cache.cxx
+index 3546b30..19c77ca 100644
+--- a/cache.cxx
++++ b/cache.cxx
+@@ -294,7 +294,11 @@ clean_cache(systemtap_session& s)
+         {
+           //interval not passed, don't continue
+           if (s.verbose > 1)
++#if defined(__x86_64__) && defined (__ILP32__)
++            clog << _F("Cache cleaning skipped, interval not reached %lld s / %lu s.",
++#else
+             clog << _F("Cache cleaning skipped, interval not reached %lu s / %lu s.",
++#endif
+                        (current_time.tv_sec-sb.st_mtime), cache_clean_interval)  << endl;
+           return;
+         }
+@@ -302,7 +306,11 @@ clean_cache(systemtap_session& s)
+         {
+           //interval reached, continue
+           if (s.verbose > 1)
++#if defined(__x86_64__) && defined (__ILP32__)
++            clog << _F("Cleaning cache, interval reached %lld s > %lu s.",
++#else
+             clog << _F("Cleaning cache, interval reached %lu s > %lu s.",
++#endif
+                        (current_time.tv_sec-sb.st_mtime), cache_clean_interval)  << endl;
+         }
+ 
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 4a1f4fb..59a578d 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -8,6 +8,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://obsolete_automake_macros.patch \
            file://system_map_location.patch \
            file://configure-allow-to-disable-libvirt.patch \
+           file://x32_abi_time.patch \
           "
 
 # systemtap doesn't support mips
-- 
1.9.1


