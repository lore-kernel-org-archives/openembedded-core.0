Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A032A71A74
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 06:19:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9P6IuXC001222
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Oct 2018 23:19:12 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 24 Oct 2018 23:18:54 -0700
From: <mingli.yu@windriver.com>
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
Date: Thu, 25 Oct 2018 14:18:53 +0800
Message-ID: <20181025061853.217541-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181024071813.110075-1-mingli.yu@windriver.com>
References: <20181024071813.110075-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v4] package_manager.py: correct the deploydir when packagefeed-stability inherited
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
X-List-Received-Date: Thu, 25 Oct 2018 06:19:37 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

After create_packages_dir added in below commit:
85e72e1 package_manager: Filter to only rpms we depend upon

When add below line into conf/local.conf
INHERIT += "packagefeed-stability"

There comes below error when do_rootfs
Exception: FileExistsError: [Errno 17] File exists: '/$Prj/tmp/deploy/rpm-prediff/i586/initscripts-1.0-r155.i586.rpm' -> '/$Prj/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/oe-rootfs-repo/rpm-prediff/i586/initscripts-1.0-r155.i586.rpm'

def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydependencies):
  [snip]
  bb.utils.remove(subrepo_dir, recurse=True)
  [snip]

In create_packages_dir function, there is a logic
as bb.utils.remove(subrepo_dir, recurse=True) to
clean subrepo_dir which is actually as example is
/$Prj/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/oe-rootfs-repo/rpm.

But currently when inherit packagefeed-stability class,
the deploydir should be /$Prj/tmp/deploy/rpm-prediff,
not the default /$Prj/tmp/deploy/rpm.

If use /$Prj/tmp/deploy/rpm, then result in the
logic as below:
os.link("/$Prj/tmp/deploy/rpm-prediff/i586/initscripts-1.0-r155.i586.rpm", "/$Prj/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/oe-rootfs-repo/rpm-prediff/i586/initscripts-1.0-r155.i586.rpm")

Update to the actual deploydir to guarantee the logic
as below:
os.link("/$Prj/tmp/deploy/rpm-prediff/i586/initscripts-1.0-r155.i586.rpm", "/$Prj/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/oe-rootfs-repo/rpm/i586/initscripts-1.0-r155.i586.rpm")

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/lib/oe/package_manager.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 2cc1c752b3..882e7c429f 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -690,7 +690,10 @@ def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydependencie
             for l in f:
                 l = l.strip()
                 deploydir = os.path.normpath(deploydir)
-                dest = l.replace(deploydir, "")
+                if bb.data.inherits_class('packagefeed-stability', d):
+                    dest = l.replace(deploydir + "-prediff", "")
+                else:
+                    dest = l.replace(deploydir, "")
                 dest = subrepo_dir + dest
                 if l.endswith("/"):
                     if dest not in seendirs:
-- 
2.18.0


