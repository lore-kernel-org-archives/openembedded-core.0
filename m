Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BFE6F6E688
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 20:28:24 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 30 Mar 2016 13:28:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,418,1455004800"; d="scan'208";a="774923929"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.90])
	by orsmga003.jf.intel.com with ESMTP; 30 Mar 2016 13:28:24 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Mar 2016 14:21:42 -0600
Message-Id: <1459369302-16671-2-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1459369302-16671-1-git-send-email-anibal.limon@linux.intel.com>
References: <1459369302-16671-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] recipes-support/rng-tools: Change runlevel start from S to 2, 3, 4, 5.
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
X-List-Received-Date: Wed, 30 Mar 2016 20:28:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When using systemd as init rng-tools is causing a circular dependency
between units,

	[    7.706250] systemd[1]: basic.target: Found ordering cycle on
	basic.target/start
	[    7.706934] systemd[1]: basic.target: Found dependency on
	sysinit.target/start
	[    7.707795] systemd[1]: basic.target: Found dependency on
	rng-tools.service/start
	[    7.708692] systemd[1]: basic.target: Found dependency on
	basic.target/start
	[    7.709461] systemd[1]: basic.target: Breaking ordering cycle by
	deleting job rng-tools.service/start
	[    7.710404] systemd[1]: rng-tools.service: Job rng-tools.service/start
	deleted to break ordering cycle starting with basic.target/start

The problem is related to systemd running sysvinit scripts by default
add dependency of basic.target for sysvinit script so when sysvscript
is at rcS is added also as dependency of sysinit.target causing a
cirular dependency in this case: basic.target -> sysinit.target ->
rng-tools.service -> basic.target.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-support/rng-tools/rng-tools_5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/rng-tools/rng-tools_5.bb b/meta/recipes-support/rng-tools/rng-tools_5.bb
index 53d2d61..913a092 100644
--- a/meta/recipes-support/rng-tools/rng-tools_5.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_5.bb
@@ -43,4 +43,4 @@ do_install_append() {
 }
 
 INITSCRIPT_NAME = "rng-tools"
-INITSCRIPT_PARAMS = "start 30 S . stop 30 0 6 1 ."
+INITSCRIPT_PARAMS = "start 30 2 3 4 5 . stop 30 0 6 1 ."
-- 
2.1.4


