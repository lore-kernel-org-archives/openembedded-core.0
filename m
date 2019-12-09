Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 61FC97FC99
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2019 11:06:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Dec 2019 02:59:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; d="scan'208";a="210078908"
Received: from ntruong2-mobl.ccr.corp.intel.com (HELO shodan.fritz.box)
	([10.255.170.244])
	by fmsmga008.fm.intel.com with ESMTP; 09 Dec 2019 02:59:21 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Dec 2019 23:59:05 +1300
Message-Id: <d8f838d56a2e4503e17508092c351c8b9fb86106.1575888923.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1575888923.git.paul.eggleton@linux.intel.com>
References: <cover.1575888923.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] oeqa: qemu: ensure that host dump commands can be run properly
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
X-List-Received-Date: Mon, 09 Dec 2019 11:06:25 -0000
Content-Transfer-Encoding: 8bit

If runqemu fails, there is some logic to run a set of commands to dump
various bits of information that might help debug the issue
(particularly in a busy situation such as on the autobuilder). However,
when we try to run these we are inside the normal build environment
which restricts commands to be run on the host to those specified in
HOSTTOOLS. Since this isn't a place where host contamination is going to
be a problem, override PATH to a reasonable default so that we run the
actual host tools directly to avoid the issue. (Logically we would want
to use the original PATH value here, but it is not easily accessible.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/utils/dump.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
index d34e05e2b4b..6594e286a49 100644
--- a/meta/lib/oeqa/utils/dump.py
+++ b/meta/lib/oeqa/utils/dump.py
@@ -71,8 +71,10 @@ class HostDumper(BaseDumper):
     def dump_host(self, dump_dir=""):
         if dump_dir:
             self.dump_dir = dump_dir
+        env = os.environ.copy()
+        env['PATH'] = '/usr/sbin:/sbin:/usr/bin:/bin'
         for cmd in self.cmds:
-            result = runCmd(cmd, ignore_status=True)
+            result = runCmd(cmd, ignore_status=True, env=env)
             self._write_dump(cmd.split()[0], result.output)
 
 class TargetDumper(BaseDumper):
-- 
2.20.1


