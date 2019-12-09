Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2358D7FC99
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2019 11:06:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Dec 2019 02:59:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; d="scan'208";a="210078913"
Received: from ntruong2-mobl.ccr.corp.intel.com (HELO shodan.fritz.box)
	([10.255.170.244])
	by fmsmga008.fm.intel.com with ESMTP; 09 Dec 2019 02:59:23 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Dec 2019 23:59:06 +1300
Message-Id: <0c52b603369d48178844dbe2a9ebad170aaffd48.1575888923.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1575888923.git.paul.eggleton@linux.intel.com>
References: <cover.1575888923.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] oeqa: qemu: fix width of top output in host dump
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
X-List-Received-Date: Mon, 09 Dec 2019 11:06:28 -0000
Content-Transfer-Encoding: 8bit

If runqemu fails, there is some logic to run a set of commands to dump
various bits of information that might help debug the issue
(particularly in a busy situation such as on the autobuilder). One of
those commands is "top -bn1", however top restricts the output to the
width of the calling terminal, and for whatever reason this is a little
restrictive when called from inside testimage, so set COLUMNS in the
environment to a high value to fix it. (Another way is to use the -w
option, but that is not supported by our default busybox configuration
so it will then fail when this same list of commands is used on the
target).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/utils/dump.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
index 6594e286a49..09a44329e01 100644
--- a/meta/lib/oeqa/utils/dump.py
+++ b/meta/lib/oeqa/utils/dump.py
@@ -73,6 +73,7 @@ class HostDumper(BaseDumper):
             self.dump_dir = dump_dir
         env = os.environ.copy()
         env['PATH'] = '/usr/sbin:/sbin:/usr/bin:/bin'
+        env['COLUMNS'] = '9999'
         for cmd in self.cmds:
             result = runCmd(cmd, ignore_status=True, env=env)
             self._write_dump(cmd.split()[0], result.output)
-- 
2.20.1


