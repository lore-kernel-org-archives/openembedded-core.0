Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 002D9CA5FC4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 11:48:56 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9891.1790941734544374309
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 04:48:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm1 header.b=hmN9Qxpe;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1334352-202610021148524e29e59f6d000207fe-8n8b6v@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202610021148524e29e59f6d000207fe
        for <openembedded-core@lists.openembedded.org>;
        Fri, 02 Oct 2026 13:48:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=BtN12cn9ulIbSPaUxuPfM4ImwUA9v3YraOT2W7CY0yA=;
 b=hmN9Qxpe7354SN+A++GVH1Micsf+sGw2ZlQTUiV6iRGVPuWmSyDsAK1Bs+EsVQd/zTr9VK
 Uq+pvey/NlT7BfMPQ4AlflVld9zVNANGR9MrZ3uZTanFt5D1XRlt7H7uPvQtLyYzy1h6gLKD
 Et7nMzzcknmNhXNWiKTh1++q3Ko7eWAJN8aNzZy0DsQbR5D2QsIiwaSEbo7zhATnaS0QUSRZ
 Bzk7yiYhKzFUuwzdQ89vAV+nf9m98ffU7E+CNmX3vF4H3g+6mZtAueIjFgfdbR1gd2Q6kADs
 MX+r9y4BXiFJxMBZsp0fa6zAcnk8gdqSHheUuQi5akFz/PosXtB0Ni0w==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [PATCH 2/3] runqemu: support rootfs-dbg flag in QB_FSINFO
Date: Fri,  2 Oct 2026 13:48:48 +0200
Message-ID: <20261002114848.1126256-2-andrej.kozemcak@siemens.com>
In-Reply-To: <20261002114848.1126256-1-andrej.kozemcak@siemens.com>
References: <20261002114848.1126256-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 11:48:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247112

Add parsing for a new 'rootfs-dbg' flag on tar-based filesystem
types in QB_FSINFO. When set, runqemu appends '-dbg' to the
IMAGE_LINK_NAME used to locate the rootfs tarball for NFS
extraction, allowing use of the debug rootfs variant.

QB_FSINFO: additional filesystem metadata, as a space-separated list of
"fstype:flag" entries, e.g., "wic:no-kernel-in-fs tar:rootfs-dbg"
Supported flags include "wic:no-kernel-in-fs" or "wic:kernel-in-fs"
to select whether a WIC image contains the kernel in the filesystem,
and "tar:rootfs-dbg" to tell runqemu to use the debug rootfs image.

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 scripts/runqemu | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 2c126e7f54..ad6e03feb6 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -197,6 +197,7 @@ class BaseConfig(object):
         self.portlocks = {}
         self.bitbake_e = ''
         self.snapshot = False
+        self.rootfs_dbg = False
         self.wictypes = ('wic.zst', 'wic', 'wic.vmdk', 'wic.qcow2', 'wic.vdi', "wic.vhd", "wic.vhdx")
         self.tartypes = ('tar.zst', 'tar.bz2', 'tar.gz', 'tar.xz', 'tar')
         self.fstypes = ('ext2', 'ext3', 'ext4', 'ext2.zst', 'ext3.zst', 'ext4.zst',
@@ -686,7 +687,7 @@ to your build configuration.
             else:
                 raise RunQemuError("FSTYPE is NULL!")
 
-        # parse QB_FSINFO into dict, e.g. { 'wic': ['no-kernel-in-fs', 'a-flag'], 'ext4': ['another-flag']}
+        # parse QB_FSINFO into dict, e.g. { 'wic': ['no-kernel-in-fs', 'a-flag'], 'tar': ['rootfs-dbg']}
         wic_fs = False
         qb_fsinfo = self.get('QB_FSINFO')
         if qb_fsinfo:
@@ -703,6 +704,12 @@ to your build configuration.
                         else:
                             logger.warning('Unknown flag "%s:%s" in QB_FSINFO', fstype, fsflag)
                             continue
+                    elif fstype in ('tar',) + self.tartypes:
+                        if fsflag == 'rootfs-dbg':
+                            self.rootfs_dbg = True
+                        else:
+                            logger.warning('Unknown flag "%s:%s" in QB_FSINFO', fstype, fsflag)
+                            continue
                     else:
                         logger.warning('QB_FSINFO is not supported for image type "%s"', fstype)
                         continue
@@ -1079,7 +1086,10 @@ to your build configuration.
 
         # Extract .tar* if no nfs dir
         if not (self.rootfs and os.path.isdir(self.rootfs)):
-            src_prefix = '%s/%s' % (self.get('DEPLOY_DIR_IMAGE'), self.get('IMAGE_LINK_NAME'))
+            image_link_name = self.get('IMAGE_LINK_NAME')
+            if self.rootfs_dbg:
+                image_link_name += '-dbg'
+            src_prefix = '%s/%s' % (self.get('DEPLOY_DIR_IMAGE'), image_link_name)
             dest = "%s-nfsroot" % src_prefix
             if os.path.exists('%s.pseudo_state' % dest):
                 logger.info('Use %s as NFS_DIR' % dest)

