Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1SSHKH-00045n-R8
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 02:33:50 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 May 2012 17:22:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="164204779"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.13.30])
	by fmsmga002.fm.intel.com with ESMTP; 09 May 2012 17:22:50 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2012 17:22:46 -0700
Message-Id: <85fc58ba361854e47f2cd078ab62b8f28ca95324.1336608479.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336608479.git.josh@linux.intel.com>
References: <cover.1336608479.git.josh@linux.intel.com>
In-Reply-To: <cover.1336608479.git.josh@linux.intel.com>
References: <cover.1336608479.git.josh@linux.intel.com>
Subject: [RFC PATCH 1/3] lib/bb/utils.py: add optional mode parameter to bb.utils.mkdirhier()
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
X-List-Received-Date: Thu, 10 May 2012 00:33:50 -0000

The optional parameter should be an octal file mode representing the
desired permissions of the created directory. If mode isn;t specified
use 0777. This is the default of os.makedirs() yet is not often what
the created directory ends up with due to umask affecting the call.

The use of chmod() in this patch ensures that whatever octal is
passed are the permissions the directory will have after creation.
This is a behaviour change...

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 bitbake/lib/bb/utils.py |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/bitbake/lib/bb/utils.py b/bitbake/lib/bb/utils.py
index 7a73419..33206fe 100644
--- a/bitbake/lib/bb/utils.py
+++ b/bitbake/lib/bb/utils.py
@@ -531,13 +531,16 @@ def prune_suffix(var, suffixes, d):
             return var.replace(suffix, "")
     return var
 
-def mkdirhier(directory):
+def mkdirhier(directory, mode=0777):
     """Create a directory like 'mkdir -p', but does not complain if
     directory already exists like os.makedirs
     """
 
     try:
-        os.makedirs(directory)
+        os.makedirs(directory, mode)
+        # We can't rely on makedirs having set the mode correctly as it is
+        # affected by umask
+        os.chmod(directory, mode)
     except OSError as e:
         if e.errno != errno.EEXIST:
             raise e
-- 
1.7.7.6



