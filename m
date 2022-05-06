Return-Path: <felix.moessbauer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44641C433F5
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 09:00:26 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net
 (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.7312.1651827623846926078
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 02:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=felix.moessbauer@siemens.com header.s=fm1
 header.b=hn/H8ZIs;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225,
 mailfrom: fm-72506-2022050609002011ecc7c010585a025c-w5rwho@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id
 2022050609002011ecc7c010585a025c
        for <openembedded-core@lists.openembedded.org>;
        Fri, 06 May 2022 11:00:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=felix.moessbauer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=jidVFDxzi6tk2yvJ/xS48pRJ6j9BKThvhTezzWL/+yw=;
 b=hn/H8ZIsE/FxTSOFxUmTc2n5iJ4od/Ewb9Yu7rf++n4RcBgQm4FSn/7mm4rC1mgC2XcQ6k
 Oi9uMKWgA3+g2cdUNgZoT8qMDKZEvjJeXTBdA0c/kM/cEdVr+zYa9bCh1PW1SY7Q+JdmvbIZ
 A5jRDEieFVaI3KFiWN15uuiUdhgJQ=;
From: Felix Moessbauer <felix.moessbauer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: jan.kiszka@siemens.com,
	Felix Moessbauer <felix.moessbauer@siemens.com>
Subject: [PATCH v2 1/1] wic/plugins/rootfs: Fix permissions when splitting
 rootfs folders across partitions
Date: Fri,  6 May 2022 10:59:41 +0200
Message-Id: <20220506085941.145741-2-felix.moessbauer@siemens.com>
In-Reply-To: <20220506085941.145741-1-felix.moessbauer@siemens.com>
References: <20220506085941.145741-1-felix.moessbauer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-72506:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 09:00:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165335

This patches makes locating the file database containing the file and
folder usernames and permissions more reliable.
In addition to locating it relative to the partition directory, we also
try to locate it relative to the IMAGE_ROOTFS.

Prior to this patch, the database was not found when using
--rootfs-dir=${IMAGE_ROOTFS}/<x> in the WIC script, leading to erronous file
permissions and ownership.

Signed-off-by: Felix Moessbauer <felix.moessbauer@siemens.com>
---
 scripts/lib/wic/plugins/source/rootfs.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 2e34e715ca..25bb41dd70 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -50,7 +50,7 @@ class RootfsPlugin(SourcePlugin):
 
     @staticmethod
     def __get_rootfs_dir(rootfs_dir):
-        if os.path.isdir(rootfs_dir):
+        if rootfs_dir and os.path.isdir(rootfs_dir):
             return os.path.realpath(rootfs_dir)
 
         image_rootfs_dir = get_bitbake_var("IMAGE_ROOTFS", rootfs_dir)
@@ -96,6 +96,9 @@ class RootfsPlugin(SourcePlugin):
         part.rootfs_dir = cls.__get_rootfs_dir(rootfs_dir)
         part.has_fstab = os.path.exists(os.path.join(part.rootfs_dir, "etc/fstab"))
         pseudo_dir = os.path.join(part.rootfs_dir, "../pseudo")
+        if not os.path.lexists(pseudo_dir):
+            pseudo_dir = os.path.join(cls.__get_rootfs_dir(None), '../pseudo')
+
         if not os.path.lexists(pseudo_dir):
             logger.warn("%s folder does not exist. "
                         "Usernames and permissions will be invalid " % pseudo_dir)
-- 
2.30.2


