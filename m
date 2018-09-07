Return-Path: <Kexin.Hao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8B09179777
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 02:25:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w872OQM6012547
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Sep 2018 19:24:57 -0700
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 6 Sep 2018 19:24:16 -0700
From: Kevin Hao <kexin.hao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Sep 2018 10:18:18 +0800
Message-ID: <20180907021818.232151-1-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>
Subject: [PATCH v2] wic: Introduce the --use-label partition parameter
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
X-List-Received-Date: Fri, 07 Sep 2018 02:25:24 -0000
Content-Type: text/plain

We can use this parameter to make the wic use the label to name a
partition in /etc/fstab.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Reviewed-by: Tom Rini <trini@konsulko.com>
---
v2:
  - Rephrase the help info
  - Rebase on the Emmanuel's patch http://lists.openembedded.org/pipermail/openembedded-core/2018-September/155414.html

 scripts/lib/wic/help.py                  | 18 +++++++++++++-----
 scripts/lib/wic/ksparser.py              | 14 ++++++++++++--
 scripts/lib/wic/partition.py             |  1 +
 scripts/lib/wic/plugins/imager/direct.py |  2 ++
 4 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 842b868a575a..64f08052c7a7 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -866,11 +866,11 @@ DESCRIPTION
        Partitions with a <mountpoint> specified will be automatically mounted.
        This is achieved by wic adding entries to the fstab during image
        generation. In order for a valid fstab to be generated one of the
-       --ondrive, --ondisk or --use-uuid partition options must be used for
-       each partition that specifies a mountpoint.  Note that with --use-uuid
-       and non-root <mountpoint>, including swap, the mount program must
-       understand the PARTUUID syntax.  This currently excludes the busybox
-       versions of these applications.
+       --ondrive, --ondisk, --use-uuid or --use-label partition options must
+       be used for each partition that specifies a mountpoint.  Note that with
+       --use-{uuid,label} and non-root <mountpoint>, including swap, the mount
+       program must understand the PARTUUID or LABEL syntax.  This currently
+       excludes the busybox versions of these applications.
 
 
        The following are supported 'part' options:
@@ -945,6 +945,14 @@ DESCRIPTION
                         label is already in use by another filesystem,
                         a new label is created for the partition.
 
+         --use-label: This option is specific to wic. It makes wic to use the
+                      label in /etc/fstab to specify a partition. If the
+                      --use-label and --use-uuid are used at the same time,
+                      we prefer the uuid because it is less likely to cause
+                      name confliction. We don't support using this parameter
+                      on the root partition since it requires an initramfs to
+                      parse this value and we do not currently support that.
+
          --active: Marks the partition as active.
 
          --align (in KBytes): This option is specific to wic and says
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index a5d29189b9b5..7e5a9c5092b0 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -141,6 +141,7 @@ class KickStart():
                                    'squashfs', 'vfat', 'msdos', 'swap'))
         part.add_argument('--mkfs-extraopts', default='')
         part.add_argument('--label')
+        part.add_argument('--use-label', action='store_true')
         part.add_argument('--no-table', action='store_true')
         part.add_argument('--ondisk', '--ondrive', dest='disk', default='sda')
         part.add_argument("--overhead-factor", type=overheadtype)
@@ -197,8 +198,17 @@ class KickStart():
                                              (confpath, lineno, err))
                     if line.startswith('part'):
                         # SquashFS does not support filesystem UUID
-                        if parsed.fstype == 'squashfs' and parsed.fsuuid:
-                            err = "%s:%d: SquashFS does not support UUID" \
+                        if parsed.fstype == 'squashfs':
+                            if parsed.fsuuid:
+                                err = "%s:%d: SquashFS does not support UUID" \
+                                       % (confpath, lineno)
+                                raise KickStartError(err)
+                            if parsed.label:
+                                err = "%s:%d: SquashFS does not support LABEL" \
+                                       % (confpath, lineno)
+                                raise KickStartError(err)
+                        if parsed.use_label and not parsed.label:
+                            err = "%s:%d: Must set the label with --label" \
                                   % (confpath, lineno)
                             raise KickStartError(err)
                         # using ArgumentParser one cannot easily tell if option
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 5054779b1b6b..3da7e23e617e 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -47,6 +47,7 @@ class Partition():
         self.fsopts = args.fsopts
         self.fstype = args.fstype
         self.label = args.label
+        self.use_label = args.use_label
         self.mkfs_extraopts = args.mkfs_extraopts
         self.mountpoint = args.mountpoint
         self.no_table = args.no_table
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 81583e97b9f7..bb14a334b2ce 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -155,6 +155,8 @@ class DirectPlugin(ImagerPlugin):
                         device_name = "UUID=%s" % part.fsuuid
                 else:
                     device_name = "PARTUUID=%s" % part.uuid
+            elif part.use_label:
+                device_name = "LABEL=%s" % part.label
             else:
                 # mmc device partitions are named mmcblk0p1, mmcblk0p2..
                 prefix = 'p' if  part.disk.startswith('mmcblk') else ''
-- 
2.14.4


