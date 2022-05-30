Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 578BEC433FE
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 02:36:27 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.31654.1653878172131745638
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 19:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Nh6IpusB;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653878178; x=1685414178;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=AZv17J7NgPNgCJj/0isx/zBK/mOAMaoED6VfvU2uFiU=;
  b=Nh6IpusBRYfffkh85xPibGDPruoHOhS8CN+zHLbEBL1f2PCTLPFV7bes
   +4vPm9WFZceJHbE9GnYxQnmrDkWVC2JeBwBPO5PqLrEFyg9pblEGRaJb4
   X6EGnMAUzgOwIpdjFvVscCrZZO2oD35HcWsNCjDF9Pbf2wsfTv39Qlsyt
   fbtHg3rnpX/nVvhagtOFCRyYwmE1N/01Z4aRrgPah+cQA/QXsZNKg4K9p
   xOWdUF9FD2NpsF8jZ6/+rDoZ0mBYvLpsPINfeHHsLOUXwrPvGIjEZAbkO
   4KGuZ/5PYIVWm6IK87TbFu6MY3enLgt2+V5kq8sF5x5AiReGNMCAbBiRC
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="274876453"
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600";
   d="scan'208";a="274876453"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2022 19:36:18 -0700
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600";
   d="scan'208";a="666313574"
Received: from jngkeatx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.254.254])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2022 19:36:16 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 07/12] wic/plugins/rootfs: Fix permissions when
 splitting rootfs folders across partitions
Date: Mon, 30 May 2022 10:35:57 +0800
Message-Id: 
 <d730fbc26993c2187c908e57a465536a508e9ee2.1653877872.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1653877872.git.anuj.mittal@intel.com>
References: <cover.1653877872.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 02:36:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166251

From: Felix Moessbauer <felix.moessbauer@siemens.com>

This patches makes locating the file database containing the file and
folder usernames and permissions more reliable.
In addition to locating it relative to the partition directory, we also
try to locate it relative to the IMAGE_ROOTFS.

Prior to this patch, the database was not found when using
--rootfs-dir=${IMAGE_ROOTFS}/<x> in the WIC script, leading to erronous file
permissions and ownership.

Signed-off-by: Felix Moessbauer <felix.moessbauer@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 09e18ee246da8b56f446c4db548fb9c7e895142b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
2.35.3


