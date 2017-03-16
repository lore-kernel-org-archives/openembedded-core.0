Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3104D77589
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 10:13:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2GADYFk003344
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 03:13:34 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Mar 2017 03:13:33 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Mar 2017 03:13:26 -0700
Message-ID: <6217059cf379bf40fee14ee2bda8f47d179781f0.1489657029.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1489657029.git.liezhi.yang@windriver.com>
References: <cover.1489657029.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] runqemu: only boot ramfs when specified
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
X-List-Received-Date: Thu, 16 Mar 2017 10:13:33 -0000
Content-Type: text/plain

This can fix a problem:
IMAGE_FSTYPES += "iso"
$ bitbake core-image-minimal
$ runqemu qemux86

It may boot core-image-minimal-initramfs rather than core-image-minimal, this
is not what we want usually. This patch makes it avoid booting ramfs when there
are other choices, or when it is specified, for example, "runqemu qemux86 ramfs"

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index d43006f..0918101 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -660,7 +660,15 @@ class BaseConfig(object):
                 logger.info('Running %s...' % cmd)
                 qbs = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
                 if qbs:
-                    self.qemuboot = qbs.split()[0]
+                    for qb in qbs.split():
+                        # Don't use initramfs when other choices unless fstype is ramfs
+                        if '-initramfs-' in os.path.basename(qb) and self.fstype != 'cpio.gz':
+                                continue
+                        self.qemuboot = qb
+                        break
+                    if not self.qemuboot:
+                        # Use the first one when no choice
+                        self.qemuboot = qbs.split()[0]
                     self.qbconfload = True
 
         if not self.qemuboot:
-- 
2.9.0


