Return-Path: <anibal.limon@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id EF73D731D8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 21:47:49 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 11 Feb 2016 13:42:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,433,1449561600"; d="scan'208";a="744539669"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.155])
	by orsmga003.jf.intel.com with ESMTP; 11 Feb 2016 13:42:56 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Feb 2016 15:45:02 -0600
Message-Id: <1455227102-19832-2-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455227102-19832-1-git-send-email-anibal.limon@linux.intel.com>
References: <1455227102-19832-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] nativesdk-buildtools-perl-dummy.bb: Fix variable expansion in python code
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
X-List-Received-Date: Thu, 11 Feb 2016 21:47:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since python expansion of bb data variables is disable in order to
provide a standard interface usage for expand variables this variables
aren't expanded now so change to call d.expand('${VAR}').

This API expansion change was causing to install perl in nativesdk.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
index 9041734..9058dad 100644
--- a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
@@ -20,7 +20,7 @@ PERLPACKAGES = "nativesdk-perl \
 ALLOW_EMPTY_${PN} = "1"
 
 python populate_packages_prepend() {
-    d.appendVar('RPROVIDES_${PN}', '${PERLPACKAGES}')
-    d.appendVar('RCONFLICTS_${PN}', '${PERLPACKAGES}')
+    d.appendVar(d.expand('RPROVIDES_${PN}'), d.expand('${PERLPACKAGES}'))
+    d.appendVar(d.expand('RCONFLICTS_${PN}'), d.expand('${PERLPACKAGES}'))
 }
 
-- 
2.1.4


