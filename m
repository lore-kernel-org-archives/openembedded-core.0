Return-Path: <jukka.rissanen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 47FC56B1F2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 15:01:45 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 01 Aug 2013 08:01:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,795,1367996400"; d="scan'208";a="276321861"
Received: from sorvi.fi.intel.com ([10.237.72.152])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Aug 2013 08:01:44 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Aug 2013 18:01:38 +0300
Message-Id: <1375369300-13471-3-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1375369300-13471-1-git-send-email-jukka.rissanen@linux.intel.com>
References: <1375369300-13471-1-git-send-email-jukka.rissanen@linux.intel.com>
Subject: [PATCH v2 2/4] ofono: Move bluetooth enabling to .inc file
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
X-List-Received-Date: Thu, 01 Aug 2013 15:01:46 -0000

Moving the bluetooth enabling to ofono.inc from .bb file as
it makes more sense to have bluetooth always checked.

Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
 meta/recipes-connectivity/ofono/ofono.inc     | 1 +
 meta/recipes-connectivity/ofono/ofono_1.12.bb | 1 -
 meta/recipes-connectivity/ofono/ofono_git.bb  | 4 ----
 3 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-connectivity/ofono/ofono.inc
index b0e8020..7adc667 100644
--- a/meta/recipes-connectivity/ofono/ofono.inc
+++ b/meta/recipes-connectivity/ofono/ofono.inc
@@ -14,6 +14,7 @@ INITSCRIPT_PARAMS = "defaults 22"
 
 EXTRA_OECONF += "\
     ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdir=${systemd_unitdir}/system/', '--with-systemdunitdir=', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
 "
 SYSTEMD_SERVICE_${PN} = "ofono.service"
 
diff --git a/meta/recipes-connectivity/ofono/ofono_1.12.bb b/meta/recipes-connectivity/ofono/ofono_1.12.bb
index 44ab0a6..32c8bc2 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.12.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.12.bb
@@ -14,6 +14,5 @@ SRC_URI[sha256sum] = "733b75bfd1b2a1925b6de532989c496b8ae17a746691120ef64cceb00b
 
 EXTRA_OECONF += "\
     --enable-test \
-    ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
 "
 CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
diff --git a/meta/recipes-connectivity/ofono/ofono_git.bb b/meta/recipes-connectivity/ofono/ofono_git.bb
index f79f34f..db0bf73 100644
--- a/meta/recipes-connectivity/ofono/ofono_git.bb
+++ b/meta/recipes-connectivity/ofono/ofono_git.bb
@@ -8,10 +8,6 @@ PR = "r5"
 SRC_URI  = "git://git.kernel.org/pub/scm/network/ofono/ofono.git;protocol=git \
 	    file://ofono"
 
-EXTRA_OECONF += "\
-    ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
-"
-
 do_configure_prepend () {
   ${S}/bootstrap
 }
-- 
1.7.11.7


