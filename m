Return-Path: <tom.zanussi@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F21D36D309
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 14:24:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Oct 2013 07:24:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="396768657"
Received: from unknown (HELO localhost) ([10.255.14.222])
	by orsmga001.jf.intel.com with ESMTP; 22 Oct 2013 07:24:17 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2013 09:24:04 -0500
Message-Id: <014a56fc9394cafb6de0258ba99831ce5f58f52e.1382451106.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <9872888983dba131e54cd489a1c5b9ef05728681.1382451106.git.tom.zanussi@linux.intel.com>
References: <9872888983dba131e54cd489a1c5b9ef05728681.1382451106.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1382451106.git.tom.zanussi@linux.intel.com>
References: <cover.1382451106.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 09/10] wic: Make find_binary_path() more user-friendly
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
X-List-Received-Date: Tue, 22 Oct 2013 14:24:16 -0000

find_binary_path() is useful, but if the binary isn't found, it prints
a stacktrace and a less-than-useful message.  Users complain when they
get stacktraces for things they can act on, so remove the stacktrace
and tell the user what the problem is.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/utils/fs_related.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/mic/utils/fs_related.py b/scripts/lib/mic/utils/fs_related.py
index 6161735..dd420e8 100644
--- a/scripts/lib/mic/utils/fs_related.py
+++ b/scripts/lib/mic/utils/fs_related.py
@@ -57,7 +57,10 @@ def find_binary_path(binary):
         bin_path = "%s/%s" % (path, binary)
         if os.path.exists(bin_path):
             return bin_path
-    raise CreatorError("Command '%s' is not available." % binary)
+
+    print "External command '%s' not found, exiting." % binary
+    print "  (Please install '%s' on your host system)" % binary
+    sys.exit(1)
 
 def makedirs(dirname):
     """A version of os.makedirs() that doesn't throw an
-- 
1.8.3.1


