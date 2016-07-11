Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E55DE605BA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 09:53:16 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 11 Jul 2016 02:53:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,345,1464678000"; d="scan'208";a="137093216"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 11 Jul 2016 02:53:17 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 990C36A4080;
	Mon, 11 Jul 2016 02:53:09 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2016 12:43:09 +0300
Message-Id: <1468230189-13944-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] sstate.bbclass: make PV to depend on PV variable value
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
X-List-Received-Date: Mon, 11 Jul 2016 09:53:17 -0000

Currently PV is defined in meta/conf/bitbake.conf as a python
expression: "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE',
False),d)[1] or '1.0'}". As FILE is whitelisted it causes PV to
not depend on it. This causes sstate code to not detect that
PV changes when recipe filename changes.

Making PV to explicitly depend on PV variable value overrides default
behaviour. Instead of depending on python expression bitbake depends
on evaluated value of PV variable, which should fix the above
mentioned issue.

[YOCTO #9806]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/sstate.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 621dc37..d706d75 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -17,6 +17,9 @@ SSTATE_EXTRAPATH   = ""
 SSTATE_EXTRAPATHWILDCARD = ""
 SSTATE_PATHSPEC   = "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}*/${SSTATE_PKGSPEC}"
 
+# explicitly make PV to depend on evaluated value of PV variable
+PV[vardepvalue] = "${PV}"
+
 # We don't want the sstate to depend on things like the distro string
 # of the system, we let the sstate paths take care of this.
 SSTATE_EXTRAPATH[vardepvalue] = ""
-- 
2.1.4


