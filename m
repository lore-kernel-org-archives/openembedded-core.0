Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9654C6013D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 19:32:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 13 May 2015 12:32:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,422,1427785200"; d="scan'208";a="728740167"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by orsmga002.jf.intel.com with ESMTP; 13 May 2015 12:32:04 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 May 2015 11:26:27 +0000
Message-Id: <1431516387-42833-1-git-send-email-mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH] sanity.bbclass: Increased verbosity for connectivity check
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
X-List-Received-Date: Wed, 13 May 2015 19:32:04 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

The connectivity sanity error doesn't tell you which URL failed to fetch nor how it failed.

This provides the URL that failed and why it failed using BBFetchException messages during the connectivity check.

[YOCTO #7592]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/sanity.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index f8b9fac..d601e91 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -278,12 +278,12 @@ def check_connectivity(d):
         try:
             fetcher = bb.fetch2.Fetch(test_uris, data)
             fetcher.checkstatus()
-        except Exception:
+        except Exception as err:
             # Allow the message to be configured so that users can be
             # pointed to a support mechanism.
             msg = data.getVar('CONNECTIVITY_CHECK_MSG', True) or ""
             if len(msg) == 0:
-                msg = "Failed to fetch test data from the network. Please ensure your network is configured correctly.\n"
+                msg = "%s. Please ensure your network is configured correctly.\n" % err 
             retval = msg
 
     return retval
-- 
1.8.4.5


