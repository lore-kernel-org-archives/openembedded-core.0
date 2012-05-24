Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1SXLgB-0001Af-UK
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 02:13:24 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 May 2012 17:03:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="103547435"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.49])
	by AZSMGA002.ch.intel.com with ESMTP; 23 May 2012 17:03:08 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 17:03:02 -0700
Message-Id: <7c6800242465a59a46397518a29e632a795117d0.1337816265.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337816265.git.josh@linux.intel.com>
References: <cover.1337816265.git.josh@linux.intel.com>
In-Reply-To: <cover.1337816265.git.josh@linux.intel.com>
References: <cover.1337816265.git.josh@linux.intel.com>
Subject: [PATCH 6/7] sanity.bbclass: catch an extra exception in check_create_long_filename
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 May 2012 00:13:24 -0000

The call to bb.mkdirhier() in check_create_long_filename() can fail with an
OSError, explicitly catch this and report something useful to the user.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/classes/sanity.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index e86edf7..4b52699 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -154,6 +154,8 @@ def check_create_long_filename(filepath, pathname):
             return "Failed to create a file with a long name in %s. Please use a filesystem that does not unreasonably limit filename length.\n" % pathname
         else:
             return "Failed to create a file in %s: %s.\n" % (pathname, strerror)
+    except OSError as (errno, strerror):
+        return "Failed to create %s directory in which to run long name sanity check: %s.\n" % (pathname, strerror)
     return ""
 
 def check_connectivity(d):
-- 
1.7.7.6



