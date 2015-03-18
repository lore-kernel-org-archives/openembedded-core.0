Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id CB17C6AC43
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 00:36:19 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 18 Mar 2015 17:36:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,426,1422950400"; d="scan'208";a="542951790"
Received: from yctb03.ostc.intel.com (HELO yctb03.otcr.jf.intel.com)
	([10.23.219.52])
	by orsmga003.jf.intel.com with ESMTP; 18 Mar 2015 17:36:18 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Mar 2015 16:31:15 +0000
Message-Id: <0beb60149642c6811c8b650bb24412ae82e0aa1d.1426695976.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1426695976.git.anibal.limon@linux.intel.com>
References: <cover.1426695976.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1426695976.git.anibal.limon@linux.intel.com>
References: <cover.1426695976.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] sysvinit-inittab: Fix no tty in runlevel 1.
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
X-List-Received-Date: Thu, 19 Mar 2015 00:36:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When switch to runlevel 1 (Single user mode), tty was not
re-spawn and appears to be a machine hang.

[YOCTO #5336]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index eed2104..e087f0f 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -41,7 +41,7 @@ EOF
 
         for n in ${SYSVINIT_ENABLED_GETTYS}
         do
-            echo "$n:2345:respawn:${base_sbindir}/getty 38400 tty$n" >> ${D}${sysconfdir}/inittab
+            echo "$n:12345:respawn:${base_sbindir}/getty 38400 tty$n" >> ${D}${sysconfdir}/inittab
         done
         echo "" >> ${D}${sysconfdir}/inittab
     fi
-- 
1.8.4.5


