Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 518A5771C6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 09:45:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8E9jxor015914
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 02:45:59 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 14 Sep 2016 02:45:58 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Sep 2016 02:45:57 -0700
Message-ID: <15e39e64de8fb94a3e22f6580bc94be28f7ea54e.1473846326.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1473846326.git.liezhi.yang@windriver.com>
References: <cover.1473846326.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] runqemu: fix a race issue on lockdir
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
X-List-Received-Date: Wed, 14 Sep 2016 09:45:59 -0000
Content-Type: text/plain

There might be a race issue when multi runqemu processess are
running at the same time:
| Traceback (most recent call last):
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-ipk/build/scripts/runqemu", line 920, in <module>
|     ret = main()
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-ipk/build/scripts/runqemu", line 911, in main
|     config.setup_network()
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-ipk/build/scripts/runqemu", line 760, in setup_network
|     self.setup_tap()
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-ipk/build/scripts/runqemu", line 697, in setup_tap
|     os.mkdir(lockdir)
| FileExistsError: [Errno 17] File exists: '/tmp/qemu-tap-locks'

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 9af13f3..b6bc0ba 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -694,7 +694,12 @@ class BaseConfig(object):
             raise Exception("runqemu-ifup, runqemu-ifdown or ip not found")
 
         if not os.path.exists(lockdir):
-            os.mkdir(lockdir)
+            # There might be a race issue when multi runqemu processess are
+            # running at the same time.
+            try:
+                os.mkdir(lockdir)
+            except FileExistsError:
+                pass
 
         cmd = '%s link' % ip
         logger.info('Running %s...' % cmd)
-- 
2.9.0


