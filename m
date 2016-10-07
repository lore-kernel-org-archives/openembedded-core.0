Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C2CEE6057A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2016 21:46:08 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 07 Oct 2016 14:46:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,456,1473145200"; d="scan'208";a="177686519"
Received: from besquive-mobl2.zpn.intel.com ([10.219.5.36])
	by fmsmga004.fm.intel.com with ESMTP; 07 Oct 2016 14:46:09 -0700
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2016 16:46:26 -0500
Message-Id: <1475876786-22027-1-git-send-email-benjamin.esquivel@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] check bitbake server-only port is a number
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
X-List-Received-Date: Fri, 07 Oct 2016 21:46:08 -0000

either using the memres script or the bitbake call with --server-only
if the port is a string instead of a number then the process hangs
indefinitely causing a loop that never ends.

adding a check at the beginning for the port being a number otherwise
end prematurely.

[YOCTO#10397]

Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
---
 bitbake/lib/bb/main.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/bitbake/lib/bb/main.py b/bitbake/lib/bb/main.py
index 7f7d87b..f2f59f6 100755
--- a/bitbake/lib/bb/main.py
+++ b/bitbake/lib/bb/main.py
@@ -402,6 +402,13 @@ def bitbake_main(configParams, configuration):
         if not configParams.bind:
             raise BBMainException("FATAL: The '--server-only' option requires a name/address "
                                   "to bind to with the -B option.\n")
+        else:
+            try:
+                #Checking that the port is a number
+                int(configParams.bind.split(":")[1])
+            except (ValueError,IndexError):
+                raise BBMainException(
+                        "FATAL: Malformed host:port bind parameter")
         if configParams.remote_server:
             raise BBMainException("FATAL: The '--server-only' option conflicts with %s.\n" %
                                   ("the BBSERVER environment variable" if "BBSERVER" in os.environ \
-- 
2.7.4


