Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4D8627304A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 15:26:55 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 07:26:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="936869703"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga003.jf.intel.com with ESMTP; 22 Feb 2017 07:26:51 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 17:26:50 +0200
Message-Id: <20170222152650.32079-1-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH] license.bbclass: run chown only under pseudo
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
X-List-Received-Date: Wed, 22 Feb 2017 15:26:56 -0000

The copy_license_files() function in license.bbclass is called in two
different contexts. First, it is run as part of the do_populate_lic
task. In addition, it is called from do_package task when
LICENSE_CREATE_PACKAGE is enabled. The function has code that changes
the owner of license files to root which is meant only to happend in the
latter case - i.e. under do_package which is run under pseudo.
Previously, the code was blindly always running chown and just ignored
errors that happened when running from do_populate_lic. This patch
changes it to be more intelligent, only doing chown when running under
pseudo.

[YOCTO #10897]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/license.bbclass | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 9923aac..96c0040 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -364,18 +364,9 @@ def copy_license_files(lic_files_paths, destdir):
                         canlink = False
                     else:
                         raise
-                try:
-                    if canlink:
-                        os.chown(dst,0,0)
-                except OSError as err:
-                    if err.errno in (errno.EPERM, errno.EINVAL):
-                        # Suppress "Operation not permitted" error, as
-                        # sometimes this function is not executed under pseudo.
-                        # Also ignore "Invalid argument" errors that happen in
-                        # some (unprivileged) container environments (no root).
-                        pass
-                    else:
-                        raise
+                # Only chown if we did hardling, and, we're running under pseudo
+                if canlink and os.environ.get('PSEUDO_DISABLED') == '0':
+                    os.chown(dst,0,0)
             if not canlink:
                 begin_idx = int(beginline)-1 if beginline is not None else None
                 end_idx = int(endline) if endline is not None else None
-- 
2.10.2


