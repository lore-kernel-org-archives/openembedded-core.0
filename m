Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 62F917016E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 14:06:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 28 Jul 2016 07:05:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,434,1464678000"; d="scan'208";a="1030826568"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 28 Jul 2016 07:05:44 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id AF83B6A4006;
	Thu, 28 Jul 2016 07:05:31 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2016 17:04:41 +0300
Message-Id: <1469714682-31488-12-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1469714682-31488-1-git-send-email-maxin.john@intel.com>
References: <1469714682-31488-1-git-send-email-maxin.john@intel.com>
Subject: [krogoth][PATCH 11/12] at: use snapshot.debian.org for SRC_URI
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
X-List-Received-Date: Thu, 28 Jul 2016 14:06:32 -0000

From: Tim Orling <timothy.t.orling@linux.intel.com>

Using ${DEBIAN_MIRROR} for SRC_URI doesn't work very well as that will only
contain releases that are currently in Debian, so currently doesn't contain
3.1.18 as unstable has moved on to 3.1.20.

So, move all of SRC_URI to the .bb so it can use snapshot.debian.org instead,
and set UPSTREAM_CHECK_URI to ${DEBIAN_MIRROR} so upstream release checking
continues to work.

[YOCTO #10005]

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/at/at_3.1.18.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/at/at_3.1.18.bb b/meta/recipes-extended/at/at_3.1.18.bb
index 93044f5..f533f3c 100644
--- a/meta/recipes-extended/at/at_3.1.18.bb
+++ b/meta/recipes-extended/at/at_3.1.18.bb
@@ -15,7 +15,7 @@ PAM_DEPS = "libpam libpam-runtime pam-plugin-env pam-plugin-limits"
 RCONFLICTS_${PN} = "atd"
 RREPLACES_${PN} = "atd"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz;subdir=${BP} \
+SRC_URI += "http://snapshot.debian.org/archive/debian/20160509T100042Z/pool/main/a/${BPN}/${BPN}_${PV}.orig.tar.gz;subdir=${BP} \
     file://fix_parallel_build_error.patch \
     file://posixtm.c \
     file://posixtm.h \
@@ -28,6 +28,8 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz;subdir=${BP} \
     file://configure-fix-with-without-selinux.patch \
     "
 
+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/at/"
+
 PAM_SRC_URI = "file://pam.conf.patch \
                file://configure-add-enable-pam.patch"
 
-- 
2.4.0


