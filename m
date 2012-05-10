Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1SSHKI-00045n-H5
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 02:33:50 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 May 2012 17:22:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="164204780"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.13.30])
	by fmsmga002.fm.intel.com with ESMTP; 09 May 2012 17:22:50 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2012 17:22:47 -0700
Message-Id: <4048abda9d53e155e0802663af9c78f542499e8e.1336608479.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336608479.git.josh@linux.intel.com>
References: <cover.1336608479.git.josh@linux.intel.com>
In-Reply-To: <cover.1336608479.git.josh@linux.intel.com>
References: <cover.1336608479.git.josh@linux.intel.com>
Subject: [RFC PATCH 2/3] lib/bb/siggen.py: create permissive files and directories
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

Create signature files, and the directories which contain them, with
rwx for everyone so that they are easily shared with different users
of the same machine.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 bitbake/lib/bb/siggen.py |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/bitbake/lib/bb/siggen.py b/bitbake/lib/bb/siggen.py
index 8c79b17..bd6d59b 100644
--- a/bitbake/lib/bb/siggen.py
+++ b/bitbake/lib/bb/siggen.py
@@ -201,7 +201,12 @@ class SignatureGeneratorBasic(SignatureGenerator):
             for dep in data['runtaskdeps']:
                 data['runtaskhashes'][dep] = self.taskhash[dep]
 
-        p = pickle.Pickler(file(sigfile, "wb"), -1)
+        # Create file with permissive (0777) read/write for easier sharing
+        f = os.fdopen(os.open(sigfile, os.O_RDWR|os.O_CREAT), "wb")
+        # os.open() and os.fdopen() are affected by the users umask so brute force
+        # the permissions with a call to chmod
+        os.chmod(sigfile, 0777)
+        p = pickle.Pickler(f, -1)
         p.dump(data)
 
     def dump_sigs(self, dataCache):
-- 
1.7.7.6



