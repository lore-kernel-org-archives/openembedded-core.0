Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D946C605FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 14:41:06 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 20 Apr 2016 07:41:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,510,1455004800"; d="scan'208";a="88680070"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.165])
	by fmsmga004.fm.intel.com with ESMTP; 20 Apr 2016 07:41:06 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Apr 2016 09:41:15 -0500
Message-Id: <1461163275-3986-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] recipe-devtools/rpm: Add PACKAGECONFIG for tomcrypt and disable by default
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
X-List-Received-Date: Wed, 20 Apr 2016 14:41:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When try to build rpm-native if configure detects the ability of tomcrypt
library it suppose that tommath library is available causing a failure
on configure.

	configure:54156: checking for magic_open in -lmagic
	.... gcc compile long line trying to link to -ltommath ....
	/usr/bin/ld: cannot find -ltommath
	collect2: error: ld returned 1 exit status

Since tomcrypt is an optional feature add a PACKAGECONFIG for it and
disable by default.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.16.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index cbdca88..b804213 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -302,6 +302,8 @@ PACKAGECONFIG[tcl] = "--with-tcl,--without-tcl,tcl,"
 
 PACKAGECONFIG[augeas] = "--with-augeas,--without-augeas,augeas,"
 
+PACKAGECONFIG[tomcrypt] = "--with-tomcrypt=yes,--with-tomcrypt=no,,"
+
 EXTRA_OECONF += "--verbose \
 		--sysconfdir=${sysconfdir} \
 		--with-file \
-- 
2.1.4


