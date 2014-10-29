Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 92EEE7067B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 05:55:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9T5t1oD021397
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Oct 2014 22:55:01 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 28 Oct 2014 22:55:00 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<paul.eggleton@linux.intel.com>
Date: Wed, 29 Oct 2014 13:54:51 +0800
Message-ID: <4a14341061201eb3da21b96549f632b2287e93f6.1414561710.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1414561710.git.hongxu.jia@windriver.com>
References: <cover.1414561710.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] rootfs.py: tweak inner warn message catching
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
X-List-Received-Date: Wed, 29 Oct 2014 05:55:01 -0000
Content-Type: text/plain

The fix filters out irrelevant messages, and makes the catching more
accurate, the inner warn message in do_rootfs usually comes from the
output of complementary install, and pattern the format to catch it.

Here is the example of irrelevant messages:
...
|WARNING: log_check: There is a warn message in the logfile
|WARNING: log_check: Matched keyword: [warn]
|WARNING: log_check: `tmp/deploy/rpm/core2_64/pam-plugin-warn
-1.1.6-r5.0.core2_64.rpm' -> `tmp/work/intel_x86_64-wrs-linux/
wrlinux-image-installer/1.0-r0/rootfs/Packages.intel/./core2_64/
pam-plugin-warn-1.1.6-r5.0.core2_64.rpm'
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/rootfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index c4735f2..f99626c 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -348,7 +348,7 @@ class RpmRootfs(Rootfs):
         pass
 
     def _log_check_warn(self):
-        r = re.compile('(warn|Warn)')
+        r = re.compile('^(warn|Warn|NOTE: warn|NOTE: Warn)')
         log_path = self.d.expand("${T}/log.do_rootfs")
         with open(log_path, 'r') as log:
             for line in log.read().split('\n'):
-- 
1.9.1


