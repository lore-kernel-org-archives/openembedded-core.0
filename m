Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8477071AA7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 13:40:26 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 31 Oct 2016 06:40:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,575,1473145200"; d="scan'208";a="780336169"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 31 Oct 2016 06:40:26 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 93D786A4080;
	Mon, 31 Oct 2016 06:39:50 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Oct 2016 15:40:18 +0200
Message-Id: <eadfd186c794a4ba465421d25d6bf94f0c22da7c.1477914497.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <c1588f91c5cfe65c0daede3a52ed35ee84f3e612.1477914497.git.jussi.kukkonen@intel.com>
References: <c1588f91c5cfe65c0daede3a52ed35ee84f3e612.1477914497.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477914497.git.jussi.kukkonen@intel.com>
References: <cover.1477914497.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/3] distcc: Don't remove users/groups in postrm
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
X-List-Received-Date: Mon, 31 Oct 2016 13:40:26 -0000

There's no way to ensure that files owned by the users aren't left
on the system at postrm time: Removing the user would mean those
files are now owned by a non-existing user, and later may be owned
by a completely unrelated new user.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-devtools/distcc/distcc_3.2.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-devtools/distcc/distcc_3.2.bb b/meta/recipes-devtools/distcc/distcc_3.2.bb
index c084ad2..ea3d7c1 100644
--- a/meta/recipes-devtools/distcc/distcc_3.2.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.2.bb
@@ -65,7 +65,3 @@ FILES_${PN} = " ${sysconfdir} \
 		${systemd_unitdir}/system/distcc.service"
 FILES_distcc-distmon-gnome = "  ${bindir}/distccmon-gnome \
 				${datadir}/distcc"
-
-pkg_postrm_${PN} () {
-	deluser distcc || true
-}
-- 
2.1.4


