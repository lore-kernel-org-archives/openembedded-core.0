Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.1470.1626403376126661608
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 19:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="232494655"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="232494655"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:42:59 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="656075541"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.225.206])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:42:57 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 18/28] linux-yocto-dev: base AUTOREV on specified version
Date: Fri, 16 Jul 2021 10:42:16 +0800
Message-Id: <b3228b4140575bfc20cb4e5bade0f3737d374e86.1626403078.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1626403078.git.anuj.mittal@intel.com>
References: <cover.1626403078.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

linux-yocto-dev tracks the latest mainline kernel, and uses
standard/* for that support.

Archived -dev versions are under v<kernel version>/standard/base.

This policy works, except that a released branch will still follow
the new kernel versions, causing potential breakage with newer
kernels than are supported in that release.

Rather than lock the SRCREVs and update branches in old releases,
we can preserve the AUTOREV nature of -dev, and allow them to
switch automatically to the archived branch based on the LINUX_VERSION
in the -dev recipe (which is unchanged in the release branch).

This is consistent with the other branch switching done for the
kernels and with the -dev workflow.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 84e14b6116a7d1e52051c5c80be2d8e3db67c2d7)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/kernel-yocto.bbclass | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 30f07de4ca..d38b60f519 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -614,7 +614,31 @@ do_validate_branches() {
 	# if SRCREV is AUTOREV it shows up as AUTOINC there's nothing to
 	# check and we can exit early
 	if [ "${machine_srcrev}" = "AUTOINC" ]; then
+	    linux_yocto_dev='${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "1", "", d)}'
+	    if [ -n "$linux_yocto_dev" ]; then
+		git checkout -q -f ${machine_branch}
+		ver=$(grep "^VERSION =" ${S}/Makefile | sed s/.*=\ *//)
+		patchlevel=$(grep "^PATCHLEVEL =" ${S}/Makefile | sed s/.*=\ *//)
+		sublevel=$(grep "^SUBLEVEL =" ${S}/Makefile | sed s/.*=\ *//)
+		kver="$ver.$patchlevel"
+		bbnote "dev kernel: performing version -> branch -> SRCREV validation"
+		bbnote "dev kernel: recipe version ${LINUX_VERSION}, src version: $kver"
+		echo "${LINUX_VERSION}" | grep -q $kver
+		if [ $? -ne 0 ]; then
+		    version="$(echo ${LINUX_VERSION} | sed 's/\+.*$//g')"
+		    versioned_branch="v$version/$machine_branch"
+
+		    machine_branch=$versioned_branch
+		    force_srcrev="$(git rev-parse $machine_branch 2> /dev/null)"
+		    if [ $? -ne 0 ]; then
+			bbfatal "kernel version mismatch detected, and no valid branch $machine_branch detected"
+		    fi
+
+		    bbnote "dev kernel: adjusting branch to $machine_branch, srcrev to: $force_srcrev"
+		fi
+	    else
 		bbnote "SRCREV validation is not required for AUTOREV"
+	    fi
 	elif [ "${machine_srcrev}" = "" ]; then
 		if [ "${SRCREV}" != "AUTOINC" ] && [ "${SRCREV}" != "INVALID" ]; then
 		       # SRCREV_machine_<MACHINE> was not set. This means that a custom recipe
-- 
2.31.1

