Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3AF1278998
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 08:24:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6P8OMRX012423
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 01:24:22 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Wed, 25 Jul 2018 01:24:21 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Jul 2018 16:34:33 +0800
Message-ID: <bbc15c8c3ab4d392f24e06479f5fae863e110346.1532507399.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1532507399.git.liezhi.yang@windriver.com>
References: <cover.1532507399.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] qemurunner.py: fix is_alive() to avoid confusing with recycled pid
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
X-List-Received-Date: Wed, 25 Jul 2018 08:24:21 -0000
Content-Type: text/plain

[YOCTO #12493]

Fixed:
- qemu started with pid 10000
- qemu exited unexpectedly
- The pid 10000 is re-used by another different process.

The is_alive() returned True in such a case because both qemu_pidfile and
/proc/10000 exist, but it's another process, this patch fixed the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index c962602..864fc71 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -400,7 +400,7 @@ class QemuRunner:
         return False
 
     def is_alive(self):
-        if not self.runqemu:
+        if not self.runqemu or self.runqemu.poll() is not None:
             return False
         if os.path.isfile(self.qemu_pidfile):
             f = open(self.qemu_pidfile, 'r')
-- 
2.7.4


