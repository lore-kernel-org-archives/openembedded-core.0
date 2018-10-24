Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 557C379870
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2018 07:19:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9O7IPaO029301
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Oct 2018 00:18:35 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 24 Oct 2018 00:18:14 -0700
From: <mingli.yu@windriver.com>
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
Date: Wed, 24 Oct 2018 15:18:13 +0800
Message-ID: <20181024071813.110075-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [PATCH] package_manager.py: check the dest before create hard link
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
X-List-Received-Date: Wed, 24 Oct 2018 07:19:01 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

After create_packages_dir added in below commit:
85e72e1 package_manager: Filter to only rpms we depend upon

When add below line into conf/local.conf
INHERIT += "packagefeed-stability"

There comes below error when do_rootfs
Exception: FileExistsError: [Errno 17] File exists: '/$Prj/tmp/deploy/rpm-prediff/i586/initscripts-1.0-r155.i586.rpm' -> '/$Prj/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/oe-rootfs-repo/rpm-prediff/i586/initscripts-1.0-r155.i586.rpm'

Add the check before create hard link to
avoid the above error.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/lib/oe/package_manager.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 2cc1c752b3..5d4739d66d 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -703,7 +703,8 @@ def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydependencie
                     bb.utils.mkdirhier(destdir)
                     seendirs.add(destdir)
                 try:
-                    os.link(l, dest)
+                    if not os.path.exists(dest):
+                        os.link(l, dest)
                 except OSError as err:
                     if err.errno == errno.EXDEV:
                         bb.utils.copyfile(l, dest)
-- 
2.18.0


