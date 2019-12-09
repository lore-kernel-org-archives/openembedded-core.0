Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3010D7FC9A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2019 11:06:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Dec 2019 02:59:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; d="scan'208";a="210078950"
Received: from ntruong2-mobl.ccr.corp.intel.com (HELO shodan.fritz.box)
	([10.255.170.244])
	by fmsmga008.fm.intel.com with ESMTP; 09 Dec 2019 02:59:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Dec 2019 23:59:09 +1300
Message-Id: <464eb3ed38a95e03bd5906daff14439ae83eb953.1575888923.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1575888923.git.paul.eggleton@linux.intel.com>
References: <cover.1575888923.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] runqemu: handle tap device creation failure properly
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
X-List-Received-Date: Mon, 09 Dec 2019 11:06:35 -0000
Content-Transfer-Encoding: 8bit

If we fail to run the command to generate the tap devices then we should
show a reasonable message and then exit, without showing a traceback.
"return 1" at this point in the code does nothing because the caller
doesn't check the return, so just use sys.exit().

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/runqemu | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index f061917c4b3..ef454d67ffd 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1121,7 +1121,11 @@ class BaseConfig(object):
             uid = os.getuid()
             logger.info("Setting up tap interface under sudo")
             cmd = ('sudo', self.qemuifup, str(uid), str(gid), self.bindir_native)
-            tap = subprocess.check_output(cmd).decode('utf-8').strip()
+            try:
+                tap = subprocess.check_output(cmd).decode('utf-8').strip()
+            except subprocess.CalledProcessError as e:
+                logger.error('Setting up tap device failed:\n%s\nRun runqemu-gen-tapdevs to manually create one.' % str(e))
+                sys.exit(1)
             lockfile = os.path.join(lockdir, tap)
             self.taplock = lockfile + '.lock'
             self.acquire_taplock()
@@ -1130,7 +1134,7 @@ class BaseConfig(object):
 
         if not tap:
             logger.error("Failed to setup tap device. Run runqemu-gen-tapdevs to manually create.")
-            return 1
+            sys.exit(1)
         self.tap = tap
         tapnum = int(tap[3:])
         gateway = tapnum * 2 + 1
-- 
2.20.1


